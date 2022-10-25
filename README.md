# ASRock B460M Steel Legend
**Hackintosh: 10th Gen Intel Comet Lake with B460M Steel Legend with OpenCore 0.8.5 & Clover 5149 Configuration**

<div align="justify">
  <p><strong>My word:</strong> - <strong>"It's merely cosmetic"</strong>, according to some. For me, this content is not just for show. <strong>Configuration?</strong>, You can play with <strong>config.plist</strong> and experiment with it. But heed the warning—if the file is not saved properly, it may get corrupted. This issue sometimes happen due to; <strong>restart before saving</strong> , &nbsp;<strong>erroneously input or  non-format input</strong>. I'm not interested to share my personal <strong>EFI</strong>, and not meant to be used by other people or systems. If you're still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>plist configuration</strong> and <strong>SSDTs</strong> according to your system. <strong>ACPI?</strong>, You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck. My advise is not to modify your <strong>DSDTs</strong>. <strong>DSDT's</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. This is not full feature guide. OpenCore and Clover sample is attached as a learning curve. Please be careful what you're read, copy and modified all these stuffs. Do a research first. Do note, while attached OpenCore and Clover SSDT has 98% differencies, both has the same output.</p>
</div>

### OpenCore EFI Structure

```zsh
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   └── SSDT-PatchOC.aml
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   └── OpenRuntime.efi
    ├── Kexts
    │   ├── AppleALC.kext
    │   ├── Lilu.kext
    │   ├── LucyRTL8125Ethernet.kext
    │   ├── RadeonSensor.kext
    │   ├── SMCProcessor.kext
    │   ├── SMCRadeonGPU.kext
    │   ├── SMCSuperIO.kext
    │   ├── USBMap.kext
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
    ├── Tools
    │   └── CleanNvram.efi
    └── config.plist
```

### Clover EFI Structure

```zsh
EFI
├── BOOT
│   └── BOOTX64.efi
└── CLOVER
    ├── ACPI
    │   ├── WINDOWS
    │   ├── origin
    │   └── patched
    │       └── SSDT-PatchCLVR.aml
    ├── CLOVERX64.efi
    ├── ROM
    ├── config.plist
    ├── drivers
    │   └── UEFI
    │       ├── ApfsDriverLoader.efi
    │       ├── EnglishDxe.efi
    │       ├── HFSPlus.efi
    │       ├── OcQuirks.efi
    │       └── OpenRuntime.efi
    ├── kexts
    │   ├── 10.11
    │   ├── 10.12
    │   ├── 10.13
    │   ├── 10.14
    │   ├── 10.15
    │   ├── 11
    │   ├── 12
    │   │   ├── AppleALC.kext
    │   │   ├── Lilu.kext
    │   │   ├── LucyRTL8125Ethernet.kext
    │   │   ├── RadeonSensor.kext
    │   │   ├── SMCProcessor.kext
    │   │   ├── SMCRadeonGPU.kext
    │   │   ├── SMCSuperIO.kext
    │   │   ├── USBMap.kext
    │   │   ├── VirtualSMC.kext
    │   │   └── WhateverGreen.kext
    │   ├── 13
    │   ├── Off
    │   └── Other
    ├── misc
    ├── themes
    │   ├── Blackcamp
    │   ├── embedded
    │   └── random
    │       └── theme.plist
    └── tools      
```        

### Basic Info

<div align="center"><p><img width="680" src="https://user-images.githubusercontent.com/72515939/197660662-25adbd37-64af-43c4-ba79-b1a2e06117a4.png" alt="2022-09-29_15-54-05"></p></div>

### Graphics

#### IGPU - Integrated Graphics (Headless)

```zsh
GPU Name                       Intel CoffeeLake-H GT2 [UHD Graphics 630]
GPU Device ID                  0x3E9B8086
```

#### GFX0 - Dedicated Graphics (Display)

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

#### VDA Support

```zsh
VDA Decoder                    Fully Supported 
```

#### Others

```zsh
Kernel                         Darwin 21.6.0 x86_64
OS                             macOS Ventura Version 13.0 (Build 22A380)
```

### PCI Device

#### Instruction
- [ ] Working
- [x] Not Working

