# XHCI Unsupported Advance

Table of contents

- [Introduction](#introduction)
  - [Do we need this?](#check-if-we-need-xhci-unsupported)
  - [Integration](#integration)
- [Credits](#credits)

## Introduction

There are various common problems with hackintosh. Our frequent problem is with the USB device. This problem depends on the USB device's internal design and architecture. As always, year after year, the various changes were made to enhance speed, stability, and some other aspects. However, the concept of the device for most manufacturers remains the same. 

`USB Bus` &rarr; `USB Hub` &rarr; `Ports` &rarr; `Port Chain (If exist)`

### Do we need this?

1. Due to these changes, power and speed are not stable. These symptoms can be detected by using our Swiss Army knife, Hackintool, and observing each USB device inserted in certain slots to see if it is blipping or not. If yes, we need this hack. Certain Intel XHCI controllers are not supported natively and require an injector. The majority of USB issues for hackintosh are caused by USB Bus, which is out of sync with macOS requirements. The native support depends by version, you can check location below as an example:

   - `System` &rarr; `Library` &rarr; `Extensions` &rarr; `IOUSBHostFamily.kext` &rarr; `Contents` &rarr; `Plugins` &rarr; `AppleUSBXHCIPCI.kext` &rarr; `Contents` &rarr; `Info.plist`

2. Typical known XHCIs needing this method include:
   1. X99-series chipset XHC controller, `8086:8d31`
   2. 200-series chipset XHC controller, `8086:a2af`
   3. 300-series chipset XHC controller `8086:a36d` or `8086:9ded`
   4. 400-series chipset XHC controller, `8086:a3af`

### Integration

- Add proper information under IOKitPersonalities in our `USBMap.kext` as below:
  - `IOKitPersonalities`
    - `AppleUSBXHCISPT`
      - `CFBundleIdentifier` &rarr; `string` &rarr; `com.apple.driver.usb.AppleUSBXHPCI`
      - `IOClass` &rarr; `string` &rarr; `AppleUSBXHCISPT`
      - `IOPCIPauseCompatible` &rarr; `boolean` &rarr; `True`
      - `IOPCIPrimaryMatch` &rarr; `string` &rarr; `0xa3af8086`
      - `IOPCITunnelCompatible` &rarr; `boolean` &rarr; `True`
      - `IOProbeScore` &rarr; `number` &rarr; `5000`
      - `IOProviderClass` &rarr; `string` &rarr; `IOPCIDevice`

- Save Info.plist and load kext to our bootloader as usual.

> **Note**: IOPCIPrimaryMatch must referred to our device-id and vendor-id.

## Credits

[acidanthera][dev0] | [dortania][dev-group0]

[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[usbtoolbox-download]: https://github.com/USBToolBox/tool
[xhciunsupport]: https://github.com/RehabMan/OS-X-USB-Inject-All
