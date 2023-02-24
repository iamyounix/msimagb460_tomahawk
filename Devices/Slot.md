# Devices

## lspci

- Update pci-id and display updated pci output:

    `sudo update-pciids && sudo lspci -Q`

    **Output:**

    ```zsh
    00:00.0 Host bridge: Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller (rev 05)
    00:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) (rev 05)
    00:02.0 VGA compatible controller: Intel Corporation CometLake-S GT2 [UHD Graphics 630] (rev 05)
    00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
    00:14.0 USB controller: Intel Corporation Comet Lake PCH-V USB Controller
    00:14.2 Signal processing controller: Intel Corporation Comet Lake PCH-V Thermal Subsystem
    00:16.0 Communication controller: Intel Corporation Comet Lake PCH-V HECI Controller
    00:17.0 SATA controller: Intel Corporation 400 Series Chipset Family SATA AHCI Controller
    00:1b.0 PCI bridge: Intel Corporation Device a3e9 (rev f0)
    00:1b.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #21 (rev f0)
    00:1c.0 PCI bridge: Intel Corporation Device a392 (rev f0)
    00:1c.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #05 (rev f0)
    00:1c.6 PCI bridge: Intel Corporation Device a396 (rev f0)
    00:1d.0 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port 9 (rev f0)
    00:1f.0 ISA bridge: Intel Corporation B460 Chipset LPC/eSPI Controller
    00:1f.2 Memory controller: Intel Corporation Cannon Lake PCH Power Management Controller
    00:1f.3 Audio device: Intel Corporation Comet Lake PCH-V cAVS
    00:1f.4 SMBus: Intel Corporation Comet Lake PCH-V SMBus Host Controller
    00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (11) I219-V
    01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev c5)
    02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
    03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5)
    03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI Audio
    04:00.0 USB controller: ASMedia Technology Inc. Device 3241
    05:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. A2000 NVMe SSD (rev 03)
    06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller (rev 04)
    07:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller (rev 01)
    08:00.0 Network controller: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter (rev 03)
    09:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. A2000 NVMe SSD (rev 03)
    ```

- Using `vt`

    `lspci -vt`

    ```zsh
    -[0000:00]-+-00.0  Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller
            +-01.0-[01-03]----00.0-[02-03]----00.0-[03]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
            |                                            \-00.1  Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI Audio
            +-02.0  Intel Corporation CometLake-S GT2 [UHD Graphics 630]
            +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
            +-14.0  Intel Corporation Comet Lake PCH-V USB Controller
            +-14.2  Intel Corporation Comet Lake PCH-V Thermal Subsystem
            +-16.0  Intel Corporation Comet Lake PCH-V HECI Controller
            +-17.0  Intel Corporation 400 Series Chipset Family SATA AHCI Controller
            +-1b.0-[04]----00.0  ASMedia Technology Inc. Device 3241
            +-1b.4-[05]----00.0  Kingston Technology Company, Inc. A2000 NVMe SSD
            +-1c.0-[06]----00.0  Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller
            +-1c.4-[07]----00.0  VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller
            +-1c.6-[08]----00.0  Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter
            +-1d.0-[09]----00.0  Kingston Technology Company, Inc. A2000 NVMe SSD
            +-1f.0  Intel Corporation B460 Chipset LPC/eSPI Controller
            +-1f.2  Intel Corporation Cannon Lake PCH Power Management Controller
            +-1f.3  Intel Corporation Comet Lake PCH-V cAVS
            +-1f.4  Intel Corporation Comet Lake PCH-V SMBus Host Controller
            \-1f.6  Intel Corporation Ethernet Connection (11) I219-V
    ```

## dmidecode

- Display Bus and Slots

    `sudo dmidecode -t slot | grep -E 'Slot|Address'`

    **Output:**

    ```zsh
    System Slot Information
            Bus Address: 0000:00:01.0
    System Slot Information
            Bus Address: 0000:00:1c.3
    System Slot Information
            Bus Address: 0000:00:1c.4
    System Slot Information
            Bus Address: 0000:00:1c.5
    System Slot Information
            Bus Address: 0000:00:1c.6
    System Slot Information
            Bus Address: 0000:00:1c.7
    System Slot Information
            Bus Address: 0000:00:1e.0
    ```

- Print Bus address and slot-id

    `sudo dmidecode -t 9 |awk '/ID:/ {id=$2} /Bus Address/ {print "Slot",id+1,"PCIe",$3}'`

    ```zsh
    Slot 1 PCIe 0000:00:01.0
    Slot 2 PCIe 0000:00:1c.3
    Slot 3 PCIe 0000:00:1c.4
    Slot 4 PCIe 0000:00:1c.5
    Slot 5 PCIe 0000:00:1c.6
    Slot 6 PCIe 0000:00:1c.7
    Slot 7 PCIe 0000:00:1e.0
    ```

- Print slot designation, tag and etc

    Example:

    ```powershell
    Get-WmiObject -class "Win32_SystemSlot"
    ```

    Output:

    ```powershell
    SlotDesignation : Slot1 / X16PCIEXP
    Tag             : System Slot 0    
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 10

    SlotDesignation : Slot2 / X1PCIEXP1
    Tag             : System Slot 1    
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 5

    SlotDesignation : Slot3 / X1PCIEXP2
    Tag             : System Slot 2    
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 5

    SlotDesignation : Slot4 / X4PCIEXP
    Tag             : System Slot 3
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 7

    SlotDesignation : Slot5 / M2 WLAN/BT
    Tag             : System Slot 4
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 5

    SlotDesignation : Slot6 / M2 SSD1
    Tag             : System Slot 5
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 7

    SlotDesignation : Slot7 / M2 SSD2
    Tag             : System Slot 6
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 7
    ```
