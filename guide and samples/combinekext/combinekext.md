# Combine Kext

Table of contents

- [Introduction](#introduction)
- [USBMap](#usbmap)
- [Integrate XHCI-Unsupported Info to USBMap.kext](#integrate-xhci-unsupported-info-to-usbmapkext)
- [Credits](#credits)

## Introduction

It is possible to mix some Kexts. Only associated kexts can do this, though. We shall integrate codeless kexts in this example. The possible kext is displayed below.

- [XHCI-Unsupported.kext][xhciunsupport]
- USBMap.kext using [USBToolbox][usbtoolbox-download] or USBPorts.kext using [Hackintool][hackintool-download]

## USBMap

Below is the easiest way and effective method to achieve proper USB port mapping. To do so...

1. Download [USBToolbox][usbtoolbox-download] in `.exe` format, boot into Windows.

2. Then, generate USBMap.kext.

3. Find Info.plist inside USBMap.kext and open with respective app such as [Xplist][plisteditor1] or [ProperTree][plisteditor2].

> **Note**: Windows 10 or 11 64-bit are recommended for the full feature set (companion port binding, port type guessing.). Windows 8 may work, Windows 7 and below will very likely crash. `32-bit` is not supported, macOS needs `64-bit` anyway. Windows PE works. Some device names may not be as descriptive but if you really don't want to install Windows, you can create a Windows PE USB and hit `Shift` + `F10` to open `cmd`, then run the program. Markdon

## Integrate XHCI-Unsupported Info to USBMap.kext

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

![xhci-unsupported][xhcipics]

## Credits

[acidanthera][dev0] | [dortania][dev-group0]

[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[hackintool-download]: https://github.com/benbaker76/Hackintool
[plisteditor1]: https://github.com/ic005k/Xplist
[plisteditor2]: https://github.com/corpnewt/ProperTree
[usbtoolbox-download]: https://github.com/USBToolBox/tool
[xhciunsupport]: https://github.com/RehabMan/OS-X-USB-Inject-All
[xhcipics]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/9c230e8cd87d64116aa4d22d0ccd01d7eeeccf42/guide%20and%20samples/combinekext/etc/xhci-unsupported.png
