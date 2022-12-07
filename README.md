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
- [MIsc](#misc)
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
#### 

```zsh
Code Name 					: Comet Lake
```

> **Note**: Start from macOS 12.3, [SSDT-PLUG.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [plugin-type=1](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [x86PlatformPlugin](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default. Check out [thread](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/) / [Acidanthera Bugtracker Issues #2013](https://github.com/acidanthera/bugtracker/issues/2013) / [Dortania Bugtracker Issues #269](https://github.com/dortania/bugtracker/issues/269) / [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

### Graphics

* Intel UHD 630 - Headless
	* IGPU - An Intregrated Graphic Processor Unit (iGPU). Function as headless mode, where the dGPU is the display out. Used when the Desktop iGPU is only used for computing tasks and doesn't drive a display.

* MSI RX 5500 XT - Display
	* GFX0 - A Dedicated Graphic Processor Unit (dGPU) is a PCI-based chip or electronic circuit that can render graphics for display on a computer. While the desktop iGPU is only used for computing tasks, this device functions as the main display.

> **Note**: Headless display for hackintosh not require `framebuffer-patch-enable` and `framebuffer-stolenmem`.

![Graphics](https://user-images.githubusercontent.com/72515939/201564512-85b70d59-cc94-4a34-8b2f-723546c9790a.png)

#### IGPU

```zsh
GPU Name 					: Intel® UHD Graphics 630
GPU Device ID 					: 0xC59B8086
Mobile 						: No
```

![IGPU](https://user-images.githubusercontent.com/72515939/201564546-2c6f57ad-72fc-478e-921e-342a009074eb.png)

With a few exceptions, like headless Intel® KBL Unknown `0xC59B8086`, certain strange name artefacts are present. There is no performance impact from this artefact. As of right now, device-id spoofing has been successful in altering its name to Intel® UHD Graphics 630. Without a doubt, only through the headless `0x3E9B8086`.

> **Note**: Real iMac 20,1 use **Intel® HD Graphics** as headless. While regular i5 10500 use **Intel® UHD Graphics**. Refer [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199277/intel-core-i510500-processor-12m-cache-up-to-4-50-ghz.html) for more info.

#### IGPU Patch

```zsh
GPU Name 					: Intel® UHD Graphics 630
GPU Device ID 					: 0x3E928086
Mobile 						: No
```

![IGPU USED](https://user-images.githubusercontent.com/72515939/201564553-07f0cb0e-2bf8-4246-abfe-5ea3abd1c65f.png)

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

- **via config.plist**
	- PciRoot(0x0)/Pci(0x2,0x0)
	  - AAPL,ig-platform-id / data / `0300923E`
	  - AAPL,slot-name / string / `Slot- 0`
	  - built-in / data / `00`
	  - device-id / data / `9B3E0000`
	  - enable-metal / data / `01000000`
	  - igfxfw / data / `02000000`
	  - igfxonln / data / `01000000`
	  - iommu-selection / data / `00000000`
	  - name / string / `IGPU`
	  
- **via SSDT**

```asl
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
			"built-in", 
			Zero, 
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
			}, 

			"iommu-selection", 
			Buffer ()
			{
				 0x00, 0x00, 0x00, 0x00                           // ....
			}
		})
	}
}
```  

> **Note**:  Additionally, the Comet Lake processor was first used in the iMac20,1 before being officially released. Checkout [Headless framebuffers](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add-2) / [Enabling Metal Support](https://github.com/5T33Z0/OC-Little-Translated/tree/main/11_Graphics/Metal_3#enabling-metal-3-support-and-gpu-tab-in-activity-monitor) / [Acidanthera Bugtracker Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)

#### GFX0

![GFX0](https://user-images.githubusercontent.com/72515939/201564574-c15433d6-683e-4765-8161-8d82a6936269.png)

```zsh
GPU Name                    : Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
GPU Device ID               : 0x73401002
Quartz Extreme (QE/CI)      : Yes
Metal Supported             : Yes
Metal Device Name           : AMD Radeon RX 5500 XT
Metal Default Device        : Yes
Metal Low Power             : No
Metal Headless              : No
VDA Decoder                 : Fully Supported
```

#### GFX0 Patch

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

- **via config.plist**
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)
	  - name / string / `PEGP`
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
	  - name / string / `BRG0`
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
	  - @0,name / string / `ATY,Python`
	  - @1,name / string / `ATY,Python`
	  - @2,name / string / `ATY,Python`
	  - @3,name / string / `ATY,Python`
	  - AAPL,slot-name / string / `Slot- 1`
	  - ATY,EFICompileDate / string / `Oct 12 2019`
	  - ATY,EFIVersion / string / `31.0.120.26.3`
	  - ATY,EFIVersionB / string / `113-MSITV382MH.161`
	  - ATY,Rom# / string / `113-EXT7635-001`
	  - ATY,copyright / string / `Copyright AMD Inc.  All Right Reserved.  2005-2019`
	  - hdagfx / string / `onboard-1`
	  - agdpmod / string / pikera
	  - device_type / string / `ATY,PythonParent`
	  - name / string / `ATY_GPU`
	  
- **via SSDT**

```asl
Scope (PEG0)
{
	Scope (PEGP)
	{
		Device (BRG0)
		{
			Name (_ADR, Zero)  // _ADR: Address
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If (_OSI ("Darwin"))
				{
					Return (0x0F)
				}
				Else
				{
					Return (Zero)
				}
			}

			Device (GFX0)
			{
				Name (_ADR, Zero)  // _ADR: Address
				Name (_SUN, One)  // _SUN: Slot User Number
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
						"@0,name", 
						"ATY,Python", 
						"@1,name", 
						"ATY,Python", 
						"@2,name", 
						"ATY,Python", 
						"@3,name", 
						"ATY,Python", 
						"AAPL,slot-name", 
						"Slot- 1", 
						"ATY,EFICompileDate", 
						"Oct 12 2019", 
						"ATY,EFIVersion", 
						"31.0.120.26.3", 
						"ATY,EFIVersionB", 
						"113-MSITV382MH.161", 
						"ATY,Rom#", 
						"113-EXT7635-001", 
						"ATY,copyright", 
						"Copyright AMD Inc.  All Right Reserved.  2005-2019", 
						"hdagfx", 
						"onboard-1", 
						"agdpmod", 
						"pikera", 
						"device_type", 
						"ATY,PythonParent"
					})
				}
			}
		}
	}
}
```

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### Other Devices

![PCI](https://user-images.githubusercontent.com/72515939/201564595-f4a4e48f-f68f-499b-8c7a-cc7f2a1c9a76.png)

#### DeviceProperties

- **via config.plist**

	- PciRoot(0x0)/Pci(0x0,0x0)
	  - name / string / `DRAM`
	- PciRoot(0x0)/Pci(0x1,0x0)
		- name / string / `PEG0`
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)
		- name / string / `PEGP`
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)
		- name / string / `PEGP`	
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
		- name / string / `BRG0`	
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
		- name / string / `ATY_GPU`
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
		- name / string / `HDAU`	
	- PciRoot(0x0)/Pci(0x14,0x0)
		- name / string / `XHC1`	
	- PciRoot(0x0)/Pci(0x14,0x2)
		- name / string / `TSUB`	
	- PciRoot(0x0)/Pci(0x16,0x0)
		- name / string / `IMEI`	
	- PciRoot(0x0)/Pci(0x17,0x0)
		- name / string / `SATA`	
	- PciRoot(0x0)/Pci(0x17,0x0)
		- name / string / `SATA`	
	- PciRoot(0x0)/Pci(0x1B,0x0)
		- name / string / `RP20`	
	- PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)
		- name / string / `ARPT`	
	- PciRoot(0x0)/Pci(0x1B,0x4)
		- name / string / `RP21`	
	- PciRoot(0x0)/Pci(0x1B,0x4)/Pci(0x0,0x0)
		- name / string / `ANS1`
	- PciRoot(0x0)/Pci(0x1C,0x0)
		- name / string / `RP04`	
	- PciRoot(0x0)/Pci(0x1C,0x0)/Pci(0x0,0x0)
		- name / string / `RTLK`	
	- PciRoot(0x0)/Pci(0x1C,0x4)
		- name / string / `RP05	
	- PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)
		- name / string / `XHC2`	
	- PciRoot(0x0)/Pci(0x1D,0x0)
		- name / string / `RP09`	
	- PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)
		- name / string / `ANS0`	
	- PciRoot(0x0)/Pci(0x1F,0x0)
		- name / string / `LPCB`	
	- PciRoot(0x0)/Pci(0x1F,0x2)
		- name / string / `PPMC`	
	- PciRoot(0x0)/Pci(0x1F,0x3)
		- name / string / `HDEF`	
	- PciRoot(0x0)/Pci(0x1F,0x4)
		- name / string / `SBUS`	
	- PciRoot(0x0)/Pci(0x2,0x0)
		- name / string / `IGPU`	

- **via SSDT**

Refer [SSDT-EXT.dsl](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/SSDT-EXT/SSDT-EXT.dsl) for more info

#### Patch

![Other Patches](https://user-images.githubusercontent.com/72515939/201564609-f85ed4ae-5584-48e8-aa00-2eaf39f8fd3b.png)

- `ALSD`- Ambient Light Sensor, `AppleLMUController` (Optional)
- `EC`- Fake Embedded Controller
- `GFX0`- rename as `IGPU` (Headless)
- `HDAS`- rename as `HDEF`
- `HDAU`- with `_SUN` properties
- `HECI`- rename as `IMEI`
- `PPMC`- device unrecognised and rename. (Not compatible)
- `RP04.PXSX`- rename as `RTLK`
- `RP05.PXSX`- rename as `XHC2`, with `_SUN` properties
- `RP09.PXSX`- rename as `ANS0`, AppleSSDController patch
- `RP20.PXSX`- rename as `ARPT`, with `_SUN` properties
- `RP21.PXSX`- renamed as `ANS1`, AppleSSDController patch
- `SAT0`- rename as `SATA`
- `SBUS`- compatible `smbus` and `diagsvault` patch
- `TSUB`- device unrecognised and rename. (Not compatible)
- `USBX`- USB Power Management patch
- `XHC`- renamed as `XHC1`

### Audio

- to enables streaming music to sound more like an original studio recording.

#### HDEF

```zsh
Device		 					: ALCS1200A
```

Patching can be done in two ways, via **config.plist** or via **SSDT**.

- **via config.plist**
	- layout-id = `01000000`
	- name = `HDEF`
	- No-hda-gfx = `0000000000000000`
	- No-idle-support = `00`

- **via SSDT**

```asl
Scope (HDAS)
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

Device (HDEF)
{
	Name (_ADR, 0x001F0003)  // _ADR: Address
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
			"No-hda-gfx", 
			Buffer ()
			{
				 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
			}, 

			"layout-id", 
			Buffer ()
			{
				 0x01, 0x00, 0x00, 0x00                           // ....
			}, 

			"No-idle-support", 
			Zero
		})
	}
}
```

![Audio](https://user-images.githubusercontent.com/72515939/201564627-0f6f3016-6251-4cfb-9132-360a9a6489e9.png)

#### HDAU

```zsh
Device		 					: Navi 10 HDMI Audio (RX 5500 XT)
```

Regularly, this device is attached via `GFX0`. Patching can be done in two ways, via **config.plist** or via **SSDT**. 

- **via config.plist**
	- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
	  - driver-version / string / `10.0.1.14`
	  - hda-gfx / string / `onboard-1`
	  - model / string / `Navi 10 HDMI Audio`
	  - name / string / `HDAU`

- **via SSDT**

```asl
Device (HDAU)
{
	Name (_ADR, One)  // _ADR: Address
	Name (_SUN, One)  // _SUN: Slot User Number
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
			"driver-version", 
			"10.0.1.14", 
			"hdagfx", 
			"onboard-1", 
			"model", 
			"Navi 10 HDMI Audio"
		})
	}
}
```

![AppleGFXHDA](https://user-images.githubusercontent.com/72515939/201564637-635e432f-f3d4-4954-8da3-191568d284a7.png)  

### Quirks and PlatformInfo

- variety of abilities that can be used to influence and alter kernel behaviour or certain types of data. 
- to take advantage of a BIOS that occasionally differs from the kernel or operating system.

#### ACPI / Quirks

- All False

#### Kernel / Quirks

- CustomSMBIOSGuid = `False` (Require PlatformInfo / Generic / UpdateSMBIOSMode = `Custom`). Refer [here](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/README.md#platforminfo).
- DisableLinkeditJettison = `True`
- PanicNoKextDump = `True`
- PowerTimeoutKernelPanic = `True`
- SetApfsTrimTimeout = `0`

> **Note**: Other than above is `False`

#### UEFI / Quirks

- EnableVectorAcceleration = `True`
- RequestBootVarRouting = `True`
- ResizeGpuBars = `-1`
- SetApfsTrimTimeout = `0`
- TscSyncTimeout = `0`

> **Note**: Other than above is `false`

#### PlatformInfo

- Automatic = `True`
- CustomMemory = `False`
- Generic = `Please Generate using` [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
- UpdateDataHub = `True`
- UpdateNVRAM = `True`
- UpdateSMBIOS = `True`
- UpdateSMBIOSMode = `Create`
- UseRawUuidEncoding = `False`


### USB

- 15 ports mapped using [USBToolbox](https://github.com/USBToolBox/tool "USBToolbox").

![USB](https://user-images.githubusercontent.com/72515939/201564661-e93efb8e-211c-4d85-9479-567ef8796c9b.png)

If you have an issue regarding sleep, and wake...you may try either Method `1` or `2`:

#### Method 1 : ACPI Wake Type

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

- **via config.plist**
	- PciRoot(0x0)/Pci(0x14,0x0)
	  - acpi-wake-type / data / `01`	  

- **via SSDT**

```asl
/**
 * Declare the XHCI Controller since this device don't have compatible ECs for macOS to handle proper wake calls.
 */
 
```asl
Scope (XHC)
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

Device (XHC1)
{
	Name (_ADR, 0x00140000)  // _ADR: Address
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
			"acpi-wake-type", 
			One
		})
	}
}
```


#### Method 2 : USBFixup.kext & SSDT-USBW

Credit to [osy](https://github.com/osy)

- Step 1: Download [USBWakeFixup.kext](https://github.com/osy/USBWakeFixup/releases/tag/v1.0)
- Step 2: Copy this script and paste to MaciAsl

```asl
/**
 * USB wakeup virtual device
 */
DefinitionBlock ("", "SSDT", 2, "OSY86 ", "USBW", 0x00001000)
{
	External (\_SB.PCI0.XHC._PRW, MethodObj)

	// We only enable the device for OSX
	If (CondRefOf (\_OSI, Local0) && _OSI ("Darwin"))
	{
		Device (\_SB.USBW)
		{
			Name (_HID, "PNP0D10")  // _HID: Hardware ID
			Name (_UID, "WAKE")  // _UID: Unique ID

			Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
			{
				Return (\_SB.PCI0.XHC._PRW ()) // Replace with path to your USB device
			}
		}
	}
}
```

- Step 3: Save this script to `.aml` with any name you want. ie: `SSDT-USBW.aml`. Before you save, make sure "Return `(\_SB.PCI0.XHC._PRW ())`" is according to your USB device (Check via DSDT).
- Step 4: Load `SSDT.USBW.aml` to `EFI` / `OC` / `ACPI` and load `USBWakeFixup.kext` to `EFI` / `OC` / `Kexts`
- Step 5: Edit your `config.plist` by adding both file and save your `.plist`
- Step 6: Reboot.

> **Note**: You may edit script above and combine with your single SSDT. Below is an example:

![USBW](https://user-images.githubusercontent.com/72515939/202895945-4e9a502d-bbaa-406a-b65c-844b006a85fa.png)

### NVRAM

NVRAM (non-volatile random-access memory) refers to 

- computer memory that can hold data even when power to the memory chips has been turned off.
- subset of the larger category of non-volatile memory (NVM), which includes storage-class memory based on NAND flash.
- Flash memory chips are slower to read to and write from than RAM chips, making them less well suited for active computational memory.
- cmputer manufacturers mainly use NVRAM to hold information about the state of the computer for faster boot times.
- allows information about the components and devices in the computer to be stored from one use to the next while the system power is turned off.
- standard computer memory uses dynamic random access memory (DRAM) which requires constant power to retain data.

![NVRAM](https://user-images.githubusercontent.com/72515939/201564673-4626b8e5-5268-4eeb-97a8-ecbf4540b52c.png)

> **Note**: This build patches bootarg via ACPI (more transparent)

### NVMe

```zsh
Device		 					: KINGSTON SA2000M8500G
```

- storage access and transport protocol for flash and next-generation solid-state drives (SSDs)
- delivers the highest throughput and fastest response times yet for all types of enterprise workloads.

#### Patch as AppleSSDController

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

- **via config.plist**
	- PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)
	  - device-id / data / `06A80000`
	  - device_type / string / `Non-Volatile memory controller`
	  - model / string / `KINGSTON SA2000M8500G`
	  - vendor-id / data / `4D140000`

- **via SSDT**

```asl
Scope (RP09)
{
	Scope (PXSX)
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

	Device (ANS0)
	{
		Name (_ADR, Zero)  // _ADR: Address
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
				"device_type", 
				"Non-Volatile memory controller", 
				"model", 
				"KINGSTON SA2000M 8500G", 
				"device-id", 
				Buffer ()
				{
					 0x06, 0xA8, 0x00, 0x00                           // ....
				}, 

				"vendor-id", 
				Buffer ()
				{
					 0x4D, 0x14, 0x00, 0x00                           // M...
				}
			})
		}
	}
}
```

![NVME](https://user-images.githubusercontent.com/72515939/201564683-1fc5dbd3-799f-4274-bb7d-9e1ab341c818.png)

### Test

- tested through its requirements on releases of macOS Catalina to Ventura. 
- no significant issues and all devices function as intended.

| **MacOS** | **Version** | **Pass** | **APFS MinDate** | **APFS MinVersion** |
|-----------|-------------|----------|------------------|---------------------|
| Catalina  |      10     |     ✓    |     20200306     |   1412101001000000  |
| BigSur    |      11     |     ✓    |         0        |          0          |
| Monterey  |      12     |     ✓    |         0        |          0          |
| Ventura   |      13     |     ✓    |         0        |          0          |

> **Note**: Warning: Not all Apple Secure Boot models are supported on all hardware configurations. Please refer [APFS Min Version & Min Date](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#apfs) / [SecureBootModel](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for more info.

### Validate Settings

#### Check Build Number:

- Input:

```zsh
sw_vers
```

- Output:

```zsh
ProductName:		macOS
ProductVersion:		13.0
BuildVersion:		22A380
```

#### Kernel Version:

- Input:

```zsh
uname -r
```

- Output:

```zsh
22.1.0
```

#### Board-id

- Input:

```zsh
ioreg -l | grep -i board-id
```

- Output:

```zsh
	|   "board-id" = <"Mac-CFF7D910A743CAAF">
```

#### Bus & Frequency:

- Input:

```zsh
sysctl -a | grep freq
```

- Output:

```zsh
net.link.fake.switch_mode_frequency: 10
hw.busfrequency: 400000000
hw.busfrequency_min: 400000000
hw.busfrequency_max: 400000000
hw.cpufrequency: 2900000000
hw.cpufrequency_min: 2900000000
hw.cpufrequency_max: 2900000000
hw.tbfrequency: 1000000000
machdep.tsc.frequency: 2903996007
```

#### CPU Vendor:

- Input:

```zsh
sysctl -a | grep machdep.cpu.vendor
```

- Output:

```zsh
machdep.cpu.vendor: GenuineIntel
```

#### CPU Brand String:

- Input:

```zsh
sysctl machdep.cpu.brand_string
```

- Output:

```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

#### CPU Features:

- Input:

```zsh
sysctl -a | grep machdep.cpu.features
```

- Output:

```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### Instruction Set:

- Input:

```zsh
sysctl -a | grep machdep.cpu.leaf7_features
```

- Output:

```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### CPU Full Features:

- Input:

```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```

- Output:

```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### CPU Details:

- Input:

```zsh
ioreg -rxn "PR00@0"
```

- Output:

```zsh
+-o PR00@0  <class IOACPIPlatformDevice, id 0x10000013f, registered, matched, a$
  | {
  |   "processor-lapic" = 0x0
  |   "clock-frequency" = <007ddaac>
  |   "processor-number" = 0x0
  |   "timebase-frequency" = <00ca9a3b>
  |   "processor-id" = 0x1
  |   "bus-frequency" = <0084d717>
  |   "cpu-type" = <0906>
  |   "device_type" = <70726f636573736f7200>
  |   "name" = <5052303000>
  |   "processor-index" = 0x0
  | }
  |
  +-o AppleACPICPU  <class AppleACPICPU, id 0x100000154, registered, matched, a$
  | +-o AppleACPICPUInterruptController  <class AppleACPICPUInterruptController$
  | +-o X86PlatformPlugin  <class X86PlatformPlugin, id 0x1000004b0, registered$
  |   +-o IOPlatformEnabler  <class IOPlatformPluginDevice, id 0x10000057f, reg$
  |   | +-o ApplePlatformEnabler  <class ApplePlatformEnabler, id 0x100000584, $
  |   +-o AGPMEnabler  <class IOPlatformPluginDevice, id 0x100000580, registere$
  |   | +-o AGPMController  <class AGPMController, id 0x100000583, !registered,$
  |   +-o X86PlatformShim  <class X86PlatformShim, id 0x100000582, !registered,$
  +-o SMCProcessor  <class SMCProcessor, id 0x100000155, !registered, !matched,$
```

#### SIP (System Integrity Protection):

- Input:

```zsh
csrutil status
```

- Output:

```zsh
System Integrity Protection status: enabled.
```

#### Wake Issue:

- Input:

```zsh
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```

- Example:

```zsh
2022-11-12 23:27:46 +0800 Sleep               	Entering Sleep state due to 'Idle Sleep':TCPKeepAlive=active Using AC (Charge:0%) 12 secs
2022-11-12 23:27:58 +0800 DarkWake            	DarkWake from Normal Sleep [CDNP] : due to GLAN XDCI/ Using AC (Charge:0%) 45 secs
2022-11-12 23:28:43 +0800 Sleep               	Entering Sleep state due to 'Maintenance Sleep':TCPKeepAlive=active Using AC (Charge:0%) 10 secs
2022-11-12 23:28:53 +0800 DarkWake            	DarkWake from Normal Sleep [CDNP] : due to GLAN XDCI/ Using AC (Charge:0%) 9 secs
2022-11-12 23:29:02 +0800 Wake                	DarkWake to FullWake from Normal Sleep [CDNVA] : due to UserActivity Assertion Using AC (Charge:0%)
```

> **Note**: Head to [GPRW/UPRW/LANC Instant Wake Patch](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html) for more info.

#### Fix Sleep Image using Hackintool:

* Open [Hackintool](https://github.com/headkaze/Hackintool)
* Hit FixSleepImage icon as picture below

![Red](https://user-images.githubusercontent.com/72515939/201133767-26576c18-59ce-4e85-a5c7-6a0c143eb70f.png)
![Green](https://user-images.githubusercontent.com/72515939/201133782-bc664c26-bc79-4640-b9fc-c993359aeeb0.png)

#### ACPI Error Lists:

- Input:

```zsh
log show --last boot | grep AppleACPIPlatform > ~/Desktop/Log_"$(date '+%Y-%m-%d_%H-%M-%S')".log
```

> **Note**: This will export ACPI log to desktop. Better logging and results is by using OpenCore-Debug

#### Verify SMBUS/SBUS:

- Input:

```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```

- Output:

```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
  150    0 0xffffff7f95eb5000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 27454DC4-17BA-3D0C-AD38-E7EDD2C69545 <17 7 6 3>
  161    1 0xffffff7f95ea9000 0x6ffd     0x6ffd     com.apple.driver.AppleSMBusController (1.0.18d1) 67C1DE20-8B96-3253-B373-5F234037AA59 <69 17 16 7 6 3>
```

#### Verify Plugin-Type=1:

- Input:

```zsh
sysctl machdep.xcpm.mode
```

- Output:

```zsh
machdep.xcpm.mode: 1
```

------------


### References

#### [AppleLife](https://applelife.ru/) and [Mac's Darwin Dumps](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)

### Soft Reminder

Please do not use [Olarila](https://www.olarila.com) since the EFI provided by him is bloated with junk and not specifically built for your hardware and device. DSDT is not a full solution, per my first [reminder](https://github.com/theofficialcopypaste/ASRockB460MSL-CLVR#asrock-b460m-steel-legend). You can do it on your own. Take your time, read well, and learn the curve. Simple methods will break your machine too early. So, I'm warning you. It doesn't matter what bootloader you choose. The best hack version is determined by your level of comprehension.

------------

### Acknowledgement

- [**Acidanthera**](https://github.com/acidanthera) for

```zsh
git clone https://github.com/acidanthera/OpenCorePkg.git
```

- [**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/) for

```zsh
git clone https://github.com/dortania/OpenCore-Install-Guide.git
```

- [**dhinakg**](https://github.com/dhinakg) for

```zsh
git clone https://github.com/USBToolBox/tool.git
```

- [**corpnewt**](https://github.com/corpnewt) for

```zsh
git clone https://github.com/corpnewt/DevicePath.git
```

```zsh
git clone https://github.com/corpnewt/SSDTTime.git
```

- [**dreamwhite**](https://github.com/dreamwhite) for

```zsh
git clone https://github.com/dreamwhite/OC-Anonymizer.git
```

- [**headkaze**](https://github.com/headkaze) for

```zsh
git clone https://github.com/headkaze/Hackintool.git
```

- [**5T33Z0**](https://github.com/5T33Z0) for

```zsh
git clone https://github.com/5T33Z0/OC-Little-Translated.git
```

- [**osy**](https://github.com/osy) for

```zsh
git clone https://github.com/osy/USBWakeFixup.git
```

<!---------------------------
CopyPaste on 15/11/2022.
---------------------------->
