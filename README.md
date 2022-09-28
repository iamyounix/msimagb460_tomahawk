# ASRock B460M Steel Legend

  Hackintosh: 10th Gen Comet Lake with B460M Steel Legend Configuration

---

### System Info

```zsh
OS                             macOS Monterey Version 12.6 (Build 21G115)
Kernel                         Darwin 21.6.0 x86_64
RAM                            32.00 GB
Model Identifier               iMac20,1
CPU                            Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
Intel Generation               Coffee Lake
Platform ID                    0x3E920003
Board ID                       Mac-CFF7D910A743CAAF
FW Version                     1916.0.3.0.0
Serial Number                  XXXXXXXXXXXX
Hardware UUID                  XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
System ID                      XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
ROM                            XXXXXXXXXXXX
Board Serial Number            XXXXXXXXXXXXXXXXX
VDA Decoder                    Fully Supported
```

### Serial Info

```zsh
Country                        China (Quanta Computer)
Year                           2020
Week                           05.06.2020-05.12.2020
Line                           412 (copy 1)
Model                          iMac (Retina 5K, 27-inch, 2020)
Model Identifier               iMac20,1
Valid                          Possibly
```

### IGPU

```zsh
GPU Name                       Intel CoffeeLake-H GT2 [UHD Graphics 630]
GPU Device ID                  0x3E9B8086
```

### GFX0

```zsh
GPU Name                       Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
GPU Device ID                  0x73401002
Quartz Extreme (QE/CI)         Yes
Metal Supported                Yes
Metal Device Name              AMD Radeon RX 5500 XT
Metal Default Device           Yes
Metal Low Power                No
Metal Headless                 No
```

### PCI Device  

**Instruction**
  - [x] Working
  - [ ] Not Working

  - **PCI list**
    - [x] Comet Lake-S 6c Host Bridge/DRAM Controller 					       
    - [x] 6th-10th Gen Core Processor PCIe Controller (x16)  
    - [x] Intel CoffeeLake-H GT2 [UHD Graphics 630]          
    - [x] Comet Lake PCH-V USB Controller                    
    - [ ] Comet Lake PCH-V Thermal Subsystem                 
    - [x] Comet Lake PCH-V HECI Controller  
    - [ ] Comet Lake PCH-V Memory controller                                  
    - [x] Comet Lake PCH-V cAVS                              
    - [x] Comet Lake PCH-V SMBus Host Controller                  
    - [x] 400 Series Chipset Family SATA AHCI Controller                                                                 
    - [x] B460 Chipset LPC/eSPI Controller                               
    - [x] Kingston SA2000M8500G (x2) 
    - [x] Navi 10 XL Upstream Port of PCI Express Switch                                                                                       
    - [x] Navi 10 XL Downstream Port of PCI Express Switch                    
    - [x] Navi 14 [Radeon RX 5500/5500M / Pro 5500M]          
    - [x] Navi 10 HDMI Audio 
    - [x] VL805/806 xHCI USB 3.0 Controller
    - [x] Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet
    - [x] BCM94360CD 802.11ac Wireless Network Adapter    

