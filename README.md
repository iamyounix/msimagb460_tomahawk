# Hackintosh: ASRock B460M Steel Legend
**OpenCore:** 10th Gen Comet Lake + ASRock B460M Steel Legend

[![BIOS](https://img.shields.io/badge/BIOS-1.60-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

**Table of Content**

[Introduction](#introduction) | [Device Specification](#device-specification) | [Tools](#tools) | [EFI Structure](#efi-structure) | [ACPI](#acpi) | [Booter](#booter) | [DeviceProperties](#deviceproperties) | [Kernel](#kernel) | [Misc](#misc) | [NVRAM](#nvram) | [PlatformInfo](#platforminfo) | [UEFI](#uefi) | [Tips](#tips) | [Various Terminal Command](#various-terminal-command) | [Credits](#credits)

### Introduction

OpenCore is what we refer to as a **boot loader** – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as **SMBIOS**, **ACPI** tables and **kexts**. How this tool differs from others like **Clover** is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as **System Integrity Protection** and  Filevault

* Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding
* Checkout Dortania Monthly [Post](https://dortania.github.io) to get more info.

**Note**: if you're still interested in utilising it, please be careful to adjust the `.plist` configuration and `SSDT's` according to your machine.

### Device Specification
* **Processor** - Intel® Core™ i5-10400 | Codename: Comet Lake 
* **Graphics 1**- Intel® UHD 630 - Headless
* **Graphics 2**- MSI RX 5500 XT 4GB - Main Display
* **Disk**	- 02 x Kingston A2000 500GB, 02 x San Disk 500GB

### Tools

[DevicePath](https://github.com/corpnewt/DevicePath) | [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) | [gibMacRecovery](https://github.com/corpnewt/gibMacRecovery) | [Hackintool](https://github.com/benbaker76/Hackintool) | [IOreg](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/IORegistryExplorer.zip) | [macIASL](https://github.com/acidanthera/MaciASL) or [Xiasl](https://github.com/ic005k/Xiasl) | [OCAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) | [octool](https://github.com/rusty-bits/octool) | [ProperTree](https://github.com/corpnewt/ProperTree) | [SSDTTime](https://github.com/corpnewt/SSDTTime) | [USBToolbox](https://github.com/USBToolBox/tool)

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

![Add](https://user-images.githubusercontent.com/72515939/209303375-ce396194-1562-4c62-90d6-6f4b343d1aaa.png)

#### Delete

ACPI delete section. Just remain this as untouched unless we need to delete certain SSDT by using signature or OEM ID.

> **Note**: Do not use table signatures when the sequence must be replaced in multiple places. This is particularly relevant when performing different types of renames.

#### Patch

Most of the cases, using ACPI patches throughout this section is dangerous, sometimes useless. Only an appropriate and functional patch implemented via ACPI achieves better results. Keep it untouched.

#### Quirks

![Quirks](https://user-images.githubusercontent.com/72515939/209303627-2716b1a2-2c52-4f92-8498-1232e0240a61.png)

### Booter

This section is originally implement from `AptioMemoryFix.efi` which is no longer maintained. It is also allows the application of different types of UEFI modifications to operating system bootloaders. The modifications currently provide various patches and environment alterations for different firmware types.

#### MmioWhitelist

Keep empty.

#### Patch

Keep empty.

#### Quirks

![B Quirks](https://user-images.githubusercontent.com/72515939/209303876-89665f09-bae6-4407-aaa1-026b5c0c9f29.png)

### DeviceProperties

In this section, what we need is to export important `devices path`, copy and add additional data to our config.plist. In this case, we take all `devices path`. The reason we doing this is to make sure all device is properly mapped.

* On Mac, export all `devices path` using [Hackintool](https://github.com/benbaker76/Hackintool). This will dump `pcidevices.dsl`, `pcidevices.json`, `pcidevices.plist` and `pcidevices.txt`. Only `pcidevices.plist` is what we need.

![PCI](https://user-images.githubusercontent.com/72515939/206184503-bdb22c2c-3321-44cd-861c-e1011a67c959.png)

![Files](https://user-images.githubusercontent.com/72515939/206185002-51536d9e-5270-4d3c-9956-a523e00d645c.png)

* On Windows, [DevicePath](https://github.com/corpnewt/DevicePath) is the best tool to convert device path. However, this need to be done manually 

![DPWin1](https://user-images.githubusercontent.com/72515939/206334354-a204a84d-bc9e-42e5-8878-7e5bc6416c92.PNG)

![DPWin](https://user-images.githubusercontent.com/72515939/206334366-d9d1c69f-8906-43ba-9745-74eb661d3103.PNG)

* Then, open `pcidevices.plist` using [ProperTree](https://github.com/corpnewt/ProperTree), copy all and paste to config.plist. Add `name` / `string` / `device name` to all device. Below is an example:

![DP](https://user-images.githubusercontent.com/72515939/209304264-46f59a56-ceaf-4856-a0f3-c482d4260b4d.png)

* Details via Linux [lspci](https://man7.org/linux/man-pages/man8/lspci.8.html)

```zsh
00:00.0 Host bridge: Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller (rev 05)
00:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) (rev 05)
00:02.0 Display controller: Intel Corporation CometLake-S GT2 [UHD Graphics 630] (rev 05)
00:14.0 USB controller: Intel Corporation Comet Lake PCH-V USB Controller
00:14.2 Signal processing controller: Intel Corporation Comet Lake PCH-V Thermal Subsystem
00:16.0 Communication controller: Intel Corporation Comet Lake PCH-V HECI Controller
00:17.0 SATA controller: Intel Corporation 400 Series Chipset Family SATA AHCI Controller
00:1b.0 PCI bridge: Intel Corporation Device a3ea (rev f0)
00:1b.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #21 (rev f0)
00:1c.0 PCI bridge: Intel Corporation Device a393 (rev f0)
00:1c.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #05 (rev f0)
00:1d.0 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port 9 (rev f0)
00:1f.0 ISA bridge: Intel Corporation B460 Chipset LPC/eSPI Controller
00:1f.2 Memory controller: Intel Corporation Cannon Lake PCH Power Management Controller
00:1f.3 Audio device: Intel Corporation Comet Lake PCH-V cAVS
00:1f.4 SMBus: Intel Corporation Comet Lake PCH-V SMBus Host Controller
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev c5)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
```

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

![Kernel](https://user-images.githubusercontent.com/72515939/209304588-168d7c4f-8c59-4e03-ab25-3322a41f5361.png)

#### Block

To remove selected kernel extensions (kexts) from the prelinked kerne

#### Emulate

Keep empty.

#### Force

Keep empty.

#### Patch

Here, only TRIM patch applied. The following details are as below:

![Patch](https://user-images.githubusercontent.com/72515939/209305376-e7c50801-6220-4080-a2fa-83ce0163986b.png)

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

![NVRAM](https://user-images.githubusercontent.com/72515939/209305551-357ebabc-64c2-4c07-b730-89475b02c36e.png)

**boot-args** is placed under (APPLE_BOOT_VARIABLE_GUID). In this case, MSI RX 5500 XT (Mostly Navi Variant) will experience a black screen issue after the boot process. This situation occurs when Apple's Graphic Device Policy is not satisfied with DGPU and IGPU. As a solution, Whatevergreen supports boot-arguement called as `agdpmod=pikera`, which renames `board-id` to `board-ix`. This will effectively disabling boardID checks, this is based off of Pike.R.A's [work](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/). As temporary workaround, refer example below:

* **7C436110-AB2A-4BBB-A880-FE41995C9F82**
  * `boot-args` / `string` / `agdpmod=pikera`

We can use these boot-args on ACPI and DeviceProperties in config.plist permanently. See the example below:

* ACPI (SSDT)

```asl
Scope (\_SB)
{
	Method (_INI, 0, NotSerialized)  // _INI: Initialize
	{
		If (_OSI ("Darwin"))
		{
			STAS = One
		}
	}

	Scope (PCI0)
	{
		Scope (GFX0)
		{
			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				If (_OSI ("Darwin"))
				{
					Return (Zero)
				}
				Else
				{
					Return (0x0F)
				}
			}
		}

		Device (IGPU)
		{
			Name (_ADR, 0x00020000)  // _ADR: Address
			Name (_SUN, Zero)  // _SUN: Slot User Number
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If ((Arg2 == Zero))
				{
					Return (Buffer ()
					{
						 0x03                                             // .
					})
				}

				Return (Package ()
				{
					"AAPL,ig-platform-id", 
					Buffer ()
					{
						 0x03, 0x00, 0x92, 0x3E                           // ...>
					}, 

					"AAPL,slot-name", 
					"Slot- 0", 
					"agdpmod",	// Apple Graphic Device Policy Patch
					"pikera",	// Arguement
					"device-id", 
					Buffer ()
					{
						 0x9B, 0x3E, 0x00, 0x00                           // .>..
					}, 

					"enable-metal", 
					Buffer ()
					{
						 0x01, 0x00, 0x00, 0x00                           // ....
					}, 

					"igfxfw", 
					Buffer ()
					{
						 0x02, 0x00, 0x00, 0x00                           // ....
					}, 

					"igfxonln", 
					Buffer ()
					{
						 0x01, 0x00, 0x00, 0x00                           // ....
					}
				})
			}
		}
	}
}
```

* via DeviceProperties (config.plist)

```xml
<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
<dict>
	<key>AAPL,ig-platform-id</key>
	<data>AwCSPg==</data>
	<key>AAPL,slot-name</key>
	<string>Slot- 0</string>
	<key>agdpmod</key>		 	// Apple Graphic Device Policy Patch
	<data>cGlrZXJhAA==</data>   // Arguement
	<key>device-id</key>
	<data>mz4AAA==</data>
	<key>enable-metal</key>
	<data>AQAAAA==</data>
	<key>igfxfw</key>
	<data>AgAAAA==</data>
	<key>igfxonln</key>
	<string>01000000</string>
