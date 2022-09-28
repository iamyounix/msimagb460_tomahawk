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
  - **_SB** = System Bus/Bus Objects are defined under this namespace
    - **PCI0** = PCI Root Bridge
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

## Configuration

- [^1]: [Config](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/config.plist) and [SSDT-B460MASL](https://github.com/theofficialcopypaste/ASRockB460MSL/blob/main/SSDT-B460MASL.dsl)
