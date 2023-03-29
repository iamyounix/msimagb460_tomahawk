# MSI MAG B460 Tomahawk Hackintosh

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents

- [Introduction](#introduction)
  - [Devices](#devices)
  - [Plist Configuration](#plist-configuration)
  - [Unmount Unsupported Partition Format](#unmount-unsupported-partition-format)
  - [BIOS Settings](#bios-settings)
  - [Changelog](#changelog)
- [Guide and Samples](#guide-and-samples)
- [Credits](#credits)

## Introduction

This is my current EFI clone that I built according to my hardware. Feel free to read my content. If you have a similar build but different settings, you might consider checking this out. Before read, below is the best way to checkout the latest OpenCore guide and news.

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) Getting Started. <sup>Get Started</sup>
- Checkout latest [post](https://dortania.github.io), news and update directly from the developer. <sup>Announcement</sup>

> **Note**: This EFI has been tested on Linux, MacOS, and Windows. Due to 'If(_OSI("Darwin"))' is injected after 'PCI0,' the patch only works on macOS. Other than that, Windows and Linux will not be affected.

### Devices

- **Out of the box**
  - ASM3241 USB 3.2 Host Controller. <sup>Works without Port Mapping; 1 x Bus, 1 x Hosts, 2 x Ports.</sup>
  - 400 Series Chipset Family SATA AHCI Controller.
  - BCM4360 802.11ac Wireless Network Adapter. <sup>Fenvi-T919</sup>
  - Kingston A2000 NVMe SSD1.
  - Kingston A2000 NVMe SSD2.
  - Navi 10 HDMI Audio. <sup>plist patch is available, but not required</sup
  - VL805/806 xHCI USB 3.0 Controller. <sup>Works without Port Mapping; 1 x Bus, 2 x Hosts, 4 x Ports.</sup>

- **Non-Native**
  - Comet Lake PCH-V Converged Audio Voice Speech. <sup>require plist patch</sup>
  - Comet Lake PCH-V SMBus Host Controller. <sup>require acpi patch</sup>
  - Comet Lake PCH-V USB Controller. <sup>require additional kext; 1 x Bus, 2 x Hosts, 4 x Ports. With Port Mapping</sup>
  - Comet Lake-S 6c Host Bridge/DRAM Controller. <sup>require acpi patch</sup>
  - Ethernet Connection (11) I219-V. <sup>require additional kext</sup>
  - Intel UHD Graphics 630 Headless. <sup>require plist patch</sup>
  - Navi 14 Radeon RX 5500 XT. <sup>require plist patch</sup>
  - RTL8125 2.5GbE Controller. <sup>require additional kext</sup>

### Plist Configuration

- **ACPI**

  - [SSDT-ALL](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Guide%20%26%20Samples/ACPI%20Samples/SSDT-ALL.dsl). Refer [ACPI Spec 6.4](https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html) for more info. Not sure? Click [here](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add).
  
  - Why this SSDT is different? `If (_OSI ("Darwin"))` is placed after `\_SB` and before `PCI0`. What it does, all acpi patches will load if Darwin kernel is executed, and other OSes; Windows and Linux will not affect. In simple mean, just like [btwise - OC No ACPI](https://gitee.com/btwise/OpenCore_NO_ACPI) and [OpenCore NDK](
<https://github.com/n-d-k>). Then enable `CustomSMBIOSGuid` = `False` and `UpdateSMBIOSMode` = `Custom`.

  ![OC No ACPI](https://user-images.githubusercontent.com/72515939/228397367-2f8b1c0e-9807-4e46-9107-7c182e17ee01.png)

- **Booter**

  - Quirks

    - AvoidRuntimeDefrag - boolean - `Yes`
    - DevirtualiseMmio - boolean - `Yes`
    - EnableSafeModeSlide - boolean - `Yes`
    - ProvideCustomSlide - boolean - `Yes`
    - SyncRuntimePermissions - boolean - `Yes`
    - ProvideMaxSlide - number - `0`
    - ResizeAppleGpuBars - number - `-1` <sup>When enabling `Above4G`, `Resizable BAR Support` may become an available on some Z490 and newer motherboards. Please ensure that `Booter` - `Quirks` - `ResizeAppleGpuBars` is set to `0` if this is enabled.</sup>
    > **Note**: Other than above is `No`

- **DeviceProperties**

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)

    - `@0,display-dual-link` - string - `01000000`
    - `@0,name` - string - `ATY,Python`
    - `@1,name` - string - `ATY,Python`
    - `@2,name` - string - `ATY,Python`
    - `@3,name` - string - `ATY,Python`
    - `AAPL,slot-name` - string - `J6B2` <sup>or <code>Slot- 1</code></sup>
    - `AAPL00,override-no-connect` - data - `Your dumped EDID from Linux`<sup>Optional. Refer [EDID Fix](Guide%20&%20Samples/EDID%20Fix/EDID%20Fix.md)</sup>
    - `AAPL01,override-no-connect` - data - `Your dumped EDID from Linux`<sup>Optional. Refer [EDID Fix](Guide%20&%20Samples/EDID%20Fix/EDID%20Fix.md)</sup>
    - `ATY,bin_image` - string - `Your dumped GPU bin image (if any)`<sup>Optional and not needed on Big Sur and above</sup>
    - `ATY,EFIVersion` - string - `31.0.120.26.3`
    - `device_type` - string - `ATY,PythonParent`

    ![gpu](https://user-images.githubusercontent.com/72515939/227340743-faf333ac-161b-488e-af7f-aa0b74febcd4.png)

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)

    - `AAPL,slot-name` - string - `J6B2` <sup>or <code>Slot- 1</code></sup>
    - `model` - string - `Navi 10 HDMI Audio`

    ![dpaudio](https://user-images.githubusercontent.com/72515939/227341081-9173d0f7-fde1-4315-ba33-3b17843c2e3e.png)

  - PciRoot(0x0)/Pci(0x14,0x0)

    - `AAPL,slot-name` - string - `Onboard`
    - `acpi-wake-type` - data - `01`
    - `model` - string - `Comet Lake PCH-V USB Controller

  - PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)

    - `AAPL,slot-name` - string - `Onboard`
    - `acpi-wake-type` - data - `01`
    - `model` - string `ASM3241 USB 3.2 USB Controller`

  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)

    - `AAPL,slot-name` - string - `J6D1` <sup>or <code>Slot- 2</code></sup>
    - `acpi-wake-type` - data - `01`
    - `model` - string - `VL805/806 USB 3.0 Controller`

    ![usb](https://user-images.githubusercontent.com/72515939/227341492-f32d3491-8496-4c8d-88d5-9fc87a9e65cc.png)

  - PciRoot(0x0)/Pci(0x1C,0x6)/Pci(0x0,0x0)

    - `AAPL,slot-name` - string - `J8B4` <sup>or <code>Slot- 3</code></sup>
    - `model` - string - `BCM4360 802.11ac Wireless Network Adapter`

    ![wifi](https://user-images.githubusercontent.com/72515939/227341968-bfaa23fd-0038-4835-b4a2-a706becf9168.png)

  - PciRoot(0x0)/Pci(0x1F,0x3)

    - `AAPL,slot-name` - string - `Onboard`
    - `layout-id` - data - `01000000`
    - `model` - string - `Comet Lake PCH-V Converged Audio Voice Speech`

    ![built-in_audio](https://user-images.githubusercontent.com/72515939/227342197-c6985fc2-06d8-4d4a-ac48-2dbfcae17068.png)

  - PciRoot(0x0)/Pci(0x2,0x0)

    - `AAPL,slot-name` - string - `Onboard`
    - `agdpmod` - data - `70696B65726100`
    - `enable-metal` - data - `01000000`
    - `igfxfw` - data - `02000000`
    - `igfxonln` - data - `01000000`
    > **Note**: Check device properties in plist layout [here](Device%20Properties/deviceproperties.plist)

    ![uhd630](https://user-images.githubusercontent.com/72515939/227342411-7d82aab1-cf28-4503-85cb-c6e5317c4403.png)
    
  - Example:

    ![example](https://user-images.githubusercontent.com/72515939/228468406-fad254cc-4ff6-4b30-94ed-5991e370cf6e.png)

- **Kext**

  - Add

    - [AppleALC](Kexts/AppleALC.kext)
    - [IntelMausi](Kexts/IntelMausi.kext)
    - [Lilu](Kexts/Lilu.kext)
    - [LucyRTL8125Ethernet](Kexts/LucyRTL8125Ethernet.kext)
    - [SMCProcessor](Kexts/SMCProcessor.kext)
    - [SMCSuperIO](Kexts/SMCSuperIO.kext)
    - [USBMap](Kexts/USBMap.kext)<sup>require USBMap or USBToolbox</sup>
    - [VirtualSMC](Kexts/VirtualSMC.kext)
    - [WhateverGreen](Kexts/WhateverGreen.kext)

- Quirks

  - AppleXcpmCfgLock - boolean - `NO` <sup>Not needed if CFG-Lock is disabled in the BIOS</sup>
  - DisableIoMapper - boolean - `Yes`<sup>Not needed if VT-D is disabled in the BIOS</sup>
  - PanicNoKextDump - boolean - `Yes`
  - PowerTimeoutKernelPanic - boolean - `Yes`
  - SetApfsTrimTimeout - number - `0`
  > **Note**: Others than shall remain as `No`

- **Misc**

  - ConsoleAttributes - boolean - `Yes`
  - HibernateMode - boolean - `Yes`
  - HideAuxiliary - string - `Auto`<sup>Press space to show macOS recovery and other auxiliary entries</sup>
  - LauncherOption - string - `Full`
  - LauncherPath - string - `Default`
  - PickerAttributes - number - `147`
  - PickerMode - string - `External`
  - PickerVariant - string - `Acidanthera\GoldenGate` <sup>or Custom Theme</sup>
  - ShowPicker - boolean - `Yes`
  - TakeoffDelay - number - `0`
  - Timeout - number - `5`
  > **Note**: Other than above is `No`

- **PlatformInfo**

  - SMBIOS: [iMac20,1](https://everymac.com/ultimate-mac-lookup/?search_keywords=iMac20,1)
    > **Note**: Refer real iMac20,1 Apple. Inc [BIOS Vendor](BIOS/BIOSVendor:%20%22Apple%20Inc.%22.yml)

- **UEFI**

  - APFS

    - EnableJumpstart - boolean - `Yes`
    - HideVerbose - boolean - `Yes`
    - MinDate - number - `0` <sup>use <code>-1</code>for Catalina</sup>
    - MinVolume - number - `0` <sup>use <code>-1</code>for Catalina</sup>

  - Drivers

    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `OpenRuntime.efi`
    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `ResetNvramEntry.efi`
    > **Note**: Enable - `boolean` all driver as `Yes`

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

### Unmount Unsupported Partition Format

- If needed, we can unmount unneeded partition format such as NTFS/others.

  - Run `sudo vifs` and enter your password.  Use `i` as input and `ESC` to exit any input. Hit `Shift + ZZ` to exit. Below is an example:

  ```zsh
  #
  # Warning - this file should only be modified with vifs(8)
  #
  # Failure to do so is unsupported and may be destructive.
  #
  UUID=A8EAAAFA-98EB-40DB-8457-40255E27E9D4 none ntfs rw,noauto // Windows NTFS
  UUID=4717D07E-B328-4084-85CF-F87C5D0015E7 none ntfs rw,noauto // Storage NTFS
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  ~                                                                               
  "/etc/fstab" 7L, 279B
  ```
  
### BIOS Settings

- **Disable**

  - Fast Boot
  - Secure Boot
  - VT-d (can be enabled if you set DisableIoMapper = `YES`)
  - CSM
  - Intel SGX (enable if multiboot on Linux)
  - Intel Platform Trust/TPM (enable if multiboot with Windows)
  - CFG Lock

- **Enable**

  - VT-x Tech (DisableIOMapper = `Yes`)
  - VT-d Tech (DisableIOMapper = `Yes`)
  - Above 4G Decoding
  - Quirks (ResizeAppleGpuBars is set to `0` if this is enabled)
  - Hyper-Threading
  - EHCI/XHCI Hand-off
  - OS type: Windows 8.1/10 UEFI Mode (some motherboards may require "Other OS" instead)
  - DVMT Pre-Allocated(iGPU Memory): 64MB
  - AHCI Mode

### Changelog

- March 11, 2023 6:19 AM [OC](https://github.com/acidanthera/OpenCorePkg) ver: [0.9.0](https://github.com/acidanthera/OpenCorePkg/releases) <sup>Latest</sup>

  - Add fake FWHD (only run on macOS)
  - Clean ACPI code

![scrsht](https://user-images.githubusercontent.com/72515939/227203289-8f1d963e-83c9-42ff-8d7f-5cd2bb079b5d.png)
  
## Guide and Samples

- Guide

  - [ACPI Samples](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Guide%20%26%20Samples/ACPI%20Samples/SSDT-ALL.dsl) <sup>An Idea</sup>
  - [Ambient Light Sensors](Guide%20&%20Samples/Ambient%20Light%20Sensors/Ambient%20Light%20Sensors.md) <sup>Optional</sup>
  - [EDID Fix](Guide%20&%20Samples/EDID%20Fix/EDID%20Fix.md) <sup>Optional</sup>
  - [Fix SBUS and MCHC](Guide%20&%20Samples/Fix%20SBUS%20and%20MCHC/Fix%20SBUS%20and%20MCHC.md) <sup>Required</sup>
  - [Fix USB Wake](Guide%20&%20Samples/USB%20Devices%20Related%20Fix/Fix%20USB%20Wake.md) <sup>Required</sup>
  - [Migrate EFI Properties](Guide%20&%20Samples/Migrate%20EFI%20Properties/Migrate%20EFI%20Properties.md) <sup>Optional</sup>
  - [Rename and Add Missing Devices](Guide%20&%20Samples/Rename%20&%20Add%20Missing%20Devices/Rename%20&%20Add%20Missing%20Devices.md) <sup>Optional</sup>
  - [Unsupported USB Advance](Guide%20&%20Samples/USB%20Devices%20Related%20Fix/Unsupported%20USB%20Advance.md) <sup>Optional</sup>

## Credits

[Acidanthera](https://github.com/acidanthera/) \| [corpnewt](https://github.com/corpnewt) \| [Dortania](https://github.com/dortania) \| [dreamwhite](https://github.com/dortania) \| [khronokernel](https://github.com/khronokernel) | [tomeko.net](http://tomeko.net/index.php?lang=en)
