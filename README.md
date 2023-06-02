# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.2-white)](https://github.com/acidanthera/OpenCorePkg/releases)

![systeminfo_oc](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5bf2d4e5-3dc1-4e2a-97d3-a7b1d0ce212a)

> **Note:**  This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). [Debug](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.debug.dmg) version can greatly help with debugging boot issues, however can add some noticeable delay to boot times (ie. 3-5 seconds to get to the picker). Once installed you can easily transition to [release](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.dmg). Release version provide snappier boot times (no useful DEBUG info provided).

Table of Contents

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

## Introduction

This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party

### Hardware and Devices

#### Native

- 400 Series Chipset Family SATA AHCI Controller
- ASM3241 USB 3.2 Host Controller
- BCM4360 802.11ac Wireless Network Adapter
- Comet Lake PCH-V SMBus Host Controller
- Comet Lake-S 6c Host Bridge/DRAM Controller
- Intel UHD Graphics 630 (Headless) + `agdpmod` / `data` / `70696b65726100` based on [Piker R. Alpha](https://github.com/Piker-Alpha) agdpmod [patch](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/)
- Kingston A2000 NVMe SSD1
- Kingston A2000 NVMe SSD2
- Navi 10 HDMI Audio]
- Navi 14 Radeon RX 5500 XT

#### Not Native

- [Comet Lake PCH-V Converged Audio Voice Speech (ALCS1200A)]
- [Comet Lake PCH-V USB Controller]
- [Ethernet Connection (11) I219-V]
- [RTL8125 2.5GbE Controller]

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

### Post Process

#### Enable GPU Tab in Activity Monitor

- If the Device Properties of iGPU and dGPU are configured correctly, you will find the Tab "GPU" in the Activity Monitor App which lists the graphics devices and the tasks/processes assigned to each of them. Use this properties to enable gpu's tab. Requirement:
  - Change iGPU  `AAPL,slot-name` to `Slot- 0`. Most iGPU attached to this slot.
  - Add `AAPL,ig-platform-id` data `0300C59B` / `0300C89B` (headless Comet Lake platform)
  - Add `device-id` data `9B3E0000`  (Kaby Lake device id is required to properly rename GPU as UHD 630 on Comet Lake platform)
  - Add `enable-metal` data `01000000` (enable metal)
  - Add `force-online` data `01000000` (always enable for offline rendering)

  ![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)
  ![quicksync](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/36807524-6733-42b1-8e23-3d9aa1c6ff64)

#### MMIO Whitelist

- MMIO stands for Memory-Mapped Input/Output. It's a method to perform I/O processes between the CPU and peripheral devices of a computer. The memory and registers of the I/O devices are mapped to (and associated with) address values. MMIO whitelist is a security feature that controls access to certain memory addresses in a computer system, allowing access only to specific processes or devices that have been explicitly granted permission and denying access to all others. This patch may improve stability. Refer [5T33Z0 - MMIO Whitelist](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist) for more info. Example:

![mmio](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/202260c1-84b4-4645-a2e7-7600a64ad11e)

#### SBUS Check

- Most 8th Gen and above actually do not require `SSDT-SBUS`.
  - Try to load EFI without this patch and reboot. Refer [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/ACPI_Sample/SSDT-YNXB460.dsl) as an example.
  - After login, copy and paste this command, `kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`. The result will shown as below:

  ![sbus](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/801d1c7b-5102-407c-8373-7d930803750e)

  - Check `AppleSMBusController` and `AppleSMBUSPCI` kexts using `System Reports` / `Software` / `Extensions`. If both loads, `SBUS` is working native without any patches. Below is an example:

  ![sbus_check](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/a606a15f-4aef-48cc-bd0a-b205ba2fc8b0)

#### Specific Drivers and Sorting Kexts

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
  
#### Useful PowerShell Command

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

#### Enabling and Disabling SIP

- SIP is disable by default by using debug mode (`csr-active-config` / `data` / `67000000`) - can be refered as `unknown`.

![sipdisabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/4621e112-7a6e-4f20-968c-41d67da1babb)

- SIP is enable by default by using release version (`csr-active-config` / `data` / `00000000`).

![sipenabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/4c6bf1c8-b3be-4091-89d0-5a831ac73fb0)

> **Note:**  Please set `ToggleSIP` to `enable` after switch from `debug` to `release`

#### Theme

- Get [here](https://github.com/iamyounix/younix_octheme)

![kora](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5d30de6f-d4c9-4aa0-9fcf-405898cf6b89)

#### Debug Log

View debug log [here](https://github.com/iamyounix/msimagb460_tomahawk/tree/main/Debug_Log)

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
