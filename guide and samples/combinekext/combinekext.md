# Combine Kext

Table of contents

- [Introduction](#introduction)
- [USBMap](#usbmap)
- [Intergrate XHCI-Unsupported Info to USBMap.kext](#intergrate-xhci-unsupported-info-to-usbmapkext)

## Introduction

It is possible to mix some Kexts. Only associated kexts can do this, though. We shall integrate codeless kexts in this example. The possible kext is displayed below.

- [XHCI-Unsupported.kext][XHCI-Unsupported Download]
- USBMap.kext using [USBToolbox][USBToolbox Download] or USBPorts.kext using [Hackintool][Hackintool Download]

## USBMap

Below is the easiest way and effective method to achieve proper USB port mapping. To do so...

1. Download [USBToolbox][USBToolbox Download] in `.exe` format, boot into Windows.

2. Then, generate USBMap.kext.

3. Find Info.plist inside USBMap.kext and open with respective app such as [Xplist][Xplist Download] or [ProperTree][Propertree Download].

> **Note**: Windows 10 or 11 64-bit are recommended for the full feature set (companion port binding, port type guessing.). Windows 8 may work, Windows 7 and below will very likely crash. `32-bit` is not supported, macOS needs `64-bit` anyway. Windows PE works. Some device names may not be as descriptive but if you really don't want to install Windows, you can create a Windows PE USB and hit `Shift` + `F10` to open `cmd`, then run the program.

## Intergrate XHCI-Unsupported Info to USBMap.kext

1. Add proper information under IOKitPersonalities in our USBMap.kext as below:
   - `IOKitPersonalities`
     - `XHCI-Unsupported`
       - `CFBundleIdentifier` - `string` - `com.apple.driver.usb.AppleUSBXHPCI`
       - `IOClass` - `string` - `AppleUSBXHCISPT`
       - `IOPCIPauseCompatible` - `boolean` - `True`
       - `IOPCIPrimaryMatch` - `string` - `0xa3af8086`
       - `IOPCITunnelCompatible` - `boolean` - `True`
       - `IOProbeScore` - `number` - `1000`
       - `IOProviderClass` - `string` - `IOPCIDevice`

2. Save Info.plist and load kext to our bootloader as usual.

> **Note**: IOPCIPrimaryMatch must referred to our device-id and vendor-id.

[Hackintool Download]: https://github.com/benbaker76/Hackintool
[Propertree Download]: https://github.com/corpnewt/ProperTree
[USBToolbox Download]: https://github.com/USBToolBox/tool
[XHCI-Unsupported Details]: https://user-images.githubusercontent.com/72515939/215503473-d3eecbbb-43f4-47f9-a246-fa32c697e606.png
[XHCI-Unsupported Download]: https://github.com/RehabMan/OS-X-USB-Inject-All
[Xplist Download]: https://github.com/ic005k/Xplist