**SSDT Patch**
  - **_SB** = System Bus/Bus Objects are defined under this namespace
    - **PCI0** = PCI Root Bridge
      - [x] **DRAM** = Comet Lake-S 6c Host Bridge/DRAM Controller 
      - [x] **GFX0** = Intel UHD Graphics 630 (Renamed as IGPU)
      - [x] **HDAS** = Comet Lake PCH-V cAVS (Renamed as HDEF)
      - [x] **HECI** = Comet Lake PCH-V HECI Controller (Renamed as IMEI)
      - [ ] **PPMC** = Programmable Power Management Controller - Typically found on 10th generation motherboards, `not compatible` with macOS
      - [x] **PMCR** = Fake Power Management Capabilities Register - replacing the function of PPMC
      - [x] **SAT0** = 400 Series Chipset Family SATA AHCI Controller (Renamed as SATA)
      - [x] **SBUS** = Serial Bus
      - [ ] **TSUB** = Thermal Subsystem - Typically found on 10th generation motherboards, `not compatible` with macOS
      - [x] **XHC** = 300/400 Series PCH-V USB Controller (Renamed as XHC1)
      - [x] **USBX** = USB Power Management
      - [x] **DTGP** = Apple/MacOS standard method that passes through calls to _DSM on various Device objects
      - [x] **STAS** = Status Method
      * **LPCB** = B460M Low Pin Count
        - [x] **EC** = Fake Embeded Controller
        - [x] **FWHD** = Fake Firmware Hub Device - Optional)
        - [x] **HPET** = High Precision Event Timer)
      * **PEG0** = 6th-10th Gen Core Processor PCIe Controller x16 (Renamed as PEGP)
        - [x] **pci-bridge0@0** = Navi 10 XL Upstream Port (Renamed as EGP0)
          - [x] **pci-bridge0@1** = Navi 10 XL Downstream Port (Renamed as EGP1)
            - [x] **GFX0** = Navi 14 [Radeon RX 5500/5500M / Pro 5500M] 
            - [x] **HDAU** = Navi 10 HDMI Audio
      * **RP04**, **05**, **09**, **20**, **21** (Root Port)
        - [x] **PXSX** = Kingston SA2000M8500G M.2 Slot 0 (Renamed as ANS0)
        - [x] **PXSX** = Kingston SA2000M8500G M.2 Slot 1 (Renamed as ANS1)
        - [x] **PXSX** = BCM4360 802.11ac Wireless Network Adapter (Renamed as ARPT)
        - [x] **PXSX** = Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet (Renamed as RTLK)
        - [x] **PXSX** = VL805/806 xHCI USB 3.0 Controller (Renamed as XHC2)

---

## Configuration

**Instruction**

  - [x] True
  - [ ] False

### ACPI

  - **Add**
    - [**SSDT-B460MASL.aml**](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/README.md#pci-device)

  - **Delete**
    - NIL

  - **Patch**
    - **HPET _CRS** to **XCRS** Rename
    - **RTC IRQ 8** Patch
    - **TIMR IRQ 0** Patch

  - **Quirks**
    - NIL

### Booter

  - **MmioWhitelist**
    - NIL

  - **Patch**
    - NIL

  - **Quirks**
    - [x] AvoidRuntimeDefrag
    - [x] DevirtualiseMmio
    - [x] EnableSafeModeSlide
    - [x] ProtectUefiServices
    - [x] ProvideCustomSlide
    - [x] RebuildAppleMemoryMap
    - [x] SyncRuntimePermissions
    * ProvideMaxSlide = 0
    * ResizeAppleGpuBars = -1

### DeviceProperties

  - **Add**
    - **PciRoot(0x0)/Pci(0x0,0x0)**
      - `name > string > DRAM`
    - **PciRoot(0x0)/Pci(0x1,0x0)**
      - `name > string > PEG0`
    - **PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)**
      - `name > string > EGP0`
    - **PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)**
      - `name > string > EGP1`
    - **PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)**
      - `@0,AAPL,boot-display > data > AQAAAA==`
      - `@0,ATY,EFIDisplay > string > DP`
      - `@0,name > string > ATY,Python`
      - `@1,name > string > ATY,Python`
      - `@2,name > string > ATY,Python`
      - `@4,name > string > ATY,Python`
      - `AAPL,slot-name > string > Internal@0,1,0/0,0/0,0/0,0`
      - `ATY,EFIEnabledMode > string > 01`
      - `ATY,EFIVersion > data > MzAuMC4xMDEuMTM0MA==`
      - `ATY,EFIVersionB > data > MDE3LjAwMi4wMDAuMDAwLjAzNzYzNg==`
      - `ATY,copyright > data > Q29weXJpZ2h0IEFNRCBJbmMuICBBbGwgUmlnaHQgUmVzZXJ2ZWQuICAyMDA1LTIwMTk=`
      - `agdpmod > string > pikera`
      - `hda-gfx > string > onboard-2`
      - `name > string > ATY_GPU`
    - **PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)**
      - `model > string > Navi 10 HDMI Audio`
      - `name > string > HDAU`
    - **PciRoot(0x0)/Pci(0x14,0x0)**
      - `name > string > XHC1`
    - **PciRoot(0x0)/Pci(0x14,0x2)**
      - `name > string > TSUB`
    - **PciRoot(0x0)/Pci(0x16,0x0)**
      - `name > string > IMEI`
    - **PciRoot(0x0)/Pci(0x17,0x0)**
      - `name > string > SATA`
    - **PciRoot(0x0)/Pci(0x1B,0x0)**
      - `name > string > RP20`
    - **PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)**
      - `model > string > BCM94360 802.11ac Wireless Network Adapter`
      - `name > string > ARPT`
    - **PciRoot(0x0)/Pci(0x1B,0x4)**
      - `name > string > RP21`
    - **PciRoot(0x0)/Pci(0x1B,0x4)/Pci(0x0,0x0)**
      - `name > string > ANS1`
    - **PciRoot(0x0)/Pci(0x1C,0x0)**
      - `name > string > RP04`
    - **PciRoot(0x0)/Pci(0x1C,0x0)/Pci(0x0,0x0)**
      - `name > string > RTLK`
    - **PciRoot(0x0)/Pci(0x1C,0x4)**
      - `name > string > RP05`
    - **PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)**
      - `model > string > VL805/806 xHCI USB 3.0 Controller`
      - `name > string > XHC2`
    - **PciRoot(0x0)/Pci(0x1D,0x0)**
      - `name > string > RP09`
    - **PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)**
      - `name > string > ANS0`
    - **PciRoot(0x0)/Pci(0x1F,0x0)**
      - `name< > string > LPCB`
    - **PciRoot(0x0)/Pci(0x1F,0x2)**
      - `name</ > string > PPMC`
    - **PciRoot(0x0)/Pci(0x1F,0x3)**
      - `layout-id > data > AQAAAA==`
      - `name< > string > HDEF`
    - **PciRoot(0x0)/Pci(0x1F,0x4)**
      - `name > string > SBUS`
    - **PciRoot(0x0)/Pci(0x2,0x0)**
      - `AAPL,ig-platform-id > data > AwCSPg==`
      - `built-in > data > AQ==`
      - `device-id > data > mz4AAA==`
      - `enable-metal > data > AQAAAA==`
      - `igfxfw > data > AgAAAA==`
      - `igfxonln< > data > AQAAAA==`
      - `iommu-selection > data > AAAAAA==`
      - `name > string > IGPU`
    
  - **Delete**
    - NIL

