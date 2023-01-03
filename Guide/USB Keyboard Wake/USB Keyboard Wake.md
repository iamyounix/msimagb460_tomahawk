# USB Keyboard Wake

### Type of ACPI Wake

**acpi-wake-type**
* The `acpi-wake-type` is a kernel parameter that can be used to specify the **Type of Wake Event** that will trigger the system to resume from a suspended or hibernated state. It is typically used in conjunction with the `acpi-wake` kernel parameter, which specifies the device that will trigger the wake event. The value of the `acpi-wake-type` parameter can be one of the following:

  * `s3_bios` - resume from a suspend-to-RAM (S3) state when it receives a BIOS-generated wake event.
  * `s4_bios` - resume from a suspend-to-disk (S4) state when it receives a BIOS-generated wake event.
  * `s3_device` - resume from a suspend-to-RAM (S3) state when it receives a device-generated wake event.
  * `s4_device` - resume from a suspend-to-disk (S4) state when it receives a device-generated wake event.

**acpi-wake-gpe**
* The `acpi-wake-gpe` kernel parameter is used to specify the type of **General-Purpose Event (GPE)** that will trigger the system to resume from a suspended or hibernated state. GPEs are a type of interrupt used in the Advanced Configuration and Power Interface (ACPI) specification to signal the occurrence of an event that may affect the system's power state.
* The value of the `acpi-wake-gpe` parameter can be either `disable` or `enable`, depending on whether you want to disable or enable GPE-based wake events. When set to "enable", the system will resume from a suspended or hibernated state when it receives a GPE-based wake event. When set to `disable`, the system will ignore GPE-based wake events and will not resume from a suspended or hibernated state when it receives one.
* The `acpi-wake-gpe` kernel parameter is typically used in conjunction with other kernel parameters such as `acpi-wake` and `acpi-wake-type`, which can be used to specify the device or type of wake event that will trigger the system to resume.

#### How?

**Method 1**: DeviceProperties

- Internal (Motherboard based USB devices)
  - PciRoot(0x0)/Pci(0x14,0x0)
    - `acpi-wake-type` | `Data` | `01` (recommended)
    - `acpi-wake-type` | `Data` | `6D` (Optional)

- External (PCIe based USB devices)
  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0))
    - `acpi-wake-type` | `Data` | `01` (recommended)
    - `acpi-wake-type` | `Data` | `69` (Optional)

![ACPIwake](https://user-images.githubusercontent.com/72515939/210158780-d2b7a60d-856f-4175-b67f-682c985fed84.png)

> **Note**: No kext required, If this method doesn't work, head to Method 2.

**Method 2**: Kext & SSDT

This method can be acieved by creating **Virtual USB Device**, associate with `acpi-wake-gpe` and `acpi-wake-type`

- Paste this code to MaciASL or Xiasl.

```asl
/**
 * In this particular SSDT, the code defines an external method called _PRW, which stands for "Power Resources for Wake",
and an internal device called USBW. The USBW device has two properties: _HID, which stands for "Hardware ID," and _UID, 
which stands for "Unique ID." The code also defines a method called _PRW that returns the value of the _PRW method of the 
XHC device in the PCI0 scope. This method appears to be used to control the power management of the USBW device. The code
also includes an "If" statement that checks whether the operating system is Darwin (i.e., MacOS) using the _OSI ("Darwin")
function. If the operating system is Darwin, the code enables the USBW device. Otherwise, the device is not enabled. Overall, 
this SSDT appears to be defining a device and method for managing the power state of a USB device, with the device and method
being enabled only on MacOS. However, this SSDT require USBWakeFixup.kext to work.
 */
DefinitionBlock ("", "SSDT", 2, "OSY86 ", "USBW", 0x00001000)
{
    External (\_SB.PCI0.XHC._PRW, MethodObj)

    // We only enable the device for OSX
    If (CondRefOf (\_OSI, Local0) && _OSI ("Darwin"))
    {
        Device (\_SB.USBW)
        {
            Name (_HID, "PNP0D10")  // _HID: Hardware ID
            Name (_UID, "WAKE")  // _UID: Unique ID

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PCI0.XHC._PRW ()) // Replace with path to your USB device
            }
        }
    }
}
```

- As required, change the path of your USB Devices.
- Save it as `SSDT-USBW.aml`.
- This SSDT require [USBWakeFixup](https://github.com/osy/USBWakeFixup) to work. 
- If you have multiple devices, include PCIe based USB devices. You may need this code below:

```asl
/**
 * In this particular SSDT, the code defines three external devices: PCI0.XHC, PCI0.RP05.PXSX, and PCI0.RP19.PXSX.
It also defines three external methods: _PRW for each of the three devices. The code also defines three internal devices:
USB0, USB1, and USB2. Each of these devices has three properties: _HID, which stands for "Hardware ID," _UID, which stands
for "Unique ID," and _PRW, which stands for "Power Resources for Wake." The _PRW method for each of these devices returns
the value of the _PRW method of one of the external devices. The code also includes an "If" statement that checks whether the
operating system is Darwin (i.e., MacOS) using the _OSI ("Darwin") function. If the operating system is Darwin, the code
enables the three internal devices and their corresponding _PRW methods. Otherwise, the devices and methods are not enabled.
Overall, this SSDT appears to be defining three virtual devices and their corresponding power management methods for managing
the power state of USB devices on a system running MacOS. The devices and methods are intended to control the power state of
the USB devices on the motherboard and on a PCIe card. Same as above, this SSDT require USBWakeFixup.kext to work.
 */
DefinitionBlock ("", "SSDT", 2, "CpyPst", "USBPW", 0x00001001)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._PRW, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP19.PXSX._PRW, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_._PRW, MethodObj)    // 0 Arguments

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
            Device (USB0) // Virtual Wake Device #1
            {
                Name (_HID, "PNP0D10" /* XHCI USB Controller with debug */)  // _HID: Hardware ID
                Name (_UID, "WAKE")  // _UID: Unique ID
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (\_SB.PCI0.XHC._PRW ())  // USB Device Path #1 (Motherboard)
                }
            }

            Device (USB1) // Virtual Wake Device #2
            {
                Name (_HID, "PNP0D10" /* XHCI USB Controller with debug */)  // _HID: Hardware ID
                Name (_UID, "WAKE")  // _UID: Unique ID
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (\_SB.PCI0.RP05.PXSX._PRW ())  // USB Device Path #1 (Motherboard)
                }
            }

            Device (USB2) // Virtual Wake Device #3
            {
                Name (_HID, "PNP0D10" /* XHCI USB Controller with debug */)  // _HID: Hardware ID
                Name (_UID, "WAKE")  // _UID: Unique ID
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (\_SB.PCI0.RP19.PXSX._PRW ())  // USB Device Path #3 (PCIe)
                }
            }
        }
    }
}
```

![Screenshot 2022-12-31 at 9 48 09 PM](https://user-images.githubusercontent.com/72515939/210138919-1f6494d4-b0a6-4f56-8734-30687da97250.png)
![Screenshot 2022-12-31 at 9 48 15 PM](https://user-images.githubusercontent.com/72515939/210138921-26ad44fe-b1dd-4693-a2ce-bad248f9abba.png)
![Screenshot 2022-12-31 at 9 48 19 PM](https://user-images.githubusercontent.com/72515939/210138923-184a21bd-bbd8-4ce2-8b09-2d941fc6493f.png)

### Credits

[Acidanthera](https://github.com/acidanthera/) | [osy](https://github.com/osy) | 