</dict>
```

### PlatformInfo

* Use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) to generate serial, MLB, UUID and others.

![GenSMBIOS](https://user-images.githubusercontent.com/72515939/208702274-20832ad7-b72f-41ec-b794-6dd45852541f.png)

![Serial](https://user-images.githubusercontent.com/72515939/208702607-6bf84cf8-10d7-4b92-a641-69c1124f1b9d.png)

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
	- **-1** = permit any version to load (strongly discouraged).
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
  
![octool](https://user-images.githubusercontent.com/72515939/206938654-956575d3-2034-440d-b99b-be9b826421a4.png)

### Editing Plist

ProperTree is a cross-platform GUI plist editor written using Python (compatible with both 2.x and 3.x) and Tkinter. Monterey and above, please update least `python-tk@3.10` via homebrew. Download [ProperTree](https://github.com/corpnewt/ProperTree) and start find [ProperTree](https://github.com/corpnewt/ProperTree) > Scripts > `buildappselect.command` and run the program.

#### Download ProperTree

```zsh
cd <Location>
```
```zsh
git clone https://github.com/corpnewt/ProperTree.git
```

#### Check ProperTree Files and Folder

**Structure**

- Scripts (Folder) - location to build `Propertree.app` 
- LICENSE
- ProperTree.bat - for Windows
- ProperTree.command - macOS & Linux
- ProperTree.py - source
- Readme.md - Description/Guide

![ProperTree](https://user-images.githubusercontent.com/72515939/206828201-329a539a-b541-46ca-bb8a-fe54b36c8190.png)

#### Install python-tk@3.10

```zsh
brew install python-tk@3.10
```

After installlation process is done, open Scripts folder. Run  `buildapp-select.command` and select No. 2 to build an `app`.

![ProperTreebuild](https://user-images.githubusercontent.com/72515939/206828298-23f8e36f-f624-495b-aff0-947bdc55ce0a.png)

```zsh
Building .app with the following python install:
 - /usr/local/bin/python3
 --> 3.10.8
 --> tk 8.6
