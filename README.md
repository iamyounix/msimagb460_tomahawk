# MSI MAG B460 Tomahawk Hackintosh

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents:

- [Introduction](#introduction)
- [About this build](#about-this-build)
- [Config.plist](#configplist)
  - [ACPI](#acpi)
  - [Booter](#booter)
  - [DeviceProperties](#deviceproperties)
  - [Kext](#kext)
  - [Quirks](#quirks)
  - [Misc](#misc)
  - [PlatformInfo](#platforminfo)
  - [UEFI](#uefi)
  - [BIOS Requirement](#bios-requirement)
- [Changelog](#changelog)
- [Credits](#credits)

## Introduction

**Author:** This is the EFI from a previous version of my Hackintosh desktop. The construction isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references you should read:

- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
- [Dortania's Announcement](https://dortania.github.io/) - Official
- [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - Non Official

> **Note**: This build has been tested on Linux, MacOS, and Windows.

## About this build

- **Out of the box**
  - ASM3241 USB 3.2 Host Controller.
  - 400 Series Chipset Family SATA AHCI Controller.
  - BCM4360 802.11ac Wireless Network Adapter.
  - Kingston A2000 NVMe SSD1.
  - Kingston A2000 NVMe SSD2.
  - Navi 10 HDMI Audio.
  - VL805/806 xHCI USB 3.0 Controller.

- **Non-Native**
  - Comet Lake PCH-V Converged Audio Voice Speech.
  - Comet Lake PCH-V SMBus Host Controller.
  - Comet Lake PCH-V USB Controller.
  - Comet Lake-S 6c Host Bridge/DRAM Controller.
  - Ethernet Connection (11) I219-V.
  - Intel UHD Graphics 630 Headless.
  - Navi 14 Radeon RX 5500 XT.
  - RTL8125 2.5GbE Controller.

> **Tips**: Identifying hardware and devices is easier with Linux.
>
> - Open Linux Terminal: Use `lspci`. The `lspci` command is a utility for displaying information about PCI buses in the system and devices connected to them.

## Config.plist

All we is needed is .plist editor. below is the best free tools to start with:

- [Propertree](https://github.com/corpnewt/ProperTree) is a cross platform application to modify `.plist` file format. Requirement needed:
  - Windows, [Python](https://www.python.org/downloads/) to be installed.
  - Mac's, [Homebrew](https://brew.sh/) and install [python-tk@3.10](https://formulae.brew.sh/formula/python-tk@3.10#default) especially on BigSur, Monterey and Ventura. Please `brew install python-tk@3.10` using terminal.
  - Linux, none. Most disto is built in with it.

### ACPI

- For this build, i have made several upgrades by merging all existing SSDTs and modifying properties that are not documented by Dortania's. Refer [SSDT-BNXB460](custom_ssdt/SSDT-YNXB460.dsl) samples. Here is my references - [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) for more info. Here's an example of regular vs optimized.

  **Regular**

  This code defines a device with the name `XXXX` and specifies its address as `0`. The `_STA` method returns different values based on the operating system running on the device. If the OS is Darwin (which is the core of macOS), then the device is turned on by returning a value of `0x0F`. Otherwise, if the OS is not Darwin, then the device is turned off by returning a value of `Zero`. The Scope statement is used to specify that this definition `only applies to this particular device`, and `not to any other devices` in the system.
  
  ```asl
  Scope (_SB.PCI0) // Here and above, still can affect other OSes, except the device declared as "Scope", not "Device".
  {
      Device (XXXX) // Whether macOS/Darwin Kernel is loaded or not, the device is always enable. 
      {
          Name (_ADR, Zero)  // _ADR: Address
          Method (_STA, 0, NotSerialized) // Here and above still can affect other OS.
          {
              If (_OSI ("Darwin")) // On and Off variable.
              {
                  Return (0x0F) // On
              }
              Else <-- Other OS than Darwin?
              {
                  Return (Zero) // Off
              }
          }
      }
  }
  ```

  **Optimized**

  The overall effect of this code is to define a new device named `XXX` which will be enabled only on systems running the Darwin operating system. The device is considered a child of the PCI bus and its status can be checked using the `_STA` method. The code is also written in such `a way as to limit the scope of the new device to only the current PCI bus`, and `not affect other devices or buses` in the system.

  ```asl
  Scope (\_SB) // Here and above, still can affect other OSes, except the device declared as "Scope", not "Device".
  {
      If (_OSI ("Darwin")) // "On" and "OFF" variable only affect if Darwin Kernel is loaded. 
      {                        Other OS will always declared as "Off" without "Return (Zero)".
          Scope (PCI0) // Since the device declared as "Scope", other OS not affect.
          {
              Device (XXXX) // The device only enable if macOS/Darwin Kernel loaded.
              {
                  Name (_ADR, Zero)
                  Method (_STA, 0, NotSerialized)
                  {
                      Return (0x0F) // On
                  }
              }
          }
      }
  }
  ```

### Booter

- Quirks

- AvoidRuntimeDefrag - boolean - `Yes`
  - DevirtualiseMmio - boolean - `Yes`
  - EnableSafeModeSlide - boolean - `Yes`
  - ProvideCustomSlide - boolean - `Yes`
  - SyncRuntimePermissions - boolean - `Yes`
  - ProvideMaxSlide - number - `0`
  - ResizeAppleGpuBars - number - `-1` (When enabling `Above4G`, `Resizable BAR Support` may become available on some Z490 and newer motherboards. Please ensure that `Booter` - `Quirks` - `ResizeAppleGpuBars` is set to `0` if this is enabled)
  > **Note**: Other than above is `No`

### DeviceProperties

- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)

  - `@0,display-dual-link` - string - `01000000`
  - `@0,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
  - `@1,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
  - `@2,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
  - `@3,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
  - `AAPL,slot-name` - string - `Slot- 1`
  - `AAPL00,override-no-connect` - data - `Your dumped EDID from Linux` - Optional.
  - `AAPL01,override-no-connect` - data - `Your dumped EDID from Linux` - Optional.
  - `ATY,bin_image` - string - `Your dumped GPU bin image (if any)`
  - `ATY,EFIVersion` - string - `31.0.120.26.3`
  - `device_type` - string - `ATY,PythonParent` / `ATY,BoaParent` / `ATY,KeelbackParent`

  > **Note**: Choosing Framebuffer:
  >
  > - `ATY,Python`: Desktop
  > - `ATY,Keelback`: Mobile
  > - `ATY,Boa`: Unknown

- PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)

  - `AAPL,slot-name` - string - `Slot- 1`

- PciRoot(0x0)/Pci(0x14,0x0)

  - `AAPL,slot-name` - string - `Onboard`
  - `acpi-wake-type` - data - `01`
  - `model` - string - `Comet Lake PCH-V USB Controller`

- PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)

  - `AAPL,slot-name` - string - `Onboard`
  - `acpi-wake-type` - data - `01`
  - `model` - string `ASM3241 USB 3.2 USB Controller`

- PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)

  - `AAPL,slot-name` - string - `Slot- 2`
  - `acpi-wake-type` - data - `01`
  - `model` - string - `VL805/806 USB 3.0 Controller`

- PciRoot(0x0)/Pci(0x1C,0x6)/Pci(0x0,0x0)

  - `AAPL,slot-name` - string - `Slot- 3`
  - `model` - string - `BCM4360 802.11ac Wireless Network Adapter`

- PciRoot(0x0)/Pci(0x1F,0x3)

  - `AAPL,slot-name` - string - `Onboard`
  - `layout-id` - data - `01000000`
  - `model` - string - `Comet Lake PCH-V Converged Audio Voice Speech`

- PciRoot(0x0)/Pci(0x2,0x0)

  - `AAPL,slot-name` - string - `Onboard`
  - `agdpmod` - data - `70696B65726100`
  - `enable-metal` - data - `01000000`
  - `igfxfw` - data - `02000000`
  - `igfxonln` - data - `01000000`

### Kext

- [AppleALC](Kexts/AppleALC.kext)
- [IntelMausi](Kexts/IntelMausi.kext)
- [Lilu](Kexts/Lilu.kext)
- [LucyRTL8125Ethernet](Kexts/LucyRTL8125Ethernet.kext)
- [SMCProcessor](Kexts/SMCProcessor.kext)<
- [SMCSuperIO](Kexts/SMCSuperIO.kext)
- [USBMap](Kexts/USBMap.kext)
- [VirtualSMC](Kexts/VirtualSMC.kext)
- [WhateverGreen](Kexts/WhateverGreen.kext)

### Quirks

- AppleXcpmCfgLock - boolean - `NO`
- DisableIoMapper - boolean - `Yes`
- PanicNoKextDump - boolean - `Yes`
- PowerTimeoutKernelPanic - boolean - `Yes`
- SetApfsTrimTimeout - number - `0`

> **Note**: Others than shall remain as `No`

### Misc

- ConsoleAttributes - boolean - `Yes`
- HibernateMode - boolean - `Yes`
- HideAuxiliary - string - `Auto`
- LauncherOption - string - `Full`
- LauncherPath - string - `Default`
- PickerAttributes - number - `147`
- PickerMode - string - `External`
- PickerVariant - string - `Acidanthera\GoldenGate`
- ShowPicker - boolean - `Yes`
- TakeoffDelay - number - `0`
- Timeout - number - `5`

> **Note**: Other than above is `No`

### PlatformInfo

- SMBIOS: [iMac20,1](https://everymac.com/ultimate-mac-lookup/?search_keywords=iMac20,1). Please generate SMBIOS using [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).

> **Note**: Enable `Kernel` `Quirks` - `CustomSMBIOSGuid` = `Yes` and `PlatformInfo` - `Generic` - `UpdateSMBIOSMode` = `Custom` to prevent ACPI break on other OSes. This is likely needed when dual or multibooting and using standard SSDT provided by - [Dortania's](https://dortania.github.io/OpenCore-Install-Guide/) and [SSDTTime](https://github.com/corpnewt/SSDTTime). Both quirks can break in the future and so we only recommend this option in the event of certain software breaking in other OSes. For best stability, disabling this is the best choice. Do note, this build using custom SSDT. So, disabling both quirks will not break other OSes.

### UEFI

- APFS

  - EnableJumpstart - boolean - `Yes`
  - HideVerbose - boolean - `Yes`
  - MinDate - number - `0` (use -1 for Catalina)
  - MinVolume - number - `0` (use -1 for Catalina)

- Drivers

  - Path - boolean - `HFSPlus.efi`
  - Path - boolean - `OpenRuntime.efi`
  - Path - boolean - `HFSPlus.efi`
  - Path - boolean - `ResetNvramEntry.efi`

  > **Note**: `boolean` all driver as `Yes`

- Input

  - KeyForgetThreshold - number - `5`
  - LeySupport - boolean - `Yes`
  - KeySupportMode - boolean - `Auto`
  - PointerSupportMode - string - `ASUS`
  - TimerResolution - number - `50000`

  > **Note**: Other than above is `No`

- Output

  - GopPassThrough - string - `Disable`
  - ProvideConsoleGop - boolean - `Yes`
  - Resolution - string - `max`
  - TextRenderer - string - `BuiltinGraphics`
  - UIScale - number - `-1`

  > **Note**: Other than above is `No`

- ProtocolOverrides

  - FirmwareVolume - boolean - `Yes`

  > **Note**: Other than above is `No`

- Quirks

  - EnableVectorAcceleration - boolean - `Yes`
  - ExitBootServicesDelay - number - `0`
  - RequestBootVarRouting - boolean - `Yes`
  - ResizeGpuBars - number - `-1`
  - TscSyncTimeout - number - `0`

  > **Note**: Other than above is `No`

### BIOS Requirement

- **Disable**

  - Fast Boot
  - Secure Boot
  - VT-d or VT-x or both
  - CSM
  - Intel SGX
  - Intel Platform Trust/TPM
  - CFG Lock

- **Enable**

  - Above 4G Decoding
  - Quirks (ResizeAppleGpuBars is set to `0` if this is enabled)
  - Hyper-Threading
  - EHCI/XHCI Hand-off
  - OS type: Windows 8.1/10 UEFI Mode (some motherboards may require "Other OS" instead)
  - DVMT Pre-Allocated(iGPU Memory): 64MB
  - AHCI Mode

## Changelog

- March 11, 2023 6:19 AM [OC](https://github.com/acidanthera/OpenCorePkg) ver: [0.9.0](https://github.com/acidanthera/OpenCorePkg/releases)

  - Clean and optimised ACPI code

## Credits

[Acidanthera](https://github.com/acidanthera/) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [dreamwhite](https://github.com/dortania) | [khronokernel](https://github.com/khronokernel) | [tomeko.net](http://tomeko.net/index.php?lang=en)
