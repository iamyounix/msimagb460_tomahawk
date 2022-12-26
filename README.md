# Hackintosh: ASRock B460M Steel Legend

[![BIOS](https://img.shields.io/badge/BIOS-1.60B-red)](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/#BIOS)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Version](https://img.shields.io/badge/Version-0.8.7-white)](https://github.com/acidanthera/OpenCorePkg/releases)
[![MOnterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)

## TOC

- [Introduction](#introduction)
- [Devices Specification](#devices-specification)
- [Structure](#structure)
- [ACPI](#acpi)
- [DeviceProperties](#deviceproperties)
- [Kexts](#kexts)
- [Trim](#trim)
- [Credits](#credits)

### Introduction

This is an Hackintosh EFI template that I built according to my generic computer specifications. Before start, please...

- Refer official [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for better understanding.
- Checkout Dortania Monthly [Post](https://dortania.github.io) to get latest news from developer directly.

### Devices Specification

- ASRock [B460M](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/) Steel legend
  - [x] Intel® [Core™ i5-10400](https://www.intel.com/content/www/us/en/products/sku/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz/specifications.html)
  - [x] Intel® [UHD 630](https://ark.intel.com/content/www/us/en/ark/products/graphics/126790/intel-uhd-graphics-630.html)
  - [x] MSI [RX 5500 XT MECH OC](https://www.msi.com/Graphics-Card/Radeon-RX-5500-XT-MECH-4G/Overview) 4GB
  - [x] 32GB RAM
  - [x] 02 x [Kingston A2000](https://www.kingston.com/en/company/press/article/56606) 500GB, 02 x [San Disk Ultra 3D SSD](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ultra-3d-sata-iii-ssd#SDSSDH3-250G-G25) 500GB

### Structure

![Structure](https://user-images.githubusercontent.com/72515939/209513272-5d82f072-63a5-492b-9e29-c072176d1585.png)

#### ACPI

- SSDT-EXT contain:
  - An extension of Advanced Configuration and Power Interface
    - AWAC (system clock fix on Z390, B460, Z490 motherboards)
    - Fake EC (Fake Embedded Controller)
    - MCHC (Known as DRAM - Dynamic Random Access Memory, in most 10th Gen Motherboard in order to Aids in proper memory reporting and can aid in getting better kernel panic details if memory related)
    - PXSX (PCI GPU Bridge)
    - SBUS (System Bus PCI Controller fix)
    - TSUB (Thermal Subsystem, cosmetics)
    - USBX (USB Power Management)

#### DeviceProperties

- **03:00.0 VGA compatible controller**: Advanced Micro Devices, Inc. [AMD/ATI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5)
  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
    - 0@,name | 1@,name | 2@,name | 3@,name | AAPL,slot-name | ATY,EFIVersion | ATY,EFIVersionB | ATY,Rom# | ATY,copyright
- **03:00.1 Audio device**: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI Audio
  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
    - AAPL,slot-name | model
- **00:14.0 USB controller**: Intel Corporation Comet Lake PCH-V USB Controller
  - PciRoot(0x0)/Pci(0x14,0x0)
    - acpi-wake-type
- **04:00.0 Network controller**: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter (rev 03)
  - PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)
    - AAPL,slot-name | model
- **07:00.0 USB controller**: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller (rev 01)
  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)
    - AAPL,slot-name | acpi-wake-type | model
- **00:1f.3 Audio device**: Intel Corporation Comet Lake PCH-V cAVS
  - PciRoot(0x0)/Pci(0x1F,0x3)
    - layout-id
- **00:02.0 Display controller**: Intel Corporation CometLake-S GT2 [UHD Graphics 630] (rev 05)
  - PciRoot(0x0)/Pci(0x2,0x0)
    - AAPL,ig-platform-id | AAPL,slot-name | agdpmod | device-id | enable-metal | igfxfw | igfxonln

#### Kexts

1. Lilu
2. VirtualSMC
3. AppleALC
4. Whatevergreen
5. SMCProcessor
6. SMCSuperIO
7. LucyRTL8125Ethernet
8. USBMap

### Credits

#### [Acidanthera](https://github.com/acidanthera) | [benbaker76](https://github.com/benbaker76) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [ic005k](https://github.com/ic005k) | [osy86](https://github.com/osy86) | [rusty-bits](https://github.com/rusty-bits) | [USBToolbox](https://github.com/USBToolBox) | [5T33Z0](https://github.com/5T33Z0)
