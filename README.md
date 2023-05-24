# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents:

- [Introduction](#introduction)
- [About this build](#about-this-build)
- [Folders and Files](#folders-and-files)
- [Kexts](#kexts)
- [Tips](#tips)
  - [Sorting Kexts](#sorting-kexts)
  - [Drivers](#drivers)
  - [MMIO Whitelist](#mmio-whitelist)
  - [Enable Multi Tab GPU](#enable-multi-tab-gpu)
  - [SBUS](#sbus)
- [Credits](#credits)

## Introduction

:arrow_forward: **Author**

This is my EFI from a previous version of my Hackintosh desktop. This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

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
- Comet Lake PCH-V SMBus Host Controller + [SSDT-SBUS](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)
- Comet Lake PCH-V USB Controller + [USBMap](https://github.com/USBToolBox/tool)
- Comet Lake-S 6c Host Bridge/DRAM Controller + [SSDT-MCHC](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)
- Ethernet Connection (11) I219-V + [IntelMausi](https://github.com/acidanthera/IntelMausi)
- Intel UHD Graphics 630 (Headless) + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen) + `agdpmod` - `data` - `70696B65726100`
- Navi 14 Radeon RX 5500 XT + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen)
- RTL8125 2.5GbE Controller + [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)

> **Note**: This project requires `agdpmod=pikera,` which replaces the Navi variant GPU's `board-id` with `board-ix` in order to fix the black screen issue [originated](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/) by [Piker R. Alpha](https://github.com/Piker-Alpha). Do not confuse; certain `agdpmod` features via [WhateverGreen](https://github.com/acidanthera/WhateverGreen) can be injected into both iGPU and dGPU. Best combination may improve stability.

## Folders and Files

![tree](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/bbcf7a87-b4c8-4f27-b7de-2070c3a28680)

## Kexts

- [AppleALC](https://github.com/acidanthera/AppleALC) - An open source kernel extension enabling native macOS HD audio for not officially supported codecs without any filesystem modifications. AppleALCU can be used for systems with digital-only audio
- [IntelMausi](https://github.com/acidanthera/IntelMausi) - Intel onboard LAN driver for macOS
- [Lilu](https://github.com/acidanthera/Lilu) - An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS.
- [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet) - Enable RTL8125 2.5GbE Controller
- [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) - To disables uninitialized disk warning in Finder
- [RadeonSensor.kext](https://github.com/aluveitie/RadeonSensor) - Provide GPU temperature to a dedicated gadget without relying on FakeSMC being installed and can therefore be used with VirtualSMC instead.
- [SMCRadeonGPU.kext](https://github.com/aluveitie/RadeonSensor) - Radeon GPU Sensor Plugin
- [SMCProcessor](https://github.com/acidanthera/VirtualSMC) - VirtualSMC Processor Plugin
- [SMCSuperIO](https://github.com/acidanthera/VirtualSMC) - VirtualSMC IO Plugin
- [USBMap](https://github.com/USBToolBox/tool) - Mapped USB Port (15 Port)
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC) - Advanced Apple SMC emulator in the kernel. Requires Lilu
- [WhateverGreen](https://github.com/acidanthera/WhateverGreen) - Lilu plugin providing patches to select GPUs on macOS. Requires Lilu

:arrow_forward: **Changelog**

- [Big Sur + (-d) / debug](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.-d.zip)
    - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
    - Add NVMe/SSD Trim patch (default is disable)
    - Clean and Optimised ACPI code.
    - Desktop `Quirks` presets.
    - Export debug info.
    - iMac20,1 SMBIOS.
    - MinDate and MinVersion is set to `0`.
    - OpenCore `v0.9.2`.
    - Stable `RX5500XT Mech OC 4GB` plist patch via config.plist.
    - Support Big Sur, Monterey and Ventura.
    - Without `plugin-type 1`. XCPM is enable by default. Refer: https://github.com/acidanthera/bugtracker/issues/2013

- [Big Sur +](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.zip)
    - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
    - Add NVMe/SSD Trim patch (default is disable)
    - Clean and Optimised ACPI code.
    - Desktop `Quirks` presets.
    - iMac20,1 SMBIOS.
    - MinDate and MinVersion is set to `0`.
    - OpenCore `v0.9.2`.
    - Stable `RX5500XT Mech OC 4GB` plist patch via config.plist.
    - Support Big Sur, Monterey and Ventura.
    - Without `plugin-type 1`. XCPM is enable by default. Refer: https://github.com/acidanthera/bugtracker/issues/2013

- [Catalina](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Catalina.zip) 
    - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
    - Add NVMe/SSD Trim patch (default is enable)
    - Clean and Optimised ACPI code.
    - Desktop `Quirks` presets.
    - iMac20,1 SMBIOS.
    - MinDate and MinVersion is set to `-1`.
    - OpenCore `v0.9.2`.
    - Stable `RX5500XT Mech OC 4GB` plist patch via config.plist.
    - USB Port LImit Removal (10.15.X). Useful for performing USB Port Mapping (Post Process)
    - With `plugin-type 1` to enable native XCPM.

> **Note** : This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).

:arrow_forward: **Tested with dualboot:**

![arch](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3c1b7e37-a72f-4617-8cda-63241384e500)

![mac](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/40b8af18-a092-4a5c-ac2f-f2e37a4ebed2)

## Tips

### Sorting Kexts:

Sorting important kexts shall improve `debug` log and `data` injection.

![sort](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/12afd08e-862b-43b1-8d5f-638d2061f5b6)

### Drivers:

Use only needed drivers. Sort the drivers may improve boot speed.

![drivers](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/d263cd52-3b99-49d0-a40f-b6b15b494dfe)

![drivers_plist](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/079acaa1-5ec7-4e41-922e-b608e185f523)

### MMIO Whitelist:

MMIO stands for Memory-Mapped Input/Output. It's a method to perform I/O processes between the CPU and peripheral devices of a computer. The memory and registers of the I/O devices are mapped to (and associated with) address values. MMIO whitelist is a security feature that controls access to certain memory addresses in a computer system, allowing access only to specific processes or devices that have been explicitly granted permission and denying access to all others. This patch may improve stability. Refer [5T33Z0 - MMIO Whitelist](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist) for more info

![mmiowhitelist](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/a7f8b000-64c5-4d19-8edd-52ef6e00fa00)

### Enable Multi Tab GPU:

Use this properties to enable multitab gpu's. Requirement:

- Change iGPU  `AAPL,slot-name` to `Slot- 0` and dGPU  `AAPL,slot-name` to `Slot- 1`.
- Add `device-id` to `9B3E0000`
- Add `enable-metal` to `01000000`
- Add `force-online` to `01000000`

![properties_igpu](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/5fde038a-7549-46bb-96af-b1500f3d02e5)

![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)

- Check using any 4k videos using [Youtube](https://www.youtube.com/) ie: [COSTA RICA IN 4K 60fps HDR (ULTRA HD)](https://www.youtube.com/watch?v=LXb3EKWsInQ&t=153s).
- Play video and select 4k Resolution.

![Screenshot 2023-05-24 at 12 32 43 AM](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/def828d3-824f-427a-bf6a-70206cdad33a)

- If GPU Time for iGPU is higher than other GPU ie: AMD, your quicksync works perfect.

![quicksync](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/e6b12a81-3704-45d8-afc5-200672ace430)

### SBUS:

Most 8th Gen and above actually do not require `SSDT-SBUS`. Try to load your EFI without this patch. Check both the `AppleSMBusController` and `AppleSMBUSPCI` kexts using `System Reports` / `Software` / `Extensions`. If both loads, it means your `SBUS` is working natively without any patches.

![sbus](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/40104077-2b06-4c54-a35f-d96898b6c498)

Use this command to check:

`kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"` and the result will appear as below:

```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
  150    0 0xffffff7f98f8d000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 76173829-8756-3746-9516-A60DABEB950C <16 7 6 3>
  166    1 0xffffff7f98f81000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) E4F2BA31-6A3A-3690-A863-80A993E08DF0 <165 16 15 7 6 3>
```

![sbus_ioreg](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/02c9851c-3a29-4a1d-84ba-aba3917c0861)

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0)