#### Device List
- [ ] Comet Lake-S 6c Host Bridge/DRAM Controller
- [ ] 6th-10th Gen Core Processor PCIe Controller (x16)
- [ ] Intel CoffeeLake-H GT2 [UHD Graphics 630]
- [ ] Comet Lake PCH-V USB Controller
- [x] Comet Lake PCH-V Thermal Subsystem
- [ ] Comet Lake PCH-V HECI Controller
- [x] Comet Lake PCH-V Memory controller
- [ ] Comet Lake PCH-V cAVS
- [ ] Comet Lake PCH-V SMBus Host Controller
- [ ] 400 Series Chipset Family SATA AHCI Controller
- [ ] B460 Chipset LPC/eSPI Controller
- [ ] Kingston SA2000M8500G (x2)
- [ ] Navi 10 XL Upstream Port of PCI Express Switch
- [ ] Navi 10 XL Downstream Port of PCI Express Switch
- [ ] Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
- [ ] Navi 10 HDMI Audio
- [ ] VL805/806 xHCI USB 3.0 Controller
- [ ] Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet
- [ ] BCM94360CD 802.11ac Wireless Network Adapter

#### Patched Devices

| **Device**                      | **Details**                                                                                                        |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| ALSD                            | Ambient Light Sensor enable (AppleLMUController)                                                                   |           
| SB.PCI0.DRAM                    | Comet Lake-S 6c Host Bridge/DRAM Controller                                                                        |
| SB.PCI0.GFX0                    | Intel UHD Graphics 630 (Renamed as `IGPU`)                                                                         |
| SB.PCI0.HDAS                    | Comet Lake PCH-V cAVS (Renamed as `HDEF`)                                                                          |
| SB.PCI0.HECI                    | Comet Lake PCH-V HECI Controller (Renamed as `IMEI`)                                                               |
| SB.PCI0.LPCB                    | B460M Low Pin Count Bus                                                                                            |
| SB.PCI0.LPCB.EC                 | Fake Embeded Controller                                                                                            |
| SB.PCI0.LPCB.FWHD               | Fake Firmware Hub Device (Optional for `300 / 400` Series)                                                         |
| SB.PCI0.LPCB.HPET               | High Precision Event Timer                                                                                         |
| SB.PCI0.PEG0                    | 6th-10th Gen Core Processor PCIe Controller x16 (Renamed as `PEGP`)                                                |
| SB.PCI0.PEG0.pci-bridge0/0      | Navi 10 XL Upstream Port (Renamed as `EGP0`)                                                                       |
| SB.PCI0.PEG0.pci-bridge1/0      | Navi 10 XL Downstream Port (Renamed as `EGP1`)                                                                     |
| SB.PCI0.PEG0.pci-bridge1/0.GFX0 | Navi 14 Radeon RX 5500 / 5500M / Pro 5500M (added `_SUN`, slot user number to properties - OpenCore Only)          |
| SB.PCI0.PEG0.pci-bridge1/0.HDAU | Navi 10 HDMI Audio (added `_SUN` (Slot User Number) to properties - OpenCore Only)                                 |
| SB.PCI0.PPMC                    | Programmable Power Management Controller. `Not compatible` with macOS                                              |
| SB.PCI0.PMCR                    | Fake Power Management Capabilities Register. Replacing the function of `PPMC`                                      |
| SB.PCI0.RP04.PXSX               | Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet (Renamed as `RTLK`)                                              |
| SB.PCI0.RP05.PXSX               | VL805/806 xHCI USB 3.0 Controller (Renamed as `XHC2` and added `built-in`, `_SUN`, slot user number to properties - OpenCore Only)                                   |
| SB.PCI0.RP09.PXSX               | Kingston SA2000M8500G M.2 Slot 0 (Renamed as `ANS0`)                                                               |
| SB.PCI0.RP20.PXSX               | BCM4360 802.11ac Wireless Network Adapter (Renamed as `ARPT`and added `built-in`, `_SUN`, slot user number to properties - OpenCore Only)                             |
| SB.PCI0.RP21.PXSX               | Kingston SA2000M8500G M.2 Slot 1 (Renamed as `ANS1`)                                                               |
| SB.PCI0.SAT0                    | 400 Series Chipset Family SATA AHCI Controller (Renamed as `SATA`)                                                 |
| SB.PCI0.SBUS                    | Serial Bus                                                                                                         |
| SB.PCI0.TSUB                    | Thermal Subsystem. `Not compatible` with macOS                                                                     |
| SB.PCI0.XHC                     | 300/400 Series PCH-V USB Controller (Renamed as `XHC1`)                                                            |
| SB.USBX                         | USB Power Management                                                                                               |
| ALSE                            | ALSE method for ALSD                                                                                               |
| GPRW                            | Native `_PRW` method for Power Resource for Wake                                                                   |
| STAS                            | `_STA` method, to enable such status changes to be communicated to the operating system.                           |

