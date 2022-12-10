# Hackintosh: ASRock B460M Steel Legend
OpenCore: 10th Gen Comet Lake + ASRock B460M Steel Legend - WIP

[![BIOS](https://img.shields.io/badge/BIOS-1.60-purple)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.8.7-white)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Release](https://img.shields.io/badge/Release-Latest-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![OS](https://img.shields.io/badge/OS-Monterey%20%2F%20Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

**Table of Content**

[Introduction](#introduction) | [Device Specification](#device-specification) | [Tools](#tools) | [EFI Structure](#efi-structure) | [ACPI](#acpi) | [Booter](#booter) | [DeviceProperties](#deviceproperties) | [Kernel](#kernel) | [Misc](#misc) | [NVRAM](#nvram) | [PlatformInfo](#platforminfo) | [UEFI](#uefi) | [Tips](#tips) | [Various Terminal Command](#various-terminal-command) | [Acknowledgement](#acknowledgement)

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

[DevicePath](https://github.com/corpnewt/DevicePath) | [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) | [gibMacRecovery](https://github.com/corpnewt/gibMacRecovery) | [Hackintool](https://github.com/benbaker76/Hackintool) | [IOreg](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/IORegistryExplorer.zip) | [OCAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) | [octool](https://github.com/rusty-bits/octool) | [ProperTree](https://github.com/corpnewt/ProperTree) | [SSDTTime](https://github.com/corpnewt/SSDTTime) | [USBToolbox](https://github.com/USBToolBox/tool)

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

* Standalone tools may help to debug firmware and hardware. In these case, leave it untouched.

### NVRAM

Allows setting of non-volatile UEFI variables which commonly described as `NVRAM` variables. Refer to man nvram for details. The macOS operating system extensively uses `NVRAM` variables for OS Bootloader  Firmware intercommunication. Hence, the supply of several `NVRAM` variables is required for the proper functioning of macOS.

- **4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14** (APPLE_VENDOR_VARIABLE_GUID)
- **7C436110-AB2A-4BBB-A880-FE41995C9F82** (APPLE_BOOT_VARIABLE_GUID)
- **5EDDA193-A070-416A-85EB-2A1181F45B18** (Apple Hardware Configuration Storage for MacPro7,1)
- **8BE4DF61-93CA-11D2-AA0D-00E098032B8C** (EFI_GLOBAL_VARIABLE_GUID)
- **4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102** (OC_VENDOR_VARIABLE_GUID)

![NVRAM](https://user-images.githubusercontent.com/72515939/206199938-8dbd2a8e-ab9a-4b83-994e-bebf4ca0f40b.png)

### PlatformInfo

* Use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) to generate serial, MLB, UUID and others.

![GenSMBIOS (1)](https://user-images.githubusercontent.com/72515939/206208941-ddabc3a1-6979-4903-8c55-8bee4975565a.png)

![PI](https://user-images.githubusercontent.com/72515939/206200493-bd8260ab-1582-4353-9b4b-7ee51610e154.png)

### UEFI

UEFI (Unified Extensible Firmware Interface) is a specification that defines a software interface between an operating system and platform firmware. This section allows loading additional UEFI modules as well as applying tweaks to the onboard firmware. To inspect firmware contents, apply modifications and perform upgrades UEFITool and supplementary utilities can be used.

#### APFS

![APFS](https://user-images.githubusercontent.com/72515939/206200992-ce905c71-a22b-413d-927b-80643805ed32.png)

* **MinDate** (Minimal allowed APFS driver date)
	- **0** = require the default supported release date of APFS in OpenCore.
	- **-1** =  permit any release date to load (strongly discouraged).
	- **Other** = custom minimal APFS release date. APFS release dates can be found in OpenCore boot log and [OcApfsLib](https://github.com/acidanthera/OpenCorePkg/blob/master/Include/Acidanthera/Library/OcApfsLib.h).

* **MinVersion** (Minimal allowed APFS driver version)
	- **0** = require the default supported version of APFS in OpenCore.
	- **- 1** = permit any version to load (strongly discouraged).
	- **Other** = custom minimal APFS version. APFS versions can be found in OpenCore boot log and [OcApfsLib](https://github.com/acidanthera/OpenCorePkg/blob/master/Include/Acidanthera/Library/OcApfsLib.h).

#### AppleInput

This option determines whether the **OEM Apple Event Protocol** is used (where available). In mosts case, these settings is untouched. No need to change anything unless needed.

![AppleInput](https://user-images.githubusercontent.com/72515939/206201217-389e944d-fbbf-460a-86fd-ca3bf45f54e6.png)

#### Audio

This typically contains the first audio codec address on the builtin analog audio controller (HDEF). For us we'll be ignoring (leave as default).

![Audio](https://user-images.githubusercontent.com/72515939/206201393-2c3c93b5-af9b-42c3-b520-4016814129d9.png)

#### Drivers

Depending on the firmware, a different set of drivers may be required. Refer [here](https://dortania.github.io/docs/release/Configuration.html#drivers) for more info.

![Drivers](https://user-images.githubusercontent.com/72515939/206201551-a5e24006-feea-4ae9-8798-c28d1794e897.png)

#### Input

Related to boot.efi keyboard passthrough used for FileVault and Hotkey support, leave everything here as default as we have no use for these quirks. Leave as default.

![Input](https://user-images.githubusercontent.com/72515939/206202189-a01fce37-b190-4ada-ad35-799bd57c7a9f.png)

#### Output

Relating to OpenCore's visual output, leave everything here as default as we have no use for these quirks. Leave as default.

![Output](https://user-images.githubusercontent.com/72515939/206202215-c6736f00-62b8-49b8-8202-6db0f952aba7.png)

#### ProtocolOverrides

Mainly relevant for Virtual machines, legacy macs and FileVault users. Leave as default.

![ProtocolOverrides](https://user-images.githubusercontent.com/72515939/206202267-6d6d433a-fede-4eef-b6cc-df366300cec5.png)

#### Quirks

Relating to quirks with the UEFI environment.

![Quirks](https://user-images.githubusercontent.com/72515939/206202288-0fe9a22d-ada5-4fa1-8cbb-7bb446895ba1.png)

### Tips

This is just a tips related to this project

#### Building EFI (GUI)

Certain users depend on OpenCore Configurator to build an EFI. However, this app only works on macOS. Post-install, maybe. But how do you create an EFI from scratch without macOS installed? The answer is [OCAuxiliary](https://github.com/ic005k/OCAuxiliaryTools). OpenCore Auxiliary Tools is a graphical user interface (GUI) configuration tool for editing config.plist files for Acidanthera's OpenCore Boot Manager. This app supports the Windows, Linux, and MacOS platforms. Because of that, this app also provides a workaround to build an EFI without any macOS installed.

![OCAT2](https://user-images.githubusercontent.com/72515939/206455702-08d09a76-4b38-408a-9cfe-e84901d96166.png)

Unlike other Configurator apps, OCAT doesn't mess up the config if the Devs of OpenCore add new features/keys to the config file structure. Instead, it adapts and integrates them in the interface automatically. 

#### Update

[octool](https://github.com/rusty-bits/octool), A tool to help edit an OpenCore config.plist, updating and make an EFI folder from the command line. Developer also provides crossplatform workaround (Windows, Linux, macOS) to handle the task.
  
![oactool](https://user-images.githubusercontent.com/72515939/206457470-8e6d377a-219e-412b-9a0b-830da7005597.png)

### Editing Plist

ProperTree is a cross-platform GUI plist editor written using Python (compatible with both 2.x and 3.x) and Tkinter. Monterey and above, please update least `python-tk@3.10` via homebrew. Download [ProperTree](https://github.com/corpnewt/ProperTree) and start find [ProperTree](https://github.com/corpnewt/ProperTree) > Scripts > `buildappselect.command` and run the program.

```zsh
brew install python-tk@3.10
```

run `ProperTree.command`

![xxxxx](https://user-images.githubusercontent.com/72515939/206460072-63691f3f-1754-4b73-a092-192c087504e4.png)

Select No. 2 to gen an app.

![xxx](https://user-images.githubusercontent.com/72515939/206460220-6718e1ad-fbf2-4b13-8993-48459c3e30ed.png)

Then, grab `ProperTree.app` from **ProperTree-master**. Move the app to `Applications` folder.

### Fix Keyboard Wake

As refered as [Dortania](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#method-1-add-wake-type-property-recommended), there is a workaround fix keyboard wake. There are two choice which is via config.plist (DeviceProperties) or ACPI. 

* **DeviceProperties**
  * add `acpi-wake-type` | `Data` | `<01>` to our USB device. In this case is **XHC**.

![WakeType](https://user-images.githubusercontent.com/72515939/206504787-829fd4f3-78b5-4fc6-bc95-68e4a28d7582.png)

* **ACPI**
  * add `acpi-wake-type` | `One` to our USB device. In this case is **XHC1**.

![Wake](https://user-images.githubusercontent.com/72515939/206506046-552e7799-d3e6-4eec-aa50-5371ef20c563.png)

> **Note**: Go to [Dortania](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#method-1-add-wake-type-property-recommended) for more method.

### Various Terminal Command

Refer [Various Terminal Command](https://github.com/5T33Z0/OC-Little-Translated/blob/main/Terminal_Commands.md) for more info.

### Acknowledgement

#### [Acidanthera](https://github.com/acidanthera) | [benbaker76](https://github.com/benbaker76) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [ic005k](https://github.com/ic005k) | [rusty-bits](https://github.com/rusty-bits) | [USBToolbox](https://github.com/USBToolBox) | [5T33Z0](https://github.com/5T33Z0)

