# Hackintosh: ASRock B460M Steel Legend
OpenCore: 10th Gen Comet Lake + ASRock B460M Steel Legend - WIP

[![BIOS](https://img.shields.io/badge/BIOS-1.60-purple)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.8.7-white)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Release](https://img.shields.io/badge/Release-Latest-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![OS](https://img.shields.io/badge/OS-Monterey%20%2F%20Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

**Table of Content**
- [Introduction](#introduction)
- [Device Specification](#device-specification)
- [Tools](#tools)
- [EFI Structure](#efi-structure)
- [ACPI](#acpi)
- [Booter](#booter)
- [DeviceProperties](#deviceproperties)
- [Kernel](#kernel)
- [Misc](#misc)
- [NVRAM](#nvram)
- [PlatformInfo](#platforminfo)
- [UEFI](#uefi)
- 
- [Acknowledgement](#acknowledgement)

### Introduction

* OpenCore is what we refer to as a **boot loader** – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as **SMBIOS**, **ACPI** tables and **kexts**. How this tool differs from others like **Clover** is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as **System Integrity Protection** and  Filevault

* Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding
* Checkout Dortania Monthly [Post](https://dortania.github.io) to get more info

* **Note**: if you're still interested in utilising it, please be carefulto adjust the .plist configuration and SSDTs according to your machine.

### Device Specification
* **Processor** - Intel® Core™ i5-10400 `CometLake` 
* **Graphics 1**- Intel® UHD 630 - Headless
* **Graphics 2**- MSI RX 5500 XT 4GB - Main Display
* **Disk**	- 02 x Kingston A2000 500GB, 02 x San Disk 500GB

### Tools
* [DevicePath](https://github.com/corpnewt/DevicePath)
* [gibMacRecovery](https://github.com/corpnewt/gibMacRecovery)
* [Hackintool](https://github.com/benbaker76/Hackintool)
* [OCAuxiliary](https://github.com/ic005k/OCAuxiliaryTools)
* [octool](https://github.com/rusty-bits/octool)
* [ProperTree](https://github.com/corpnewt/ProperTree)
* [SSDTTime](https://github.com/corpnewt/SSDTTime)

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

### ACPI

* This project uses almost 80% of the patches from ACPI. The patch used is the same patch as used in config.plist. The purpose of patching on ACPI is that it is more permanent, at the same time we may learn a bit about ACPI basic knowledge. [SSDTTime](https://github.com/corpnewt/SSDTTime) is the tool used in this process. But be reminded, [SSDTTime](https://github.com/corpnewt/SSDTTime) only helps to patch the basic ACPI structure. The full patch can be viewed through the link provided below.

* [SSDT-EXT](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/SSDT-EXT/SSDT-EXT.dsl)

#### Add

![ACPI-Add](https://user-images.githubusercontent.com/72515939/206202889-00f51692-3f6b-40d5-bb93-8d598b146884.png)

#### Delete

* Untouched. Keep all empty.

#### Patch

* Untouched. Keep all empty.

####Quirks

![Quirks (1)](https://user-images.githubusercontent.com/72515939/206203114-133e4565-985c-4b8d-ae79-79ba259fa6d9.png)

### Booter
* MmioWhitelist - NIL
* Patch - NIL
* Quirks
  * AvoidRuntimeDefrag = `True`
  * DevirtualiseMmio = `True`
  * EnableSafeModeSlide = `True`
  * ProtectUefiServices = `True`
  * ProvideCustomSlide = `True`
  * RebuildAppleMemoryMap = `True`
  * ResizeAppleGpuBars = `-1`
  * SyncRuntimePermissions = `True`

> **Note**: Other than above is `False`

### DeviceProperties

* In this section, what we need is to export important `devices path`, copy and add additional data to our config.plist. In this case, we take all `devices path`. The reason we doing this is to make sure all device is properly mapped. Export all `devices path` using [Hackintool](https://github.com/benbaker76/Hackintool). This will dump `pcidevices.dsl`, `pcidevices.json`, `pcidevices.plist` and `pcidevices.txt`. Only `pcidevices.plist` is what we need.

![PCI](https://user-images.githubusercontent.com/72515939/206184503-bdb22c2c-3321-44cd-861c-e1011a67c959.png)
![Files](https://user-images.githubusercontent.com/72515939/206185002-51536d9e-5270-4d3c-9956-a523e00d645c.png)

* Then, open `pcidevices.plist` using [ProperTree](https://github.com/corpnewt/ProperTree), copy all and paste to config.plist. Add `name` / `string` / `device name` to all device. Below is an example:

![path](https://user-images.githubusercontent.com/72515939/206184392-14984c21-6fa4-4c55-aee8-401233eb908d.png)

* Below is the results. 

![Mapped](https://user-images.githubusercontent.com/72515939/206185310-9fd93aed-5f3f-4d8a-94a2-b10874ccce06.png)

### Kernel

#### Add

* To make all of our hacks function, just `7` kernel extensions addition is required. 

![Kernel2](https://user-images.githubusercontent.com/72515939/206186463-b9183de6-6fb2-436e-8ac8-50bc7be67fea.png)

![Kernel](https://user-images.githubusercontent.com/72515939/206186484-416352f1-797e-4ae0-8b6d-2a82cebfee1c.png)

#### Block

* Untouched. Keep all empty.

#### Emulate

* Untouched. Keep all empty.

#### Force

* Untouched. Keep all empty.

#### Patch

* Here, only the TRIM patch is applied. The following details are available:

![Patch](https://user-images.githubusercontent.com/72515939/206198814-88c24678-5164-43c8-accf-1f6402821cde.png)

### Misc

#### BlessOverride

* Untouched. Keep all empty.

#### Boot

![Boot](https://user-images.githubusercontent.com/72515939/206198048-26eec458-eaa6-49fc-82c9-626cb6016748.png)

#### Debug

* This part is only required when using OpenCore `debug` to look for any device-related hints. This time, we don't need it.

#### Entries

* Untouched. Keep all empty.

#### Security

![Security](https://user-images.githubusercontent.com/72515939/206195788-2cf8170a-c94b-4ce3-af74-761cb2e96e21.png)

#### Serial

![Serial](https://user-images.githubusercontent.com/72515939/206199568-e20d77b2-a071-44f5-b411-d0d4b2722051.png)

#### Tools

* Untouched. Keep all empty.

### NVRAM

![NVRAM](https://user-images.githubusercontent.com/72515939/206199938-8dbd2a8e-ab9a-4b83-994e-bebf4ca0f40b.png)

### PlatformInfo

![PI](https://user-images.githubusercontent.com/72515939/206200493-bd8260ab-1582-4353-9b4b-7ee51610e154.png)

### UEFI

#### APFS

![APFS](https://user-images.githubusercontent.com/72515939/206200992-ce905c71-a22b-413d-927b-80643805ed32.png)

#### AppleInput

![AppleInput](https://user-images.githubusercontent.com/72515939/206201217-389e944d-fbbf-460a-86fd-ca3bf45f54e6.png)

#### Audio

![Audio](https://user-images.githubusercontent.com/72515939/206201393-2c3c93b5-af9b-42c3-b520-4016814129d9.png)

#### Drivers

![Drivers](https://user-images.githubusercontent.com/72515939/206201551-a5e24006-feea-4ae9-8798-c28d1794e897.png)

#### Input

![Input](https://user-images.githubusercontent.com/72515939/206202189-a01fce37-b190-4ada-ad35-799bd57c7a9f.png)

#### Output

![Output](https://user-images.githubusercontent.com/72515939/206202215-c6736f00-62b8-49b8-8202-6db0f952aba7.png)

#### ProtocolOverrides

![ProtocolOverrides](https://user-images.githubusercontent.com/72515939/206202267-6d6d433a-fede-4eef-b6cc-df366300cec5.png)

#### Quirks

![Quirks](https://user-images.githubusercontent.com/72515939/206202288-0fe9a22d-ada5-4fa1-8cbb-7bb446895ba1.png)