#### SSDT
- [SSDT-PatchCLVR](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/SSDT-PatchCLVR.dsl.dsl) (Clover)

<img width="988" alt="Page 1" src="https://user-images.githubusercontent.com/72515939/197654895-39ec6305-f3f9-4148-883d-da8ea8077da5.png">

- [SSDT-PatchOC](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/SSDT-PatchOC.dsl) (OpenCore)

<img width="988" alt="Page 2" src="https://user-images.githubusercontent.com/72515939/197654909-306009cf-699f-4acd-bbd2-3491e82ad8f1.png">

> **Note:** Start from **macOS 12.3**, [**SSDT-PLUG.aml**](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [**plugin-type=1**](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [**x86PlatformPlugin**](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default on Skylake and Comet Lake. **Refer** original [**thread**](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/), [**Dortania/Bugtracker Issue #2013**](https://github.com/acidanthera/bugtracker/issues/2013) and [**Dortania/Bugtracker Issue #269**](https://github.com/dortania/bugtracker/issues/269). 

---

### Test & Validate
#### Build Number:

```zsh
sw_vers
```
```zsh
ProductName:	macOS
ProductVersion:	12.6
BuildVersion:	21G115
```

#### Kernel Version:

```zsh
 uname -r
```
 ```zsh
21.6.0
```

#### Bus and Frequency:

```zsh
sysctl -a | grep freq
```
```zsh
hw.busfrequency: 400000000
hw.busfrequency_min: 400000000
hw.busfrequency_max: 400000000
hw.cpufrequency: 2900000000
hw.cpufrequency_min: 2900000000
hw.cpufrequency_max: 2900000000
hw.tbfrequency: 1000000000
machdep.tsc.frequency: 2903999153
```

#### CPU Vendor:

```zsh
sysctl -a | grep machdep.cpu.vendor
```
```zsh
machdep.cpu.vendor: GenuineIntel
```

#### CPU Brand String:

```zsh
sysctl machdep.cpu.brand_string
``` 
```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

#### CPU Features:

```zsh
sysctl -a | grep machdep.cpu.features
```
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### CPU Full Features:

```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### CPU Details:

```zsh
ioreg -rxn "PR00@0"
```
```zsh
+-o PR00@0  <class IOACPIPlatformDevice, id 0x10000013c, registered, matched, a$
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
  +-o AppleACPICPU  <class AppleACPICPU, id 0x100000151, registered, matched, a$
  | +-o AppleACPICPUInterruptController  <class AppleACPICPUInterruptController$
  | +-o X86PlatformPlugin  <class X86PlatformPlugin, id 0x100000485, registered$
  |   +-o IOPlatformEnabler  <class IOPlatformPluginDevice, id 0x100000505, reg$
  |   | +-o ApplePlatformEnabler  <class ApplePlatformEnabler, id 0x10000050b, $
  |   +-o AGPMEnabler  <class IOPlatformPluginDevice, id 0x100000506, registere$
  |   | +-o AGPMController  <class AGPMController, id 0x10000050a, !registered,$
  |   +-o X86PlatformShim  <class X86PlatformShim, id 0x100000508, !registered,$
  +-o SMCProcessor  <class SMCProcessor, id 0x100000152, !registered, !matched,$\
```
#### Check Instruction Set:

```zsh
sysctl -a | grep machdep.cpu.leaf7_features
```
```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### Check SIP (System Integrity Protection):

```zsh
csrutil status
```
```zsh
System Integrity Protection status: enabled.
```

#### Find Wake Issue:

```zsh
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```
```zsh
Empty
```

#### Lists any ACPI Error:

```zsh
log show --last boot | grep AppleACPIPlatform > ~/Desktop/Log_"$(date '+%Y-%m-%d_%H-%M-%S')".log
```

> @ [**ASRock B460M Stell Legend ACPI Log**](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/ACPI%20Debug.log)

#### Verifyying SMBUS/SBUS:

```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```
```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
148    0 0xffffff7f98f8e000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) C0C24D4F-420F-3AD1-9039-AFA08E9524FF <16 7 6 3>
153    1 0xffffff7f98f82000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) 7ECD5D2C-E62F-3C6D-ACD7-D90B7443024D <152 16 15 7 6 3>
```

#### Verifying Plugin-Type=1:

```zsh
sysctl machdep.xcpm.mode
```
```zsh
machdep.xcpm.mode: 1
```

#### 4K Test (Online)

<div align="center"><p>
  
[![AppleTV](https://yt-embed.herokuapp.com/embed?v=Yl4cs7Xzuu4)](https://youtu.be/Yl4cs7Xzuu4 "AppleTV Test")
[![Youtube4K](https://yt-embed.herokuapp.com/embed?v=uV4JGZE8Jrk)](https://youtu.be/uV4JGZE8Jrk "Youtube4K")
</p></div>

<div align="center"><p>
<img width="584" alt="Page 0" src="https://user-images.githubusercontent.com/72515939/197660426-ce80a169-c6ab-451a-aab4-0def82e52f5e.png">
<img width="284" alt="Page 1" src="https://user-images.githubusercontent.com/72515939/197660437-c82f5399-25a8-4671-84aa-2ba18353cec9.png">
<img width="908" alt="Page 3" src="https://user-images.githubusercontent.com/72515939/197660455-1b476530-4632-4b64-827c-4e69549e5583.png">
<img width="908" alt="Page 4" src="https://user-images.githubusercontent.com/72515939/197660456-dbefed3b-6f82-4ba4-8ef4-132393efe4e6.png">
<img width="908" alt="Page 5" src="https://user-images.githubusercontent.com/72515939/197660461-1dd3a09b-0539-4049-b7ee-e34b996ff705.png">
<img width="908" alt="Page 6" src="https://user-images.githubusercontent.com/72515939/197660462-fc0202d0-2ba1-4c75-93c2-09c1e73e5715.png">
<img width="908" alt="Page 7" src="https://user-images.githubusercontent.com/72515939/197660467-47f39b0e-3c5b-409a-9394-2f223c3c9978.png">
<img width="908" alt="Page 8" src="https://user-images.githubusercontent.com/72515939/197660476-05dadde8-0e50-4a5e-aae7-c05125ed2052.png">
<img width="908" alt="Page 9" src="https://user-images.githubusercontent.com/72515939/197660484-c8bcd770-17ee-4165-aaf6-ca06f64086b4.png">
<img width="908" alt="Page 10" src="https://user-images.githubusercontent.com/72515939/197660488-7e36e131-20d8-4d11-b35a-7e22759b48e3.png">
<img width="908" alt="Page 11" src="https://user-images.githubusercontent.com/72515939/197660493-da4d5b6e-e582-45fa-ac15-8814615fe6e7.png">
<img width="908" alt="Page 12" src="https://user-images.githubusercontent.com/72515939/197660498-d5e7e35b-a21f-4e31-b9f6-d74342f329fb.png">
<img width="908" alt="Page 13" src="https://user-images.githubusercontent.com/72515939/197660500-06ed43b3-7b23-4a15-a8e4-961dfb49d67f.png">
<img width="908" alt="Page 14" src="https://user-images.githubusercontent.com/72515939/197660504-345b5af1-1536-43c9-ba41-096e3cca5a44.png">
<img width="908" alt="Page 15" src="https://user-images.githubusercontent.com/72515939/197660509-8d0ac9e6-8a7c-41f5-8b74-a75e12526128.png">
<img width="908" alt="Page 16" src="https://user-images.githubusercontent.com/72515939/197660515-b1114821-1308-4a34-8a7e-ca000d3db842.png">
</p></div>


#### Download
- [**Clover 5149**](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/v5149.zip) Pre-Build
- [**OpenCore 0.8.5**](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/v0.8.5.zip) Pre-Build

> Both **config.plist** sensitive data is removed
---

#### References

[**AppleLife**](https://applelife.ru/)
> @ [**Dumps of system information of Apple computers**](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)

---

### Acknowledgement                                 

* [**Acidanthera**](https://github.com/acidanthera) for [**OpenCorePkg**](https://github.com/acidanthera/OpenCorePkg) 
* [**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/) for [**OC Guides**](https://dortania.github.io/OpenCore-Install-Guide/)
* [**corpnewt**](https://github.com/corpnewt) for [**DevicePath**](https://github.com/corpnewt/DevicePath)
* [**dreamwhite**](https://github.com/dreamwhite) for [**OC-Anonymizer**](https://github.com/dreamwhite/OC-Anonymizer)                                             
* [**5T33Z0**](https://github.com/5T33Z0) for [**OC Little Translate**](https://github.com/5T33Z0/OC-Little-Translated) 