Checking for existing ProperTree.app...
Creating bundle structure...
Copying scripts...
 - ProperTree.py -> ProperTree.command
 - __init__.py
 - buildapp-select.py
 - downloader.py
 - menu.plist
 - plist.py
 - plistwindow.py
 - run.py
 - shortcut.icns
 - snapshot.plist
 - utils.py
 - version.json
Building Info.plist...
Saved to: /Volumes/Tools/ProperTree/ProperTree.app

Saving session...
...copying shared history...
...saving history...truncating history files...
...completed.

[Process completed]
```

Then go back to ProperTree main folder. You may see `ProperTree.app` in this location.

![ProperTreebuild2](https://user-images.githubusercontent.com/72515939/206828403-f841f3a3-d651-430c-b405-828420c4dbd8.png)

You may move `ProperTree.app` to `Applications` folder.

> **Note**: Using `ProperTree.command` may run the this tool without build the `app`.

### Fix Keyboard Wake

As refered from [Dortania](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#method-1-add-wake-type-property-recommended), there is a workaround fix keyboard wake. There are two choice which is via config.plist (DeviceProperties) or ACPI. 

#### Method 1 (Recommended) 

* **DeviceProperties**
  * add `acpi-wake-type` | `Data` | `<01>` to our USB device. In this case is **XHC1**. Add USB device properties using [ProperTree](https://github.com/corpnewt/ProperTree).

![acpi-wake-type cp](https://user-images.githubusercontent.com/72515939/206938454-6c0fe68e-e8c6-4fea-8cc9-f8a14f51e187.png)

* **ACPI**
  * add `acpi-wake-type` | `One` to our USB device. In this case is **XHC1**. Edit USB device path using [macIASL](https://github.com/acidanthera/MaciASL) or [Xiasl](https://github.com/ic005k/Xiasl).

![acpi-wake-type](https://user-images.githubusercontent.com/72515939/206938315-74d244b6-3535-47e1-8081-401643d8aa8c.png)

> **Note**: Go to [Dortania](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#method-1-add-wake-type-property-recommended) for more method.

#### Method 2 (Virtual Wake Device)

This method creates **USB wakeup virtual device** that will be associated with the GPE, then add the property of `acpi-wake-type` with `USBWakeFixup.kext`.

* Apply [USBWakeFixup.kext](https://github.com/osy86/USBWakeFixup/releases) using bootloader.
* Add `SSDT-USBW.dsl` to ACPI. Below is an example:

```asl
/**
 * USB wakeup virtual device
 */
