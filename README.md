# MSI MAG B460 Tomahawk Hackintosh

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents

- [Introduction](#introduction)
  - [Devices](#devices)
  - [Structure](#structure)
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

> **Note**: This EFI has been tested on Linux, MacOS, and Windows. Due to 'If(_OSI("Darwin"))' is injected before 'PCI0,' importantpatched devices only works on macOS. Other than that, Windows and Linux will not be affected. No BSOD on Windows!. This is what we want. Check example below:

**Example:**

*Remark: OSI = Operating System Interface*

- Standard
```asl
Scope (_SB.PCI0) <-- Here and above, still can affect other OSes, except the device declared as "Scope", not "Device".
{
    Device (XXXX) <-- Whether macOS/Darwin Kernel is loaded or not, the device is always enable. 
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_STA, 0, NotSerialized)  // _STA: Status <-- Here and above still can affect other OS.
        {
            If (_OSI ("Darwin")) <-- On and OFF variable will not affect until the end of the script.
            {
                Return (0x0F) <-- On
            }
            Else <-- Other OS than Darwin?
            {
                Return (Zero) <-- Off
            }
        }
    }
}
```

- Optimised

```asl
Scope (\_SB) <-- Here and above, still can affect other OSes, except the device declared as "Scope", not "Device".
{
    If (_OSI ("Darwin")) <-- "On" and "OFF" variable only affect if Darwin Kernel is loaded. 
    {                         Other OS will always declared as "Off" without "Return (Zero)".
        Scope (PCI0) <-- Safe, only loaded if Darwin Kernel loaded. Since the device declared as "Scope", other OS not affect.
        {
            Device (XXXX) <-- The device only enable if macOS/Darwin Kernel loaded.
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F) <-- On
                }
            }
        }
    }
}
```

### Devices

- **Out of the box**
  - ASM3241 USB 3.2 Host Controller. <sup>Works without Port Mapping; 1 x Bus, 1 x Hosts, 2 x Ports.</sup>
  - 400 Series Chipset Family SATA AHCI Controller.
  - BCM4360 802.11ac Wireless Network Adapter. <sup>Fenvi-T919</sup>
  - Kingston A2000 NVMe SSD1.
  - Kingston A2000 NVMe SSD2.
  - Navi 10 HDMI Audio. <sup>plist patch is available, but not required</sup>
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

### Structure

![1](https://user-images.githubusercontent.com/72515939/228694404-e105ce6f-128b-4a35-98c9-81a9f8ac8914.png)
![2](https://user-images.githubusercontent.com/72515939/228694410-a08afbb7-0c65-404f-975a-0934245548cb.png)
![3](https://user-images.githubusercontent.com/72515939/228694417-edb9a4d6-45f5-4fec-86fb-40e96075b574.png)
![4](https://user-images.githubusercontent.com/72515939/228694420-b30a1d7e-b1d6-4ec7-ac4b-a7e90a27714d.png)
![5](https://user-images.githubusercontent.com/72515939/228694425-87a38234-1c78-46a4-bfc2-74d53112cae9.png)
![tree](https://user-images.githubusercontent.com/72515939/228694864-fc549194-8096-41c1-8702-3bf9d04b7155.png)

### Plist Configuration

- **ACPI**

  - [SSDT-ALL](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Guide%20%26%20Samples/ACPI%20Samples/SSDT-ALL.dsl). Refer [ACPI Spec 6.4](https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html) for more info. Not sure? Click [here](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add).
  
  - We can set `CustomSMBIOSGuid` = `True` and `UpdateSMBIOSMode` = `Custom` quirks to prevent acpi injection to another OS (Multiboot/Dualboot).

  ![oc_no_acpi](https://user-images.githubusercontent.com/72515939/228397367-2f8b1c0e-9807-4e46-9107-7c182e17ee01.png)
  
  - `CustomSMBIOSGuid` = `True`

  ![cstm_smbios_guid](https://user-images.githubusercontent.com/72515939/228692165-15a7eab6-0943-4bf1-9a52-99003cfca432.png)
  
  - `UpdateSMBIOSMode` = `Custom`

  ![upd_smbiosmode](https://user-images.githubusercontent.com/72515939/228692166-7d16b3db-3485-4dc1-a888-2604658740aa.png)

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
    - `@0,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
    - `@1,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
    - `@2,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
    - `@3,name` - string - `ATY,Python` / `ATY,Boa` / `ATY,Keelback`
    - `AAPL,slot-name` - string - `J6B2` <sup>or <code>Slot- 1</code></sup>
    - `AAPL00,override-no-connect` - data - `Your dumped EDID from Linux`<sup>Optional. Refer [EDID Fix](Guide%20&%20Samples/EDID%20Fix/EDID%20Fix.md)</sup>
    - `AAPL01,override-no-connect` - data - `Your dumped EDID from Linux`<sup>Optional. Refer [EDID Fix](Guide%20&%20Samples/EDID%20Fix/EDID%20Fix.md)</sup>
    - `ATY,bin_image` - string - `Your dumped GPU bin image (if any)`<sup>Optional and not needed on Big Sur and above</sup>
    - `ATY,EFIVersion` - string - `31.0.120.26.3`
    - `device_type` - string - `ATY,PythonParent` / `ATY,BoaParent` / `ATY,KeelbackParent`

    ![gpu](https://user-images.githubusercontent.com/72515939/227340743-faf333ac-161b-488e-af7f-aa0b74febcd4.png)

    > **Note**: `@x,name` - string - `ATY,Keeelback` + `device_type` - string - `ATY,KeelbackParent` + [SMBUS with I2C properties injected](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Guide%20%26%20Samples/ACPI%20Samples/SSDT-ALL.dsl) + [PNLF with proper UID, properties and type injected](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Guide%20%26%20Samples/ACPI%20Samples/SSDT-ALL.dsl) may enable `display0`/`AppleBacklightDisplay`. See picture below:
    
    ![keelback](https://user-images.githubusercontent.com/72515939/228712281-353e3251-c129-4cf5-a3b2-c989c76fdfd3.png)

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
    ![usb_hackintool](https://user-images.githubusercontent.com/72515939/228692952-0b2fedcd-de86-4a74-8a07-e96b8be233a3.png)

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

    ![uhd630](https://user-images.githubusercontent.com/72515939/227342411-7d82aab1-cf28-4503-85cb-c6e5317c4403.png)

  - Example:

    ![dev_props](https://user-images.githubusercontent.com/72515939/228690668-19ce1c9a-de29-4c24-b79a-e4c7bff22a17.png)

    > **Note**: Check device properties in plist layout [here](https://github.com/iamyounix/msimag_b460tmhwk/blob/main/Device%20Properties/dev_props.plist)

- **Kext**

  - Add

    - [AppleALC](Kexts/AppleALC.kext)<sup>ALCS1200A audio</sup>
    - [IntelMausi](Kexts/IntelMausi.kext)<sup>Ethernet0</sup>
    - [Lilu](Kexts/Lilu.kext)<sup>Arbitrary kext and process patching on macOS</sup>
    - [LucyRTL8125Ethernet](Kexts/LucyRTL8125Ethernet.kext)<sup>Ethernet1</sup>
    - [SMCProcessor](Kexts/SMCProcessor.kext)<sup>VirtualSMC plugins</sup>
    - [SMCSuperIO](Kexts/SMCSuperIO.kext)<sup>VirtualSMC plugins</sup>
    - [USBMap](Kexts/USBMap.kext)<sup>Choosen 15 USB Port</sup>
    - [VirtualSMC](Kexts/VirtualSMC.kext)<sup>Lilu plugins</sup>
    - [WhateverGreen](Kexts/WhateverGreen.kext)<sup>Lilu plugins</sup>

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

  - Clean and optimised ACPI code

  ![scrsht](https://user-images.githubusercontent.com/72515939/228696528-14d9dc55-dfc1-470d-a46d-4a1516470720.png)
  ![arch](https://user-images.githubusercontent.com/72515939/228697345-3e11763f-9556-434f-b401-0af9a11a3bb4.png)
  ![windows](https://user-images.githubusercontent.com/72515939/228697904-247b77f1-5c1b-4eaf-bb34-3f075f2635fb.png)
  
  - Still working on brightness fix iMac20,1 using ACPI and plist patch.

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
