# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents:

- [Introduction](#introduction)
- [About this build](#about-this-build)
- [Base Files](#base-files)
- [Changelog](#changelog)
- [Tips](#tips)
  - [Sorting Kexts](#sorting-kexts)
  - [Drivers](#drivers)
  - [MMIO Whitelist](#mmio-whitelist)
  - [Enable Multi Tab GPU](#enable-multi-tab-gpu)
  - [SBUS](#sbus)
  - [Useful Windows Command](#useful-windows-command)
- [Results](#results)
- [Credits](#credits)

## Introduction

:arrow_forward: **Author**

This is my EFI from Hackintosh desktop. This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

:arrow_forward: **References**

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party References

## About this build

:arrow_forward: **Native**

- ASM3241 USB 3.2 Host Controller
- 400 Series Chipset Family SATA AHCI Controller
- BCM4360 802.11ac Wireless Network Adapter
- Kingston A2000 NVMe SSD1
- Kingston A2000 NVMe SSD2
- Navi 10 HDMI Audio

:arrow_forward: **Requires Patching**

- Comet Lake PCH-V Converged Audio Voice Speech (ALCS1200A) + [AppleALC](https://github.com/acidanthera/AppleALC)
- Comet Lake PCH-V SMBus Host Controller + [SSDT-SBUS](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) - Not compulsory, see [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/README.md#sbus) for more info
- Comet Lake PCH-V USB Controller + [USBMap](https://github.com/USBToolBox/tool)
- Comet Lake-S 6c Host Bridge/DRAM Controller + `DRAM` rename. Also known as [SSDT-MCHC](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) 
- Ethernet Connection (11) I219-V + [IntelMausi](https://github.com/acidanthera/IntelMausi)
- Intel UHD Graphics 630 (Headless) + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen) + `agdpmod` - `data` - `70696B65726100`
- Navi 14 Radeon RX 5500 XT + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen)
- RTL8125 2.5GbE Controller + [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)

> **Note**: This project requires `agdpmod=pikera,` which replaces the Navi variant GPU's `board-id` with `board-ix` in order to fix the black screen issue [originated](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/) by [Piker R. Alpha](https://github.com/Piker-Alpha). Do not confuse; certain `agdpmod` features via [WhateverGreen](https://github.com/acidanthera/WhateverGreen) can be injected into both iGPU and dGPU. Best combination may improve stability.

## Base Files

```zsh
📁 EFI
├── 📁 BOOT
│  └── 📃 BOOTx64.efi                  // OC Base File
└── 📁 OC
    ├── 📁 ACPI
    │  └── 📃 SSDT-YNXB460.aml         // An additional patches using Secondary System Description Tables
    ├── 📁 Drivers
    │  ├── 📃 HfsPlus.efi              // Compulsory (OC Base File)
    │  ├── 📃 OpenCanopy.efi           // Additional (release)
    │  ├── 📃 OpenRuntime.efi          // Compulsory (OC Base File)
    │  ├── 📃 ResetNvramEntry.efi      // Additional (debug) 
    │  └── 📃 ToggleSipEntry.efi       // Additional (debug)
    ├── 📁 Kexts
    │  ├── 📃 AppleALC.kext            // Requires Lilu (OC Base File)
    │  ├── 📃 IntelMausi.kext          // Requires Lilu
    │  ├── 📃 Lilu.kext                // Conpulsory (OC Base File)
    │  ├── 📃 LucyRTL8125Ethernet.kext // Requires Lilu
    │  ├── 📃 RadeonSensor.kext        // Requires VirtualSMC
    │  ├── 📃 RestrictEvents.kext      // Requires Lilu (Lilu Kernel extension)
    │  ├── 📃 SMCProcessor.kext        // Requires VirtualSMC (OC Base File)
    │  ├── 📃 SMCRadeonGPU.kext        // Requires RadeonSensor
    │  ├── 📃 SMCSuperIO.kext          // Requires VirtualSMC
    │  ├── 📃 USBMap.kext              // Compulsory (can be build using USBToolbox/Windows and USBMap/MacOS)
    │  ├── 📃 VirtualSMC.kext          // Requires Lilu (OC Base File)
    │  └── 📃 WhateverGreen.kext       // Requires Lilu (OC Base File)
    ├── 📁 Resources
    │  ├── 🎨 Audio                    // Additional (release)
    │  ├── 🎨 Font                     // Additional (release)
    │  ├── 🎨 Image                    // Additional (release)
    │  └── 🎨 Label                    // Additional (release)
    ├── 📁 Tools
    │  ├── 📃 OpenShell.efi            // Requires with debug version (OC Base File)   
    ├── 📃 config.plist                // Configuration  (OC Base File)
    └── 📃 OpenCore.efi                // OC Base File
```

## Changelog

- Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
- Add NVMe/SSD Trim patch (default is disable)
- Clean and Optimised ACPI code (Single .aml file)
- Desktop `Quirks` presets (10th Gen)
- iMac20,1 SMBIOS.
- Stable `RX5500XT Mech OC 4GB` plist patch via config.plist.
- Support Big Sur, Monterey and Ventura.

**Do Note!**

- This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).
- [Debug](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.debug.dmg) version can greatly help with debugging boot issues, however can add some noticeable delay to boot times(ie. 3-5 seconds to get to the picker). Once installed you can easily transition to [release](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.dmg). Release version provide snappier boot times (no useful DEBUG info provided)
- This template include `Misc` / `Entries` example. Please change accordingly to your specific needed.

:arrow_forward: **Tested with dualboot:**

![mac](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/40b8af18-a092-4a5c-ac2f-f2e37a4ebed2)
![arch](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3c1b7e37-a72f-4617-8cda-63241384e500)

## Tips

### Sorting Kexts

Sorting important kexts shall improve `debug` log and `data` injection.

![sort](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/12afd08e-862b-43b1-8d5f-638d2061f5b6)

### Drivers

Use only needed drivers. Sort the drivers may improve boot speed.

![drivers](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/d263cd52-3b99-49d0-a40f-b6b15b494dfe)

![drivers_plist](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/079acaa1-5ec7-4e41-922e-b608e185f523)

### MMIO Whitelist

MMIO stands for Memory-Mapped Input/Output. It's a method to perform I/O processes between the CPU and peripheral devices of a computer. The memory and registers of the I/O devices are mapped to (and associated with) address values. MMIO whitelist is a security feature that controls access to certain memory addresses in a computer system, allowing access only to specific processes or devices that have been explicitly granted permission and denying access to all others. This patch may improve stability. Refer [5T33Z0 - MMIO Whitelist](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist) for more info

![mmiowhitelist](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/a7f8b000-64c5-4d19-8edd-52ef6e00fa00)

### Enable Multi Tab GPU

Use this properties to enable multitab gpu's. Requirement:

- Change iGPU  `AAPL,slot-name` to `Slot- 0` (Slot attach directly to CPU)
- Add `AAPL,ig-platform-id` data `0300C59B` / `0300C89B` (headless Comet Lake platform)
- Add `device-id` data `9B3E0000`  (Kaby Lake device id is required to properly rename GPU as UHD 630 on Comet Lake platform)
- Add `enable-metal` data `01000000` (enable metal)
- Add `force-online` data `01000000` (always enable for offline rendering)

![igpu_properties](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/b13a2c27-dcaf-4b63-aa8d-c7f96ecc5b19)

![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)

- Check using any 4k videos using [Youtube](https://www.youtube.com/) ie: [COSTA RICA IN 4K 60fps HDR (ULTRA HD)](https://www.youtube.com/watch?v=LXb3EKWsInQ&t=153s).
- Play video and select 4k Resolution.

![Screenshot 2023-05-24 at 12 32 43 AM](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/def828d3-824f-427a-bf6a-70206cdad33a)

- If GPU Time for iGPU is higher than other GPU ie: AMD, your quicksync works perfect.

![quicksync](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/e6b12a81-3704-45d8-afc5-200672ace430)

### SBUS

Most 8th Gen and above actually do not require `SSDT-SBUS`. Try to load EFI without this patch. Refer [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/ACPI_Sample/SSDT-YNXB460.dsl) as an example.

- Check `AppleSMBusController` and `AppleSMBUSPCI` kexts using `System Reports` / `Software` / `Extensions`. If both loads, it means your `SBUS` is working natively without any patches.

![sbus](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/40104077-2b06-4c54-a35f-d96898b6c498)

![sbus_ioreg](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/02c9851c-3a29-4a1d-84ba-aba3917c0861)

- As shown in the picture above, `AppleSMBusController` and `AppleSMBUSPCI` are not loaded via ioreg. However, both load normally by using the command as below:

- Copy and paste this command, `kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`. The result will shown as below:

```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
  150    0 0xffffff7f98f8d000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 76173829-8756-3746-9516-A60DABEB950C <16 7 6 3>
  166    1 0xffffff7f98f81000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) E4F2BA31-6A3A-3690-A863-80A993E08DF0 <165 16 15 7 6 3>
```

### Useful Windows command

This command help us to specify need information in order to build our own hackintosh and set `AAPL,slot-name` properly. Please check `SlotDesignation` as references.

- **Slot Check**
  - Open Windows Powershell, copy and paste `Get-WmiObject -class "Win32_SystemSlot"`
    
    **Example:** X16 slot
    
    ```powershell
    SlotDesignation : Slot1 / X16PCIEXP // Refer to x16 slot capability
    Tag             : System Slot 0 // Use this as references. 
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 10
    ```
    
    Explanation: Slot1 X16PCIEXP is refered to x16 PCI slot capabilities. The exact match for `AAPL,slot-name` is `Slot- 1`. Remember, most     iGPU built-in with processor is considered as `Slot- 0`.

- **Dump most information about hardware**
  - Open Windows Powershell, copy and paste `Get-WmiObject -class "Win32_PnPEntity"`
  - Copy all dumped info from Powershell and paste to any text editor as references.
 
## Results

![hardware](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/e462231a-8feb-4ad0-a0c6-d91c606ecde7)
![archlinux](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/017134c6-1e00-492d-b918-7d20abad7c2e)

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
