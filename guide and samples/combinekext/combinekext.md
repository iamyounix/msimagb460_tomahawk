# Combine Kext

Table of contents

- [USBMap](#usbmap)
- [Intergrate XHCI-Unsupported Info to USBMap.kext](#intergrate-xhci-unsupported-info-to-usbmapkext)

Certain kext is possible to combine. However, only certain kext which is related able to do so. In this case, we will combine codeless kext. Below is the possible kext:

- [XHCI-Unsupported.kext][XHCI-Unsupported Download] + USBMap.kext / USBPorts.kext

## USBMap

Below is the easiest way and effective method to achieve proper USB port mapping. To do so...

- Download [USBToolbox][USBToolbox Download] in `.exe` format, boot into Windows. Windows 10 or 11 64-bit are recommended for the full feature set (companion port binding, port type guessing.). Windows 8 may work, Windows 7 and below will very likely crash. `32-bit` is not supported, macOS needs `64-bit` anyway. Windows PE works. Some device names may not be as descriptive but if you really don't want to install Windows, you can create a Windows PE USB and hit `Shift` + `F10` to open `cmd`, then run the program.
- Then, generate USBMap.kext.
- Find Info.plist inside USBMap.kext and open with respective app such as [Xplist][Xplist Download] or [ProperTree][Propertree Download].

## Intergrate XHCI-Unsupported Info to USBMap.kext

- Add proper information under IOKitPersonalities in our USBMap.kext as below:

  - `IOKitPersonalities`
  - `XHCI-Unsupported`
  - `CFBundleIdentifier` - `string` - `com.apple.driver.usb.AppleUSBXHPCI`
  - `IOClass` - `string` - `AppleUSBXHCISPT`
  - `IOPCIPauseCompatible` - `boolean` - `True`
  - `IOPCIPrimaryMatch` - `string` - `0xa3af8086`
  - `IOPCITunnelCompatible` - `boolean` - `True`
  - `IOProbeScore` - `number` - `1000`
  - `IOProviderClass` - `string` - `IOPCIDevice`
  
> **Note**: IOPCIPrimaryMatch must referred to our device-id and vendor-id.

- Then, all followe by your usb device as default. Do not touch anything. Below is an example:

![XHCI-Unsupported Details][XHCI-Unsupported Details]

- Save Info.plist and load kext to our bootloader as usual.

[Propertree Download]: https://github.com/corpnewt/ProperTree
[USBToolbox Download]: https://github.com/USBToolBox/tool
[XHCI-Unsupported Details]: https://user-images.githubusercontent.com/72515939/215503473-d3eecbbb-43f4-47f9-a246-fa32c697e606.png
[XHCI-Unsupported Download]: https://github.com/RehabMan/OS-X-USB-Inject-All
[Xplist Download]: https://github.com/ic005k/Xplist
