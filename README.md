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

**Device Patch vis SSDT**[^1]

| **Device**    | **Details**                                                  |
| ------------- | ------------------------------------------------------------ |
| SB            | System Bus/Bus Objects are defined under this namespace      |
| PCI0          | PCI Root Bridge                                              |
| DRAM          | Comet Lake-S 6c Host Bridge/DRAM Controller                  |
| GFX0          | Intel UHD Graphics 630 (Renamed as `IGPU`)                   |
| HDAS          | Comet Lake PCH-V cAVS (Renamed as `HDEF`)                    |
| HDAU          | Navi 10 HDMI Audio                                           |
| HECI          | Comet Lake PCH-V HECI Controller (Renamed as `IMEI`)         |
| LPCB          | B460M Low Pin Count Bus                                      |
| EC            | Fake Embeded Controller                                      |
| FWHD          | Fake Firmware Hub Device (Optional)                          |
| HPET          | High Precision Event Timer                                   |
| PEG0          | 6th-10th Gen Core Processor PCIe Controller x16 (Renamed as `PEGP`) |
| pci-bridge0@0 | Navi 10 XL Upstream Port (Renamed as `EGP0`)                 |
| pci-bridge1@0 | Navi 10 XL Downstream Port (Renamed as `EGP1`)               |
| GFX0          | Navi 14 Radeon RX 5500/5500M / Pro 5500M                     |
| PPMC          | Programmable Power Management Controller. Found on 10th generation motherboards, not compatible with macOS |
| PMCR          | Fake Power Management Capabilities Register. Replacing the function of `PPMC` |
| RP04.PXSX     | Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet (Renamed as `RTLK`) |
| RP05.PXSX     | VL805/806 xHCI USB 3.0 Controller (Renamed as `XHC2`)        |
| RP09.PXSX     | Kingston SA2000M8500G M.2 Slot 0 (Renamed as `ANS0`)         |
| RP20.PXSX     | BCM4360 802.11ac Wireless Network Adapter (Renamed as `ARPT`) |
| RP21.PXSX     | Kingston SA2000M8500G M.2 Slot 1 (Renamed as `ANS1`)         |
| SAT0          | 400 Series Chipset Family SATA AHCI Controller (Renamed as `SATA`) |
| SBUS          | Serial Bus                                                   |
| TSUB          | Thermal Subsystem. Typically found on 10th generation motherboards, not compatible with macOS |
| XHC           | 300/400 Series PCH-V USB Controller (Renamed as `XHC1`)      |
| USBX          | USB Power Management                                         |
| DTGP          | Apple/MacOS standard method that passes through calls to `_DSM` on various device objects |
| STAS          | `_STA` method, to enable such status changes to be communicated to the operating system. |

