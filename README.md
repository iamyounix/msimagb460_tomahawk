# ASRock B460M Steel Legend

Hackintosh: 10th Gen Comet Lake with B460M Steel Legend Configuration

---

<div align="center"><p><img width="800" src="https://user-images.githubusercontent.com/72515939/192975564-4f14fa9c-1f93-4aa2-93ea-d1d16287f608.png" alt="2022-09-29_15-54-05"></p></div>


<div align="justify"><p><strong>Reminders:</strong> - <b>"It&#39;s merely cosmetic"</b>, according to some. For me, this content is not just for show. You may see how <strong>ACPI</strong> impacts the operating system. Incorrect device renaming through <strong>SSDTs</strong> will results the operating system getting stuck on the Apple Boot. I am strongly advised to not to modify your <strong>DSDTs</strong>. <strong>DSDT&#39;s</strong> (Primary Table) modification method will results more difficulties to your machine and harm your BIOS directly. I recommend <strong>SSDTs</strong> (Secondary Table) modifications, since this way are more <strong>dynamic</strong> and <strong>safe</strong>. Device renaming is not necessary for recognised and functional devices unless the devices are not identified or displayed via IOreg or require extra tweaks, especially if your computer contains multiple bootable OSes. Some sections from provided <strong>config.plist</strong> have been censored. I&#39;m not interested to share my personal config.plist (EFI), and not meant to be used by other people or systems. If you&#39;re still interested in utilising it, please be <strong>careful</strong> to adjust the <strong>SSDTs</strong> and <strong>plist</strong> according to your system. </p></div>


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

#### Instruction
- [x] Working
- [ ] Not Working

##### PCI list
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

**Device Patch vis SSDT**

| **Device**                      | **Details**                                                                                                |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| SB.PCI0.DRAM                    | Comet Lake-S 6c Host Bridge/DRAM Controller                                                                |
| SB.PCI0.GFX0                    | Intel UHD Graphics 630 (Renamed as `IGPU`)                                                                 |
| SB.PCI0.HDAS                    | Comet Lake PCH-V cAVS (Renamed as `HDEF`)                                                                  |
| SB.PCI0.HECI                    | Comet Lake PCH-V HECI Controller (Renamed as `IMEI`)                                                       |
| SB.PCI0.LPCB                    | B460M Low Pin Count Bus                                                                                    |
| SB.PCI0.LPCB.EC                 | Fake Embeded Controller                                                                                    |
| SB.PCI0.LPCB.FWHD               | Fake Firmware Hub Device (Optional for `300 / 400` Series)                                                 |
| SB.PCI0.LPCB.HPET               | High Precision Event Timer                                                                                 |
| SB.PCI0.PEG0                    | 6th-10th Gen Core Processor PCIe Controller x16 (Renamed as `PEGP`)                                        |
| SB.PCI0.PEG0.pci-bridge0/0      | Navi 10 XL Upstream Port (Renamed as `EGP0`)                                                               |
| SB.PCI0.PEG0.pci-bridge1/0      | Navi 10 XL Downstream Port (Renamed as `EGP1`)                                                             |
| SB.PCI0.PEG0.pci-bridge1/0.GFX0 | Navi 14 Radeon RX 5500 / 5500M / Pro 5500M                                                                 |
| SB.PCI0.PEG0.pci-bridge1/0.HDAU | Navi 10 HDMI Audio                                                                                         |
| SB.PCI0.PPMC                    | Programmable Power Management Controller. `Not compatible` with macOS                                      |
| SB.PCI0.PMCR                    | Fake Power Management Capabilities Register. Replacing the function of `PPMC`                              |
| SB.PCI0.RP04.PXSX               | Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet (Renamed as `RTLK`)                                      |
| SB.PCI0.RP05.PXSX               | VL805/806 xHCI USB 3.0 Controller (Renamed as `XHC2`)                                                      |
| SB.PCI0.RP09.PXSX               | Kingston SA2000M8500G M.2 Slot 0 (Renamed as `ANS0`)                                                       |
| SB.PCI0.RP20.PXSX               | BCM4360 802.11ac Wireless Network Adapter (Renamed as `ARPT`)                                              |
| SB.PCI0.RP21.PXSX               | Kingston SA2000M8500G M.2 Slot 1 (Renamed as `ANS1`)                                                       |
| SB.PCI0.SAT0                    | 400 Series Chipset Family SATA AHCI Controller (Renamed as `SATA`)                                         |
| SB.PCI0.SBUS                    | Serial Bus                                                                                                 |
| SB.PCI0.TSUB                    | Thermal Subsystem. `Not compatible` with macOS                                                             |
| SB.PCI0.XHC                     | 300/400 Series PCH-V USB Controller (Renamed as `XHC1`)                                                    |
| SB.USBX                         | USB Power Management                                                                                       |
| SB.STAS                         | `_STA` method, to enable such status changes to be communicated to the operating system.                   |