DefinitionBlock ("", "SSDT", 2, "OSY86 ", "USBW", 0x00001000)
{
    External (\_SB.PCI0.XHC1._PRW, MethodObj)

    // We only enable the device for OSX
    If (CondRefOf (\_OSI, Local0) && _OSI ("Darwin"))
    {
        Device (\_SB.USBW)
        {
            Name (_HID, "PNP0D10")  // _HID: Hardware ID
            Name (_UID, "WAKE")  // _UID: Unique ID

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PCI0.XHC1._PRW ()) // Replace with path to your USB device
            }
        }
    }
}
```

#### Method 3 (Partial Wake)

* Hint 1
```zsh
// gDarkWakeFlags
enum {
    kDarkWakeFlagHIDTickleEarly      = 0x01, // hid tickle before gfx suppression
    kDarkWakeFlagHIDTickleLate       = 0x02, // hid tickle after gfx suppression
    kDarkWakeFlagHIDTickleNone       = 0x03, // hid tickle is not posted
    kDarkWakeFlagHIDTickleMask       = 0x03,
    kDarkWakeFlagAlarmIsDark         = 0x0100,
    kDarkWakeFlagGraphicsPowerState1 = 0x0200,
    kDarkWakeFlagAudioNotSuppressed  = 0x0400
};
```
* Hint 2
```zsh
Bit	Name	Comment
0	N/A	Supposedly disables darkwake
1	HID Tickle Early	Helps with wake from lid, may require pwr-button press to wake in addition
2	HID Tickle Late	Helps single keypress wake but disables auto-sleep
3	HID Tickle None	Default darkwake value if none is set
3	HID Tickle Mask	To be paired with other
256	Alarm Is Dark	To be explored
512	Graphics Power State 1	Enables wranglerTickled to wake fully from hibernation and RTC
1024	Audio Not Suppressed	Supposedly helps with audio disappearing after wake
```
> **Note**: HID = Human-interface devices (Keyboards, mice, pointing devices, etc).

To apply the above table to your system, it's as simple as grabbing calculator, adding up your desired darkwake values and then applying the final value to your boot-args. However we recommend trying 1 at a time rather than merging all at once, unless you know what you're doing(though you likely wouldn't be reading this guide).

* As example, lets try and combine `kDarkWakeFlagHIDTickleLate` and `kDarkWakeFlagGraphicsPowerState1`:
  * `2 = kDarkWakeFlagHIDTickleLate`
  * `512 = kDarkWakeFlagAudioNotSuppressed`

* So our final value would be darkwake=514, which we can next place into boot-args:

```
NVRAM
|---Add
  |---7C436110-AB2A-4BBB-A880-FE41995C9F82
    |---boot-args | Sting | darkwake=514
```

Below is clarification for users who are already using darkwake or are looking into it, specifically clarifying what values no longer work:

* `darkwake=8`: This hasn't been in the kernel since [Mavericks](https://opensource.apple.com/source/xnu/xnu-2422.115.4/iokit/Kernel/IOPMrootDomain.cpp.auto.html)
  * Correct boot-arg would be `darkwake=0`
* `darkwake=10`: This hasn't been in the kernel since [Mavericks](https://opensource.apple.com/source/xnu/xnu-2422.115.4/iokit/Kernel/IOPMrootDomain.cpp.auto.html)
  * Correct boot-arg would be `darkwake=2`

### Various Terminal Command

Refer [Various Terminal Command](https://github.com/5T33Z0/OC-Little-Translated/blob/main/Terminal_Commands.md) for more info.

### Credits

#### [Acidanthera](https://github.com/acidanthera) | [benbaker76](https://github.com/benbaker76) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [ic005k](https://github.com/ic005k) | [osy86](https://github.com/osy86) | [rusty-bits](https://github.com/rusty-bits) | [USBToolbox](https://github.com/USBToolBox) | [5T33Z0](https://github.com/5T33Z0)

