# ASRock B460M Steel Legend
**Hackintosh: 10th Gen Intel Comet Lake with B460M Steel Legend with OpenCore 0.8.5 & Clover 5149 Configuration**

<div align="justify">
  <p><strong>My word:</strong> - <strong>"It's merely cosmetic"</strong>, according to some. For me, this content is not just for show. <strong>Configuration?</strong>, You can play with <strong>config.plist</strong> and experiment with it. But heed the warning—if the file is not saved properly, it may get corrupted. This issue sometimes happen due to; <strong>restart before saving</strong> , &nbsp;<strong>erroneously input or  non-format input</strong>. I'm not interested to share my personal <strong>EFI</strong>, and not meant to be used by other people or systems. If you're still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>plist configuration</strong> and <strong>SSDTs</strong> according to your system. <strong>ACPI?</strong>, You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck. My advise is not to modify your <strong>DSDTs</strong>. <strong>DSDT's</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. This is not full feature guide. OpenCore and Clover sample is attached as a learning curve. Please be careful what you're read, copy and modified all these stuffs. Do a research first.</p>
</div>

> **Note**:	SMBIOS is pre-generated. Since this attachment is just an example, please change SMBIOS matched with your settings. Refer [**Choose The Right SMBIOS**](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html) and [**Platform Info**](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#platforminfo) by Dortania.

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

### Basic Info

<div align="center"><p><img width="500" src="https://user-images.githubusercontent.com/72515939/197660662-25adbd37-64af-43c4-ba79-b1a2e06117a4.png" alt="2022-09-29_15-54-05"></p></div>

### Processor

#### Intel® Core™ i5-10400

```zsh
Code Name                   : Comet Lake
```
> **Note**: Start from macOS 12.3, [SSDT-PLUG.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [plugin-type=1](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [x86PlatformPlugin](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default. Check out [thread](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/) / [Acidanthera Bugtracker Issues #2013](https://github.com/acidanthera/bugtracker/issues/2013) / [Dortania Bugtracker Issues #269](https://github.com/dortania/bugtracker/issues/269) / [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

### Graphics

#### IGPU (Headless)

```zsh
GPU Name                    : Intel® UHD Graphics 630
GPU Device ID               : 0xC59B8086
```
> **Note**: With a few exceptions, like headless Intel® KBL Unknown "0xC59B8086", certain strange name artefacts are present. There is no performance impact from this artefact. As of right now, device-id spoofing has been successful in altering its name to Intel® UHD Graphics 630. Without a doubt, only through the headless "0x3E9B8086". The real iMac20,1 uses Intel® HD Graphics "0xC89B8086" instead of Intel® UHD Graphics. Additionally, the Comet Lake processor was first used in the iMac20,1 before being officially released. Checkout  [Headless framebuffers](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add-2) / [Enabling Metal Support](https://github.com/5T33Z0/OC-Little-Translated/tree/main/11_Graphics/Metal_3#enabling-metal-3-support-and-gpu-tab-in-activity-monitor) / [Acidanthera Bugtracker Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)

#### GFX0 (Display)

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

| **Device**                      | **Details**                                                                    |
| ------------------------------- | ------------------------------------------------------------------------------ |
| SB.PCI0.PEG0.pci-bridge0/0      | Navi 10 XL Upstream Port (pci-bridge0 to PEGP)                                 |
| SB.PCI0.PEG0.pci-bridge1/0      | Navi 10 XL Downstream Port (pci-bridge1 to BRG0)                               |
| SB.PCI0.PEG0.pci-bridge1/0.GFX0 | Navi 14 Radeon RX 5500 / 5500M / Pro 5500M (include with _SUN, properties)     |
| SB.PCI0.PEG0.pci-bridge1/0.HDAU | Navi 10 HDMI Audio (include with _SUN, properties)                             |

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### PCI Devices

#### Patches

| **Device**                      | **Details**                                                                                               |
| ------------------------------- | --------------------------------------------------------------------------------------------------------- |          
| SB.PCI0.GFX0                    | Intel UHD Graphics 630 (rename as IGPU)                                                                   |
| SB.PCI0.HDAS                    | Comet Lake PCH-V cAVS (renamed as HDEF)                                                                   |
| SB.PCI0.HECI                    | Comet Lake PCH-V HECI Controller (Renamed as IMEI)                                                        |
| SB.PCI0.LPCB.EC                 | Fake Embeded Controller                                                                                   |
| SB.PCI0.LPCB.HPET               | High Precision Event Timer                                                                                |
| SB.PCI0.PEG0.pci-bridge1/0.GFX0 | Navi 14 Radeon RX 5500 / 5500M / Pro 5500M (include with _SUN, properties)                                |
| SB.PCI0.PEG0.pci-bridge1/0.HDAU | Navi 10 HDMI Audio (include with _SUN, properties)                                                        |
| SB.PCI0.RP05.PXSX               | VL805/806 xHCI USB 3.0 Controller (renamed as XHC2, added built-in, include with _SUN properties)         |
| SB.PCI0.RP09.PXSX               | Kingston SA2000M8500G M.2 (renamed as ANS0, include AppleSSDController patch)                             |
| SB.PCI0.RP20.PXSX               | BCM4360 802.11ac Wireless Network Adapter (renamed as ARPT, added built-in, include with _SUN properties) |
| SB.PCI0.RP21.PXSX               | Kingston SA2000M8500G M.2 Slot 1 (renamed as ANS1, include AppleSSDController patch)                      |            
| SB.PCI0.SBUS                    | Serial Bus                                                                                                |                         
| SB.USBX                         | USB Power Management                                                                                      |
| _DSM                            | Device Specific Method                                                                                    |
| GPRW                            | Native _PRW method for Power Resource for Wake                                                            |
| STAS                            | _STA method, to enable such status changes to be communicated to the operating system.                    |

#### Cosmetics

| **Device**                      | **Details**                                                                                               |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------|
| ALSD                            | Ambient Light Sensor enable (AppleLMUController)                                                          |           
| SB.PCI0.LPCB.FWHD               | Fake Firmware Hub Device (Optional for 300 / 400 Series)                                                  |
| SB.PCI0.PPMC                    | Programmable Power Management Controller. Device rename. Not compatible with macOS                        |
| SB.PCI0.PMCR                    | Fake Power Management Capabilities Register.                                                              |
| SB.PCI0.RP04.PXSX               | Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet (renamed as RTLK)                                       |
| SB.PCI0.SAT0                    | 400 Series Chipset Family SATA AHCI Controller (renamed as SATA)                                          |
| SB.PCI0.TSUB                    | Thermal Subsystem. Device rename. Not compatible with macOS                                               |
| SB.PCI0.XHC                     | 300/400 Series PCH-V USB Controller (renamed as XHC1)                                                     |
| ALSE                            | ALSE method for Ambient Light Sensor                                                                      |

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### Secondary System Description Tables

#### [SSDT-PatchOC](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/SSDT-PatchOC.dsl) 

```zsh
Current Bootable            : Catalina, Monterey, Ventura
```

### Validate

#### Check Build Number:

```zsh
sw_vers
```
```zsh
ProductName:	macOS
ProductVersion:	13.0
BuildVersion:	22A380
```

#### Check Kernel Version:

```zsh
 uname -r
```
 ```zsh
22.1.0
```

#### Check Bus & Frequency:

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

#### Check CPU Vendor:

```zsh
sysctl -a | grep machdep.cpu.vendor
```
```zsh
machdep.cpu.vendor: GenuineIntel
```

#### Check CPU Brand String:

```zsh
sysctl machdep.cpu.brand_string
``` 
```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

#### Check CPU Features:

```zsh
sysctl -a | grep machdep.cpu.features
```
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### Check CPU Full Features:

```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### Check CPU Details:

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

#### Verify SMBUS/SBUS:

```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```
```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
148    0 0xffffff7f98f8e000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) C0C24D4F-420F-3AD1-9039-AFA08E9524FF <16 7 6 3>
153    1 0xffffff7f98f82000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) 7ECD5D2C-E62F-3C6D-ACD7-D90B7443024D <152 16 15 7 6 3>
```

#### Verify Plugin-Type=1:

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

</p></div>

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
