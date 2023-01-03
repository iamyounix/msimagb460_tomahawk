# Hackintosh: MSI MAG B460M Tomahawk

[![BIOS](https://img.shields.io/badge/BIOS-1.60B-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

### Introduction

This is an Hackintosh EFI template that I built according to my generic computer specifications. Before start, please...

- Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding.
- Checkout Dortania Monthly [Post](https://dortania.github.io) to get latest news from developer directly.

### Devices Specification

- MSI MAG [B460M Tomahawk](https://www.msi.com/Motherboard/MAG-B460-TOMAHAWK)
  - [x] Intel® [Core™ i5-10400](https://www.intel.com/content/www/us/en/products/sku/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz/specifications.html)
  - [x] Intel® [UHD 630](https://ark.intel.com/content/www/us/en/ark/products/graphics/126790/intel-uhd-graphics-630.html)
  - [x] MSI [RX 5500 XT MECH OC](https://www.msi.com/Graphics-Card/Radeon-RX-5500-XT-MECH-4G/Overview) 4GB
  - [x] 32GB RAM
  - [x] 02 x [Kingston A2000](https://www.kingston.com/en/company/press/article/56606) 500GB, 02 x [San Disk Ultra 3D SSD](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ultra-3d-sata-iii-ssd#SDSSDH3-250G-G25) 500GB

### Structure

```zsh
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   └── SSDT-EXT.aml
    ├── config.plist
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   ├── OpenRuntime.efi
    │   └── ResetNvramEntry.efi
    ├── Kexts
    │   ├── AppleALC.kext
    │   ├── IntelMausi.kext
    │   ├── Lilu.kext
    │   ├── LucyRTL8125Ethernet.kext
    │   ├── SMCProcessor.kext
    │   ├── SMCSuperIO.kext
    │   ├── USBMap.kext
    │   ├── VirtualSMC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources
    │   ├── Audio
    │   ├── Font
    │   ├── Image
    │   │   └── Acidanthera
    │   │       ├── Chardonnay
    │   │       ├── GoldenGate
    │   │       └── Syrah
    │   └── Label
    └── Tools
```

#### ACPI

[SSDT-EXT](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/SSDT/SSDT-EXT.dsl) contain:

| Input | Details |
|---|---|
| AWAC | System clock fix on Z390, B460, Z490 motherboards |
| EC | Fake Embedded Controller as an alternative EC controller, also prevents actual AppleACPIEC from being loaded on macOS. |
| MCHC | Memory Controller Hub Configuration (Cosmetics) |
| PXSX | Patched PCI Bridge for GFX0 |
| PGMM | Processor Gaussian Mixture Model (Cosmetics) |
| SBUS | Patched System BUS |
| TSUB | Thermal Subsystem (Cosmetics) |
| USBX | Patched USB Power Management (Required for USBMap.kext) |

#### Booter

Quirks

| Input | Option |
|---|---|
| AvoidRuntimeDefrag | Yes |
| DevirtualiseMmio | Yes |
| EnableSafeModeSlide | Yes |
| ProvideCustomSlide | Yes |
| SyncRuntimePermissions | Yes |
| ProvideMaxSlide | 0 |
| ResizeAppleGpuBars | -1 |

> **Note**: Other than above is `No`

#### DeviceProperties

Checkout [here](https://github.com/theofficialcopypaste/MSIB460Tomahawk/blob/main/DeviceProperties/deviceproperties.plist).

#### Kernel

Kexts

| Kext | Details |
|---|---|
| AppleALC | An open source kernel extension enabling native macOS HD audio for not officially supported codecs without any filesystem modifications. AppleALCU can be used for systems with digital-only audio. |
| IntelMausi | Intel onboard LAN driver for macOS |
| Lilu | An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS. |
| LucyRTL8125Ethernet | A macOS driver for Realtek RTL8125 2.5GBit Ethernet Controllers |
| USBMap | USB Port configuration. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |
| VirtualSMC | Advanced Apple SMC emulator in the kernel. Requires [Lilu](https://github.com/acidanthera/Lilu) for full functioning. Include with SMCProcessor & SMCSuperIO. |
| Whatevergreen | [Lilu](https://github.com/acidanthera/Lilu) plugin providing patches to select GPUs on macOS. Requires Lilu 1.5.6 or newer. |

Patch

| Input | Type | Details |
|---|---|---|
| Arch | String | x86_64 |
| Base | String |  |
| Comment | String | Enable TRIM for SSD \| Catalina + |
| Count | Number | 0 |
| Enabled | Boolean | Yes |
| Find | Data | 00415050 4C452053 534400 |
| Identifier | String | com.apple.iokit.IOAHCIBlockStorage |
| Limit | Number | 0 |
| Mask | Data |  |
| MaxKernel | String |  |
| MinKernel | String |  |
| Replace | Data | 00000000 00000000 000000 |
| ReplaceMask | Data |  |
| Skip | Data |  |

Quirks

| Input | Option |
|---|---|
| AppleXcpmCfgLock | Boolean | Yes |
| DisableIoMapper | Boolean | Yes |
| PanicNoKextDump | Boolean | Yes |
| PowerTimeoutKernelPanic | Boolean | Yes |
| SetApfsTrimTimeout | Number | 0 |

> **Note**: Other than above is `No`

#### Misc

| Input | Type | Details |
|---|---|---|
| ConsoleAttributes | Boolean | Yes |
| HibernateMode | Boolean | Yes |
| HideAuxiliary | String | Auto |
| LauncherOption | String | Full |
| LauncherPath | String | Default |
| PickerAttributes | Number | 147 |
| PickerMode | String | External |
| PickerVariant | String | Acidanthera\GoldenGate |
| ShowPicker | Boolean | Yes |
| TakeoffDelay | Number | 0 |
| Timeout | Number | 5 |

> **Note**: Other than above is `No`

#### PlatformInfo

SMBIOS: iMac20,1

#### UEFI

APFS

| Input | Type | Details |
|---|---|---|
| EnableJumpstart | Boolean | Yes |
| HideVerbose | Boolean | Yes |
| MinDate | Number | 0 |
| MinVolume | Number | 0 |

Drivers

- HFSPlus

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | HFSPlus.efi |

- OpenRuntime

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | OpenRuntime.efi |

- OpenCanopy

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | HFSPlus.efi |

- ResetNvramEntry

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | ResetNvramEntry.efi |

- Input

| Input | Type | Details |
|---|---|---|
| KeyForgetThreshold | Number | 5 |
| LeySupport | Boolean | Yes |
| KeySupportMode | Boolean | Auto |
| PointerSupportMode | String | ASUS |
| TimerResolution | Number | 50000 |

> **Note**: Other than above is `No`

- Output

| Input | Type | Details |
|---|---|---|
| GopPassThrough | String | Disable |
| ProvideConsoleGop | Boolean | Yes |
| Resolution | String | max |
| TextRenderer| String | BuiltinGraphics |
| UIScale | Number | - |

> **Note**: Other than above is `No`

- ProtocolOverrides

| Input | Type | Details |
|---|---|---|
| FirmwareVolume | Boolean | Yes |

> **Note**: Other than above is `No`

Quirks

| Input | Type | Details |
|---|---|---|
| EnableVectorAcceleration | Boolean | Yes |
| ExitBootServicesDelay | Number | 0 |
| RequestBootVarRouting | Boolean | Yes |
| ResizeGpuBars | Number | -1 |
| TscSyncTimeout| Number | 0 |

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

**My Build** 

- [Release](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8release.zip)
- [Debug](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8debug.zip)
- [Both](https://github.com/theofficialcopypaste/MSIB460Tomahawk/releases/download/Release/OC_0.8.8both.dmg)

**Patches** 
  
- permanent `agdpmod=pikera` via IGPU DeviceProperties.
- permanent `acpi-wake-type` via XHCI and PXSX DeviceProperties.
- patched `ATY,Python` FB for MSI RX 5500 XT Mech OC 4GB.
- censored SMBIOS using [OC-Anonymizer](https://github.com/dreamwhite/OC-Anonymizer) credit to [dreamwhite](https://github.com/dreamwhite).
- less acpi code

### Credits

#### [Acidanthera](https://github.com/acidanthera) | [Dortania](https://github.com/dortania)
