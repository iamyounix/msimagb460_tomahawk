# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.2-white)](https://github.com/acidanthera/OpenCorePkg/releases)

![systeminfo_oc](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5bf2d4e5-3dc1-4e2a-97d3-a7b1d0ce212a)

## Changelog

- Add [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
- Add NVMe/SSD Trim patch (default is disable)
- Clean and Optimised ACPI code (Single .aml file)
- iMac20,1 SMBIOS.
- Stable [RX5500XT Mech OC 4GB](https://www.msi.com/Graphics-Card/Radeon-RX-5500-XT-MECH-4G-OC) patch via config.plist.
- Support Big Sur, Monterey and Ventura.
- Debug - SIP disabled
  - boot args
    - `-liludbg`, `-dbgenhdbg`, `-dbgenhiolog`, `-v`, `-vsmcdbg`, `-wegdbg`, `debug=0x100`, `keepsyms=1`, `-revdbg`
- Release - SIP enabled
  - boot args
    - none

## Reminder

- This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).
- Debug version can greatly help with debugging boot issues, however can add some noticeable delay to boot times (ie. 3-5 seconds to get to the picker). Once installed you can easily transition to Release.
- Release version provide snappier boot times with no useful debug info.
- This template include `Misc` / `Entries` example. Please change accordingly to your specific needed.

## Table of contents

- [Introduction](#introduction)
  - [Hardware and Devices](#hardware-and-devices)
    - [Native](#native)
    - [Not Native](#not-native)
  - [Base Files](#base-files)
  - [Post Process](#post-process)
    - [Enable GPU Tab in Activity Monitor](#enable-gpu-tab-in-activity-monitor)
    - [MMIO Whitelist](#mmio-whitelist)
    - [SBUS Check](#sbus-check)
    - [Specific Drivers and Sorting Kexts](#specific-drivers-and-sorting-kexts)
    - [Useful PowerShell Command](#useful-powershell-command)
    - [Enabling and Disabling SIP](#enabling-and-disabling-sip)
    - [Theme](#theme)
  - [Debug Log](#debug-log)
- [Credits](#credits)

### Introduction

This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party

#### Hardware and Devices

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

##### Native

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

##### Not Native

- Comet Lake PCH-V USB Controller
- Comet Lake PCH-V cAVS
- Ethernet Connection (11) I219-V
- RTL8125 2.5GbE Controller

#### Base Files

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

#### Post Process

##### Enable GPU Tab in Activity Monitor

- If the Device Properties of iGPU and dGPU are configured correctly, you will find the Tab "GPU" in the Activity Monitor App which lists the graphics devices and the tasks/processes assigned to each of them. Use this properties to enable gpu's tab. Requirement:
  - Change iGPU  `AAPL,slot-name` to `Slot- 0`. Most iGPU attached to this slot.
  - Add `AAPL,ig-platform-id` data `0300C59B` / `0300C89B` (headless Comet Lake platform)
  - Add `device-id` data `9B3E0000`  (Kaby Lake device id is required to properly rename GPU as UHD 630 on Comet Lake platform)
  - Add `enable-metal` data `01000000` (enable metal)
  - Add `force-online` data `01000000` (always enable for offline rendering)

  ![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)
  ![quicksync](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/36807524-6733-42b1-8e23-3d9aa1c6ff64)

##### MMIO Whitelist

- MMIO stands for Memory-Mapped Input/Output. It's a method to perform I/O processes between the CPU and peripheral devices of a computer. The memory and registers of the I/O devices are mapped to (and associated with) address values. MMIO whitelist is a security feature that controls access to certain memory addresses in a computer system, allowing access only to specific processes or devices that have been explicitly granted permission and denying access to all others. This patch may improve stability. Refer [5T33Z0 - MMIO Whitelist](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist) for more info. Example:

![mmio](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/202260c1-84b4-4645-a2e7-7600a64ad11e)

##### SBUS Check

- Most 8th Gen and above actually do not require `SSDT-SBUS`.
  - Try to load EFI without this patch and reboot. Refer [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/ACPI_Sample/SSDT-YNXB460.dsl) as an example.
  - After login, copy and paste this command, `kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`. The result will shown as below:

  ![sbus](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/801d1c7b-5102-407c-8373-7d930803750e)

  - Check `AppleSMBusController` and `AppleSMBUSPCI` kexts using `System Reports` / `Software` / `Extensions`. If both loads, `SBUS` is working native without any patches. Below is an example:

  ![sbus_check](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/a606a15f-4aef-48cc-bd0a-b205ba2fc8b0)

##### Specific Drivers and Sorting Kexts

- Adding a `Plugins` folder inside `Lilu.kext` and certain kexts to improve stability (Recommended). Use only specific drivers. improve boot speed and sorting kexts in priority; improve `debug` log and `data` injection, especially debugging. This method requires [Propertree](https://github.com/corpnewt/ProperTree). Below is an example:

  - Drivers

    ```zsh
    📁 Drivers
    ├── 📃 HfsPlus.efi                                        // 1
    ├── 📃 OpenCanopy.efi                                     // 2
    └── 📃 OpenRuntime.efi                                    // 3
    ```

  - Kext

    ```zsh
    📁 Lilu
    └── Contents
        ├── 📃 Info.plist
        ├── 📁 MacOS
        │   └── 📃 Lilu
        └── 📁 Plugins                                        // release, plugin that depends on Lilu.kext
            ├── 📁 AppleALC.kext
            │   └── 📁 Contents
            │       ├── 📃 Info.plist
            │       └── 📁 MacOS
            │           └── 📃 AppleALC
            ├── 📁 DebugEnhancer.kext
            │   └── 📁 Contents
            │       ├── 📃 Info.plist
            │       └── 📁 MacOS
            │           └── 📃 DebugEnhancer                  // debug
            ├── 📁 VirtualSMC.kext
            │   └── Contents
            │       ├── 📃 Info.plist
            │       ├── 📁 MacOS
            │       │   └── 📃 VirtualSMC
            │       └── Plugins                               // release, plugin that depends on VirtualSMC.kext
            │           ├── 📁 SMCProcessor.kext
            │           │   └── 📃 Contents
            │           │       ├── 📁 Info.plist
            │           │       └── MacOS
            │           │           └── 📃 SMCProcessor
            │           └── SMCSuperIO.kext
            │               └── Contents
            │                   ├── 📃 Info.plist
            │                   └── 📁 MacOS
            │                       └── 📃 SMCSuperIO
            └── 📁 WhateverGreen.kext
                └── 📁 Contents
                    ├── 📃 Info.plist
                    └── 📁 MacOS
                        └── 📃 WhateverGreen
    ```

    > **Note:**  All kexts contained in the `Plugins` folder are the kexts that rely on Lilu. `DebugEnhancer.kext` is include with debug version.

  - Open config.plist using [Propertree](https://github.com/corpnewt/ProperTree), and use **OC Clean Snapshot** function (`CMD`+`Shift`+`R`) to capture all kext (include plugins folder). [Here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/kext.plist) is an example in plist format. Below is the graphical structure:
  
  ![kexts_sort](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/6a64b331-62f9-431a-96fc-40f543acae43)
  
  - Our EFI structure shall be like this:

    ```zsh
    📁 EFI
    ├── 📁 BOOT
    │   └── 📃 BOOTx64.efi
    └── OC
        ├── 📁 ACPI
        │   └── 📃 SSDT-YNXB460.aml
        ├── 📁 Drivers
        │   ├── 📃 HfsPlus.efi
        │   ├── 📃 OpenCanopy.efi
        │   ├── 📃 OpenRuntime.efi
        ├── 📁 Kexts
        │   ├── 📁 IntelMausi.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       └── 📁 MacOS
        │   │           └── 📃 IntelMausi
        │   ├── 📁 Lilu.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       ├── 📁 MacOS
        │   │       │   └── 📃 Lilu
        │   │       └── 📁 Plugins
        │   │           ├── 📁 AppleALC.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── AppleALC
        │   │           ├── 📁 DebugEnhancer.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── 📃 DebugEnhancer
        │   │           ├── 📁 RestrictEvents.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── 📃 RestrictEvents
        │   │           ├── 📁 VirtualSMC.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       ├──📁  MacOS
        │   │           │       │   └── 📃 VirtualSMC
        │   │           │       └── 📁 Plugins
        │   │           │           ├── 📁 SMCProcessor.kext
        │   │           │           │   └── 📁 Contents
        │   │           │           │       ├── 📃 Info.plist
        │   │           │           │       └── 📁 MacOS
        │   │           │           │           └── 📃 SMCProcessor
        │   │           │           └── 📁 SMCSuperIO.kext
        │   │           │               └── 📁 Contents
        │   │           │                   ├── 📃 Info.plist
        │   │           │                   └── 📁 MacOS
        │   │           │                       └── 📃 SMCSuperIO
        │   │           └── 📁 WhateverGreen.kext
        │   │               └── 📁 Contents
        │   │                   ├── 📃 Info.plist
        │   │                   └── 📁 MacOS
        │   │                       └── 📃 WhateverGreen
        │   ├── 📁 LucyRTL8125Ethernet.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       ├── 📁 MacOS
        │   │       │   └── 📃 LucyRTL8125Ethernet
        │   │       └── 📁 _CodeSignature
        │   │           └── 📃 CodeResources
        │   └── 📁 USBMap.kext
        │       └── 📁 Contents
        │           └── 📃 Info.plist
        ├── OpenCore.efi
        ├── 📁 Resources
        │   ├── 📁 Audio
        │   ├── 📁 Font
        │   ├── 📁 Image
        │   └── 📁 Label
        ├── 📁 Tools
        │   └── 📃 OpenShell.efi
        └── 📁 config.plist
    ```

  - As we can see by using `kextstat -l | grep -v com.apple`, kext still running as usual. Below is an example:

  ![kexstat](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/68f1389b-7b8b-40b1-8017-f3b4225453cd)

  - Download [this](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/Sorted%20Kexts%20(Plugins).zip) file as an example.
  
##### Useful PowerShell Command

- This command help us to specify need information in order to build our own hackintosh and set `AAPL,slot-name` properly. Please check `SlotDesignation` as references.
  - Open Windows Powershell, copy and paste `Get-WmiObject -class "Win32_SystemSlot"`. As an example, PCI x16 Slot.

    ```pws
    SlotDesignation : Slot1 / X16PCIEXP // Refer to x16 slot capability
    Tag             : System Slot 0 // Root Slot connected to SlotDesignation. 
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 10
    ```

  - Slot1 X16PCIEXP is refered to x16 PCI slot capabilities. The exact match for `AAPL,slot-name` is `Slot- 1`. Remember, most iGPU built-in with processor is considered as `Slot- 0`.
  - Another way is using `Get-WmiObject -class "Win32_PnPEntity"`. Copy all dumped info from Powershell and paste to any text editor as references.

##### Enabling and Disabling SIP

- SIP is disable by default by using debug mode (`csr-active-config` / `data` / `67000000`) - can be refered as `unknown`.

![sipdisabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/4621e112-7a6e-4f20-968c-41d67da1babb)

- SIP is enable by default by using release version (`csr-active-config` / `data` / `00000000`).

![sipenabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3a4f13de-c965-483b-baca-730ef1c56c68)

> **Note:**  Please set `ToggleSIP` to `enable` after switch from `debug` to `release`

##### Theme

- Get [here](https://github.com/iamyounix/younix_octheme)

![kora](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5d30de6f-d4c9-4aa0-9fcf-405898cf6b89)

#### Debug Log

View debug log [here](https://github.com/iamyounix/msimagb460_tomahawk/tree/main/Debug_Log)

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