### Kernel

  - **Add**
    - [x] AppleALC.kext
    - [x] Lilu.kext
    - [x] LucyRTL8125Ethernet.kext
    - [x] RadeonSensor.kext
    - [x] SMCProcessor.kext
    - [x] SMCRadeonGPU.kext
    - [x] SMCSuperIO.kext
    - [x] USBMap.kext (**Min Kernel** 19.0.0)
    - [x] VirtualSMC.kext
    - [x] WhateverGreen.kext

  - **Block**
    - NIL

  - **Emulate**
    - [ ] DummyPowerManagement  
    * Cpuid1data > data > `Empty`
    * Cpuid1Mask > data > `Empty`
    * MaxKernel > string > `Empty`
    * MinKernel > string > `Empty`

  - **Force**
    - NIL

  - **Patch**
    - Arch > string > `x86_64`
    - Base > string > `Empty`
    - Comment > string > `Enable TRIM for SSD`
    - Count > Integer > `0`
    - Enable > Integer > `0`
    - Find > data > `004150504C452053534400`
    - Identifier > string > `com.apple.iokit.IOAHCIBlockStorage`
    - Limit > Integer > `0`
    - Mask > data > `Empty`
    - MinKernel > string > `Empty`
    - MaxKernel > string > `Empty`
    - Replace > data > `0000000000000000000000`
    - Replacemask > data > `Empty`
    - Skip > Interger > `0`

 - **Scheme**
   - [ ] CustomKernel
   - [x] FuzzyMatch
   * KernelArch > string > `x86_64`
   * KernelCache > string > `Auto`

