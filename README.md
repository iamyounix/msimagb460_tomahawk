# iHack MSI MAG B460 Tomahawk

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
[![Version](https://img.shields.io/badge/Version-0.8.8-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents

- [Introduction][Intro]
  - [Devices][Devices]
  - [Plist Configuration][Plist Configuration]
  - [History][History]
- [Guide and Samples][Guide and Samples]
- [Update][Update]
- [Credits][Credits]

## Introduction

This is my current EFI clone that I built according to my hardware. Feel free to read my content. If you have a similar build but different settings, you might consider checking this out. Before read, below is the best way to checkout the latest OpenCore guide and news.

- [Dortania][OpenCore Install Guide] "Getting Started".
- Checkout latest [post][News by Developer], news and update directly from developer.

> **Reminder**: Since I only boot Linux and macOS, my ACPI code would be less (lack of `Else`, numerous OS `Zero` and `0xFF` methods). This will result in issues with Windows. If you need help dual- or multiple-booting other operating systems, especially Windows, please get in touch with me.

### Devices

- ~~400 Series Chipset Family SATA AHCI Controller~~
- ~~6th-10th Gen Core Processor PCIe Controller (x16)~~
- ~~B460 Chipset LPC/eSPI Controller~~
- ~~Cannon Lake PCH Power Management Controller~~
- ~~Comet Lake PCH-V HECI Controller~~
- ~~Comet Lake PCI Express Root Port #03~~
- ~~Comet Lake PCI Express Root Port #05~~
- ~~Comet Lake PCI Express Root Port #07~~
- ~~Comet Lake PCI Express Root Port #09~~
- ~~Comet Lake PCI Express Root Port #19~~
- ~~Comet Lake PCI Express Root Port #21~~
- ~~Navi 10 XL Upstream Port of PCI Express Switch~~
- ASM3241 USB 3.2 Host Controller
- BCM4360 802.11ac Wireless Network Adapter
- Comet Lake PCH-V cAVS
- Comet Lake PCH-V SMBus Host Controller
- Comet Lake PCH-V Thermal Subsystem
- Comet Lake PCH-V USB Controller
- Comet Lake-S 6c Host Bridge/DRAM Controller
- Ethernet Connection (11) I219-V
- Intel CoffeeLake-H GT2 (UHD Graphics 630 Headless)
- Kingston A2000 NVMe SSD1
- Kingston A2000 NVMe SSD2
- Navi 10 HDMI Audio
- Navi 10 XL Downstream Port of PCI Express Switch
- Navi 14 Radeon RX 5500/5500M / Pro 5500M
- RTL8125 2.5GbE Controller
- VL805/806 xHCI USB 3.0 Controller
- Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen

> **Note**: Device with `striketrough` mark is untouched, no acpi, kext and config.plist patch required.

### Plist Configuration

Settings should be based on the type of CPU, motherboard, and GPU. This is a Comet Lake, B460, and AMD Navi 14 configuration via `config.plist`.

- **ACPI**

  - [SSDT-MSIB460.aml][SSDT-MSIB460]

- **Booter**

  - Quirks
  
    - AvoidRuntimeDefrag - boolean - `Yes`
    - DevirtualiseMmio - boolean - `Yes`
    - EnableSafeModeSlide - boolean - `Yes`
    - ProvideCustomSlide - boolean - `Yes`
    - SyncRuntimePermissions - boolean - `Yes`
    - ProvideMaxSlide - number - `0`
    - ResizeAppleGpuBars - number - `-1`
  
      > **Note**: Other than above is `No`

- **DeviceProperties**

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
  
    - `@0,name` to `@3,name` - data - `4154592C507974686F6E`
    - `AAPL,slot-name` - data - `536C6F742D2031`
    - `ATY,EFIVersion` - data - `33312E302E3132302E32362E33`
    - `device_type` - data - `4154592C507974686F6E506172656E74`

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
  
    - `AAPL,slot-name` - data - `536C6F742D2031`
    - `model` - data - `4E6176692031302048444D4920417564696F`
  
  - PciRoot(0x0)/Pci(0x14,0x0)
  
    - `acpi-wake-type` - data - `01`
  
  - PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)
  
    - `acpi-wake-type` - data - `01`
    - `model` - data `41534D6564696120546563686E6F6C6F67792041534D333234312055534220332E30205848434920436F6E74726F6C6C6572`
  
  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)
  
    - `AAPL,slot-name` - data - `536C6F742D2033`
    - `acpi-wake-type` - data - `01`
    - `model` - data - `564C3830352F38303620784843492055534220332E3020436F6E74726F6C6C6572`
  
  - PciRoot(0x0)/Pci(0x1C,0x6)/Pci(0x0,0x0)
  
    - `AAPL,slot-name` - data - `536C6F742D2032`
    - `model` - data - `42434D34333630203830322E3131616320576972656C657373204E6574776F726B2041646170746572`
    - `name` - data - `616972706F7274`
  
  - PciRoot(0x0)/Pci(0x1F,0x3)
  
    - `layout-id` - data - `01000000`
  
  - PciRoot(0x0)/Pci(0x2,0x0)
  
    - `AAPL,ig-platform-id` - data - `0300923E`
    - `AAPL,slot-name` - data - `536C6F742D2030`
    - `agdpmod` - data - `70696B65726100`
    - `device-id` - data - `9B3E0000`
    - `enable-metal` - data - `01000000`
    - `igfxfw` - data - `02000000`
    - `igfxonln` - data - `01000000`

