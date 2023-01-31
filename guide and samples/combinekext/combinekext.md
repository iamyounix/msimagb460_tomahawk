# Combine Kext

Table of contents

- [Introduction](#introduction)
  - [XHCI-Unsupported](#xhci-unsupported)
  - [USBMap](#usbmap)
  - [Integrate XHCI-Unsupported Info to USBMap.kext](#integrate-xhci-unsupported-info-to-usbmapkext)
- [Credits](#credits)

## Introduction

It is possible to mix some Kexts. Only associated kexts can do this, though. We shall integrate codeless kexts in this example. The possible kext is displayed below.

- [XHCI-Unsupported.kext][xhciunsupport]
- USBMap.kext using [USBToolbox][usbtoolbox-download] or USBPorts.kext using [Hackintool][hackintool-download]

### XHCI-Unsupported

1. If you have a 9-series chipset XHC controller, 8086:8cb1, install XHCI-9-series.kext from the project as well. The USB3 drivers will not load without this injector kext. Update: As of 10.11.1, this injector is no longer needed as direct support was added. If you need it, go back in history: <https://github.com/RehabMan/OS-X-USB-Inject-All/tree/706fea51222eb73343d347db10cf48500333a7bd>

2. Certain Intel xHCI controllers are not supported natively and require an injector. For these systems, install XHCI-unsupported.kext. The native support depends by version, you can check in /`System` / `Library` / `Extensions` / `IOUSBHostFamily.kext` / `Contents` /`Plugins` / `AppleUSBXHCIPCI.kext` / `Contents` / `Info.plist` to see if your `xHCI` is supported natively.

3. Because `XHCI-unsupported.kext` uses a lower `IOProbeScore` than the native `Info.plist`, there is no harm in installing it even if native support exists.

4. Typical xHCI needing XHCI-unsupported.kext:
   - X99-series chipset XHC controller, `8086:8d31`
   - 200-series chipset XHC controller, `8086:a2af` (depends on macOS version)
   - 300-series chipset XHC controller `8086:a36d` or `8086:9ded`
   - certain 400-series chipset XHC controller, `8086:a3af`

### USBMap

- Below is the easiest way and effective method to achieve proper USB port mapping. To do so...

  1. Download [USBToolbox][usbtoolbox-download] in `.exe` format, boot into Windows.

  2. Then, generate USBMap.kext.

  3. Find Info.plist inside USBMap.kext and open with respective app such as [Xplist][plisteditor1] or [ProperTree][plisteditor2].

  > **Note**: Windows 10 or 11 64-bit are recommended for the full feature set (companion port binding, port type guessing.). Windows 8 may work, Windows 7 and below will very likely crash. `32-bit` is not supported, macOS needs `64-bit` anyway. Windows PE works. Some device names may not be as descriptive but if you really don't want to install Windows, you can create a Windows PE USB and hit `Shift` + `F10` to open `cmd`, then run the program.

### Integrate XHCI-Unsupported Info to USBMap.kext

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

![xhcipics][xhcipics]

2. Save Info.plist and load kext to our bootloader as usual.

> **Note**: IOPCIPrimaryMatch must referred to our device-id and vendor-id.

## Credits

[acidanthera][dev0] | [dortania][dev-group0]

[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[hackintool-download]: https://github.com/benbaker76/Hackintool
[plisteditor1]: https://github.com/ic005k/Xplist
[plisteditor2]: https://github.com/corpnewt/ProperTree
[usbtoolbox-download]: https://github.com/USBToolBox/tool
[xhciunsupport]: https://github.com/RehabMan/OS-X-USB-Inject-All
[xhcipics]: etc/xhci-unsupported.png
