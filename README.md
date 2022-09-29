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

**SSDT Patch**[^1]
  - **_SB** = `System Bus/Bus Objects are defined under this namespace`
    - **PCI0** = `PCI Root Bridge`
      - [x] **DRAM** = `Comet Lake-S 6c Host Bridge/DRAM Controller` 
      - [x] **GFX0** = `Intel UHD Graphics 630` (Renamed as **IGPU**)
      - [x] **HDAS** = `Comet Lake PCH-V cAVS` (Renamed as **HDEF**)
      - [x] **HECI** = `Comet Lake PCH-V HECI Controller` (Renamed as **IMEI**)
      - [ ] **PPMC** = `Programmable Power Management Controller`. Found on 10th generation motherboards, **not compatible** with macOS
      - [x] **PMCR** = `Fake Power Management Capabilities Register`. Replacing the function of **PPMC**
      - [x] **SAT0** = `400 Series Chipset Family SATA AHCI Controller` (Renamed as **SATA**)
      - [x] **SBUS** = `Serial Bus`
      - [ ] **TSUB** = `Thermal Subsystem`. Typically found on 10th generation motherboards, **not compatible** with macOS
      - [x] **XHC** = `300/400 Series PCH-V USB Controller` (Renamed as **XHC1**)
      - [x] **USBX** = `USB Power Management`
      - [x] **DTGP** = `Apple/MacOS standard method` that passes through calls to `_DSM` on various Device objects
      - [x] **STAS** = `Status` Method
      * **LPCB** = `B460M Low Pin Count Bus`
        - [x] **EC** = `Fake Embeded Controller`
        - [x] **FWHD** = `Fake Firmware Hub Device`. **Optional**
        - [x] **HPET** = `High Precision Event Timer`
      * **PEG0** = `6th-10th Gen Core Processor PCIe Controller x16` (Renamed as **PEGP**)
        - [x] **pci-bridge0@0** = `Navi 10 XL Upstream Port` (Renamed as **EGP0**)
          - [x] **pci-bridge0@1** = `Navi 10 XL Downstream Port` (Renamed as **EGP1**)
            - [x] **GFX0** = `Navi 14` [Radeon RX 5500/5500M / Pro 5500M] 
            - [x] **HDAU** = `Navi 10` HDMI Audio
      * **RP04**
        - [x] **PXSX** = `Realtek RTL8125B PCI Express 2.5 Gigabit Ethernet` (Renamed as **RTLK**)
      * **RP05**
        - [x] **PXSX** = `VL805/806 xHCI USB 3.0 Controller` (Renamed as **XHC2**)
      * **RP09**
        - [x] **PXSX** = `Kingston SA2000M8500G M.2 Slot 0` (Renamed as **ANS0**)
      * **RP20**
        - [x] **PXSX** = `BCM4360 802.11ac Wireless Network Adapter` (Renamed as **ARPT**)
      * **RP21**
        - [x] **PXSX** = `Kingston SA2000M8500G M.2 Slot 1` (Renamed as **ANS1**)
      
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
<li>Before making any property changes to the object, <code>Scope</code> is needed to manipulate devices i.e; <code>Scope (ABC)</code>. Typically indicate to actual device name in DSDTs/SSDTs. Then, <code>Method (_STA, 0, NotSerialized) / STA: Status</code> is used to tell the machine that the object is accessible. In this case, device <code>ABC</code> is returning properties as <code>0</code> <code>(Zero)</code> or <code>false</code>, indicating that the device&#39;s features are deactivated. </li>
<li>A new name for object is injected <code>Device (ABDC)</code> by the address assigned same as DSDT/SSDT i.e; <code>_ADR, 0x00140000</code>. Again, <code>Method (_STA, 0, NotSerialized) / STA: Status</code> is used to tell the machine that the object is accessible.</li>
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
