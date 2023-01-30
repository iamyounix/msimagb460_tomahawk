# Combine Kext

Certain kext is possible to combine. However, only certain kext which is related able to do so. In this case, we will combine codeless kext. Below is the possible kext:

- [XHCI-Unsupported.kext](https://github.com/RehabMan/OS-X-USB-Inject-All) + USBMap.kext / USBPorts.kext

## USBMap

Below is the easiest way and effective method to achieve proper USB port mapping. To do so...

- Download [USBToolbox](https://github.com/USBToolBox/tool) in `.exe` format, boot into Windows. Windows 10 or 11 64-bit are recommended for the full feature set (companion port binding, port type guessing.). Windows 8 may work, Windows 7 and below will very likely crash. `32-bi`t is not supported, macOS needs `64-bit` anyway. Windows PE works. Some device names may not be as descriptive but if you really don't want to install Windows, you can create a Windows PE USB and hit `Shift` + `F10` to open `cmd`, then run the program.
- Then, generate USBMap.kext.
- Find Info.plist inside USBMap.kext and open with respective app such as [Xplist](https://github.com/ic005k/Xplist) or [ProperTree](https://github.com/corpnewt/ProperTree).

## Adding XHCIUnsupport to USBMap.kext
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

- Then, all followe by your usb device as default. Do not touch anything.
- Save Info.plist and load kext to our bootloader as usual.