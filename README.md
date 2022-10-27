# ASRock B460M Steel Legend

**Hackintosh: 10th Gen Intel Comet Lake with B460M Steel Legend with OpenCore 0.8.5**

<div align="justify">
  <p><strong>My word:</strong> - <strong>"It's merely cosmetic"</strong>, according to some. For me, this content is not just for show. <strong>Configuration?</strong>, You can play with <strong>config.plist</strong> and experiment with it. But heed the warning—if the file is not saved properly, it may get corrupted. This issue sometimes happen due to; <strong>restart before saving</strong> , &nbsp;<strong>erroneously input or  non-format input</strong>. I'm not interested to share my personal <strong>EFI</strong>, and not meant to be used by other people or systems. If you're still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>plist configuration</strong> and <strong>SSDTs</strong> according to your system. <strong>ACPI?</strong>, You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck. My advise is not to modify your <strong>DSDTs</strong>. <strong>DSDT's</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. This is not full feature guide. OpenCore and Clover sample is attached as a learning curve. Please be careful what you're read, copy and modified all these stuffs. Do a research first.</p>
</div>

> **Note**: SMBIOS is pre-generated. Since this attachment is just an example, please change SMBIOS matched with your settings. Refer [Choose The Right SMBIOS](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html) and [Platform Info](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#platforminfo) by Dortania.

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

### Processor

#### Intel® Core™ i5-10400

```zsh
Code Name                   : Comet Lake
```

> **Note**: Start from macOS 12.3, [SSDT-PLUG.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [plugin-type=1](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [x86PlatformPlugin](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default. Check out [thread](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/) / [Acidanthera Bugtracker Issues #2013](https://github.com/acidanthera/bugtracker/issues/2013) / [Dortania Bugtracker Issues #269](https://github.com/dortania/bugtracker/issues/269) / [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

### Graphics

<div align=center>
  
<img width="1017" alt="2022-10-27_22-19-30" src="https://user-images.githubusercontent.com/72515939/198311969-4949a162-ad67-4e35-8738-f996716d0518.png">

</div>

#### IGPU (Headless)

```zsh
GPU Name                    : Intel® UHD Graphics 630
GPU Device ID               : 0xC59B8086
```

> **Note**: With a few exceptions, like headless Intel® KBL Unknown "0xC59B8086", certain strange name artefacts are present. There is no performance impact from this artefact. As of right now, device-id spoofing has been successful in altering its name to Intel® UHD Graphics 630. Without a doubt, only through the headless "0x3E9B8086". The real iMac20,1 uses Intel® HD Graphics "0xC89B8086" instead of Intel® UHD Graphics. Additionally, the Comet Lake processor was first used in the iMac20,1 before being officially released. Checkout [Headless framebuffers](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add-2) / [Enabling Metal Support](https://github.com/5T33Z0/OC-Little-Translated/tree/main/11_Graphics/Metal_3#enabling-metal-3-support-and-gpu-tab-in-activity-monitor) / [Acidanthera Bugtracker Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)

#### GFX0 (Display)

<div align=center>
  
<img width="919" alt="2022-10-27_22-23-02" src="https://user-images.githubusercontent.com/72515939/198312790-4dffdc77-6e9e-4463-89e9-1bb02c7bd054.png">

</div>
  
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

- `pci-bridge0`- rename to `PEGP`
- `pci-bridge1`- rename to `BRG0`

<div align=center>

<img width="917" alt="2022-10-27_22-48-54" src="https://user-images.githubusercontent.com/72515939/198322516-083df5a4-c15e-451c-9371-582ef3597d0a.png">

</div>

- `GFX0`- with `_SUN` properties, `agdpmod=pikera`
- `HDAU`- with `_SUN` properties

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### PCI Devices

<div align=center>  
  
<img width="919" alt="2022-10-27_22-23-24" src="https://user-images.githubusercontent.com/72515939/198312992-ae285354-a2d3-486b-b7e8-13addb08747d.png">

</div>
  
#### Other Patches

<div align=center>

<img width="2133" alt="2022-10-27_22-52-31" src="https://user-images.githubusercontent.com/72515939/198324011-917702b0-2d1a-4298-b10a-e7c7a3c6e9d2.png">

</div>

- `GFX0`- rename as `IGPU` (Headless)
- `HDAS`- rename as `HDEF`
- `HECI`- rename as `IMEI`
- `HDAU`- with `_SUN` properties
- `EC`- Fake Embedded Controller
- ` HPET`- High Precision Event Timer Fix (Optional)
- `RP05.PXSX`- rename as `XHC2`, with `_SUN` properties
- `RP09.PXSX`- rename as `ANS0`, AppleSSDController patch
- `RP20.PXSX`- rename as `ARPT`, with `_SUN` properties
- `RP21.PXSX`- renamed as `ANS1`, AppleSSDController patch
- `SBUS`- compatible `smbus` and `diagsvault` patch
- `USBX`- USB Power Management patch

> **Note**: This is not just cosmetics. Device is injected with properties.

#### Cosmetics

- `ALSD`- Ambient Light Sensor, `AppleLMUController` (Optional)
- `FWHD`- Fake Firmware Hub Device (Optional for 300 / 400 Series)
- `PPMC`- device unrecognised and rename. (Not compatible)
- `PMCR`- Fake Power Management Capabilities Register
- `RP04.PXSX`- rename as `RTLK`
- `SAT0`- rename as `SATA`
- `TSUB`- device unrecognised and rename. (Not compatible)
- `XHC`- renamed as `XHC1`

> **Note**: This is just cosmetics. However, inaccurate rename method can cause an issue. Use at your own risk!.

### Validate

#### Check Build Number:

  * Input:
```zsh
sw_vers
```
  * Output:
```zsh
ProductName:		macOS
ProductVersion:		13.0
BuildVersion:		22A380
```

#### Check Kernel Version:

  * Input:
```zsh
uname -r
```
  * Output:
```zsh
22.1.0
```

#### Check Bus & Frequency:

  * Input:
```zsh
sysctl -a | grep freq
```

  * Output:
```zsh
net.link.fake.switch_mode_frequency: 10
hw.busfrequency: 400000000
hw.busfrequency_min: 400000000
hw.busfrequency_max: 400000000
hw.cpufrequency: 2900000000
hw.cpufrequency_min: 2900000000
hw.cpufrequency_max: 2900000000
hw.tbfrequency: 1000000000
machdep.tsc.frequency: 2903996007
```

#### Check CPU Vendor:

  * Input:
```zsh
sysctl -a | grep machdep.cpu.vendor
```
  * Output:
```zsh
machdep.cpu.vendor: GenuineIntel
```

#### Check CPU Brand String:

  * Input:
```zsh
sysctl machdep.cpu.brand_string
```
  * Output:
```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

#### Check CPU Features:

  * Input:
```zsh
sysctl -a | grep machdep.cpu.features
```
  * Output:
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

#### Check Instruction Set:

  * Input:
```zsh
sysctl -a | grep machdep.cpu.leaf7_features
```
  * Output:
```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### Check CPU Full Features:

  * Input:
```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```
  * Output:
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

#### Check CPU Details:

  * Input:
```zsh
ioreg -rxn "PR00@0"
```
  * Output:
```zsh
+-o PR00@0  <class IOACPIPlatformDevice, id 0x10000013f, registered, matched, a$
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
  +-o AppleACPICPU  <class AppleACPICPU, id 0x100000154, registered, matched, a$
  | +-o AppleACPICPUInterruptController  <class AppleACPICPUInterruptController$
  | +-o X86PlatformPlugin  <class X86PlatformPlugin, id 0x1000004b0, registered$
  |   +-o IOPlatformEnabler  <class IOPlatformPluginDevice, id 0x10000057f, reg$
  |   | +-o ApplePlatformEnabler  <class ApplePlatformEnabler, id 0x100000584, $
  |   +-o AGPMEnabler  <class IOPlatformPluginDevice, id 0x100000580, registere$
  |   | +-o AGPMController  <class AGPMController, id 0x100000583, !registered,$
  |   +-o X86PlatformShim  <class X86PlatformShim, id 0x100000582, !registered,$
  +-o SMCProcessor  <class SMCProcessor, id 0x100000155, !registered, !matched,$
```

#### Check SIP (System Integrity Protection):

  * Input:
```zsh
csrutil status
```
  * Output:
```zsh
System Integrity Protection status: enabled.
```

#### Find Wake Issue:

  * Input:
```zsh
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```

  * Output:
    * Sleep/Wake Issue Example:

```zsh
2022-10-26 09:31:20 +0800 Sleep               	Entering DarkWake state due to 'Idle Sleep':TCPKeepAlive=active Using AC (Charge:0%) 2 secs    
2022-10-26 09:31:22 +0800 Wake                	DarkWake to FullWake from Invalid [CDNVA] : due to HID Activity Using AC (Charge:0%) 0 secs    
2022-10-26 09:31:22 +0800 Sleep               	Entering DarkWake state due to 'Software Sleep pid=173':TCPKeepAlive=active Using AC (Charge:0%) 5 secs    
2022-10-26 09:31:27 +0800 Wake                	DarkWake to FullWake from Invalid [CDNVA] : due to HID Activity Using AC (Charge:0%)  
```
> **Note**: Head to [GPRW/UPRW/LANC Instant Wake Patch](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html) if output as above. Sometimes, dortania solution does't fix this issue. From my experience personally, just clean install macOS. This happen to me when upgrading Monterey to Ventura. Other than that, if no output, this mean the machine has no sleep and wake issues. Whatever happen, try Dortania method first.

  * Output:
    * Sleep/Wake Issue Fix Example (After Clean Install):

<div align=center>
<img width="788" alt="2022-10-27_22-20-09" src="https://user-images.githubusercontent.com/72515939/198312156-62d91cbc-01a5-4ff9-a0eb-ddf61636f4ef.png">
</div>

#### Lists any ACPI Error:

  * Input:
```zsh
log show --last boot | grep AppleACPIPlatform > ~/Desktop/Log_"$(date '+%Y-%m-%d_%H-%M-%S')".log
```
> **Note**: This will export ACPI log to desktop. Better logging and results is by using OpenCore-Debug

#### Verify SMBUS/SBUS:

  * Input:
```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```
  * Output:
```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
  150    0 0xffffff7f95eb5000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 27454DC4-17BA-3D0C-AD38-E7EDD2C69545 <17 7 6 3>
  161    1 0xffffff7f95ea9000 0x6ffd     0x6ffd     com.apple.driver.AppleSMBusController (1.0.18d1) 67C1DE20-8B96-3253-B373-5F234037AA59 <69 17 16 7 6 3>
```

#### Verify Plugin-Type=1:

  * Input:
```zsh
sysctl machdep.xcpm.mode
```
  * Output:
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

### Compatible with

```zsh
Catalina  =  Passed (UEFI > APFS: MinDate=20200306 and MinVersion=1412101001000000, SecureBootModel: j185)
BigSur    =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Monterey  =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Ventura   =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
```

### References

#### [AppleLife](https://applelife.ru/) and [Mac's Darwin Dumps](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)
```zsh
curl -L "https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/Real%20iMac%2020%2C1.zip"
```

---

### Acknowledgement

- [**Acidanthera**](https://github.com/acidanthera) for
```zsh
git clone https://github.com/acidanthera/OpenCorePkg.git
```

- [**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/) for 
```zsh
git clone https://github.com/dortania/OpenCore-Install-Guide.git
```

- [**corpnewt**](https://github.com/corpnewt) for 
```zsh
git clone https://github.com/corpnewt/DevicePath.git
```

- [**dreamwhite**](https://github.com/dreamwhite) for
```zsh
git clone https://github.com/dreamwhite/OC-Anonymizer.git
```

- [**5T33Z0**](https://github.com/5T33Z0) for
```zsh
git clone https://github.com/5T33Z0/OC-Little-Translated.git
```
