# USB Keyboard Wake

Refer: [Dortania - Keyboard Wake Issues](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#keyboard-wake-issues)

## Three Method

So the ideal method is to declare the `XHCI Controller` to be an ACPI wake device, as we don't have compatible ECs for macOS to handle proper wake calls.

- **Method 1:** Set `acpi-wake-type` to all usb devices.
- **Method 2:** Set Virtual USB Devices to route proper wake event from loaded [USBWakeFixup.kext](https://github.com/osy/USBWakeFixup) to acpi mapped usb devices.
- **Method 3:** Combination of USBMap.kext and ACPI. Sometimes macOS resist to call wake and sleep properties.

**Method 1**

- Set wake by adding the property of `acpi-wake-type=01` to USB devices via DeviceProperties in config.plist. ie:

  - PciRoot(0x0)/Pci(0x14,0x0)
    * `acpi-wake-type` - `Data` - `01`

**Method 2**

- Set virtual USB devices to route the proper wake event from [USBWakeFixup.kext](https://github.com/osy/USBWakeFixup) loaded USBWakeFixup.kext to acpi-mapped USB devices. This method combines proper instruction from acpi from the associated kext with `acpi-wake-type` and `acpi-wake-gpe`. Create a new SSDT by pasting this code into any ".asl" equivalent editor and saving it as ".dsl." Before editing, please make sure to check the path of your USB devices.

- In this particular SSDT, the code defines an external method called `_PRW`, which stands for "Power Resources for Wake", and an internal device called `USBW`. The `USBW` device has two properties: `_HID`, which stands for "Hardware ID," and `_UID`, which stands for "Unique ID". 
- The code also defines a method called `_PRW` that returns the value of the `_PRW` method of the `XHC` device in the `PCI0` scope. This method appears to be used to control the power management of the "USBW" device. The code also includes an `If` statement that checks whether the operating system is Darwin (i.e., MacOS) using the `_OSI ("Darwin"))` function. 
- If the operating system is Darwin, the code enables the `USBW` device. Otherwise, the device is not enabled. Overall, this SSDT appears to be defining a device and method for managing the power state of a USB device, with the device and method being enabled only on MacOS. However, this SSDT require [USBWakeFixup.kext](https://github.com/osy/USBWakeFixup) to work.

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

- In this particular SSDT, the code defines three external devices: `PCI0.XHC`, `PCI0.RP05.PXSX`, and `PCI0.RP19.PXSX`. It also defines three external methods `_PRW` for each of the three devices. The code also defines three internal devices, `USB0`, `USB1`, and `USB2`.
- Each of these devices has three properties, `_HID`, which stands for "Hardware ID, `_UID`, which stands for "Unique ID," and `_PRW`, which stands for "Power Resources for Wake". The `_PRW` method for each of these devices returns the value of the `_PRW` method of one of the external devices. The code also includes an `If` statement that checks whether the operating system is Darwin (i.e., MacOS) using the `_OSI ("Darwin"))` function.
- If the operating system is Darwin, the code enables the three devices and their corresponding `_PRW` methods. Otherwise, the devices and methods are not enabled. Overall, this SSDT appears to be defining three virtual devices and their corresponding power management methods for managing the power state of USB devices on a system running MacOS.
- The devices and methods are intended to control the power state of the USB devices on the motherboard and on a PCIe card. Same as above, this SSDT require [USBWakeFixup.kext](https://github.com/osy/USBWakeFixup) to work. In order to make multiple USB devices work with this method, use the code as shown below:

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
                    Name (_HID, "PNP0D11" /* XHCI USB Controller with debug */)  // _HID: Hardware ID
                    Name (_UID, "WAKE")  // _UID: Unique ID
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (\_SB.PCI0.RP05.PXSX._PRW ())  // USB Device Path #1 (Motherboard)
                    }
                }

                Device (USB2) // Virtual Wake Device #3
                {
                    Name (_HID, "PNP0D12" /* XHCI USB Controller with debug */)  // _HID: Hardware ID
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


**Method 3**

- Generate `SSDT-USBX.aml` using (https://github.com/corpnewt/SSDTTime), make sure `USBX` has this code as shown below:
    - [x] `kUSBSleepPowerSupply`, `0x13EC`
    - [x] `kUSBSleepPortCurrentLimit`, `0x0834`
    - [x] `kUSBWakePowerSupply`, `0x13EC`
    - [x] `kUSBWakePortCurrentLimit`, `0x0834`

- Set wake by adding the property of `acpi-wake-type=01` to USB devices via DeviceProperties in config.plist. ie:

  - PciRoot(0x0)/Pci(0x14,0x0)
    * `acpi-wake-type` - `Data` - `01`

- Edit your `USBMap.kext` by opening "Info.plist" and add similar `USBX` properties as shown above to all USB devices. Below is an example:
	- `XHC`
		- `IOProviderMergeProperties`
            - `kUSBSleepPowerSupply` - `number` - `5100`
            - `kUSBSleepPortCurrentLimit` - `number` - `2100`
            - `kUSBWakePowerSupply` - `number` - `5100`
            - `kUSBWakePortCurrentLimit` - `number` - `2100`

- Load `USBMap.kext` and `SSDT-USBX.aml`. Good Luck!

### Credits

[Acidanthera](https://github.com/acidanthera/) | [osy](https://github.com/osy)
