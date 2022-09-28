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
Serial Number                  C02CN0C4PN5T
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
  - [x] BCM4360 802.11ac Wireless Network Adapter    

  **History**

  - [x] Working
  - [ ] Not Working

---

## Configuration

### ACPI

  - **Add**
    - **SSDT-B460MASL.aml** (Single File)
      - **_SB** (System Bus/Bus Objects are defined under this namespace)
        - **PCI0** (PCI Root Bridge)
          - **DRAM** (Comet Lake-S 6c Host Bridge/DRAM Controller )
          - **GFX0** (Intel UHD Graphics 630)
          - **HDAS** (Comet Lake PCH-V cAVS )
          - **HECI** (Comet Lake PCH-V HECI Controller)
          - **LPCB** (B460M Low Pin Count)
            - **EC** (Fake Embeded Controller)
            - **FWHD** (Fake Firmware Hub Device - Optional)
            - **HPET** (High Precision Event Timer)
          - **PEG0** (6th-10th Gen Core Processor PCIe Controller (x16) )
            - **PEGP**, etc
          - **RP04**, **05**, **09**, **20**, **21** (Root Port)
            - **PXSX**, etc
              - **XHC2** (VL805/806 xHCI USB 3.0 Controller)
              - **RTLK** (Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet)
              - **ARPT** (BCM4360 802.11ac Wireless Network Adapter)
          - **SAT0** (400 Series Chipset Family SATA AHCI Controller )
          - **SBUS** (Serial Bus)
          - **TSUB** (Thermal Subsystem)
          - **XHC_** (USB)
          - **USBX** (USB Power Management)
          - **DTGP** (Apple Standard Calling Method)
          - **STAS** (Status Method)

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
    - ProvideMaxSlide = 0
    - ResizeAppleGpuBars = -1

  

