# ASRock B460M Steel Legend

**Hackintosh: 10th Gen Intel Comet Lake with B460M Steel Legend with OpenCore 0.8.5**

<div align=justify>
  <p><strong>My word:</strong> - <strong>"It's merely cosmetic"</strong>, according to some. For me, this content is not just for show. <strong>Configuration?</strong>, You can play with <strong>config.plist</strong> and experiment with it. But heed the warning—if the file is not saved properly, it may get corrupted. This issue sometimes happen due to; <strong>restart before saving</strong> , &nbsp;<strong>erroneously input or  non-format input</strong>. I'm not interested to share my personal <strong>EFI</strong>, and not meant to be used by other people or systems. If you're still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>plist configuration</strong> and <strong>SSDTs</strong> according to your system. <strong>ACPI?</strong>, You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck. My advise is not to modify your <strong>DSDTs</strong>. <strong>DSDT's</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. This is not full feature guide. OpenCore and Clover sample is attached as a learning curve. Please be careful what you're read, copy and modified all these stuffs. Do a research first.</p>
</div>

> **Note**: SMBIOS is pre-generated. Since this attachment is just an example, please change SMBIOS matched with your settings. Refer [Choose The Right SMBIOS](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html) and [Platform Info](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#platforminfo) by Dortania.

### Sample

Download [here](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/OC085.zip)

### OpenCore EFI Structure

<div align=center>
	
![EFI drawio](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/EFI.png)

</div>
	
### Processor

#### Intel® Core™ i5-10400

```zsh
Code Name                   : Comet Lake
```

> **Note**: Start from macOS 12.3, [SSDT-PLUG.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [plugin-type=1](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [x86PlatformPlugin](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default. Check out [thread](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/) / [Acidanthera Bugtracker Issues #2013](https://github.com/acidanthera/bugtracker/issues/2013) / [Dortania Bugtracker Issues #269](https://github.com/dortania/bugtracker/issues/269) / [Intel Ark](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

### Graphics

<div align=center>
  
![GPU](https://user-images.githubusercontent.com/72515939/199858587-831f2951-1ed5-48d3-890a-da5c8e85c4d0.png)

</div>

#### IGPU (Headless)

* Current

```zsh
GPU Name                    : Intel® UHD Graphics 630
GPU Device ID               : 0xC59B8086
Mobile			    : No
```
<div align=center>

![IGPU9BC5](https://user-images.githubusercontent.com/72515939/199859156-609ae9b5-c6cb-4280-b8fd-65d5e289333a.png)

</div>

* Used

```zsh
GPU Name                    : Intel® UHD Graphics 630
GPU Device ID               : 0x3E928086
Mobile			    : No
```
<div align=center>

![IGPU923E](https://user-images.githubusercontent.com/72515939/199859350-19b5d82e-9c1f-4b5c-a00f-a392587819b6.png)

</div>

**Patch via config.plist**

* PciRoot(0x0)/Pci(0x2,0x0)
	* AAPL,ig-platform-id / data / `0300923E`
	* AAPL,slot-name / string / `Slot- 0`
	* built-in / data / `00`
	* device-id / data / `9B3E0000`
	* enable-metal / data / `01000000`
	* igfxfw / data / `02000000`
	* igfxonln / data / `01000000`
	* iommu-selection / data / `00000000`
	* name / string / `IGPU`

> **Note**: With a few exceptions, like headless Intel® KBL Unknown "0xC59B8086", certain strange name artefacts are present. There is no performance impact from this artefact. As of right now, device-id spoofing has been successful in altering its name to Intel® UHD Graphics 630. Without a doubt, only through the headless "0x3E9B8086". The real iMac20,1 uses Intel® HD Graphics "0xC89B8086" instead of Intel® UHD Graphics. Additionally, the Comet Lake processor was first used in the iMac20,1 before being officially released. Checkout [Headless framebuffers](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#add-2) / [Enabling Metal Support](https://github.com/5T33Z0/OC-Little-Translated/tree/main/11_Graphics/Metal_3#enabling-metal-3-support-and-gpu-tab-in-activity-monitor) / [Acidanthera Bugtracker Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)

#### GFX0 (Display)

<div align=center>
  
![GFX0](https://user-images.githubusercontent.com/72515939/199858610-040a217e-95c3-4278-b5ff-c25da795a288.png)
![IOregGFX0](https://user-images.githubusercontent.com/72515939/199858868-2fcad4c5-b973-49c7-9287-24273814f5d2.png)

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

**Patch via ACPI**

- `pci-bridge0` = rename to `PEGP`
- `pci-bridge1` = rename to `BRG0`	
- `GFX0`= with `_SUN` properties, `agdpmod=pikera`
- `HDAU`= with `_SUN` properties

**Patch via config.plist**

* PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)
	* name / string / `PEGP`
	
* PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
	* name / string / `BRG0`
	
* PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
	* @0,AAPL,boot-display / data / `01000000`
	* @0,ATY,EFIDisplay / string / `DP1`
	* @0,compatible / string / `ATY,Python`
	* @0,display-type / string / `LCD`
	* @0,display_type / string / `display`
	* @0,name / string / `ATY,Python`
	* @1,compatible / string / `ATY,Python`
	* @1,display-type / string / `NONE`
	* @1,display_type / string / `display`
	* @1,name / string / `ATY,Python`
	* @2,compatible / string / `ATY,Python`
	* @2,display-type / string / `NONE`
	* @2,display_type / string / `display`
	* @2,name / string / `ATY,Python`
	* @3,compatible / string / `ATY,Python`
	* @3,display-type / string / `NONE`
	* @3,display_type / string / `display`
	* @3,name / string / `ATY,Python`
	* AAPL,slot-name / string / `Internal@0,1,0/0,0/0,0/0,0`
	* ATY,EFIBootMode / data / `00000100020000000000010001000000000000000000000000000000000000000000000000000000000100010000000000010000000300000050CFCD1C00000000000A0000400B0000A00000000000000000000000520000000000000000000000300000002000000001030000000A000000000000000100020000000000000000000000000000000000000000000A0000000000000100010000000000010000000300000050CFCD1C00000000000A0000400B0000A00000000000000000000000520000000000000000000000300000002000000001030000000A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100000000000100000003000000108FEC370000000000140000400B0000A0000000000000000000000052000000000000000000000030000000200000000103000000050000000000`
	* ATY,EFICompileDate / data / `4F63742031322032303139`
	* ATY,EFIDriverType / data / `02`
	* ATY,EFIEnabledMode / data / `04`
	* ATY,EFIVersion / data / `33312E302E31323032362E33`
	* ATY,EFIVersionB / string / `3131332D4D534954563338324D482E313631`
	* ATY,Rom# / string / `3131332D45585433373633352D303031`
	* ATY,copyright / string / `436F7079726967687420414D4420496E632E2020416C6C2052696768742052657365727665642E2020323030352D32303139`
	* StartupDisplay / data / `474E02000000000000140000400B0000108FEC370000000000140000400B0000A00000000000000000000000520000000000000000000000300000002000000003000000050000000000000000000000000000020000000000000000100632AE0100000000000000000A0000400B000050CFCD1C00000000000A0000400B0000A000000000000000000000005200000000000000000000003000000020000000030000000A0000000000000000000000000A000000000000100632AE0200000000000000000A0000400B000050CFCD1C00000000000A0000400B0000A000000000000000000000005200000000000000000000003000000020000000030000000A0000000000000000000000`
	* hda-gfx / string / `onboard-1`

			
* PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
	* hda-gfx / string / `onboard-1`
	* model / string / `Navi 10 HDMI Audio`
	* name / string / `HDAU`

> **Note**: Use at your own risk! In general, these patches have to be regarded as "experimental". They may work as intended but that's not guaranteed.

### PCI Devices

<div align=center>  
  
![PCI](https://user-images.githubusercontent.com/72515939/199859770-f821e5d9-3faf-4602-80ec-f00c03449b70.png)

</div>
  
#### Other Patches

<div align=center>

![OtherPatches](https://user-images.githubusercontent.com/72515939/199859915-ae709a8f-d2a7-40ee-b6cc-c7c3b138f094.png)

</div>

- `EC`- Fake Embedded Controller
- `GFX0`- rename as `IGPU` (Headless)
- `HDAS`- rename as `HDEF`
- `HDAU`- with `_SUN` properties
- `HECI`- rename as `IMEI`
- `HPET`- High Precision Event Timer Fix (Optional)
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
- `PMCR`- Fake Power Management Capabilities Register
- `PPMC`- device unrecognised and rename. (Not compatible)
- `RP04.PXSX`- rename as `RTLK`
- `SAT0`- rename as `SATA`
- `TSUB`- device unrecognised and rename. (Not compatible)
- `XHC`- renamed as `XHC1`

> **Note**: This is just cosmetics. However, inaccurate rename method can cause an issue. Use at your own risk!.

### Audio

  * ALCS1200A (Layout ID = 1)

#### Patch via ACPI

* No-hda-gfx = `0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00`
* No-idle-support = `0x00`

#### Patch via config.plist

* PciRoot(0x0)/Pci(0x1F,0x3)
	* layout-id / data / `01000000`
	* name / string / `HDEF`

<div align=center>

![Audio](https://user-images.githubusercontent.com/72515939/199860198-759ed5e5-3061-4be1-a05a-535b237bb9f0.png) 

</div>

  * AppleGFXHDADriver (Navi 10 HDMI Audio)

<div align=center>
  
![HDMIAu](https://user-images.githubusercontent.com/72515939/199860231-599aef27-f08e-46a6-a329-0e92cc32dc66.png)
  
</div>

### Quirks 

This config is based on OpenCore 0.8.5. 

#### ACPI / Quirks

* All False

#### Booter / Quirks

* AvoidRuntimeDefrag = `True`
* DevirtualiseMmio = `True`
* EnableSafeModeSlide = `True`
* ProtectUefiServices = `True`
* ProvideCustomSlide = `True`
* RebuildAppleMemoryMap = `True`
* ResizeAppleGpuBars = `-1`
* SyncRuntimePermissions = `True`

> **Note**: Other than above is `false`

#### Kernel / Quirks

* CustomSMBIOSGuid = `True` (Require PlatformInfo / Generic / UpdateSMBIOSMode = `Custom`)
* DisableLinkeditJettison = `True`
* PanicNoKextDump = `True`
* PowerTimeoutKernelPanic = `True`
* SetApfsTrimTimeout = `0`

> **Note**: Other than above is `false`

#### UEFI / Quirks

* EnableVectorAcceleration = `True`
* RequestBootVarRouting = `True`
* ResizeGpuBars = `-1`
* TscSyncTimeout = `0`
* SetApfsTrimTimeout = `0`

> **Note**: Other than above is `false`

### USB

<div align=center>

![USB](https://user-images.githubusercontent.com/72515939/199860343-2e2eefe1-94ab-480c-b2de-a2195f6bc9ca.png)

</div>

> **Note**: USB is mapped properly using [USBToolbox](https://github.com/USBToolBox/tool)

### NVRAM

<div align=center>
  
![NVRAM](https://user-images.githubusercontent.com/72515939/199860442-72bdf0a9-059d-41e9-8170-09f72ed3a9ea.png)

</div>
  
### NVMe

<div align=center>
  
![NVMe](https://user-images.githubusercontent.com/72515939/199860512-2aea8ec7-a63e-40fc-885d-e869b0410592.png)

</div>  

> **Note**: `ANS0` and `ANS1` as Apple SSD Controller

### IOACPIPlane Patch

<div align=center>

<img width="1195" alt="2022-10-30_21-41-20" src="https://user-images.githubusercontent.com/72515939/198882187-fddd24cb-b851-4bbe-a781-b39fb7321ef3.png">

</div>

> **Note**: Refer SSDT [Modular Mode](https://github.com/theofficialcopypaste/ASRockB460MSL/tree/main/SSDT%20Modular) and [Single Mode](https://github.com/theofficialcopypaste/ASRockB460MSL/tree/main/SSDT-Patch) for more info.

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

  * And generally you'll get output like these:

	* Wake [CDNVA] due to GLAN: Using AC
		* Generally caused by WakeOnLAN enabled, try to disable this option first in the BIOS
	* If WOL wasn't the issue, you can try the below patches
		* Wake [CDNVA] due to HDEF: Using AC
	* Similar to the GLAN issue
		* Wake [CDNVA] due to XHC: Using AC
	* Generally caused by WakeOnUSB enabled, try to disable this option first in the BIOS
		* GPRW patch is likely needed
	* DarkWake from Normal Sleep [CDNPB] : due to RTC/Maintenance Using AC
		* Generally caused by PowerNap
	* Wake reason: RTC (Alarm)
		* Generally caused by an app waking the system, quitting said app before you sleep should fix it


> **Note**: Head to [GPRW/UPRW/LANC Instant Wake Patch](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html) for more info.

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

### Compatible with

```zsh
Catalina  =  Passed (UEFI > APFS: MinDate=20200306 and MinVersion=1412101001000000, SecureBootModel: j185)
BigSur    =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Monterey  =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
Ventura   =  Passed (UEFI > APFS: MinDate and MinVersion 0, SecureBootModel: j185)
```
> **Note**: Warning: Not all Apple Secure Boot models are supported on all hardware configurations. Please refer [APFS Min Version & Min Date](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#apfs) / [SecureBootModel](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for more info.

### Clover Fans? 

Grab Sample [Here](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/CLVR5150.zip)

### References

#### [AppleLife](https://applelife.ru/) and [Mac's Darwin Dumps](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)
```zsh
curl -L "https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/Real%20iMac%2020%2C1.zip"
```

### BaseSystem Internet Recovery 

* Catalina
```zsh
python ./macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download
```
* Big Sur
```zsh
python ./macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download
```

* Monterey
```zsh
python ./macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download
```

* Ventura
```zsh
python3 ./macrecovery.py -b Mac-7BA5B2D9E42DDD94 download
```

> **Note**: [macrecovery](https://github.com/acidanthera/OpenCorePkg/releases) is required. Credit to [**dreamwhite**](https://github.com/dreamwhite) for discover [macOS Ventura Online Recovery Install](https://www.reddit.com/r/hackintosh/comments/yf3mzs/macos_ventura_internet_recovery_install/). To check [Python](http://softwarert.com) version, use `python -V` command on [Windows Powershell x64](https://github.com/PowerShell/PowerShell/releases/download/v7.2.7/PowerShell-7.2.7-win-x64.msi) and `python --version` on macOS Terminal. If you are using [Python 3](http://softwarert.com), change the command based on [Python](http://softwarert.com) version. ie: `python3 ./macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download`. This method will download `2` files, **BaseSystem.chunklist** and **BaseSystem.dmg**.

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

- [**dhinakg**](https://github.com/dhinakg) for
```zsh
git clone https://github.com/USBToolBox/tool.git
```

- [**corpnewt**](https://github.com/corpnewt) for 
```zsh
git clone https://github.com/corpnewt/DevicePath.git
```
```zsh
git clone https://github.com/corpnewt/SSDTTime.git
```

- [**dreamwhite**](https://github.com/dreamwhite) for
```zsh
git clone https://github.com/dreamwhite/OC-Anonymizer.git
```

- [**5T33Z0**](https://github.com/5T33Z0) for
```zsh
git clone https://github.com/5T33Z0/OC-Little-Translated.git
```
