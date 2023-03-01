# USB Wake and Sleep Fix

![GUIDE](https://img.shields.io/badge/Guide-USB-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [Three Method to fix Sleep and Wake Issues](#three-method-to-fix-sleep-and-wake-issues)
  - [Method 1](#method-1)
  - [Method 2](#method-2)
- [Special Thanks!](#special-thanks)
- [Credits](#credits)

## Three Method to fix Sleep and Wake Issues

So, the ideal method is to declare the `XHCI Controller` to be an ACPI wake device, as we don't have compatible ECs for macOS to handle proper wake calls.

- **Method 1:** Set `acpi-wake-type` to all usb devices.
- **Method 2:** Set Virtual USB Devices to route proper wake event from loaded [USBWakeFixup.kext][usbwakefix] to acpi mapped usb devices.
- **Method 3:** Combination of USBMap.kext and ACPI. Sometimes macOS resist to call wake and sleep properties.

### Method 1

- Set wake by adding the property of `acpi-wake-type=01` to USB devices via DeviceProperties in config.plist. ie:
  - `PciRoot(0x0)/Pci(0x14,0x0)`
    - `acpi-wake-type` - `Data` - `01`
    - `acpi-wake-gpe` - `Data` - `6D`

### Method 2

1. Set virtual USB devices to route the proper wake event from [USBWakeFixup.kext][usbwakefix] loaded USBWakeFixup.kext to acpi-mapped USB devices. This method combines proper instruction from acpi from the associated kext with `acpi-wake-type` and `acpi-wake-gpe`. Create a new SSDT by pasting this code into any ".asl" equivalent editor and saving it as ".dsl." Before editing, please make sure to check the path of your USB devices.
2. In this particular SSDT, the code defines an external method called `_PRW`, which stands for "Power Resources for Wake", and an internal device called `USBW`. The `USBW` device has two properties: `_HID`, which stands for "Hardware ID," and `_UID`, which stands for "Unique ID".
3. The code also defines a method called `_PRW` that returns the value of the `_PRW` method of the `XHC` device in the `PCI0` scope. This method appears to be used to control the power management of the "USBW" device. The code also includes an `If` statement that checks whether the operating system is Darwin (i.e., MacOS) using the `_OSI ("Darwin"))` function.
4. If the operating system is Darwin, the code enables the `USBW` device. Otherwise, the device is not enabled. Overall, this SSDT appears to be defining a device and method for managing the power state of a USB device, with the device and method being enabled only on MacOS. However, this SSDT require [USBWakeFixup.kext][usbwakefix] to work.

    ```asl
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

5. In this particular SSDT, the code defines three external devices: `PCI0.XHC`, `PCI0.RP05.PXSX`, and `PCI0.RP19.PXSX`. It also defines three external methods `_PRW` for each of the three devices. The code also defines three internal devices, `USB0`, `USB1`, and `USB2`.
6. Each of these devices has three properties, `_HID`, which stands for "Hardware ID, `_UID`, which stands for "Unique ID," and `_PRW`, which stands for "Power Resources for Wake". The `_PRW` method for each of these devices returns the value of the `_PRW` method of one of the external devices. The code also includes an `If` statement that checks whether the operating system is Darwin (i.e., MacOS) using the `_OSI ("Darwin"))` function.
7. If the operating system is Darwin, the code enables the three devices and their corresponding `_PRW` methods. Otherwise, the devices and methods are not enabled. Overall, this SSDT appears to be defining three virtual devices and their corresponding power management methods for managing the power state of USB devices on a system running MacOS.
8. The devices and methods are intended to control the power state of the USB devices on the motherboard and on a PCIe card. Same as above, this SSDT require [USBWakeFixup.kext][usbwakefix] to work. In order to make multiple USB devices work with this method, use the code as shown below:

    ```asl
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

9. Here is the results!

![Results1][res1]
![Results2][res2]
![Results3][res3]

## Special Thanks

[USBToolbox][usbtoolbox]

## Credits

[Acidanthera][dev0] | [benbaker76][dev1] | [Dortania][dev-group0] | [osy][dev2]

[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[dev1]: https://github.com/benbaker76/Hackintool
[dev2]: https://github.com/osy
[res1]: https://user-images.githubusercontent.com/72515939/210138919-1f6494d4-b0a6-4f56-8734-30687da97250.png
[res2]: https://user-images.githubusercontent.com/72515939/210138921-26ad44fe-b1dd-4693-a2ce-bad248f9abba.png
[res3]: https://user-images.githubusercontent.com/72515939/210138923-184a21bd-bbd8-4ce2-8b09-2d941fc6493f.png
[usbtoolbox]: https://github.com/USBToolBox/tool
[usbwakefix]: https://github.com/osy/USBWakeFixup
