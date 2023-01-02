# Hackintosh: Troubleshooting, Method and Alternative
This is all about alternative methods that users can try in order to solve hackintosh issues.

### Keyboard Wake Issues

#### acpi-wake-type

The `acpi-wake-type` is a kernel parameter that can be used to specify the **Type of Wake Event** that will trigger the system to resume from a suspended or hibernated state. It is typically used in conjunction with the `acpi-wake` kernel parameter, which specifies the device that will trigger the wake event.

The value of the `acpi-wake-type` parameter can be one of the following:

* `s3_bios` - This indicates that the system will resume from a suspend-to-RAM (S3) state when it receives a BIOS-generated wake event.
* `s4_bios` - This indicates that the system will resume from a suspend-to-disk (S4) state when it receives a BIOS-generated wake event.
* `s3_device` - This indicates that the system will resume from a suspend-to-RAM (S3) state when it receives a device-generated wake event.
* `s4_device` - This indicates that the system will resume from a suspend-to-disk (S4) state when it receives a device-generated wake event.

#### acpi-wake-gpe

The `acpi-wake-gpe` kernel parameter is used to specify the type of **General-Purpose Event (GPE)** that will trigger the system to resume from a suspended or hibernated state. GPEs are a type of interrupt used in the Advanced Configuration and Power Interface (ACPI) specification to signal the occurrence of an event that may affect the system's power state.

The value of the `acpi-wake-gpe` parameter can be either `disable` or `enable`, depending on whether you want to disable or enable GPE-based wake events. When set to "enable", the system will resume from a suspended or hibernated state when it receives a GPE-based wake event. When set to `disable`, the system will ignore GPE-based wake events and will not resume from a suspended or hibernated state when it receives one.

The `acpi-wake-gpe` kernel parameter is typically used in conjunction with other kernel parameters such as `acpi-wake` and `acpi-wake-type`, which can be used to specify the device or type of wake event that will trigger the system to resume.

#### How?

**Method 1**: DeviceProperties

- Internal (Motherboard based USB devices)
  - PciRoot(0x0)/Pci(0x14,0x0)
    - `acpi-wake-type` | `Data` | `01` - If not exist on `IOreg` / `IOACPIPlane`
    - `acpi-wake-gpe` | `Data` | `6d` - If not exist on `IOreg` / `IOACPIPlane`

- External (PCIe based USB devices)
  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0))
    - `acpi-wake-type` | `Data` | `01` - If not exist on `IOreg` / `IOACPIPlane`
    - `acpi-wake-gpe` | `Data` | `69` - If not exist on `IOreg` / `IOACPIPlane`

![ACPIwake](https://user-images.githubusercontent.com/72515939/210158780-d2b7a60d-856f-4175-b67f-682c985fed84.png)

**Method 2**: Kext & SSDT

- **Credits:** [osy](https://github.com/osy)
- **Link:** [USBWakeFixup](https://github.com/osy/USBWakeFixup)

This method can be acieved by creating **Virtual USB Device**, associate with `acpi-wake-gpe` and `acpi-wake-type`

- Paste this code to MaciASL or Xiasl.

```asl
/**
 * Virtual USB Wakeup
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
 * Virtual USB Wakeup for multiple devices
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
