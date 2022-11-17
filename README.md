# ASRock B460M Steel Legend

---

## Jump!

* [OpenCore EFI Structure](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#opencore-efi-structure)
* [Graphics](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#graphics)
* [Other Devices](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#other-devices)
* [Audio](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#audio)
* [Quirks](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#quirks)
* [USB](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#usb)
* [NVRAM](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#nvram)
* [NVMe](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#nvme)
* [Validate Settings](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#validate-settings)
* [Compability](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#compatible-with)
* [References](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#references)
* [Soft Reminder](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#soft-reminder)
* [Acknowledgement](https://github.com/theofficialcopypaste/ASRockB460MSL-OC#acknowledgement)

---

## Hackintosh: 10th Gen Comet Lake + ASRock B460M Steel Legend + OpenCore

<div align=justify>

OpenCore is what we refer to as a "boot loader" – it is a complex piece of software that we use to prepare our systems for macOS – specifically by injecting new data for macOS such as SMBIOS, ACPI tables and kexts. How this tool differs from others like Clover is that it has been designed with security and quality in mind, allowing us to use many security features found on real Macs, such as System <b>Integrity Protection</b> and <b>FileVault</b>.

</div>

* Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding
* Checkout Dortania Monthly [Post](https://dortania.github.io) to get more info

<div align=justify>
<p><strong>My word:</strong> - <strong>"It's merely cosmetic"</strong>, according to some. For me, this content is not just for show. <strong>Configuration?</strong>, You can play with <strong>config.plist</strong> and experiment with it. But heed the warning—if the file is not saved properly, it may get corrupted. This issue sometimes happen due to; <strong>restart before saving</strong> , &nbsp;<strong>erroneously input or  non-format input</strong>. I'm not interested to share my personal <strong>EFI</strong>, and not meant to be used by other people or systems. If you're still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>plist configuration</strong> and <strong>SSDTs</strong> according to your system. <strong>ACPI?</strong>, You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck. My advise is not to modify your <strong>DSDTs</strong>. <strong>DSDT's</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. This is not full feature guide. OpenCore sample is attached as a learning curve. Please be careful what you're read, copy and modified all these stuffs. Do a research first.</p>
</div>

> **Note**: Since this attachment is just an example, please change SMBIOS matched with your settings. Refer [Choose The Right SMBIOS](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html) and [Platform Info](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#platforminfo) by Dortania.

### OpenCore EFI Structure

<div align=center>

![OpenCore](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/OpenCore.drawio.png)

</div>
	
### Processor

#### Intel® Core™ i5-10400

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

<div align=center>

![Graphics](https://user-images.githubusercontent.com/72515939/201564512-85b70d59-cc94-4a34-8b2f-723546c9790a.png)

</div>

#### IGPU

```zsh
GPU Name 					: Intel® UHD Graphics 630
GPU Device ID 					: 0xC59B8086
Mobile 						: No
```

<div align=center>

![IGPU](https://user-images.githubusercontent.com/72515939/201564546-2c6f57ad-72fc-478e-921e-342a009074eb.png)

</div>

<div align=justify>

With a few exceptions, like headless <b>Intel® KBL Unknown</b> <code>0xC59B8086</code>, certain strange name artefacts are present. There is no performance impact from this artefact. As of right now, device-id spoofing has been successful in altering its name to <b>Intel® UHD Graphics 630</b>. Without a doubt, only through the headless <code>0x3E9B8086</code>. 

</div>

> **Note**: Real iMac 20,1 use **Intel® HD Graphics** as headless. While regular i5 10500 use **Intel® UHD Graphics**. Refer [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199277/intel-core-i510500-processor-12m-cache-up-to-4-50-ghz.html) for more info.

#### IGPU Patch

```zsh
GPU Name 					: Intel® UHD Graphics 630
GPU Device ID 					: 0x3E928086
Mobile 						: No
```

<div align=center>

![IGPU USED](https://user-images.githubusercontent.com/72515939/201564553-07f0cb0e-2bf8-4246-abfe-5ea3abd1c65f.png)

</div>

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

**via config.plist**

- PciRoot(0x0)/Pci(0x2,0x0)
  - AAPL,slot-name / string / `Slot- 0`
  - built-in / data / `00`
  - device-id / data / `9B3E0000`
  - enable-metal / data / `01000000`
  - igfxfw / data / `02000000`
  - igfxonln / data / `01000000`
  - iommu-selection / data / `00000000`
  - name / string / `IGPU`
  - AAPL,ig-platform-id / data / `0300923E`
  
**via SSDT**

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
			Return (Buffer (One)
			{
				 0x03                                             // .
			})
		}

		Return (Package (0x10)
		{
			"AAPL,ig-platform-id", 
			Buffer (0x04)
			{
				 0x03, 0x00, 0x92, 0x3E                           // ...>
			}, 

			"AAPL,slot-name", 
			Buffer (0x07)
			{
				 0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x30         // Slot- 0
			}, 

			"built-in", 
			Zero, 
			"device-id", 
			Buffer (0x04)
			{
				 0x9B, 0x3E, 0x00, 0x00                           // .>..
			}, 

			"enable-metal", 
			Buffer (0x04)
			{
				 0x01, 0x00, 0x00, 0x00                           // ....
			}, 

			"igfxfw", 
			Buffer (0x04)
			{
				 0x02, 0x00, 0x00, 0x00                           // ....
			}, 

			"igfxonln", 
			Buffer (0x04)
			{
				 0x01, 0x00, 0x00, 0x00                           // ....
			}, 

			"iommu-selection", 
			Buffer (0x04)
			{
				 0x00, 0x00, 0x00, 0x00                           // ....
			}
		})
	}
```  

> **Note**:  Additionally, the Comet Lake processor was first used in the iMac20,1 before being officially released. Checkout [Headless framebuffers](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add-2) / [Enabling Metal Support](https://github.com/5T33Z0/OC-Little-Translated/tree/main/11_Graphics/Metal_3#enabling-metal-3-support-and-gpu-tab-in-activity-monitor) / [Acidanthera Bugtracker Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)

#### GFX0

<div align=center>

![GFX0](https://user-images.githubusercontent.com/72515939/201564574-c15433d6-683e-4765-8161-8d82a6936269.png)

</div>
  
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

**via config.plist**

- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)
  - name / string / `PEGP`
- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
  - name / string / `BRG0`
- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
  - @0,AAPL,boot-display / data / `01000000`
  - @0,ATY,EFIDisplay / string / `DP1`
  - @0,compatible / string / `ATY,Python`
  - @0,display-type / string / `LCD`
  - @0,display_type / string / `display`
  - @0,name / string / `ATY,Python`
  - @1,compatible / string / `ATY,Python`
  - @1,display-type / string / `NONE`
  - @1,display_type / string / `display`
  - @1,name / string / `ATY,Python`
  - @2,compatible / string / `ATY,Python`
  - @2,display-type / string / `NONE`
  - @2,display_type / string / `display`
  - @2,name / string / `ATY,Python`
  - @3,compatible / string / `ATY,Python`
  - @3,display-type / string / `NONE`
  - @3,display_type / string / `display`
  - @3,name / string / `ATY,Python`
  - AAPL,slot-name / string / `Internal@0,1,0/0,0/0,0/0,0`
  - ATY,EFIBootMode / data / `00000100020000000000010001000000000000000000000000000000000000000000000000000000000100010000000000010000000300000050CFCD1C00000000000A0000400B0000A00000000000000000000000520000000000000000000000300000002000000001030000000A000000000000000100020000000000000000000000000000000000000000000A0000000000000100010000000000010000000300000050CFCD1C00000000000A0000400B0000A00000000000000000000000520000000000000000000000300000002000000001030000000A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100000000000100000003000000108FEC370000000000140000400B0000A0000000000000000000000052000000000000000000000030000000200000000103000000050000000000`
  - ATY,EFICompileDate / data / `4F63742031322032303139`
  - ATY,EFIDriverType / data / `02`
  - ATY,EFIEnabledMode / data / `04`
  - ATY,EFIVersion / data / `33312E302E31323032362E33`
  - ATY,EFIVersionB / string / `3131332D4D534954563338324D482E313631`
  - ATY,Rom# / string / `3131332D45585433373633352D303031`
  - ATY,copyright / string / `436F7079726967687420414D4420496E632E2020416C6C2052696768742052657365727665642E2020323030352D32303139`
  - Force_Load_FalconSMUFW / data / `01`
  - PP_WorkLoadPolicyMask / data / `32`
  - StartupDisplay / data / `474E02000000000000140000400B0000108FEC370000000000140000400B0000A00000000000000000000000520000000000000000000000300000002000000003000000050000000000000000000000000000020000000000000000100632AE0100000000000000000A0000400B000050CFCD1C00000000000A0000400B0000A000000000000000000000005200000000000000000000003000000020000000030000000A0000000000000000000000000A000000000000100632AE0200000000000000000A0000400B000050CFCD1C00000000000A0000400B0000A000000000000000000000005200000000000000000000003000000020000000030000000A0000000000000000000000`
  - hda-gfx / string / `onboard-1`
  
**via SSDT**
  
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
						Return (Buffer (One)
						{
							 0x03                                             // .
						})
					}

					Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
					{
						If (_OSI ("Darwin"))
						{
							Return (Package (0x02)
							{
								0x69, 
								0x04
							})
						}
						Else
						{
							Return (Package (0x02)
							{
								0x69, 
								0x03
							})
						}
					}

					Return (Package (0x42)
					{
						"@0,AAPL,boot-display", 
						Buffer (0x04)
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 

						"@0,ATY,EFIDisplay", 
						Buffer (0x03)
						{
							 0x44, 0x50, 0x31                                 // DP1
						}, 

						"@0,compatible", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@0,device_type", 
						Buffer (0x07)
						{
							 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
						}, 

						"@0,display-type", 
						Buffer (0x03)
						{
							 0x4C, 0x43, 0x44                                 // LCD
						}, 

						"@0,display_type", 
						Buffer (0x07)
						{
							 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
						}, 

						"@0,name", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@1,compatible", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@1,device_type", 
						Buffer (0x07)
						{
							 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
						}, 

						"@1,display-type", 
						Buffer (0x04)
						{
							 0x4E, 0x4F, 0x4E, 0x45                           // NONE
						}, 

						"@1,name", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@2,compatible", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@2,device_type", 
						Buffer (0x07)
						{
							 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
						}, 

						"@2,display-type", 
						Buffer (0x04)
						{
							 0x4E, 0x4F, 0x4E, 0x45                           // NONE
						}, 

						"@2,name", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@3,compatible", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"@3,device_type", 
						Buffer (0x07)
						{
							 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
						}, 

						"@3,display-type", 
						Buffer (0x04)
						{
							 0x4E, 0x4F, 0x4E, 0x45                           // NONE
						}, 

						"@3,name", 
						Buffer (0x0A)
						{
							/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
							/* 0008 */  0x6F, 0x6E                                       // on
						}, 

						"AAPL,slot-name", 
						Buffer (0x07)
						{
							 0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x31         // Slot- 1
						}, 

						"ATY,EFIBootMode", 
						Buffer (0x0203)
						{
							/* 0000 */  0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
							/* 0008 */  0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
							/* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0028 */  0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0030 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
							/* 0038 */  0x00, 0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00,  // .P......
							/* 0040 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00,  // .....@..
							/* 0048 */  0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00,  // .....R..
							/* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0060 */  0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00,  // .0... ..
							/* 0068 */  0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
							/* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
							/* 0078 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
							/* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,  // ........
							/* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
							/* 00A0 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x50, 0xCF, 0xCD,  // .....P..
							/* 00A8 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
							/* 00B0 */  0x00, 0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00,  // .@......
							/* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00C0 */  0x00, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // .R......
							/* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00,  // .....0..
							/* 00D0 */  0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x03, 0x00,  // . ......
							/* 00D8 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0118 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0128 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0138 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0140 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0150 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0160 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0168 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0180 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0190 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01B8 */  0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01C0 */  0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
							/* 01C8 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
							/* 01D0 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
							/* 01D8 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01E0 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
							/* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 01F0 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
							/* 01F8 */  0x01, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,  // ........
							/* 0200 */  0x00, 0x00, 0x00                                 // ...
						}, 

						"ATY,EFICompileDate", 
						Buffer (0x0B)
						{
							/* 0000 */  0x4F, 0x63, 0x74, 0x20, 0x31, 0x32, 0x20, 0x32,  // Oct 12 2
							/* 0008 */  0x30, 0x31, 0x39                                 // 019
						}, 

						"ATY,EFIDriverType", 
						Buffer (0x02)
						{
							 0x30, 0x32                                       // 02
						}, 

						"ATY,EFIEnabledMode", 
						Buffer (0x02)
						{
							 0x30, 0x34                                       // 04
						}, 

						"ATY,EFIVersion", 
						Buffer (0x0C)
						{
							/* 0000 */  0x33, 0x31, 0x2E, 0x30, 0x2E, 0x31, 0x32, 0x30,  // 31.0.120
							/* 0008 */  0x32, 0x36, 0x2E, 0x33                           // 26.3
						}, 

						"ATY,EFIVersionB", 
						Buffer (0x12)
						{
							/* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x4D, 0x53, 0x49, 0x54,  // 113-MSIT
							/* 0008 */  0x56, 0x33, 0x38, 0x32, 0x4D, 0x48, 0x2E, 0x31,  // V382MH.1
							/* 0010 */  0x36, 0x31                                       // 61
						}, 

						"ATY,Rom#", 
						Buffer (0x10)
						{
							/* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x45, 0x58, 0x54, 0x33,  // 113-EXT3
							/* 0008 */  0x37, 0x36, 0x33, 0x35, 0x2D, 0x30, 0x30, 0x31   // 7635-001
						}, 

						"ATY,copyright", 
						Buffer (0x32)
						{
							/* 0000 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  // Copyrigh
							/* 0008 */  0x74, 0x20, 0x41, 0x4D, 0x44, 0x20, 0x49, 0x6E,  // t AMD In
							/* 0010 */  0x63, 0x2E, 0x20, 0x20, 0x41, 0x6C, 0x6C, 0x20,  // c.  All 
							/* 0018 */  0x52, 0x69, 0x67, 0x68, 0x74, 0x20, 0x52, 0x65,  // Right Re
							/* 0020 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2E, 0x20,  // served. 
							/* 0028 */  0x20, 0x32, 0x30, 0x30, 0x35, 0x2D, 0x32, 0x30,  //  2005-20
							/* 0030 */  0x31, 0x39                                       // 19
						}, 

						"Force_Load_FalconSMUFW", 
						Buffer (One)
						{
							 0x01                                             // .
						}, 

						"PP_WorkLoadPolicyMask", 
						Buffer (One)
						{
							 0x32                                             // 2
						}, 

						"StartupDisplay", 
						Buffer (0x010C)
						{
							/* 0000 */  0x47, 0x4E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // GN......
							/* 0008 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
							/* 0010 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
							/* 0018 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
							/* 0020 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0028 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
							/* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0038 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
							/* 0040 */  0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
							/* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0050 */  0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0058 */  0x00, 0x00, 0x00, 0x00, 0x10, 0x06, 0x32, 0xAE,  // ......2.
							/* 0060 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0068 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
							/* 0070 */  0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00, 0x00,  // P.......
							/* 0078 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
							/* 0080 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0088 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
							/* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0098 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
							/* 00A0 */  0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,  // ........
							/* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00B0 */  0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00B8 */  0x10, 0x06, 0x32, 0xAE, 0x02, 0x00, 0x00, 0x00,  // ..2.....
							/* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
							/* 00C8 */  0x40, 0x0B, 0x00, 0x00, 0x50, 0xCF, 0xCD, 0x1C,  // @...P...
							/* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
							/* 00D8 */  0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00,  // @.......
							/* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 00E8 */  0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // R.......
							/* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00,  // ....0...
							/* 00F8 */  0x20, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  //  .......
							/* 0100 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
							/* 0108 */  0x00, 0x00, 0x00, 0x00                           // ....
						}, 

						"hdagfx", 
						Buffer (0x09)
						{
							/* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
							/* 0008 */  0x31                                             // 1
						}, 

						"agdpmod", 
						"pikera"
					})
				}
			}
		}
	}
}
```

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### Other Devices

<div align=center> 

![PCI](https://user-images.githubusercontent.com/72515939/201564595-f4a4e48f-f68f-499b-8c7a-cc7f2a1c9a76.png)

</div>

#### DeviceProperties

**via config.plist**

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
		
**via SSDT**

Refer [SSDT-EXT.dsl](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/blob/main/SSDT-EXT/SSDT-EXT.dsl) for more info

#### Patch

<div align=center>

![Other Patches](https://user-images.githubusercontent.com/72515939/201564609-f85ed4ae-5584-48e8-aa00-2eaf39f8fd3b.png)

</div>

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

HD audio, or high-definition audio, enables streaming music to sound more like an original studio recording. While the specifications for HD audio can vary, the term is generally used to refer to digital music formats that offer at least CD-quality mastering.

#### HDEF

```zsh
Device		 					: ALCS1200A
```

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

**via config.plist**

- layout-id = `01000000`
- name = `HDEF`
- No-hda-gfx = `0000000000000000`
- No-idle-support = `00`

**via SSDT**

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
			Return (Buffer (One)
			{
				 0x03                                             // .
			})
		}

		Return (Package (0x06)
		{
			"No-hda-gfx", 
			Buffer (0x08)
			{
				 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
			}, 

			"layout-id", 
			Buffer (0x04)
			{
				 0x01, 0x00, 0x00, 0x00                           // ....
			}, 

			"No-idle-support", 
			Buffer (One)
			{
				 0x00                                             // .
			}
		})
	}
}
```

<div align=center>

![Audio](https://user-images.githubusercontent.com/72515939/201564627-0f6f3016-6251-4cfb-9132-360a9a6489e9.png)

</div>

#### HDAU

```zsh
Device		 					: Navi 10 HDMI Audio (RX 5500 XT)
```

Regularly, this device is attached via `GFX0`. Patching can be done in two ways, via **config.plist** or via **SSDT**. 

**via config.plist**

- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
  - hda-gfx / string / `onboard-1`
  - model / string / `Navi 10 HDMI Audio`
  - name / string / `HDAU`
  
**via SSDT**

```asl
Device (HDAU)
{
	Name (_ADR, One)  // _ADR: Address
	Name (_SUN, One)  // _SUN: Slot User Number
	Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
	{
		If ((Arg2 == Zero))
		{
			Return (Buffer (One)
			{
				 0x03                                             // .
			})
		}

		Return (Package (0x06)
		{
			"driver-version", 
			Buffer (0x09)
			{
				/* 0000 */  0x31, 0x30, 0x2E, 0x30, 0x2E, 0x31, 0x2E, 0x32,  // 10.0.1.2
				/* 0008 */  0x34                                             // 4
			}, 

			"hdagfx", 
			Buffer (0x09)
			{
				/* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
				/* 0008 */  0x31                                             // 1
			}, 

			"model", 
			Buffer (0x12)
			{
				/* 0000 */  0x4E, 0x61, 0x76, 0x69, 0x20, 0x31, 0x30, 0x20,  // Navi 10 
				/* 0008 */  0x48, 0x44, 0x4D, 0x49, 0x20, 0x41, 0x75, 0x64,  // HDMI Aud
				/* 0010 */  0x69, 0x6F                                       // io
			}
		})
	}
}
```

<div align=center> 

![AppleGFXHDA](https://user-images.githubusercontent.com/72515939/201564637-635e432f-f3d4-4954-8da3-191568d284a7.png)  

</div>

### Quirks

OpenCore Quirks are a variety of abilities that can be used to influence and alter kernel behaviour or certain types of data. It is employed to take advantage of a BIOS that occasionally differs from the kernel or operating system. Here are the Quirks necessary to meet the macOS requirements.

#### ACPI / Quirks

- All False

#### Booter / Quirks

- AvoidRuntimeDefrag = `True`
- DevirtualiseMmio = `True`
- EnableSafeModeSlide = `True`
- ProtectUefiServices = `True`
- ProvideCustomSlide = `True`
- RebuildAppleMemoryMap = `True`
- ResizeAppleGpuBars = `-1`
- SyncRuntimePermissions = `True`

> **Note**: Other than above is `false`

#### Kernel / Quirks

- CustomSMBIOSGuid = `True` (Require PlatformInfo / Generic / UpdateSMBIOSMode = `Custom`)
- DisableLinkeditJettison = `True`
- PanicNoKextDump = `True`
- PowerTimeoutKernelPanic = `True`
- SetApfsTrimTimeout = `0`

> **Note**: Other than above is `false`

#### UEFI / Quirks

- EnableVectorAcceleration = `True`
- RequestBootVarRouting = `True`
- ResizeGpuBars = `-1`
- TscSyncTimeout = `0`
- SetApfsTrimTimeout = `0`

> **Note**: Other than above is `false`

### USB

<div align=justify>

With other operating systems, the number of USB ports on macOS varies. It is distinctive and has a port of its own based on Apple's product preferences. The "15 port restriction" refers to the limit of 15 ports per device for Apple goods in particular. It differs from other operating systems where there are generally more than 15 ports. It is called as USB Port Mapping, and it involves choosing ports for devices, typically 15 specific ports using <a href="https://github.com/USBToolBox/tool">USBToolbox</a>

</div><br>

<div align=center>

![USB](https://user-images.githubusercontent.com/72515939/201564661-e93efb8e-211c-4d85-9479-567ef8796c9b.png)

</div>

### NVRAM

<div align=justify>

NVRAM (non-volatile random-access memory) refers to computer memory that can hold data even when power to the memory chips has been turned off. NVRAM is a subset of the larger category of non-volatile memory (NVM), which includes storage-class memory based on NAND flash. Flash memory chips are slower to read to and write from than RAM chips, making them less well suited for active computational memory. Computer manufacturers mainly use NVRAM to hold information about the state of the computer for faster boot times. This allows information about the components and devices in the computer to be stored from one use to the next while the system power is turned off. Standard computer memory uses dynamic random access memory (DRAM) which requires constant power to retain data. Additional bootargs can be found here:

* [Lilu](https://github.com/theofficialcopypaste/Lilu/edit/master/README.md)
* [Whatevergreen](https://github.com/acidanthera/WhateverGreen)

</div>

<div align=center>

![NVRAM](https://user-images.githubusercontent.com/72515939/201564673-4626b8e5-5268-4eeb-97a8-ecbf4540b52c.png)

</div>

> **Note**: This build patches bootarg via ACPI.

### NVMe

```zsh
Device		 					: KINGSTON SA2000M8500G
```

NVMe (nonvolatile memory express) is a new storage access and transport protocol for flash and next-generation solid-state drives (SSDs) that delivers the highest throughput and fastest response times yet for all types of enterprise workloads. 

#### Patch as AppleSSDController

Patching can be done in two ways, via **config.plist** or via **SSDT**. 

**via config.plist**

- PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)
  - device_type / string / `Non-Volatile memory controller`
  - model / string / `KINGSTON SA2000M8500G`
  - device-id / data / `06A80000`
  - vendor-id / data / `4D140000`
  
**via SSDT**

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
				Return (Buffer (One)
				{
					 0x03                                             // .
				})
			}

			Return (Package (0x08)
			{
				"device_type", 
				Buffer (0x1E)
				{
					/* 0000 */  0x4E, 0x6F, 0x6E, 0x2D, 0x56, 0x6F, 0x6C, 0x61,  // Non-Vola
					/* 0008 */  0x74, 0x69, 0x6C, 0x65, 0x20, 0x6D, 0x65, 0x6D,  // tile mem
					/* 0010 */  0x6F, 0x72, 0x79, 0x20, 0x63, 0x6F, 0x6E, 0x74,  // ory cont
					/* 0018 */  0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72               // roller
				}, 

				"model", 
				Buffer (0x15)
				{
					/* 0000 */  0x4B, 0x49, 0x4E, 0x47, 0x53, 0x54, 0x4F, 0x4E,  // KINGSTON
					/* 0008 */  0x20, 0x53, 0x41, 0x32, 0x30, 0x30, 0x30, 0x4D,  //  SA2000M
					/* 0010 */  0x38, 0x35, 0x30, 0x30, 0x47                     // 8500G
				}, 

				"device-id", 
				Buffer (0x04)
				{
					 0x06, 0xA8, 0x00, 0x00                           // ....
				}, 

				"vendor-id", 
				Buffer (0x04)
				{
					 0x4D, 0x14, 0x00, 0x00                           // M...
				}
			})
		}
	}
}
```

<div align=center>
  
![NVME](https://user-images.githubusercontent.com/72515939/201564683-1fc5dbd3-799f-4274-bb7d-9e1ab341c818.png)

</div>

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

#### Check Kernel Version:

- Input:

```zsh
uname -r
```

- Output:

```zsh
22.1.0
```

#### Check Bus & Frequency:

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

#### Check CPU Vendor:

- Input:

```zsh
sysctl -a | grep machdep.cpu.vendor
```

- Output:

```zsh
machdep.cpu.vendor: GenuineIntel
```

#### Check CPU Brand String:

- Input:

```zsh
sysctl machdep.cpu.brand_string
```

- Output:

```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

#### Check CPU Features:

- Input:

```zsh
sysctl -a | grep machdep.cpu.features
```

- Output:

```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### Check Instruction Set:

- Input:

```zsh
sysctl -a | grep machdep.cpu.leaf7_features
```

- Output:

```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### Check CPU Full Features:

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

#### Check CPU Details:

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

#### Check SIP (System Integrity Protection):

- Input:

```zsh
csrutil status
```

- Output:

```zsh
System Integrity Protection status: enabled.
```

#### Find Wake Issue:

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

<div align=center>

![2022-11-10_23-13-48](https://user-images.githubusercontent.com/72515939/201133767-26576c18-59ce-4e85-a5c7-6a0c143eb70f.png)
![2022-11-10_23-14-19](https://user-images.githubusercontent.com/72515939/201133782-bc664c26-bc79-4640-b9fc-c993359aeeb0.png)

</div>

#### Lists any ACPI Error:

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

### Compatible with

```zsh
Catalina  =  Passed (UEFI > APFS: MinDate=20200306 and MinVersion=1412101001000000, SecureBootModel: j185)
BigSur    =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Monterey  =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Ventura   =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
```

> **Note**: Warning: Not all Apple Secure Boot models are supported on all hardware configurations. Please refer [APFS Min Version & Min Date](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#apfs) / [SecureBootModel](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for more info.

### References

#### [AppleLife](https://applelife.ru/) and [Mac's Darwin Dumps](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)

### Soft Reminder

Please do not use [Olarila](https://www.olarila.com) since the EFI provided by him is bloated with junk and not specifically built for your hardware and device. DSDT is not a full solution, per my first [reminder](https://github.com/theofficialcopypaste/ASRockB460MSL-CLVR#asrock-b460m-steel-legend). You can do it on your own. Take your time, read well, and learn the curve. Simple methods will break your machine too early. So, I'm warning you. It doesn't matter what bootloader you choose. The best hack version is determined by your level of comprehension.

---

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
