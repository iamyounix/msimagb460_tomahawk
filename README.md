# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents:

- [Introduction](#introduction)
- [About this build](#about-this-build)
  - [Kext Used](#kext-used)
  - [BIOS Requirement](#bios-requirement)
- [Changelog](#changelog)
- [Credits](#credits)
- [Additional References](#additional-references)

## Introduction

**Author:** This is my EFI from a previous version of my Hackintosh desktop. The construction isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references you should read:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - Non Official

> **Note**: This build has been tested on Linux, MacOS, and Windows.

## About this build

- **Out of the box**
  - ASM3241 USB 3.2 Host Controller.
  - 400 Series Chipset Family SATA AHCI Controller.
  - BCM4360 802.11ac Wireless Network Adapter.
  - Kingston A2000 NVMe SSD1.
  - Kingston A2000 NVMe SSD2.
  - Navi 10 HDMI Audio.
  - VL805/806 xHCI USB 3.0 Controller.

- **Non-Native**
  - Comet Lake PCH-V Converged Audio Voice Speech.
  - Comet Lake PCH-V SMBus Host Controller.
  - Comet Lake PCH-V USB Controller.
  - Comet Lake-S 6c Host Bridge/DRAM Controller.
  - Ethernet Connection (11) I219-V.
  - Intel UHD Graphics 630 Headless.
  - Navi 14 Radeon RX 5500 XT.
  - RTL8125 2.5GbE Controller.

### Kext Used

- [AppleALC](https://github.com/acidanthera/AppleALC)
- [IntelMausi](https://github.com/acidanthera/IntelMausi)
- [Lilu](https://github.com/acidanthera/Lilu)
- [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)
- [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) To disables uninitialized disk warning in Finder
- [RadeonSensor.kext](https://github.com/aluveitie/RadeonSensor)
- [SMCRadeonGPU.kext](https://github.com/aluveitie/RadeonSensor) RadeonSensor Plugin
- [SMCProcessor](https://github.com/acidanthera/VirtualSMC) VirtualSMC Plugin
- [SMCSuperIO](https://github.com/acidanthera/VirtualSMC) VirtualSMC Plugin
- [USBMap](https://github.com/USBToolBox/tool)
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC)
- [WhateverGreen](https://github.com/acidanthera/WhateverGreen)

> **Note![**: Check out `release` and `debug` kext [here](https://dortania.github.io/builds/)

### BIOS Requirement

- **Disable**

  - Fast Boot
  - Secure Boot
  - VT-d / VT-x
  - CSM
  - Intel SGX
  - Intel Platform Trust / TPM
  - CFG Lock

- **Enable**

  - Above 4G Decoding
  - Quirks (ResizeAppleGpuBars is set to `0` if this is enabled)
  - Hyper-Threading
  - EHCI/XHCI Hand-off
  - OS type: Windows 8.1/10 UEFI Mode (some motherboards may require "Other OS" instead)
  - DVMT Pre-Allocated(iGPU Memory): 64MB
  - AHCI Mode

## Changelog

- May 14, 2023 2:44 PM [OC](https://github.com/acidanthera/OpenCorePkg) ver: [0.9.2](https://github.com/acidanthera/OpenCorePkg/releases)

**Monterey + :**
  
  - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` / `revpatch`  / `diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
  - Add NVMe/SSD Trim patch for Catalina.
  - Clean and Optimised ACPI code.
  - Desktop `Quirks` presets.
  - iMac20,1 SMBIOS.
  - MinDate and MinVersion is set to `0`.
  - OpenCore `v0.9.2`.
  - Without `plugin-type 1`. XCPM is enable by default. Refer: https://github.com/acidanthera/bugtracker/issues/2013


  **Catalina - :**

  - Add `RestrictEvents.kext`. Refer `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102 / revpatch / diskread` to disables uninitialized disk warning in Finder. ie: swap (linux) via config.plist.
  - Add NVMe/SSD Trim patch for Catalina.
  - Add USB Port limit patch `1` and `2`. Useful before performing USB Port Mapping. Refer `Kernel` / `Patch` / `1` and `2`
  - Clean and Optimised ACPI code.
  - Desktop `Quirks` presets.
  - iMac20,1 SMBIOS.
  - MinDate and MinVersion is set to `-1`.
  - OpenCore `v0.9.2`.
  - With`plugin-type 1`. Require to enable XCPM.

## Credits

[Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [tomeko.net](http://tomeko.net/index.php?lang=en) ⌘ [sqlec](https://apple.sqlsec.com/6-%E5%AE%9E%E7%94%A8%E5%A7%BF%E5%8A%BF/)

## Additional References

[^1]: [macOS Monterey 12.3 broke Radeon Family](https://www.tonymacx86.com/threads/rx-6600-xt-henbury-framebuffer-and-zero-rpm-in-monterey-12-3.319526/#post-2314148)
[^2]: [Refresh Rate Patcher](https://github.com/iamyounix/edid_refreshrate_patcher)
[^3]: [AMD RX6000 Success, working on macOS](https://www.tonymacx86.com/threads/success-amd-rx6000-series-working-in-macos.306736/page-109)
[^4]: [Keyboard wake Issues](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#keyboard-wake-issues)
[^5]: [Whatevergreen Boot Args](https://github.com/acidanthera/WhateverGreen#intel-hd-graphics)
