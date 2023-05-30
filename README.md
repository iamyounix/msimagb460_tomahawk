# MSI MAG B460 TOMAHAWK

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![macOS](https://img.shields.io/badge/Compatible-Catalina/Monterey/Ventura-orange)](https://www.apple.com/ge/macos/monterey/)
[![Version](https://img.shields.io/badge/Version-0.9.0-white)](https://github.com/acidanthera/OpenCorePkg/releases)

> **Note:**  This project use pre-generated iMac20,1 SMBIOS. Please generate your own using [ACAuxiliary](https://github.com/ic005k/OCAuxiliaryTools) or [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). [Debug](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.debug.dmg) version can greatly help with debugging boot issues, however can add some noticeable delay to boot times (ie. 3-5 seconds to get to the picker). Once installed you can easily transition to [release](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/Big.Sur.+.dmg). Release version provide snappier boot times (no useful DEBUG info provided).

**Introduction**

-   This project isn't ideal, but it does the job. Never blame me if there is an issue or malfunction.   Although this project carries some risk. Please read Dortania's official documents and my explanations for about this build, then shouldn't have any issues. Please do so at your own risk. Below are the best references to explore:

    -   [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/) - Official
    -   [Dortania's Announcement](https://dortania.github.io/) - Official
    -   [OC Little Translate](https://github.com/5T33Z0/OC-Little-Translated) - 3rd Party References

**Hardware and Devices**

-   **Native**

    -   400 Series Chipset Family SATA AHCI Controller
    -   ASM3241 USB 3.2 Host Controller
    -   BCM4360 802.11ac Wireless Network Adapter
    -   Comet Lake PCH-V SMBus Host Controller
    -   Comet Lake-S 6c Host Bridge/DRAM Controller
    -   Intel UHD Graphics 630 (Headless) + `agdpmod` / `data` / `70696b65726100` based on [Piker R. Alpha](https://github.com/Piker-Alpha) agdpmod [patch](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/)
    -   Kingston A2000 NVMe SSD1
    -   Kingston A2000 NVMe SSD2
    -   Navi 10 HDMI Audio]
    -   Navi 14 Radeon RX 5500 XT

-   **Not Native**
    -   [Comet Lake PCH-V Converged Audio Voice Speech (ALCS1200A)]
    -   [Comet Lake PCH-V USB Controller]
    -   [Ethernet Connection (11) I219-V]
    -   [RTL8125 2.5GbE Controller]

**Base Files**

-   Using 64-bit Firmwares, all base is taken from [OpenCorePkg's releases](https://github.com/acidanthera/OpenCorePkg/releases/), x64 folders.

    ```zsh
    📁 EFI
    ├── 📁 BOOT
    │  └── 📃 BOOTx64.efi                  // OC Base File
    └── 📁 OC
        ├── 📁 ACPI
        │  └── 📃 SSDT-YNXB460.aml         // An additional patches using Secondary System Description Tables
        ├── 📁 Drivers
        │  ├── 📃 HfsPlus.efi              // Compulsory (OC Base File)
        │  ├── 📃 OpenCanopy.efi           // Additional (release)
        │  ├── 📃 OpenRuntime.efi          // Compulsory (OC Base File)
        │  ├── 📃 ResetNvramEntry.efi      // Additional (debug) 
        │  └── 📃 ToggleSipEntry.efi       // Additional (debug)
        ├── 📁 Kexts
        │  ├── 📃 AppleALC.kext            // Requires Lilu (OC Base File)
        │  ├── 📃 IntelMausi.kext          // Requires Lilu
        │  ├── 📃 Lilu.kext                // Conpulsory (OC Base File)
        │  ├── 📃 LucyRTL8125Ethernet.kext // Requires Lilu
        │  ├── 📃 RadeonSensor.kext        // Requires VirtualSMC
        │  ├── 📃 RestrictEvents.kext      // Requires Lilu (Lilu Kernel extension)
        │  ├── 📃 SMCProcessor.kext        // Requires VirtualSMC (OC Base File)
        │  ├── 📃 SMCRadeonGPU.kext        // Requires RadeonSensor
        │  ├── 📃 SMCSuperIO.kext          // Requires VirtualSMC
        │  ├── 📃 USBMap.kext              // Compulsory (can be build using USBToolbox/Windows and USBMap/MacOS)
        │  ├── 📃 VirtualSMC.kext          // Requires Lilu (OC Base File)
        │  └── 📃 WhateverGreen.kext       // Requires Lilu (OC Base File)
        ├── 📁 Resources
        │  ├── 📃 Audio                    // Additional (release)
        │  ├── 📃 Font                     // Additional (release)
        │  ├── 📃 Image                    // Additional (release)
        │  └── 📃 Label                    // Additional (release)
        ├── 📁 Tools
        │  └── 📃 OpenShell.efi            // Requires with debug version (OC Base File)   
        ├── 📃 config.plist                // Configuration  (OC Base File)
        └── 📃 OpenCore.efi                // OC Base File
    ```

**Post Process**

-   **Enable GPU Tab in Activity Monitor**
 
    -   If the Device Properties of your iGPU and dGPU are configured correctly, you will find the Tab "GPU" in the Activity Monitor App which lists the graphics devices and the tasks/processes assigned to each of them. Use this properties to enable gpu's tab. Requirement:
        -   Change iGPU  `AAPL,slot-name` to `Slot- 0`. Most iGPU attached to this slot.
        -   Add `AAPL,ig-platform-id` data `0300C59B` / `0300C89B` (headless Comet Lake platform)
        -   Add `device-id` data `9B3E0000`  (Kaby Lake device id is required to properly rename GPU as UHD 630 on Comet Lake platform)
        -   Add `enable-metal` data `01000000` (enable metal)
        -   Add `force-online` data `01000000` (always enable for offline rendering)

    ![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)

-   **MMIO Whitelist**

    -   MMIO stands for Memory-Mapped Input/Output. It's a method to perform I/O processes between the CPU and peripheral devices of a computer. The memory and registers of the I/O devices are mapped to (and associated with) address values. MMIO whitelist is a security feature that controls access to certain memory addresses in a computer system, allowing access only to specific processes or devices that have been explicitly granted permission and denying access to all others. This patch may improve stability. Refer [5T33Z0 - MMIO Whitelist](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist) for more info.

-   **SBUS**

    -   Most 8th Gen and above actually do not require `SSDT-SBUS`. 
        -   Try to load EFI without this patch and reboot. Refer [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/ACPI_Sample/SSDT-YNXB460.dsl) as an example.
        -   After login, copy and paste this command, `kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`. The result will shown as below:
        
            ```zsh
            Executing: /usr/bin/kmutil showloaded
            No variant specified, falling back to release
              150    0 0xffffff7f98f8d000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 76173829-8756-3746-9516-A60DABEB950C <16 7 6 3>
              166    1 0xffffff7f98f81000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) E4F2BA31-6A3A-3690-A863-80A993E08DF0 <165 16 15 7 6 3>
            ```
        -   Check `AppleSMBusController` and `AppleSMBUSPCI` kexts using `System Reports` / `Software` / `Extensions`. If both loads, it means your `SBUS` is working natively without any patches.

-   **Specific Drivers and Sorting Kexts**

    -   Use only specific drivers. improve boot speed and sorting kexts in priority; improve `debug` log and `data` injection, especially debugging.

        ```zsh
        📁 Drivers
        ├── 📃 HfsPlus.efi              // 1
        ├── 📃 OpenCanopy.efi           // 2
        └── 📃 OpenRuntime.efi          // 3

        📁 Kexts
        ├── 📃 Lilu.kext                // 1
        ├── 📃 VirtualSMC.kext          // 2          
        ├── 📃 SMCProcessor.kext        // 3       
        ├── 📃 SMCSuperIO.kext          // 4         
        ├── 📃 RadeonSensor.kext        // 5         
        ├── 📃 SMCRadeonGPU.kext        // 6         
        ├── 📃 AppleALC.kext            // 7                        
        ├── 📃 WhateverGreen.kext       // 8         
        ├── 📃 IntelMausi.kext          // 9          
        ├── 📃 LucyRTL8125Ethernet.kext // 10 
        ├── 📃 RestrictEvents.kext      // 11      
        └── 📃 USBMap.kext              // 12
        ```

-   **Useful PowerShell Command**

    -   This command help us to specify need information in order to build our own hackintosh and set `AAPL,slot-name` properly. Please check `SlotDesignation` as references.
        -   Open Windows Powershell, copy and paste `Get-WmiObject -class "Win32_SystemSlot"`. As an example, PCI x16 Slot.
        
            ```powershell
            SlotDesignation : Slot1 / X16PCIEXP // Refer to x16 slot capability
            Tag             : System Slot 0 // Root Slot connected to SlotDesignation. 
            SupportsHotPlug : False
            Status          : OK
            Shared          : False
            PMESignal       : True
            MaxDataWidth    : 10
            ```
        -   Slot1 X16PCIEXP is refered to x16 PCI slot capabilities. The exact match for `AAPL,slot-name` is `Slot- 1`. Remember, most iGPU built-in with processor is considered as `Slot- 0`.
        -   Another way is using `Get-WmiObject -class "Win32_PnPEntity"`. Copy all dumped info from Powershell and paste to any text editor as references.

-   **OpenCanopy Theme**

    -   [younix rad theme](https://github.com/iamyounix/msimagb460_tomahawk/releases/download/Release/theme_younix.zip)

        ![30073939](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/6c640b15-32a6-4b01-ba5c-307afdb74167)

    -   Rad Theme Config Example:
        -   PickerAttributes = `147`
        -   PickerMode = `External`
        -   PickerVariant = `younix\Rad`
        -   ShowPicker = `Yes`
        -   Entries
            -   Arguments = `Auxiliary` (Only appear when pressing Tab)
            -   Comment = `macOS Installation Media (FS1:)` (Your Comment/Any)
            -   Enabled = ` Yes`/`True`
            -   Flavour = `Disc:Disc` (Provided Icon Name)
            -   Name = `Install macOS 12` (Label)
            -   Path = `PciRoot(0x0)/Pci(0x17,0x0)/Sata(0x0,0xFFFF,0x0)/HD(2,GPT,XFX5XEX0-XCX1-XAXA-X3X3-X4X3X3XCXAXF,0xX4X2X,0xX4X8X9X)/\System\Library\CoreServices\boot.efi` (Use OpenShell.efi to dump GUID path)
            -   TextMode = `No`/`False`

-   **Credits**

    ⌘ [Acidanthera](https://github.com/acidanthera/) ⌘ [corpnewt](https://github.com/corpnewt) ⌘ [Dortania](https://github.com/dortania) ⌘ [khronokernel](https://github.com/khronokernel) ⌘ [5T33Z0](https://github.com/5T33Z0) ⌘ [Photopea](https://www.photopea.com/)
