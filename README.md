# Hackintosh: ASRock B460M Steel Legend
**OpenCore:** 10th Gen Comet Lake + ASRock B460M Steel Legend

[![BIOS](https://img.shields.io/badge/BIOS-1.60-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

### Introduction

OpenCore is what we refer to as a **boot loader** – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as **SMBIOS**, **ACPI** tables and **kexts**. How this tool differs from others like **Clover** is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as **System Integrity Protection** and  Filevault.

* Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding
* Checkout Dortania Monthly [Post](https://dortania.github.io) to get more info.

**Note**: if you're still interested in utilising it, please be careful to adjust the `.plist` configuration and `SSDT's` according to your machine.

### Device Specification
* **Processor** 	- Intel® Core™ i5-10400 | Codename: Comet Lake 
* **Motherboard**	- ASRock B460M Steel legend
* **Graphics 1**	- Intel® UHD 630 - Headless
* **Graphics 2**	- MSI RX 5500 XT 4GB - Main Display
* **Disk**		- 02 x Kingston A2000 500GB, 02 x San Disk 500GB

### EFI Structure

```zsh
EFI
├── ./BOOT
│   └── ./BOOTx64.efi	
└── ./OC
	├── ./OC/ACPI
	├── ./OC/Drivers
	├── ./OC/Kexts
	│   ├── ./OC/Kexts/AppleALC.kext
	│   ├── ./OC/Kexts/Lilu.kext
	│   ├── ./OC/Kexts/LucyRTL8125Ethernet.kext
	│   ├── ./OC/Kexts/SMCProcessor.kext
	│   ├── ./OC/Kexts/SMCSuperIO.kext
	│   ├── ./OC/Kexts/USBMap.kext
	│   ├── ./OC/Kexts/VirtualSMC.kext
	│   └── ./OC/Kexts/WhateverGreen.kext
	├── ./OC/Resources
	│   ├── ./OC/Resources/Audio
	│   ├── ./OC/Resources/Font
	│   ├── ./OC/Resources/Image
	│   └── ./OC/Resources/Label
	└── ./OC/Tools
```

### Credits

#### [Acidanthera](https://github.com/acidanthera) | [benbaker76](https://github.com/benbaker76) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [ic005k](https://github.com/ic005k) | [osy86](https://github.com/osy86) | [rusty-bits](https://github.com/rusty-bits) | [USBToolbox](https://github.com/USBToolBox) | [5T33Z0](https://github.com/5T33Z0)

