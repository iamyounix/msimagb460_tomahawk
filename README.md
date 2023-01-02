# Hackintosh: MSI MAG B460M Tomahawk

[![BIOS](https://img.shields.io/badge/BIOS-1.60B-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

### Introduction

This is an Hackintosh EFI template that I built according to my generic computer specifications. Before start, please...

- Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding.
- Checkout Dortania Monthly [Post](https://dortania.github.io) to get latest news from developer directly.

### Devices Specification

- MSI MAG [B460M Tomahawk](https://www.msi.com/Motherboard/MAG-B460-TOMAHAWK)
  - [x] Intel® [Core™ i5-10400](https://www.intel.com/content/www/us/en/products/sku/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz/specifications.html)
  - [x] Intel® [UHD 630](https://ark.intel.com/content/www/us/en/ark/products/graphics/126790/intel-uhd-graphics-630.html)
  - [x] MSI [RX 5500 XT MECH OC](https://www.msi.com/Graphics-Card/Radeon-RX-5500-XT-MECH-4G/Overview) 4GB
  - [x] 32GB RAM
  - [x] 02 x [Kingston A2000](https://www.kingston.com/en/company/press/article/56606) 500GB, 02 x [San Disk Ultra 3D SSD](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ultra-3d-sata-iii-ssd#SDSSDH3-250G-G25) 500GB

### Structure

```zsh
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   └── SSDT-EXT.aml
    ├── config.plist
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   ├── OpenRuntime.efi
    │   └── ResetNvramEntry.efi
    ├── Kexts
    │   ├── AppleALC.kext
    │   ├── IntelMausi.kext
    │   ├── Lilu.kext
    │   ├── LucyRTL8125Ethernet.kext
    │   ├── SMCProcessor.kext
    │   ├── SMCSuperIO.kext
    │   ├── USBMap.kext
    │   ├── VirtualSMC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources
    │   ├── Audio
    │   ├── Font
    │   ├── Image
    │   │   └── Acidanthera
    │   │       ├── Chardonnay
    │   │       ├── GoldenGate
    │   │       └── Syrah
    │   └── Label
    └── Tools
```

#### ACPI

[SSDT-EXT](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/tree/main/SSDT-EXT) contain:

| Input | Details |
|---|---|
| AWAC | ACPI based System clock fix on Z390, B460, Z490 motherboards |
| EC | ACPI based fake Embedded Controller as an alternative EC controller, also prevents actual AppleACPIEC from being loaded on macOS. |
| MCHC | Known as DRAM (Dynamic Random Access Memory), in most 10th Gen Motherboard in order to Aids in proper memory reporting and can aid in getting better kernel panic details if memory related (Cosmetics) |
| PXSX | PCI Bridge |
| PGMM | Processor Gaussian Mixture Model (Cosmetics) |
| TSUB | ACPI based Thermal Subsystem (Cosmetics) |
| USBX | USB Power Management (Required for USBMap.kext) |

#### Booter

Quirks

| Input | Option |
|---|---|
| AvoidRuntimeDefrag | Yes |
| DevirtualiseMmio | Yes |
| EnableSafeModeSlide | Yes |
| ProvideCustomSlide | Yes |
| SyncRuntimePermissions | Yes |
| ProvideMaxSlide | 0 |
| ResizeAppleGpuBars | -1 |

> **Note**: Other than above is `No`

#### DeviceProperties

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>DeviceProperties</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
			<dict>
				<key>@0,name</key>
				<string>ATY,Python</string>
				<key>@1,name</key>
				<string>ATY,Python</string>
				<key>@2,name</key>
				<string>ATY,Python</string>
				<key>@3,name</key>
				<string>ATY,Python</string>
				<key>AAPL,slot-name</key>
				<string>Slot- 1</string>
				<key>ATY,EFIVersion</key>
				<string>31.0.120.26.3</string>
				<key>ATY,EFIVersionB</key>
				<string>113-MSITV382MH.161</string>
				<key>ATY,Rom#</key>
				<string>113-EXT7635-001</string>
				<key>ATY,copyright</key>
				<string>Copyright AMD Inc. All Rights Reserved. 2005-2019</string>
			</dict>
			<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Slot- 1</string>
				<key>model</key>
				<string>Navi 10 HDMI Audio</string>
			</dict>
			<key>PciRoot(0x0)/Pci(0x14,0x0)</key>
			<dict>
				<key>acpi-wake-type</key>
				<data>
				AQ==
				</data>
			</dict>
			<key>PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)</key>
			<dict>
				<key>acpi-wake-type</key>
				<data>
				AQ==
				</data>
			</dict>
			<key>PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Slot- 3</string>
				<key>acpi-wake-type</key>
				<data>
				AQ==
				</data>
				<key>model</key>
				<string>VL805/806 xHCI USB 3.0 Controller</string>
			</dict>
			<key>PciRoot(0x0)/Pci(0x1C,0x6)/Pci(0x0,0x0)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Slot- 2</string>
				<key>model</key>
				<string>BCM4360 802.11ac Wireless Network Adapter</string>
			</dict>
			<key>PciRoot(0x0)/Pci(0x1F,0x3)</key>
			<dict>
				<key>layout-id</key>
				<data>
				AQAAAA==
				</data>
			</dict>
			<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
			<dict>
				<key>AAPL,ig-platform-id</key>
				<data>
				AwCSPg==
				</data>
				<key>AAPL,slot-name</key>
				<string>Slot- 0</string>
				<key>agdpmod</key>
				<data>
				cGlrZXJhAA==
				</data>
				<key>device-id</key>
				<data>
				mz4AAA==
				</data>
				<key>enable-metal</key>
				<data>
				AQAAAA==
				</data>
				<key>igfxfw</key>
				<data>
				AgAAAA==
				</data>
				<key>igfxonln</key>
				<string>01000000</string>
			</dict>
		</dict>
		<key>Delete</key>
		<dict/>
	</dict>
```
#### Kernel

Kexts

| Kext | Details |
|---|---|
| AppleALC | An open source kernel extension enabling native macOS HD audio for not officially supported codecs without any filesystem modifications. AppleALCU can be used for systems with digital-only audio. |
| IntelMausi | Intel onboard LAN driver for macOS |
| Lilu | An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS. |
| LucyRTL8125Ethernet | A macOS driver for Realtek RTL8125 2.5GBit Ethernet Controllers |
| USBMap | USB Port configuration. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |
| VirtualSMC | Advanced Apple SMC emulator in the kernel. Requires [Lilu](https://github.com/acidanthera/Lilu) for full functioning. Include with SMCProcessor & SMCSuperIO. |
| Whatevergreen | [Lilu](https://github.com/acidanthera/Lilu) plugin providing patches to select GPUs on macOS. Requires Lilu 1.5.6 or newer. |

Patch

| Input | Type | Details |
|---|---|---|
| Arch | String | x86_64 |
| Base | String |  |
| Comment | String | Enable TRIM for SSD \| Catalina + |
| Count | Number | 0 |
| Enabled | Boolean | Yes |
| Find | Data | 00415050 4C452053 534400 |
| Identifier | String | com.apple.iokit.IOAHCIBlockStorage |
| Limit | Number | 0 |
| Mask | Data |  |
| MaxKernel | String |  |
| MinKernel | String |  |
| Replace | Data | 00000000 00000000 000000 |
| ReplaceMask | Data |  |
| Skip | Data |  |

Quirks

| Input | Option |
|---|---|
| AppleXcpmCfgLock | Boolean | Yes |
| DisableIoMapper | Boolean | Yes |
| PanicNoKextDump | Boolean | Yes |
| PowerTimeoutKernelPanic | Boolean | Yes |
| SetApfsTrimTimeout | Number | 0 |

> **Note**: Other than above is `No`

#### Misc

| Input | Type | Details |
|---|---|---|
| ConsoleAttributes | Boolean | Yes |
| HibernateMode | Boolean | Yes |
| HideAuxiliary | String | Auto |
| LauncherOption | String | Full |
| LauncherPath | String | Default |
| PickerAttributes | Number | 147 |
| PickerMode | String | External |
| PickerVariant | String | Acidanthera\GoldenGate |
| ShowPicker | Boolean | Yes |
| TakeoffDelay | Number | 0 |
| Timeout | Number | 5 |

> **Note**: Other than above is `No`

#### PlatformInfo

SMBIOS: iMac20,1

#### UEFI

APFS

| Input | Type | Details |
|---|---|---|
| EnableJumpstart | Boolean | Yes |
| HideVerbose | Boolean | Yes |
| MinDate | Number | 0 |
| MinVolume | Number | 0 |

Drivers

- HFSPlus

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | HFSPlus.efi |

- OpenRuntime

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | OpenRuntime.efi |

- OpenCanopy

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | HFSPlus.efi |

- ResetNvramEntry

| Input | Type | Details |
|---|---|---|
| Enable | Boolean | Yes |
| Path | Boolean | ResetNvramEntry.efi |

- Input

| Input | Type | Details |
|---|---|---|
| KeyForgetThreshold | Number | 5 |
| LeySupport | Boolean | Yes |
| KeySupportMode | Boolean | Auto |
| PointerSupportMode | String | ASUS |
| TimerResolution | Number | 50000 |

> **Note**: Other than above is `No`

- Output

| Input | Type | Details |
|---|---|---|
| GopPassThrough | String | Disable |
| ProvideConsoleGop | Boolean | Yes |
| Resolution | String | max |
| TextRenderer| String | BuiltinGraphics |
| UIScale | Number | - |

> **Note**: Other than above is `No`

- ProtocolOverrides

| Input | Type | Details |
|---|---|---|
| FirmwareVolume | Boolean | Yes |

> **Note**: Other than above is `No`

Quirks

| Input | Type | Details |
|---|---|---|
| EnableVectorAcceleration | Boolean | Yes |
| ExitBootServicesDelay | Number | 0 |
| RequestBootVarRouting | Boolean | Yes |
| ResizeGpuBars | Number | -1 |
| TscSyncTimeout| Number | 0 |

> **Note**: Other than above is `No`

### Credits

#### [Acidanthera](https://github.com/acidanthera) | [benbaker76](https://github.com/benbaker76) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [ic005k](https://github.com/ic005k) | [osy86](https://github.com/osy86) | [rusty-bits](https://github.com/rusty-bits) | [USBToolbox](https://github.com/USBToolBox) | [5T33Z0](https://github.com/5T33Z0)