> **Note:** Start from **macOS 12.3**, [SSDT-PLUG.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or [plugin-type=1](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) is not required. The [x86PlatformPlugin](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) is enabled by default on Skylake and Comet Lake. **Refer** original [thread](https://www.insanelymac.com/forum/topic/351675-macos-12-monterey-x86platformplugin-without-plugin-type1/), [Dortania/Bugtracker Issue #2013](https://github.com/acidanthera/bugtracker/issues/2013) and [Dortania/Bugtracker Issue #269](https://github.com/dortania/bugtracker/issues/269).

<br>

<div align="center"><p><img width="800" alt="2022-09-29_15-58-49" src="https://user-images.githubusercontent.com/72515939/192975908-173cad9b-4bdf-4f73-92c5-5ee2103c64c0.png"></p></div>

---

## Test My Hack

### Build Number:

-   Input
```zsh
sw_vers
```
-   Output
```zsh
ProductName:	macOS
ProductVersion:	12.6
BuildVersion:	21G115
```

### Kernel Version:

-   Input
```zsh
 uname -r
```
-   Output
 ```zsh
21.6.0
```

### Bus and Frequency:

-   Input
```zsh
sysctl -a | grep freq
```
-   Output
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

### CPU Vendor:

-   Input
```zsh
sysctl -a | grep machdep.cpu.vendor
```
-   Output
```zsh
machdep.cpu.vendor: GenuineIntel
```

### CPU Brand String:

-   Input
```zsh
sysctl machdep.cpu.brand_string
```
-   Output     
```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

### CPU Features:

-   Input 
```zsh
sysctl -a | grep machdep.cpu.features
```
-   Output 
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

### CPU Full Features:

-   Input   
```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```
-   Output
```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

### CPU Details:

-   Input
```zsh
ioreg -rxn "PR00@0"
```
-   Output
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

### Check System Integrity Protection:
-   Input
```zsh
csrutil status
```
-   Output
```zsh
System Integrity Protection status: enabled.
```

### Find Wake Issue:

-   Input
```zsh
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```
-   Output
```zsh
Empty
```

### Lists any ACPI Error:

-   Input (w/o log)
```zsh
log show --last boot | grep AppleACPIPlatform
```
-   Input (w/ log)
```zsh
log show --last boot | grep AppleACPIPlatform > ~/Desktop/Log_"$(date '+%Y-%m-%d_%H-%M-%S')".log
```

- **Refer Output:** [https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/ASRockB460%20ACPI%20Debug.log)

### Supported Instruction Set:

-   Input
```zsh
sysctl -a | grep machdep.cpu.leaf7_features
```
-   Output
```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

### Verify Working SMBUS/SBUS:

-   Input
```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```
-   Output
```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
148    0 0xffffff7f98f8e000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) C0C24D4F-420F-3AD1-9039-AFA08E9524FF <16 7 6 3>
153    1 0xffffff7f98f82000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) 7ECD5D2C-E62F-3C6D-ACD7-D90B7443024D <152 16 15 7 6 3>
```

### Verify Plugin Type 1:

-   Input
```zsh
sysctl machdep.xcpm.mode`
```
-   Output
```zsh
machdep.xcpm.mode: 1
```

### 4K Video test via Youtube

- **Refer Output:** [4k Test](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/4k%20test.gif)


---

## Acknowledgement                                 

[**Acidanthera**](https://github.com/acidanthera)
- Maintaining OpenCorePkg 
                          
[**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/)
- Updating OC Guides                                
                            
[**5T33Z0**](https://github.com/5T33Z0)
- OC Little Translate 

[**References**](https://applelife.ru/threads/dampy-originalnyx-makov.2943712/)
- Dont Ask!