> **Note**: Check device properties in plist layout [here][Device Properties Samples].

- **Kext**

  - Add
  
    - [x] AppleALC.kext
    - [x] IntelMausi.kext
    - [x] Lilu.kext
    - [x] LucyRTL8125Ethernet.kext
    - [x] SMCProcessor.kext
    - [x] SMCSuperIO.kext
    - [x] USBMap.kext
    - [x] VirtualSMC.kext
    - [x] WhateverGreen.kext

  - Patch

    - Arch - string - `x86_64`
    - Comment - string - `Enable SSD TRIM`
    - Count - number - `0`
    - Enabled - boolean - `Yes`
    - Find - data - `00415050 4C452053 534400`
    - Identifier - string - `com.apple.iokit.IOAHCIBlockStorage`
    - Limit - number - `0`
    - Replace - data - `00000000 00000000 000000`

> **Note**: Others than above should remain as empty

- Quirks
  
  - AppleXcpmCfgLock - boolean - `Yes`
  - DisableIoMapper - boolean - `Yes`
  - PanicNoKextDump - boolean - `Yes`
  - PowerTimeoutKernelPanic - boolean - `Yes`
  - SetApfsTrimTimeout - number - `0`

> **Note**: Others than shall remain as `No`

- **Misc**

  - ConsoleAttributes - boolean - `Yes`
  - HibernateMode - boolean - `Yes`
  - HideAuxiliary - string - `Auto`
  - LauncherOption - string - `Full`
  - LauncherPath - string - `Default`
  - PickerAttributes - number - `147`
  - PickerMode - string - `External`
  - PickerVariant - string - `Acidanthera\GoldenGate`
  - ShowPicker - boolean - `Yes`
  - TakeoffDelay - number - `0`
  - Timeout - number - `5`

> **Note**: Other than above is `No`

- **PlatformInfo**

  - SMBIOS: [iMac20,1][EveryMac iMac20,1]

