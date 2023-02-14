# XHCI Unsupported Advance

Table of contents

- [Introduction](#introduction)
  - [Do we need this?](#do-we-need-this)
  - [Integration](#integration)
- [Credits](#credits)

## Introduction

There are various common problems with hackintosh. Our frequent problem is with the USB device. This problem depends on the USB device's internal design and architecture. As always, year after year, the various changes were made to enhance speed, stability, and some other aspects. However, the concept of the device for most manufacturers remains the same. 

`USB Bus` &rarr; `USB Hub` &rarr; `Ports` &rarr; `Port Chain (If exist)`

### Do we need this?

1. Due to these changes, power and speed are not stable. These symptoms can be detected by using our Swiss Army knife, [Hackintool](https://github.com/benbaker76/Hackintool), and observing each USB device inserted in certain slots to see if it is blipping or not. If yes, we need this hack. Certain Intel XHCI controllers are not supported natively and require an injector. The majority of USB issues for hackintosh are caused by USB Bus, which is out of sync with macOS requirements. The native support depends by version, check file below as an example:

   - `System` &rarr; `Library` &rarr; `Extensions` &rarr; `IOUSBHostFamily.kext` &rarr; `Contents` &rarr; `Plugins` &rarr; `AppleUSBXHCIPCI.kext` &rarr; `Contents` &rarr; `Info.plist`

2. Typical known XHCIs needing this method include:
   -  X99-series chipset XHC controller &rarr; `8086:8d31`
   -  200-series chipset XHC controller &rarr; `8086:a2af`
   -  300-series chipset XHC controller &rarr; `8086:a36d` or `8086:9ded`
   -  400-series chipset XHC controller &rarr; `8086:a3af`

### Integration

1. Check device detail before we start. We will use [Comet Lake PCH-V USB Controller](https://devicehunt.com/view/type/pci/vendor/8086/device/A3AF) as an example.

2. Add proper information under IOKitPersonalities in our `USBMap.kext` as below:
  - `IOKitPersonalities`
    - `AppleUSBXHCISPT`
      - `CFBundleIdentifier` &rarr; `string` &rarr; `com.apple.driver.usb.AppleUSBXHPCI`
      - `IOClass` &rarr; `string` &rarr; `AppleUSBXHCISPT`
      - `IOPCIPauseCompatible` &rarr; `boolean` &rarr; `True`
      - `IOPCIPrimaryMatch` &rarr; `string` &rarr; `0xa3af8086` (refer to your usb device / vendor id)
      - `IOPCITunnelCompatible` &rarr; `boolean` &rarr; `True`
      - `IOProbeScore` &rarr; `number` &rarr; `5000`
      - `IOProviderClass` &rarr; `string` &rarr; `IOPCIDevice`

3. Save `Info.plist` and load kext to our bootloader as usual.

## Credits

[acidanthera][dev0] | [benbaker76](dev1) | [dortania][dev-group0]

[dev1]: https://github.com/benbaker76
[dev0]: https://github.com/acidanthera/
[dev-group0]: https://dortania.github.io
[usbtoolbox-download]: https://github.com/USBToolBox/tool
[xhciunsupport]: https://github.com/RehabMan/OS-X-USB-Inject-All
