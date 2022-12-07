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
- [Acknowledgement](#acknowledgement)

### Introduction
OpenCore is what we refer to as a **boot loader** – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as **SMBIOS**, **ACPI** tables and **kexts**. How this tool differs from others like **Clover** is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as **System Integrity Protection** and  Filevault

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
This project uses almost 80% of the patches from ACPI. The patch used is the same patch as used in config.plist. The purpose of patching on ACPI is that it is more permanent, at the same time we may learn a bit about ACPI basic knowledge. [SSDTTime](https://github.com/corpnewt/SSDTTime) is the tool used in this process. But be reminded, [SSDTTime](https://github.com/corpnewt/SSDTTime) only helps to patch the basic ACPI structure. The full patch can be viewed through the link provided below.

* [SSDT-EXT](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/SSDT-EXT/SSDT-EXT.dsl)

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

In this section, what we need is to export important `devices path`, copy and add additional data to our config.plist. In this case, we take all `devices path`. The reason we doing this is to make sure all device is properly mapped. Export all `devices path` using [Hackintool](https://github.com/benbaker76/Hackintool). This will dump `pcidevices.dsl`, `pcidevices.json`, `pcidevices.plist` and `pcidevices.txt`. Only `pcidevices.plist` is what we need.

![PCI](https://user-images.githubusercontent.com/72515939/206184503-bdb22c2c-3321-44cd-861c-e1011a67c959.png)
![Files](https://user-images.githubusercontent.com/72515939/206185002-51536d9e-5270-4d3c-9956-a523e00d645c.png)

Then, open `pcidevices.plist` using [ProperTree](https://github.com/corpnewt/ProperTree), copy all and paste to config.plist. Add `name` / `string` / `device name` to all device. Below is an example:

![path](https://user-images.githubusercontent.com/72515939/206184392-14984c21-6fa4-4c55-aee8-401233eb908d.png)

Below is the results. 

![Mapped](https://user-images.githubusercontent.com/72515939/206185310-9fd93aed-5f3f-4d8a-94a2-b10874ccce06.png)

### Kernel

#### Add

Only `7` Kernel extension needed to get all our hacks working. 

![Kernel2](https://user-images.githubusercontent.com/72515939/206186463-b9183de6-6fb2-436e-8ac8-50bc7be67fea.png)

![Kernel](https://user-images.githubusercontent.com/72515939/206186484-416352f1-797e-4ae0-8b6d-2a82cebfee1c.png)

#### Block

No additional data needed here.

#### Emulate

All is untouched. Keep all empty.

#### Force

No additional data needed here.

#### Patch

Here, only TRIM patch is added. All data as stated below:

```xml
<key>Patch</key>
<array>
	<dict>
		<key>Arch</key>
		<string>x86_64</string>
		<key>Base</key>
		<string></string>
		<key>Comment</key>
		<string>Enable TRIM for SSD</string>
		<key>Count</key>
		<integer>0</integer>
		<key>Enabled</key>
		<true/>
		<key>Find</key>
		<data>
		AEFQUExFIFNTRAA=
		</data>
		<key>Identifier</key>
		<string>com.apple.iokit.IOAHCIBlockStorage</string>
		<key>Limit</key>
		<integer>0</integer>
		<key>Mask</key>
		<data>
		</data>
		<key>MaxKernel</key>
		<string></string>
		<key>MinKernel</key>
		<string></string>
		<key>Replace</key>
		<data>
		AAAAAAAAAAAAAAA=
		</data>
		<key>ReplaceMask</key>
		<data>
		</data>
		<key>Skip</key>
		<integer>0</integer>
	</dict>
</array>
```

### Misc

#### Boot

Enable:

- HideAuxiliary = `True`
- Showpicker = `True`
- PickerAttributes = `147`
- PickerMode = `External`
- PickerVariant = `Acidanthera\GoldenGate`
- Timeout - `5`

> **Note**: The rest just keep untouched

#### Debug

This section is only needed when we need OpenCore `debug` to find any clue related to device issues. In this case, we don't need it.

#### Security
