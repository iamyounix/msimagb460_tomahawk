# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.3-white)](https://github.com/acidanthera/OpenCorePkg/releases)
![sysinfo](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/c52e5de0-c298-4200-98c5-dc243ea7b334)

> **Note:** Please read, google, and do some research related to your hardware before start.
>
> - Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).
> - Debug version can greatly help with debugging boot issues, however can add some noticeable delay to boot times (ie. 3-5 seconds to get to the picker). Once installed you can easily transition to Release.
> - Release version provide snappier boot times with no useful debug info.
> - This template include `Misc` / `Entries` example. Please change accordingly to your specific needed.

Table of Contents

- [Introduction](#introduction)
  - [Hardware and Devices](#hardware-and-devices)
  - [Base Files](#base-files)
  - [Tips](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/oc_tips/tips%20introduction.md)
- [Credits](#credits)

## Introduction

This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party

Changelog 0.9.3

- Bypass 15 USB Port Limit
- Switch USBMap.kext to UTBMap.kext.
- Integrate XHCI-Unsupport to UTBMap.kext (unlock all port)
- Maintain all properties from 0.9.2.

### Hardware and Devices

- 400 Series Chipset Family SATA AHCI Controller
- ASM3241 USB 3.2 Host Controller
- BCM4360 802.11ac Wireless Network Adapter
- Comet Lake PCH-V HECI Controller
- Comet Lake PCH-V SMBus Host Controller
- Comet Lake-S UHD Graphics 630 (Headless)
- Comet Lake-S 6c Host Bridge/DRAM Controller
- Comet Lake PCH-V USB Controller
- Comet Lake PCH-V cAVS - Requires AppleALC
- Ethernet Connection (11) I219-V 
- KINGSTON SA2000M8500G NVMe SSD No. 1
- KINGSTON SA2000M8500G NVMe SSD No. 2
- Navi 10 HDMI Audio
- Navi 14 Radeon RX 5500/5500M / Pro 5500M
- RTL8125 2.5GbE Controller

> Note: `agdpmod=pikera` boot arg may disable `board ID` checks on Navi GPUs (RX 5000 and 6000 series); without this, you'll get a black screen, especially on SMBIOS, which is built with dual GPUs. Don't use it if you don't have Navi (i.e., Polaris and Vega cards shouldn't use this). As an alternative, this patch can also be injected via DeviceProperties as `agdpmod` or `data` or `70696b65726100` to any of the two GPUs available. Refer, [here](https://github.com/acidanthera/WhateverGreen).

### Base Files

Using 64-bit Firmwares, all base is taken from [OpenCorePkg's releases](https://github.com/acidanthera/OpenCorePkg/releases/) (x64) and [Binary Data](https://github.com/acidanthera/OcBinaryData).

```zsh
📁 EFI
├── 📁 BOOT
│  └── 📃 BOOTx64.efi                  // OC Base File
└── 📁 OC
    ├── 📁 ACPI
    │  └── 📃 SSDT-YNXB460.aml         // An additional patches using Secondary System Description Tables
    ├── 📁 Drivers
    │  ├── 📃 HfsPlus.efi              // OpenCore Extensible Firmware Interface, Binary Data (release)
    │  ├── 📃 OpenCanopy.efi           // OpenCore Extensible Firmware Interface, OpenCore Package (debug & release)
    │  ├── 📃 OpenRuntime.efi          // OpenCore Extensible Firmware Interface, OpenCore Package (debug & release)
    │  ├── 📃 ResetNvramEntry.efi      // OpenCore Extensible Firmware Interface, OpenCore Package (debug & release)
    │  └── 📃 ToggleSipEntry.efi       // OpenCore Extensible Firmware Interface, OpenCore Package (debug & release) 
    ├── 📁 Kexts
    │  ├── 📃 AppleALC.kext            // Compulsory Lilu extension (debug & release)
    │  ├── 📃 IntelMausi.kext          // Compulsory, standalone (debug & release)
    │  ├── 📃 Lilu.kext                // Compulsory (debug & release)
    │  ├── 📃 LucyRTL8125Ethernet.kext // Compulsory, standalone (release)
    │  ├── 📃 DebugEnhancer.kext       // An additional Lilu extension (debug)
    │  ├── 📃 RestrictEvents.kext      // An additional Lilu extension (debug & release)
    │  ├── 📃 SMCProcessor.kext        // An additional VirtualSMC plugin (debug & release)
    │  ├── 📃 SMCSuperIO.kext          // An additional VirtualSMC plugin (debug & release)
    │  ├── 📃 USBMap.kext              // Compulsory, standalone (refer USBToolbox/Windows and USBMap/MacOS)
    │  ├── 📃 VirtualSMC.kext          // Compulsory, Lilu extension (debug & release)
    │  └── 📃 WhateverGreen.kext       // Compulsory, Lilu extension (debug & release)
    ├── 📁 Resources
    │  ├── 📃 Audio                    // OpenCore Binary Data (release)
    │  ├── 📃 Font                     // OpenCore Binary Data (release)
    │  ├── 📃 Image                    // OpenCore Binary Data (release)
    │  └── 📃 Label                    // OpenCore Binary Data (release)
    ├── 📁 Tools
    │  └── 📃 OpenShell.efi            // OpenCore Extensible Firmware Interface (debug & release) 
    ├── 📃 config.plist                // OpenCore Configuration (debug & release)
    └── 📃 OpenCore.efi                // OpenCore Extensible Firmware Interface (debug & release)
```
> Note: Binary, drivers, and kexts may change. Refer [changelog](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/README.md#introduction) for more info.

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
