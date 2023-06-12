# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.2-white)](https://github.com/acidanthera/OpenCorePkg/releases)
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

Changelog

- Add [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
- Add [DebugEnhancer.kext](https://github.com/acidanthera/DebugEnhancer) to [debug](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/oc_debug.zip) version, enable additional debug output in the macOS kernel, originated by [Piker R. Alpha](https://github.com/Piker-Alpha)
- Clean and Optimised ACPI code (Single `.aml` file)
- iMac20,1 SMBIOS.
- Stable [RX5500XT Mech OC 4GB](https://www.msi.com/Graphics-Card/Radeon-RX-5500-XT-MECH-4G-OC) patch via config.plist.
- Support Big Sur, Monterey and Ventura.
- Debug - SIP disabled
  - boot args
    - `-liludbg`, `-dbgenhdbg`, `-dbgenhiolog`, `-v`, `-vsmcdbg`, `-wegdbg`, `debug=0x100`, `keepsyms=1`, `-revdbg`
- Release - SIP enabled
  - boot args
    - `none`

### Hardware and Devices

Below is the devices info related to this project:

```zsh
╭─younix at archlinux in ~ 23-06-02 - 23:58:50
╰─○ lshw -short 
WARNING: you should run this program as super-user.
H/W path          Device        Class          Description
==========================================================
                                system         Computer
/0                              bus            Motherboard
/0/0                            memory         32GiB System memory
/0/1                            processor      Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
/0/100                          bridge         Comet Lake-S 6c Host Bridge/DRAM Controller
/0/100/1                        bridge         6th-10th Gen Core Processor PCIe Controller (x16)
/0/100/1/0                      bridge         Navi 10 XL Upstream Port of PCI Express Switch
/0/100/1/0/0                    bridge         Navi 10 XL Downstream Port of PCI Express Switch
/0/100/1/0/0/0                  display        Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
/0/100/1/0/0/0.1                multimedia     Navi 10 HDMI Audio
/0/100/2                        display        CometLake-S GT2 [UHD Graphics 630]
/0/100/8                        generic        Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
/0/100/14                       bus            Comet Lake PCH-V USB Controller
/0/100/14.2                     generic        Comet Lake PCH-V Thermal Subsystem
/0/100/16                       communication  Comet Lake PCH-V HECI Controller
/0/100/17                       storage        400 Series Chipset Family SATA AHCI Controller
/0/100/1b                       bridge         Intel Corporation
/0/100/1b/0                     bus            ASMedia Technology Inc.
/0/100/1b.4                     bridge         Comet Lake PCI Express Root Port #21
/0/100/1b.4/0     /dev/nvme0    storage        KINGSTON SA2000M8500G
/0/100/1b.4/0/0   hwmon1        disk           NVMe disk
/0/100/1b.4/0/2   /dev/ng0n1    disk           NVMe disk
/0/100/1b.4/0/1   /dev/nvme0n1  disk           NVMe disk
/0/100/1c                       bridge         Intel Corporation
/0/100/1c/0       enp6s0        network        RTL8125 2.5GbE Controller
/0/100/1c.6                     bridge         Intel Corporation
/0/100/1c.6/0     wlan0         network        BCM4360 802.11ac Wireless Network Adapter
/0/100/1d                       bridge         Comet Lake PCI Express Root Port 9
/0/100/1d/0       /dev/nvme1    storage        KINGSTON SA2000M8500G
/0/100/1d/0/0     hwmon2        disk           NVMe disk
/0/100/1d/0/2     /dev/ng1n1    disk           NVMe disk
/0/100/1d/0/1     /dev/nvme1n1  disk           NVMe disk
/0/100/1f                       bridge         B460 Chipset LPC/eSPI Controller
/0/100/1f.2                     memory         Memory controller
/0/100/1f.3                     multimedia     Comet Lake PCH-V cAVS
/0/100/1f.4                     bus            Comet Lake PCH-V SMBus Host Controller
/0/100/1f.6       enp0s31f6     network        Ethernet Connection (11) I219-V
/0/2                            system         Motherboard registers
/0/3                            system         Motherboard registers
/0/4                            generic        PnP device INT3f0d
/0/5                            system         Motherboard registers
/0/6                            system         Motherboard registers
/0/7                            system         Motherboard registers
/0/8                            system         Motherboard registers
```

#### Native

- Full functioning devices without any additional needs:
  - 400 Series Chipset Family SATA AHCI Controller
  - ASM3241 USB 3.2 Host Controller
  - BCM4360 802.11ac Wireless Network Adapter
  - Comet Lake PCH-V HECI Controller
  - Comet Lake PCH-V SMBus Host Controller
  - Comet Lake-S UHD Graphics 630 (Headless)
  - KINGSTON SA2000M8500G NVMe SSD No. 1
  - KINGSTON SA2000M8500G NVMe SSD No. 2
  - Navi 10 HDMI Audio - Native
  - Navi 14 Radeon RX 5500/5500M / Pro 5500M

> Note: `agdpmod=pikera` boot arg may disable `board ID` checks on Navi GPUs (RX 5000 and 6000 series); without this, you'll get a black screen, especially on SMBIOS, which is built with dual GPUs. Don't use it if you don't have Navi (i.e., Polaris and Vega cards shouldn't use this). As an alternative, this patch can also be injected via DeviceProperties as `agdpmod` or `data` or `70696b65726100` to any of the two GPUs available. Refer, [here](https://github.com/acidanthera/WhateverGreen).
> 
#### Partial

- Require Kexts/Patch/ACPI Injections for full functioning:
  - Comet Lake-S 6c Host Bridge/DRAM Controller - Require ACPI injection using `_STA` Method, `(0x0F)`
  - Comet Lake PCH-V USB Controller - Requires 400 Series [XHCIUnsuported.kext](https://github.com/CrisHotpatch/USBInjectAll) (Integrated with USBMap.kext)
  - Comet Lake PCH-V cAVS - Requires AppleALC - Require [AppleALC](https://github.com/acidanthera/AppleALC)
  - Ethernet Connection (11) I219-V - Requires [IntelMausi](https://github.com/acidanthera/IntelMausi)
  - RTL8125 2.5GbE Controller - Requires [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)

#### Not Working

- Not Function, No Solution tu Enabling / Partial Enabling the devices
  - None

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

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