### Misc

  - **BlessOverride**
    - NIL

  - **Boot**
    - [x] Hide Auxiliary 
    - [ ] PickerAudioAssist
    - [ ] PollAppleHotKeys
    - [x] ShowPicker
    * ConsoleAttributes = `0`
    * HibernateMode = `Auto`
    * LauncherOption = `Full`
    * LauncherPath = `Default`
    * PickerAttributes = `17`
    * PickerMode = `External`
    * PickerVariant = `Acidanthera\GoldenGate`
    * TakeoffDelay = `0`
    * Timeout = `5`

  - **Debug**
    - [x] DisableWatchDog
    * DisplayLevel = `0`
    * DisplayDelay = `0`
    * Target = `0`

  - **Entries**
    - NIL

  - **Security**
    - [x] AllowSetDefault
    - [x] BlacklistAppleUpdate
    * DmgLoading = `Signed`
    * Vault = `Optional`
    * SecureBootModel = `j85-10.15.6 (19G2005)`
    * HaltLevel = `2147483648` equal to `0x80000000`
    * ExposeSensitivedata = `3` equal to `0x03`
    * ScanPolicy = `2690819` equal to `0x00290F03`
    * PasswordHash = `Empty`
    * PasswordSalt = `Empty`

  - **Serial**
    - [ ] Init
    - [ ] Override
    * Custom (Leave It)

  - **Tools**
    
    - [x] Auxiliary
    - [x] Enabled 
    - [ ] FullNvramAccess
    - [ ] RealPath
    - [ ] TextMode
    * Arguments > string > `Empty`
    * Comment > string > `CleanNvram.efi` 
    * Flavour = `Auto`
    
### NVRAM

- **Add**
  - **4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14**
    - DefaultBackgroundColor > data > `00000000`
    - UIScale > data > `01`
  - **4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102**
    - rtc-blacklist > data > `Empty`
  - **7C436110-AB2A-4BBB-A880-FE41995C9F82**
    - ForceDisplayRotationInEFI > Number > `0`
    - SystemAudioVolume > data > `46`
    - boot-args > string > `Empty` **(Patches Inject via DeviceProperties)**
    - csr-active-config > data > `00000000`
    - prev-lang:kbd > data > **Hexadecimal:** `656E2D55533A30` **ASCII:** `en-US:0`
    - run-efi-updater > string > `No`

- **Delete**
  - **4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14**
    - Item 1 > string > `UIScale`
    - Item 2 > string > `DefaultBackgroundColor`
  - **4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102**
    - Item 1 > string > `rtc-blacklist`
  - **7C436110-AB2A-4BBB-A880-FE41995C9F82**
    - Item 1 > string > `boot-args`

- **LegacyOverwrite**
  - NIL
- LegacySchema
  - [x] WriteFlash

### PlatformInfo

- [x] **Automatic**
- [ ] **CustomMemory**

* **Generic**
  - [ ] AdviseFeatures
  - [ ] MaxBIOSVersion
  - [x] SpoofVendor
  * MLB > string > `XXXXXXXXXXXXXXXX`
  * ProcessorType > Interger > `0`
  * ROM > data > `XXXXXXXXXXXXXXXX`
  * SystemMemoryStatus > string > `Auto`
  * SystemProductName > string > `iMac20,1`
  * SystemSerialNumber > string > `XXXXXXXXXXXXXXXX`
  * SystemUUID > string > `XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXXX`
* **UpdatedataHub**
* **UpdateNVRAM**
* **UpdateSMBIOS**
* **UpdateSMBIOSMode** > string > `Custom`
* **UseRawUuidEncoding**

### UEFI

- **APFS**
  - [x] EnableJumpstart
  - [ ] GlobalConnect
  - [x] HideVerbose
  - [ ] JumpstartHotPlug
  * MinDate > Integrer > `-1`
  * MinVersion > Integrer > `-1`

- **AppleInput**
  - [ ] CustomDelays
  - [x] GraphicInputMirroring
  * AppleEvent > string > `BuiltIn`
  * KeyInitialDelay > Integer > `0`
  * KeySubsequentDelay > Integer > `5`
  * PointePollMask > Integer > `-1`
  * PointerPollMax > Integer > `80`
  * PointerPollMin > Integer > `10`
  * PointerSpeedDiv > Integer > `1`
  * PointerSpeedMul > Interger > `1`

- **Audio**

- To Be Continued...
