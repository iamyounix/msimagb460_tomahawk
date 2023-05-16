# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents:

- [Introduction](#introduction)
- [About this build](#about-this-build)
- [Kexts](#kexts)
- [Credits](#credits)

## Introduction

**Author:** This is my EFI from a previous version of my Hackintosh desktop. The construction isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references you should read:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party References

> **Note**: This build has been tested on Linux, MacOS, and Windows.

## About this build

- **Native**
  - ASM3241 USB 3.2 Host Controller.
  - 400 Series Chipset Family SATA AHCI Controller.
  - BCM4360 802.11ac Wireless Network Adapter.
  - Kingston A2000 NVMe SSD1.
  - Kingston A2000 NVMe SSD2.
  - Navi 10 HDMI Audio.

- **Require Patch**
  - Comet Lake PCH-V Converged Audio Voice Speech (ALCS1200A) + [AppleALC](https://github.com/acidanthera/AppleALC)
  - Comet Lake PCH-V SMBus Host Controller + [SSDT-SBUS](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)
  - Comet Lake PCH-V USB Controller + [USBMap](https://github.com/USBToolBox/tool)
  - Comet Lake-S 6c Host Bridge/DRAM Controller + [SSDT-MCHC](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)
  - Ethernet Connection (11) I219-V + [IntelMausi](https://github.com/acidanthera/IntelMausi)
  - Intel UHD Graphics 630 (Headless) + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen) + `agdpmod` = `pikera` / `agdpmod` = `70696B65726100`.
  - Navi 14 Radeon RX 5500 XT + Additional patch with [WhateverGreen](https://github.com/acidanthera/WhateverGreen)
  - RTL8125 2.5GbE Controller + [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)

  ![device_properties](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/f5cd940f-00de-4c38-b1a3-0d4fca85d351)

  > **Note**: This build requires `agdpmod=pikera,` which replaces `board-id` with `board-ix`, the most common for Navi variants GPU's to fix the black screen issue. `agdpmod` = `pikera` / `agdpmod` = `70696B65726100` is injected via IGPU.

## Kexts

- [AppleALC](https://github.com/acidanthera/AppleALC). An open source kernel extension enabling native macOS HD audio for not officially supported codecs without any filesystem modifications. AppleALCU can be used for systems with digital-only audio.
- [IntelMausi](https://github.com/acidanthera/IntelMausi). Intel onboard LAN driver for macOS
- [Lilu](https://github.com/acidanthera/Lilu). An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS.
- [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet). Enable RTL8125 2.5GbE Controller
- [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents). To disables uninitialized disk warning in Finder
- [RadeonSensor.kext](https://github.com/aluveitie/RadeonSensor). Provide GPU temperature to a dedicated gadget without relying on FakeSMC being installed and can therefore be used with VirtualSMC instead.
- [SMCRadeonGPU.kext](https://github.com/aluveitie/RadeonSensor). RadeonSensor Plugin.
- [SMCProcessor](https://github.com/acidanthera/VirtualSMC). VirtualSMC Processor Plugin.
- [SMCSuperIO](https://github.com/acidanthera/VirtualSMC). VirtualSMC IO Plugin.
- [USBMap](https://github.com/USBToolBox/tool). Mapped USB Port (15 Port).
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC). Advanced Apple SMC emulator in the kernel. Requires Lilu.
- [WhateverGreen](https://github.com/acidanthera/WhateverGreen). Lilu plugin providing patches to select GPUs on macOS. Requires Lilu.

> **Note**: Check out `release` and `debug` kext [here](https://dortania.github.io/builds/)

**Changelog** 👍

- [Big Sur +](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/bigsur+_0.9.2.zip)
  - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
  - Add NVMe/SSD Trim patch (default is disable)
  - Clean and Optimised ACPI code.
  - Desktop `Quirks` presets.
  - iMac20,1 SMBIOS.
  - MinDate and MinVersion is set to `0`.
  - OpenCore [0.9.2](https://github.com/acidanthera/OpenCorePkg/releases).
  - Stable `RX5500XT Mech OC 4GB` plist patch cia config.plist.
  - Support Big Sur, Monterey and Ventura.
  - Without `plugin-type 1`. XCPM is enable by default. Refer:

- [Catalina](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/catalina_0.9.2.zip)
  - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
  - Add NVMe/SSD Trim patch (default is enable)
  - Clean and Optimised ACPI code.
  - Desktop `Quirks` presets.
  - iMac20,1 SMBIOS.
  - MinDate and MinVersion is set to `-1`.
  - OpenCore [0.9.2](https://github.com/acidanthera/OpenCorePkg/releases).
  - Stable `RX5500XT Mech OC 4GB` plist patch cia config.plist.
  - USB Port Limit Removal (10.15.X). Useful for performing USB Port Mapping (Post Process)
  - With `plugin-type 1` to enable native XCPM.

> **Note** : This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)..

**Tested with dualboot:**

![arch](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/42d2b969-9b29-41a8-adc6-8bcaeae8bd0c)

![mac](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/b5fda91a-ac01-42b3-8312-168cbbbd0bc0)

## Credits

⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [tomeko.net](http://tomeko.net/index.php?lang=en) ⌘ [sqlec](https://apple.sqlsec.com/6-%E5%AE%9E%E7%94%A8%E5%A7%BF%E5%8A%BF/)
