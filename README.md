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

### Introduction

OpenCore is what we refer to as a **boot loader** – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as **SMBIOS**, **ACPI** tables and **kexts**. How this tool differs from others like **Clover** is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as **System Integrity Protection** and  Filevault

* Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding
* Checkout Dortania Monthly [Post](https://dortania.github.io) to get more info

**Note**: if you're still interested in utilising it, please be carefulto adjust the .plist configuration and SSDTs according to your machine.

### Device Specification
* **Processor** - Intel® Core™ i5-10400 `CometLake` 
* **Graphics 1**- Intel® UHD 630 - Headless
* **Graphics 2**- MSI RX 5500 XT 4GB - Main Display
* **Disk**	- 02 x Kingston A2000 500GB, 02 x San Disk 500GB

### Tools
* [DevicePath](https://github.com/corpnewt/DevicePath)
* [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
* [gibMacRecovery](https://github.com/corpnewt/gibMacRecovery)
* [Hackintool](https://github.com/benbaker76/Hackintool)
* [IOreg](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/IORegistryExplorer.zip)
* [OCAuxiliary](https://github.com/ic005k/OCAuxiliaryTools)
* [octool](https://github.com/rusty-bits/octool)
* [ProperTree](https://github.com/corpnewt/ProperTree)
* [SSDTTime](https://github.com/corpnewt/SSDTTime)
* [USBToolbox](https://github.com/USBToolBox/tool)

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

Almost 80% of the patches from ACPI are used in this project. The patch applied is identical to the patch applied to config.plist. Patching ACPI has the advantage of making it more permanent, and it also gives us the chance to learn some fundamental concepts about ACPI. This basic process require [SSDTTime](https://github.com/corpnewt/SSDTTime). However, keep in mind that [SSDTTime](https://github.com/corpnewt/SSDTTime) only helps the fundamental ACPI patching structure.

![SSDTTime](https://user-images.githubusercontent.com/72515939/206207663-6e93f488-8194-4c19-8484-2e5f78ba1971.png)

> **Note**:  Refer to [SSDT-EXT](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/SSDT-EXT/SSDT-EXT.dsl) as a template for advance patching.

#### Add

The ACPI table load order follows the item order in the array. ACPI tables are loaded from the `OC` / `ACPI` directory.

![ACPI-Add](https://user-images.githubusercontent.com/72515939/206202889-00f51692-3f6b-40d5-bb93-8d598b146884.png)

#### Delete

ACPI delete section. Just remain this as untouched unless we need to delete certain SSDT by using signature or OEM ID.

> **Note**: Do not use table signatures when the sequence must be replaced in multiple places. This is particularly relevant when performing different types of renames.

#### Patch

Most of the cases, using ACPI patches throughout this section is dangerous, sometimes useless. Only an appropriate and functional patch implemented via ACPI achieves better results. Keep it untouched.

#### Quirks

![Quirks (1)](https://user-images.githubusercontent.com/72515939/206203114-133e4565-985c-4b8d-ae79-79ba259fa6d9.png)

### Booter

This section is originally implement from `AptioMemoryFix.efi` which is no longer maintained. It is also allows the application of different types of UEFI modifications to operating system bootloaders. The modifications currently provide various patches and environment alterations for different firmware types.

#### MmioWhitelist

Keep empty.

#### Patch

Keep empty.

#### Quirks

![Quirks (2)](https://user-images.githubusercontent.com/72515939/206203808-e053d833-d8a6-4fa6-b169-76820d728ec1.png)

### DeviceProperties

In this section, what we need is to export important `devices path`, copy and add additional data to our config.plist. In this case, we take all `devices path`. The reason we doing this is to make sure all device is properly mapped.

* On Mac, export all `devices path` using [Hackintool](https://github.com/benbaker76/Hackintool). This will dump `pcidevices.dsl`, `pcidevices.json`, `pcidevices.plist` and `pcidevices.txt`. Only `pcidevices.plist` is what we need.

![PCI](https://user-images.githubusercontent.com/72515939/206184503-bdb22c2c-3321-44cd-861c-e1011a67c959.png)

![Files](https://user-images.githubusercontent.com/72515939/206185002-51536d9e-5270-4d3c-9956-a523e00d645c.png)

* On Windows, [DevicePath](https://github.com/corpnewt/DevicePath) is the best tool to convert device path. However, this need to be done manually 

![DPWin1](https://user-images.githubusercontent.com/72515939/206334354-a204a84d-bc9e-42e5-8878-7e5bc6416c92.PNG)

![DPWin](https://user-images.githubusercontent.com/72515939/206334366-d9d1c69f-8906-43ba-9745-74eb661d3103.PNG)

* Then, open `pcidevices.plist` using [ProperTree](https://github.com/corpnewt/ProperTree), copy all and paste to config.plist. Add `name` / `string` / `device name` to all device. Below is an example:

![path](https://user-images.githubusercontent.com/72515939/206184392-14984c21-6fa4-4c55-aee8-401233eb908d.png)

* Below is the results. 

![Mapped](https://user-images.githubusercontent.com/72515939/206185310-9fd93aed-5f3f-4d8a-94a2-b10874ccce06.png)

### Kernel

This section allows the application of different kinds of kernelspace modifications on `Apple Kernel (XNU)`. The modifications currently provide driver (kext) injection, kernel and driver patching, and driver blocking.

#### Add

To make all of our hacks function, just `7` kernel extensions addition is required. 

**Kexts List**
1. [Lilu](https://github.com/acidanthera/Lilu)
2. [AppleALC](https://github.com/acidanthera/AppleALC)
3. [VirtualSMC](https://github.com/acidanthera/VirtualSMC) - include [SMCProcessor.kext](https://github.com/acidanthera/VirtualSMC) and [SMCSuperIO.kext](https://github.com/acidanthera/VirtualSMC)
4. [LucyRTL8125Ethernet](https://github.com/Mieze/LucyRTL8125Ethernet)
5. USBMap

> **Note**: USBMap.kext require [USBToolbox](https://github.com/USBToolBox/tool). Please read developer description. 

![Kernel2](https://user-images.githubusercontent.com/72515939/206186463-b9183de6-6fb2-436e-8ac8-50bc7be67fea.png)

![Kernel](https://user-images.githubusercontent.com/72515939/206186484-416352f1-797e-4ae0-8b6d-2a82cebfee1c.png)

#### Block

To remove selected kernel extensions (kexts) from the prelinked kerne

#### Emulate

Keep empty.

#### Force

Keep empty.

#### Patch

Here, only TRIM patch applied. The following details are as below:

![Patch](https://user-images.githubusercontent.com/72515939/206198814-88c24678-5164-43c8-accf-1f6402821cde.png)

### Misc

This section contains miscellaneous configuration options affecting OpenCore operating system loading behaviour in addition to other options that do not readily fit into other sections.

#### BlessOverride

Add custom scanning paths through the bless model. In these case, just keep it untouched unless needed.

#### Boot

Apply the boot configuration described in the [Boot Properties](https://dortania.github.io/docs/release/Configuration.html#boot-properties)

![Boot](https://user-images.githubusercontent.com/72515939/206198048-26eec458-eaa6-49fc-82c9-626cb6016748.png)

#### Debug

Apply debug configuration described in the [Debug Properties](https://dortania.github.io/docs/release/Configuration.html#debug-properties) section below

#### Entries

This section add boot entries to OpenCore picker. Other than that, just keep empty.

#### Security

Apply the security configuration described in the [Security Properties](https://dortania.github.io/docs/release/Configuration.html#security-properties)

![Security](https://user-images.githubusercontent.com/72515939/206195788-2cf8170a-c94b-4ce3-af74-761cb2e96e21.png)

#### Serial

Perform serial port initialisation and configure PCD values required by `BaseSerialPortLib16550` for serial ports to properly function. Values are listed and described in the [Serial Properties](https://dortania.github.io/docs/release/Configuration.html#serial-properties) and [Serial Custom Properties](https://dortania.github.io/docs/release/Configuration.html#serial-custom-properties). Keep it untouched.

![Serial](https://user-images.githubusercontent.com/72515939/206199568-e20d77b2-a071-44f5-b411-d0d4b2722051.png)

#### Tools

* Untouched. Keep all empty.

### NVRAM

![NVRAM](https://user-images.githubusercontent.com/72515939/206199938-8dbd2a8e-ab9a-4b83-994e-bebf4ca0f40b.png)

### PlatformInfo

* Use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) to generate serial, MLB, UUID and others.

![GenSMBIOS (1)](https://user-images.githubusercontent.com/72515939/206208941-ddabc3a1-6979-4903-8c55-8bee4975565a.png)

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





