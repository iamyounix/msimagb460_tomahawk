# Combine Kext

Table of contents

- [Introduction](#introduction)
  - [Check if we need XHCI-Unsupported](#check-if-we-need-xhci-unsupported)
  - [Integrate XHCI-Unsupported Info to USBMap.kext](#integrate-xhci-unsupported-info-to-usbmapkext)
- [Credits](#credits)

## Introduction

It is possible to mix some Kexts. Only associated kexts can do this, though. We shall integrate codeless kexts in this example. ie: [XHCI-Unsupported.kext][xhciunsupport] + [USBMap.kext][usbtoolbox-download].

### Check if we need XHCI-Unsupported

1. Certain Intel XHCI controllers are not supported natively and require an injector. For these systems, install [XHCI-Unsupported.kext][xhciunsupport]. The native support depends by version, you can check location below to see if your XHCI is supported natively. The reason to do this is because 

   - / System / Library / Extensions / IOUSBHostFamily.kext / Contents / Plugins / AppleUSBXHCIPCI.kext /Contents / Info.plist

2. There is no harm to use it even if native support exists. 

3. Typical xHCI needing XHCI-unsupported.kext:
   1. X99-series chipset XHC controller, `8086:8d31`
   2. 200-series chipset XHC controller, `8086:a2af` (depends on macOS version)
   3. 300-series chipset XHC controller `8086:a36d` or `8086:9ded`
   4. certain 400-series chipset XHC controller, `8086:a3af`

### Integrate XHCI-Unsupported Info to USBMap.kext

- Add proper information under IOKitPersonalities in our USBMap.kext as below:
  - `IOKitPersonalities`
    - `AppleUSBXHCISPT`
      - `CFBundleIdentifier` - `string` - `com.apple.driver.usb.AppleUSBXHPCI`
      - `IOClass` - `string` - `AppleUSBXHCISPT`
      - `IOPCIPauseCompatible` - `boolean` - `True`
      - `IOPCIPrimaryMatch` - `string` - `0xa3af8086`
      - `IOPCITunnelCompatible` - `boolean` - `True`
      - `IOProbeScore` - `number` - `5000`
      - `IOProviderClass` - `string` - `IOPCIDevice`

![xhcipics][xhcipics]

- Save Info.plist and load kext to our bootloader as usual.

> **Note**: IOPCIPrimaryMatch must referred to our device-id and vendor-id.

## Credits

[acidanthera][dev0] | [dortania][dev-group0]

[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[usbtoolbox-download]: https://github.com/USBToolBox/tool
[xhciunsupport]: https://github.com/RehabMan/OS-X-USB-Inject-All
[xhcipics]: image/xhci-unsupported.png