> Note: Start from **macOS 12.3**, [**SSDT-PLUG.aml**](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) or **plugin-type=1** is not required. The **x86PlatformPlugin** is enabled by default in macOS 12.3+. **Refer** [Dortania/Bugtracker Issue #269](https://github.com/dortania/bugtracker/issues/269). 

```zsh
# With macOS 12.3 Beta 1, Apple dropped the 'plugin-type' check within X86PlatformPlugin
# Because of this, X86PP will match onto the CPU instead of ACPI_SMC_PlatformPlugin
# This causes power management to break on pre-Ivy Bridge CPUs as they don't have correct
# power management tables provided.
# This patch will simply increase ASPP's 'IOProbeScore' to outmatch X86PP
```
---

## Rename/Replace/On and Off, _STA Method

```asl
Scope (ABC)
{
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }
}

Device (ABDC)
{
    Name (_ADR, 0x00140000)  // _ADR: Address
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        If (_OSI ("Darwin")) 
        {
            Return (0x0F)
        }
        Else
        {
            Return (Zero)
        }
    }
}
```

**Explanation**

A more secure method to replace the object / device is demonstrated by the script above.

<p><div align="justify"></p>
<ol>
<li>Before making any property changes to the object, <code>Scope</code> is needed to manipulate devices i.e; <code>Scope (ABC)</code>. Typically indicate to actual device name in DSDTs/SSDTs. Then, <code>Method (_STA, 0, NotSerialized) / STA: Status</code> is to enable such status changes to be communicated to the operating system. In this case, device <code>ABC</code> is returning properties as <code>0</code> <code>(Zero)</code> or <code>false</code>, indicating that the device&#39;s features are deactivated. </li>
<li>A new name for object is injected <code>Device (ABDC)</code> by the address assigned same as DSDT/SSDT i.e; <code>_ADR, 0x00140000</code>. Again, <code>Method (_STA, 0, NotSerialized) / STA: Status</code> used to enable such status changes to be communicated to the operating system for a second rule.</li>
<li><code>If (_OSI (&quot;Darwin&quot;))</code> indicates, if the macOS Kernel is loaded, the device is accessible using the new name i.e; <code>Device (ABDC)</code>. <code>Else</code>, indicates if another OS/kernel is loaded, the inject properties are not accessible. The machine will assume the device continue to function normally as <code>ABC</code> via DSDTs. This method has been applied to certain devices via SSDT for functional Hackintosh via OpenCore / Clover.</div></li>
</ol>



## DTGP Method

```asl
DefinitionBlock ("", "SSDT", 2, "KGP ", "DTGP", 0x00001000)
{
    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
        {
            If ((Arg1 == One))
            {
                If ((Arg2 == Zero))
                {
                    Arg3 = Buffer (One)
                        {
                             0x03                                             // .
                        }
                    Return (One)
                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             // .
            }
        Return (Zero)
    }
}
```

**Explanation**

Inject Custom Parameters

<p><div align="justify"></p>
<ol>
<li><p>Nowadays, most users especially from <strong>Dortania Guide</strong> prefer independent SSDTs, each for a specific function. Most SSDTs already have the <code>DTGP</code> method incorporated. For this reason, it is currently not necessary to use <code>DTGP</code> method and information about it is not easily found. </p>
</li>
<li><p>Here, <code>DTGP</code> has been used with my sample. Most of the DSDTs that are present on the iMac employ the <code>DTGP</code> approach to inject capabilities and attributes into select devices. It is crucial that this method is simply built into macOS. <code>DTGP</code> method must be present at the DSDT in order to inject custom parameters to some devices. Without this method the modified DSDTs would not work well. Since this method is not available on <code>generic</code> DSDTs, this method was applied using SSDTs. Below is an example.</div></p>
</li>
</ol>



```asl
Scope (RPXX)
{
    Scope (PXSX)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (Zero)
        }
    }

    Device (ANSX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                    0x03                                             // .
                })
            }

            Local0 = Package (0x0A)
                {
                    "device_type", 
                    "NMVe", 
                    "model", 
                    "AppleSSDNVMe", 
                    "name", 
                    "ANSX", 
                    "device-id", 
                    Buffer (0x04)
                    {
                        x06, 0xA8, 0x00, 0x00                           // ....
                    }, 

                    "vendor-id", 
                    Buffer (0x04)
                    {
                        0x4D, 0x14, 0x00, 0x00                           // M...
                    }
                }
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }
}
```



## Test Build

**Build Number:** 
`sw_vers`

```zsh
ProductName:	macOS
ProductVersion:	12.6
BuildVersion:	21G115
```

**Kernel Version:** 
`uname -r`

```zsh
21.6.0
```

**Bus and Frequency:** 
`sysctl -a | grep freq`

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

**CPU Vendor:** 
`sysctl -a | grep machdep.cpu.vendor`

```zsh
machdep.cpu.vendor: GenuineIntel
```

**CPU Brand String:** 
`sysctl machdep.cpu.brand_string`

```zsh
machdep.cpu.brand_string: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
```

**CPU Features:** 
`sysctl -a | grep machdep.cpu.features`

```zsh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```

**CPU Full Features:** 

```zsh
sysctl -a | grep machdep.cpu.features
sysctl -a | grep machdep.cpu.leaf7_features
sysctl machdep.cpu | grep AVX
```

```zsh
sysctl machdep.cpu | grep AVX
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD

```

**CPU Details:** 
`ioreg -rxn "PR00@0"`

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

**Check System Integrity Protection:** 
`csrutil status`

```zsh
System Integrity Protection status: enabled.
```

**Find Wake Issue:** 
`pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"`

```zsh
Empty
```

**Lists any ACPI Error:** 

```zsh
log show --last boot | grep AppleACPIPlatform
log show --last boot | grep AppleACPIPlatform > ~/Desktop/Log_"$(date '+%Y-%m-%d_%H-%M-%S')".log
```
**Refer Output:** [Log_2022-09-29_14-40-24.log](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/Log_2022-09-29_14-40-24.log)

**Supported Instruction Set:** 
`sysctl -a | grep machdep.cpu.leaf7_features`

```zsh
machdep.cpu.leaf7_features: RDWRFSGS TSC_THREAD_OFFSET SGX BMI1 AVX2 SMEP BMI2 ERMS INVPCID FPU_CSDS MPX RDSEED ADX SMAP CLFSOPT IPT PKU SGXLC MDCLEAR IBRS STIBP L1DF ACAPMSR SSBD
```

**Verify Working SMBUS/SBUS:** 
`kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`

```zsh
Executing: /usr/bin/kmutil showloaded
No variant specified, falling back to release
  148    0 0xffffff7f98f8e000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) C0C24D4F-420F-3AD1-9039-AFA08E9524FF <16 7 6 3>
  153    1 0xffffff7f98f82000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) 7ECD5D2C-E62F-3C6D-ACD7-D90B7443024D <152 16 15 7 6 3>
```

---

## Acknowlegdement

☠ [**Acidanthera**](https://github.com/acidanthera) 

The one who brings Hackintosh this further 

☠ [**Dortania's OpenCore Install Guide**](https://dortania.github.io/OpenCore-Install-Guide/) 

Official guide for Hackintosh

☠ [**Hackintosh Malaysia**](https://www.facebook.com/groups/HackintoshMalaysia/about/) 

Official Facebook for Malaysia Hackintosh Community

☠ [**r/Hackintosh**](https://www.reddit.com/r/hackintosh/) 

A community for those looking to install macOS on their PC!

☠ [**5T33Z0**](https://github.com/5T33Z0) 

ACPI Hotpatches and Guides for the OpenCore Bootmanager. Enhance and fine-tune your system by adding devices and enabling additional features not covered in the OpenCore Install Guide.

☠ [**ic500k**](https://github.com/ic005k) 

References

☠ [**ACPI6.1**](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/ACPI_6_1.pdf) 


## Footnote

[^1]: [Config](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/config.plist) and [SSDT-B460MASL](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/SSDT-B460MASL.dsl)
