# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.2-white)](https://github.com/acidanthera/OpenCorePkg/releases)
![systeminfo_oc](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5bf2d4e5-3dc1-4e2a-97d3-a7b1d0ce212a)

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
- Add [DebugEnhancer.kext](https://github.com/acidanthera/DebugEnhancer) to debug version, enable additional debug output in the macOS kernel, originated by [Piker R. Alpha](https://github.com/Piker-Alpha)
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

Below is the device info related to this project:

```zsh
╭─younix at archlinux in ~ 23-06-02 - 23:49:11
╰─○ lscpu
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         39 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  12
  On-line CPU(s) list:   0-11
Vendor ID:               GenuineIntel
  Model name:            Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
    CPU family:          6
    Model:               165
    Thread(s) per core:  2
    Core(s) per socket:  6
    Socket(s):           1
    Stepping:            5
    CPU(s) scaling MHz:  82%
    CPU max MHz:         4300.0000
    CPU min MHz:         800.0000
    BogoMIPS:            5802.42
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe sy
                         scall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni
                          pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_dead
                         line_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault invpcid_single ssbd ibrs ibpb stibp ibrs_enhanc
                         ed tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap c
                         lflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp pku ospke 
                         md_clear flush_l1d arch_capabilities
Virtualization features: 
  Virtualization:        VT-x
Caches (sum of all):     
  L1d:                   192 KiB (6 instances)
  L1i:                   192 KiB (6 instances)
  L2:                    1.5 MiB (6 instances)
  L3:                    12 MiB (1 instance)
NUMA:                    
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-11
Vulnerabilities:         
  Itlb multihit:         KVM: Mitigation: VMX disabled
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Mitigation; Clear CPU buffers; SMT vulnerable
  Retbleed:              Mitigation; Enhanced IBRS
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; Enhanced / Automatic IBRS, IBPB conditional, RSB filling, PBRSB-eIBRS SW sequence
  Srbds:                 Mitigation; Microcode
  Tsx async abort:       Not affected
```

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

- 400 Series Chipset Family SATA AHCI Controller
- ASM3241 USB 3.2 Host Controller
- BCM4360 802.11ac Wireless Network Adapter
- Comet Lake PCH-V HECI Controller
- Comet Lake PCH-V SMBus Host Controller
- Comet Lake-S 6c Host Bridge/DRAM Controller
- Comet Lake-S UHD Graphics 630 - Headless + `agdpmod` / `data` / `70696b65726100` based on [Piker R. Alpha](https://github.com/Piker-Alpha) agdpmod [patch](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/)
- KINGSTON SA2000M8500G NVMe SSD No. 1
- KINGSTON SA2000M8500G NVMe SSD No. 2
- Navi 10 HDMI Audio
- Navi 14 Radeon RX 5500/5500M / Pro 5500M

#### Not Native

- Comet Lake PCH-V USB Controller
- Comet Lake PCH-V cAVS
- Ethernet Connection (11) I219-V
- RTL8125 2.5GbE Controller

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