- **UEFI**

  - APFS
  
    - EnableJumpstart - boolean - `Yes`
    - HideVerbose - boolean - `Yes`
    - MinDate - number - `0`
    - MinVolume - number - `0`
  
  - Drivers
  
    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `OpenRuntime.efi`
    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `ResetNvramEntry.efi`

      > **Note**: Enable - `boolean` all driver as `Yes`

  - Input
  
    - KeyForgetThreshold - number - `5`
    - LeySupport - boolean - `Yes`
    - KeySupportMode - boolean - `Auto`
    - PointerSupportMode - string - `ASUS`
    - TimerResolution - number - `50000`

      > **Note**: Other than above is `No`

  - Output
  
    - GopPassThrough - string - `Disable`
    - ProvideConsoleGop - boolean - `Yes`
    - Resolution - string - `max`
    - TextRenderer - string - `BuiltinGraphics`
    - UIScale - number - `-1`

      > **Note**: Other than above is `No`

  - ProtocolOverrides
  
    - FirmwareVolume - boolean - `Yes`

      > **Note**: Other than above is `No`

  - Quirks
  
    - EnableVectorAcceleration - boolean - `Yes`
    - ExitBootServicesDelay - number - `0`
    - RequestBootVarRouting - boolean - `Yes`
    - ResizeGpuBars - number - `-1`
    - TscSyncTimeout - number - `0`

      > **Note**: Other than above is `No`

### History

- December 15, 2022 4:02 PM

  - This hack got an issue since Monterey only inject 2/4 properties (wake & sleep). `USBX` has `4` properties as usual but still inject `2/4` properties.
  
    - [x] `kUSBSleepPowerSupply`, `0x13EC`
    - [ ] `kUSBSleepPortCurrentLimit`, `0x0834`
    - [x] `kUSBWakePowerSupply`, `0x13EC`
    - [ ] `kUSBWakePortCurrentLimit`, `0x0834`

## Guide and Samples

- Below is relevan guide and samples for Hackintosh:

  - [Ambient Light Sensor][Ambient Light Sensor]
  - [Combine Kext][Combine Kext]
  - [Disassembled ASL Sample][Disassemble SSDT Sample]
  - [Renaming and Add Missing Devices][Renaming and Add Missing Devices]
  - [Transferring Opencore to Clover][Transferring OpenCore to Clover]
  - [USB Wake and Sleep Fix][USB Wake and Sleep Fix]

## Update

- January 28, 2023 2:02 AM

  - [ ] Remove certain stupid ACPI code and config.plist injection for better stability.
  - [ ] Permanent `agdpmod=pikera` via `IGPU`.
  - [ ] Fix unrecognize `pci-bridge` connected to `GFX0`.
  - [ ] Clean single SSDT.
  - [ ] Better device rename via ACPI.
  - [ ] Fix USB properties. Now all `4` properties is properly inject using `USBMap.kext` and `SSDT-MSIB460.aml`.

## Credits

- [acidanthera](https://github.com/acidanthera) | [dortania](https://github.com/dortania) | [dreamwhite](https://github.com/dreamwhite)

[Ambient Light Sensor]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/ambient%20light%20sensor/ambient%20light%20sensor.md
[Combine Kext]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/combinekext/combinekext.md
[Credits]: #credits
[Device Properties Samples]: https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/DeviceProperties/deviceproperties.plist
[Devices]: #devices
[Disassemble SSDT Sample]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/tree/main/guide%20and%20samples/disassembled%20ASL%20sample
[EveryMac iMac20,1]: https://everymac.com/systems/apple/imac/specs/imac-core-i5-3.1-6-core-27-inch-retina-5k-2020-specs.html
[Guide and Samples]: #guide-and-samples
[History]: #history
[Intro]: #introduction
[News by Developer]: https://dortania.github.io
[OpenCore Install Guide]: https://dortania.github.io/OpenCore-Install-Guide/
[Plist Configuration]: #plist-configuration
[Renaming and Add Missing Devices]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/renaming%20and%20add%20missing%20devices/Rename%20and%20Add%20Missing%20Devices.md
[SSDT-MSIB460]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/disassembled%20ASL%20sample/ssdt-b460-sample-full.dsl
[Transferring OpenCore to Clover]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/transferring%20opencore%20to%20clover/transferring%20opencore%20to%20clover.md
[Update]: #update
[USB Wake and Sleep Fix]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/usb%20wake%20and%20sleep%20fix/usb%20wake%20and%20sleep%20fix.md