### DeviceProperties

  - **Add**

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>DeviceProperties</key>
            <dict>
                <key>Add</key>
                <dict>
                    <key>PciRoot(0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>DRAM</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>PEG0</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>EGP0</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>EGP1</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>@0,AAPL,boot-display</key>
                        <data>AQAAAA==</data>
                        <key>@0,ATY,EFIDisplay</key>
                        <string>DP</string>
                        <key>@0,name</key>
                        <string>ATY,Python</string>
                        <key>@1,name</key>
                        <string>ATY,Python</string>
                        <key>@2,name</key>
                        <string>ATY,Python</string>
                        <key>@3,name</key>
                        <string>ATY,Python</string>
                        <key>AAPL,slot-name</key>
                        <string>Internal@0,1,0/0,0/0,0/0,0</string>
                        <key>ATY,EFIEnabledMode</key>
                        <string>01</string>
                        <key>ATY,EFIVersion</key>
                        <data>MzAuMC4xMDEuMTM0MA==</data>
                        <key>ATY,EFIVersionB</key>
                        <data>MDE3LjAwMi4wMDAuMDAwLjAzNzYzNg==</data>
                        <key>ATY,copyright</key>
                        <data>Q29weXJpZ2h0IEFNRCBJbmMuICBBbGwgUmlnaHQgUmVzZXJ2ZWQuICAyMDA1LTIwMTk=</data>
                        <key>agdpmod</key>
                        <string>pikera</string>
                        <key>hda-gfx</key>
                        <string>onboard-2</string>
                        <key>name</key>
                        <string>ATY_GPU</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)</key>
                    <dict>
                        <key>model</key>
                        <string>Navi 10 HDMI Audio</string>
                        <key>name</key>
                        <string>HDAU</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x14,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>XHC1</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x14,0x2)</key>
                    <dict>
                        <key>name</key>
                        <string>TSUB</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x16,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>IMEI</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x17,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>SATA</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1B,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>RP20</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>model</key>
                        <string>BCM4360 802.11ac Wireless Network Adapter</string>
                        <key>name</key>
                        <string>ARPT</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1B,0x4)</key>
                    <dict>
                        <key>name</key>
                        <string>RP20</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1B,0x4)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>ANS1</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1C,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>RP04</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1C,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>RTLK</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1C,0x4)</key>
                    <dict>
                        <key>name</key>
                        <string>RP05</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>model</key>
                        <string>VL805/806 xHCI USB 3.0 Controller</string>
                        <key>name</key>
                        <string>XHC2</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1D,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>RP09</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>ANS0</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1F,0x0)</key>
                    <dict>
                        <key>name</key>
                        <string>LPCB</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1F,0x2)</key>
                    <dict>
                        <key>name</key>
                        <string>PPMC</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1F,0x3)</key>
                    <dict>
                        <key>layout-id</key>
                        <data>AQAAAA==</data>
                        <key>name</key>
                        <string>HDEF</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x1F,0x4)</key>
                    <dict>
                        <key>name</key>
                        <string>SBUS</string>
                    </dict>
                    <key>PciRoot(0x0)/Pci(0x2,0x0)</key>
                    <dict>
                        <key>AAPL,ig-platform-id</key>
                        <data>AwCSPg==</data>
                        <key>built-in</key>
                        <data>AQ==</data>
                        <key>device-id</key>
                        <data>mz4AAA==</data>
                        <key>enable-metal</key>
                        <data>AQAAAA==</data>
                        <key>igfxfw</key>
                        <data>AgAAAA==</data>
                        <key>igfxonln</key>
                        <data>AQAAAA==</data>
                        <key>iommu-selection</key>
                        <data>AAAAAA==</data>
                        <key>name</key>
                        <string>IGPU</string>
                    </dict>
                </dict>
                <key>Delete</key>
                <dict/>
            </dict>
        </dict>
    </plist>
    ```
    
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
    - Cpuid1Data > Data > `Empty`
    - Cpuid1Mask > Data > `Empty`
    - [ ] DummyPowerManagement
    - MaxKernel > String > `Empty`
    - MinKernel > String > `Empty`

  - **Force**
    - NIL

  - **Patch**
    - Arch > String > `x86_64`
    - Base > String > `Empty`
    - Comment > String > `Enable TRIM for SSD`
    - Count > Integer > `0`
    - Enable > Integer > `0`
    - Find > Data > `004150504C452053534400`
    - Identifier > String > `com.apple.iokit.IOAHCIBlockStorage`
    - Limit > Integer > `0`
    - Mask > Data > `Empty`
    - MinKernel > String > `Empty`
    - MaxKernel > String > `Empty`
    - Replace > Data > `0000000000000000000000`
    - Replacemask > Data > `Empty`
    - Skip > Interger > `0`

 - **Scheme**
   - [ ] CustomKernel
   - [x] FuzzyMatch
   - KernelArch > String > `x86_64`
   - KernelCache > String > `Auto`

### Misc

  - **BlessOverride**
    - NIL

  - **Boot**
    - ConsoleAttributes = `0`
    - HibernateMode = `Auto`
    - [x] Hide Auxiliary 
    - LauncherOption = `Full`
    - LauncherPath = `Default`
    - PickerAttributes = `17`
    - [ ] PickerAudioAssist
    - PickerMode = `External`
    - PickerVariant = `Acidanthera\GoldenGate`
    - [ ] PollAppleHotKeys
    - [x] ShowPicker
    - TakeoffDelay = `0`
    - Timeout = `5`

  - **Debug**
    - DisplayLevel = `0`
    - DisplayDelay = `0`
    - Target = `0`
    - [x] DisableWatchDog

  - **Security**
    - [x] AllowSetDefault
    - [x] BlacklistAppleUpdate
    - DmgLoading = `Signed`
    - Vault = `Optional`
    - SecureBootModel = `j85-10.15.6 (19G2005)`
    - HaltLevel = `2147483648` equal to `0x80000000`
    - ExposeSensitiveData = `3` equal to `0x03`
    - ScanPolicy = `2690819` equal to `0x00290F03`
    - PasswordHash = `Empty`
    - PasswordSalt = `Empty`

  - **Entries**
    - NIL
  - **Tools**
    - Arguments > String > `Empty`
    - [x] Auxiliary
    - Comment > String > `CleanNvram.efi` 
    - [x] Enabled 
    - Flavour = `Auto`
    - [ ] FullNvramAccess
    - [ ] RealPath
    - [ ] TextMode

    - Serial
      - NIL

### NVRAM

- **Add**
  - **4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14**
    - DefaultBackgroundColor > Data > `00000000`
    - UIScale > Data > `01`
  - **4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102**
    - rtc-blacklist > Data > `Empty`
  - **7C436110-AB2A-4BBB-A880-FE41995C9F82**
    - ForceDisplayRotationInEFI > Number > `0`
    - SystemAudioVolume > Data > `46`
    - boot-args > String > `Empty` **(Patches Inject via DeviceProperties)**
    - csr-active-config > Data > `00000000`
    - prev-lang:kbd > Data > **Hexadecimal:** `656E2D55533A30` **ASCII:** `en-US:0`
    - run-efi-updater > String > `No`

- **Delete**
  - **4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14**
    - Item 1 > String > `UIScale`
    - Item 2 > String > `DefaultBackgroundColor`
  - **4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102**
    - Item 1 > String > `rtc-blacklist`
  - **7C436110-AB2A-4BBB-A880-FE41995C9F82**
    - Item 1 > String > `boot-args`

- **LegacyOverwrite**
  - NIL
- LegacySchema
  - [x] WriteFlash

### PlatformInfo

- [x] **Automatic**
- [ ] **CustomMemory**

- **Generic**
  - [ ] AdviseFeatures
  - MLB > String > `XXXXXXXXXXXXXXXX`
  - [ ] MaxBIOSVersion
  - ProcessorType > Interger > `0`
  - ROM > Data > `XXXXXXXXXXXXXXXX`
  - [x] SpoofVendor
  - SystemMemoryStatus > String > `Auto`
  - SystemProductName > String > `iMac20,1`
  - SystemSerialNumber > String > `XXXXXXXXXXXXXXXX`
  - SystemUUID > String > `XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXXX`
- **UpdateDataHub**
- **UpdateNVRAM**
- **UpdateSMBIOS**
- **UpdateSMBIOSMode** > String > `Custom`
- **UseRawUuidEncoding**

### UEFI

- **APFS**
  - [x] EnableJumpstart
  - [ ] GlobalConnect
  - [x] HideVerbose
  - [ ] JumpstartHotPlug
  - MinDate > Integrer > `-1`
  - MinVersion > Integrer > `-1`

- **AppleInput**
  - AppleEvent > String > `BuiltIn`
  - [ ] CustomDelays
  - [x] GraphicInputMirroring
  - KeyInitialDelay > Integer > `0`
  - KeySubsequentDelay > Integer > `5`
  - PointePollMask > Integer > `-1`
  - PointerPollMax > Integer > `80`
  - PointerPollMin > Integer > `10`
  - PointerSpeedDiv > Integer > `1`
  - PointerSpeedMul > Interger > `1`

- **Audio**

- To Be Continued...
