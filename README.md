# Hackintosh: MSI MAG B460 Tomahawk

[![BIOS](https://img.shields.io/badge/BIOS-1.60B-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

## Table of Content

- [Introduction](#introduction)
  
- [Devices Specification](#devices-specification)
  
- [OpenCore](#opencore)
  
  - [ACPI](#acpi)
    
  - [Booter](#booter)
    
  - [DeviceProperties](#deviceproperties)
    
  - [Kernel](#kernel)
    
  - [Misc](#misc)
    
  - [PlatformInfo](#platforminfo)
    
  - [UEFI](#uefi)
    
- [Changelog](#changelog)
  
- [Tips](#tips)
  
- [Credits](#credits)
  
### Introduction

This is my current EFI clone that I built according to my hardware. Feel free to read my content. If you have a similar build but different settings, you might consider checking this out. Before read, below is the best way to checkout the latest OpenCore guide and news

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) "Getting Started"
- Checkout latest [post](https://dortania.github.io), news and update directly from developer
  
### Devices Specification

- Hardware and Differences
  
  | **Hardware** | **Real iMac** | **My Hack** |
  | --- | --- | --- |
  | **Motherboard** | Apple Custom | MSI MAG B460 Tomahawk |
  | **Processor** | Core i5 10500 | i5 10400 |
  | **Series** | 10th Gen | 10th Gen |
  | **Code Name** | Comet Lake | Comet Lake |
  | **Socket** | LGA1200 | LGA1200 |
  | **Core** | 6   | 6   |
  | **Thread** | 12  | 12  |
  | **Base Freq** | 3.1 GHz | 2.9 GHz |
  | **Turbo Boost** | 4.5 GHz | 4.3 GHz |
  | **ROM/FW Type** | EFI | EFI / Legacy |
  | **T2 Sec. Chip** | Yes | No  |
  | **RAM** | Up to 2666 MHz DDR4 SDRAM | Up to 2666 MHz DDR4 SDRAM |
  | **iGPU** | Intel UHD 630 | Intel UHD 630 |
  | **dGPU** | Radeon Pro 5300 4GB  (TB) | MSI RX 5500 XT Mech OC 4GB (HDMI & DP) |
  | **Native Resolution** | 5120 x 2880 | 5120 x 2880 |
  | **Firewire Ports** | None | None |
  | **Expansion Slot** | SDXC SD Card | Upgradeable |
  | **Wi-Fi** | 802.11ac (Broadcom) | 802.11ac (Broadcom) |
  | **Bluetooth** | 5.0 | 5.0 via BCM94360CD |
  | **Standard Storage** | 256 GB SSD | Upgradeable |
  
### OpenCore

- Structure
  
```zsh
EFI
├── BOOT
│   └── BOOTx64.efi                     // Modern BIOS firmware
└── OC
    ├── ACPI
    │   └── SSDT-EXT.aml                // Additional ACPI extension
    ├── config.plist                    // OpenCore configuration list
    ├── Drivers
    │   ├── HfsPlus.efi                 // HFS+ EFI driver
    │   ├── OpenCanopy.efi              // OpenCore entry driver
    │   ├── OpenRuntime.efi             // OpenCore firmware driver
    │   └── ResetNvramEntry.efi         // OpenCore NVRAM reset plugin
    ├── Kexts
    │   ├── AppleALC.kext               // Audio
    │   ├── IntelMausi.kext             // Ethernet
    │   ├── Lilu.kext                   // Arbitrary Kernel Library
    │   ├── LucyRTL8125Ethernet.kext    // Ethernet     
    │   ├── SMCProcessor.kext           // SMC plugin for processor
    │   ├── SMCSuperIO.kext             // IO SMC Plugin
    │   ├── USBMap.kext                 // Mapped USB Port
    │   ├── VirtualSMC.kext             // Virtual SMC
    │   └── WhateverGreen.kext          // Graphic Solution
    ├── OpenCore.efi                    // Bootloader plugins
    ├── Resources
    │   ├── Audio                       // Audio library
    │   ├── Font                        // Font library
    │   ├── Image                       // Image library
    │   │   └── Acidanthera
    │   │       ├── Chardonnay
    │   │       ├── GoldenGate
    │   │       └── Syrah
    │   └── Label                        // Label library
    └── Tools
```

#### ACPI

- [SSDT-EXT](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/SSDT/SSDT-EXT.dsl) contain:
  
  - AWAC
    - System clock fix on Z390, B460, Z490 motherboards
  - EC
    - Fake Embedded Controller as an alternative EC controller, also prevents actual `AppleACPIEC` from being loaded on macOS
  - MCHC
    - Memory Controller Hub Configuration (Cosmetics)
  - PXSX
    - Patched PCI Bridge for `GFX0`
  - PGMM
    - Processor Gaussian Mixture Model (Cosmetics)
  - SBUS
    - Patched System BUS
  - TSUB
    - Thermal Subsystem (Cosmetics)
  - USBX
    - Patched USB Power Management

#### Booter

- Quirks
  
| Input | Type | Value |
| --- | --- | --- |
| AvoidRuntimeDefrag | boolean | Yes |
| DevirtualiseMmio | boolean | Yes |
| EnableSafeModeSlide | boolean | Yes |
| ProvideCustomSlide | boolean | Yes |
| SyncRuntimePermissions | boolean | Yes |
| ProvideMaxSlide | number | 0   |
| ResizeAppleGpuBars | number | -1  |

> **Note**: Other than above is `No`

#### DeviceProperties

Please see the entire patch [here](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/DeviceProperties/deviceproperties.plist).

> **Note**: The format is in XML.

#### Kernel

- Kernel extension used for this build.
  
| Kext | Details |
| --- | --- |
| **AppleALC** | An open source kernel extension enabling native macOS HD audio for not officially supported codecs without any filesystem modifications. AppleALCU can be used for systems with digital-only audio. |
| **IntelMausi** | Intel onboard LAN driver for macOS |
| **Lilu** | An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS. |
| **LucyRTL8125Ethernet** | A macOS driver for Realtek RTL8125 2.5GBit Ethernet Controllers |
| **USBMap** | USB Port configuration. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |
| **VirtualSMC** | Advanced Apple SMC emulator in the kernel. Requires [Lilu](https://github.com/acidanthera/Lilu) for full functioning. Include with SMCProcessor & SMCSuperIO. |
| **Whatevergreen** | [Lilu](https://github.com/acidanthera/Lilu) plugin providing patches to select GPUs on macOS. Requires Lilu 1.5.6 or newer. |

- Patch

| Input | Type | Value |
| --- | --- | --- |
| Arch | string | x86_64 |
| Base | string |     |
| Comment | string | Enable TRIM for SSD \\| Catalina + |
| Count | number | 0   |
| Enabled | boolean | Yes |
| Find | data | 00415050 4C452053 534400 |
| Identifier | string | com.apple.iokit.IOAHCIBlockStorage |
| Limit | number | 0   |
| Mask | data |     |
| MaxKernel | string |     |
| MinKernel | string |     |
| Replace | data | 00000000 00000000 000000 |
| ReplaceMask | data |     |
| Skip | data |     |

- Quirks
  
| Input | Type | Value |
| --- | --- | --- |
| AppleXcpmCfgLock | boolean | Yes |
| DisableIoMapper | boolean | Yes |
| PanicNoKextDump | boolean | Yes |
| PowerTimeoutKernelPanic | boolean | Yes |
| SetApfsTrimTimeout | number | 0   |

> **Note**: Other than above is `No`

#### Misc

| Input | Type | Value |
| --- | --- | --- |
| ConsoleAttributes | boolean | Yes |
| HibernateMode | boolean | Yes |
| HideAuxiliary | string | Auto |
| LauncherOption | string | Full |
| LauncherPath | string | Default |
| PickerAttributes | number | 147 |
| PickerMode | string | External |
| PickerVariant | string | Acidanthera\GoldenGate |
| ShowPicker | boolean | Yes |
| TakeoffDelay | number | 0   |
| Timeout | number | 5   |

> **Note**: Other than above is `No`

#### PlatformInfo

- SMBIOS: [iMac20,1](https://everymac.com/systems/apple/imac/specs/imac-core-i5-3.1-6-core-27-inch-retina-5k-2020-specs.html)
  
#### UEFI

- APFS
  
| Input | Type | Value |
| --- | --- | --- |
| EnableJumpstart | boolean | Yes |
| HideVerbose | boolean | Yes |
| MinDate | number | 0   |
| MinVolume | number | 0   |

- Drivers
  
| Input | Type | Value |
| --- | --- | --- |
| Enable | boolean | Yes |
| Path | boolean | HFSPlus.efi |

| Input | Type | Value |
| --- | --- | --- |
| Enable | boolean | Yes |
| Path | boolean | OpenRuntime.efi |

| Input | Type | Value |
| --- | --- | --- |
| Enable | boolean | Yes |
| Path | boolean | HFSPlus.efi |

| Input | Type | Value |
| --- | --- | --- |
| Enable | boolean | Yes |
| Path | boolean | ResetNvramEntry.efi |

- Input

| Input | Type | Value |
| --- | --- | --- |
| KeyForgetThreshold | number | 5   |
| LeySupport | boolean | Yes |
| KeySupportMode | boolean | Auto |
| PointerSupportMode | string | ASUS |
| TimerResolution | number | 50000 |

> **Note**: Other than above is `No`

- Output

| Input | Type | Value |
| --- | --- | --- |
| GopPassThrough | string | Disable |
| ProvideConsoleGop | boolean | Yes |
| Resolution | string | max |
| TextRenderer | string | BuiltinGraphics |
| UIScale | number | -   |

> **Note**: Other than above is `No`

- ProtocolOverrides

| Input | Type | Value |
| --- | --- | --- |
| FirmwareVolume | boolean | Yes |

> **Note**: Other than above is `No`

Quirks

| Input | Type | Value |
| --- | --- | --- |
| EnableVectorAcceleration | boolean | Yes |
| ExitBootServicesDelay | number | 0   |
| RequestBootVarRouting | boolean | Yes |
| ResizeGpuBars | number | -1  |
| TscSyncTimeout | number | 0   |

> **Note**: Other than above is `No`

## Changelog

**[0.8.8](https://github.com/acidanthera/OpenCorePkg/releases)**

- Updated underlying EDK II package to edk2-stable202211
- Updated AppleKeyboardLayouts.txt from macOS 13.1
- Updated builtin firmware versions for SMBIOS and the rest
- Updated ocvalidate to allow duplicate tool if FullNvramAccess is different
- Fixed `Kernel` -> `Block` entries not being processed if one was skipped due to `Arch`
- Fixed intermittent prelinking failures caused by XML corruption when kext blocking is enabled
- Removed magic Acidanthera sequence from OpenCore files used for picker hiding
- Added `.contentVisibility` to hide and disable boot entries
- Added Linux support to QemuBuild.command used for Duet debugging
- Built in new secure PE/COFF loader
- Added prebuilt mtoc universal binary with Apple Silicon support
- Corrected OpenDuet build on Apple Silicon
- Added SD card device path support for boot device selection

## My Build

- [Release](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8release.zip)
- [Debug](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8debug.zip)
- [Both](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8both.dmg)

> **Note**: SMBIOS is censored by [OC-Anonymizer](https://github.com/dreamwhite/OC-Anonymizer)

## Patches

- permanent `agdpmod=pikera` via IGPU DeviceProperties.
- permanent `acpi-wake-type` via XHCI and PXSX DeviceProperties.
- patched `ATY,Python` FB for MSI RX 5500 XT Mech OC 4GB.
- less acpi code

## Tips

- [Rename Devices](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/Guide/Rename%20Devices/Rename%20Devices.md)
- [Missing Bridge](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/Guide/Missing%20Bridge/Missing%20Bridge.md)
- [USB keyboard Wake](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/Guide/USB%20Keyboard%20Wake/USB%20Keyboard%20Wake.md)

## Credits

#### [Acidanthera](https://github.com/acidanthera) | [Dortania](https://github.com/dortania) | [dreamwhite](https://github.com/dreamwhite).
