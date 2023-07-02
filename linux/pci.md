# PCI

```zsh
00:00.0 Host bridge: Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller (rev 05)
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake-S 6c Host Bridge/DRAM Controller
	Flags: bus master, fast devsel, latency 0
	Capabilities: <access denied>
	Kernel driver in use: skl_uncore

00:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) (rev 05) (prog-if 00 [Normal decode])
	Subsystem: Micro-Star International Co., Ltd. [MSI] 6th-10th Gen Core Processor PCIe Controller (x16)
	Flags: bus master, fast devsel, latency 0, IRQ 122
	Bus: primary=00, secondary=01, subordinate=03, sec-latency=0
	I/O behind bridge: 4000-4fff [size=4K] [16-bit]
	Memory behind bridge: 7fd00000-7fefffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: 4080000000-41ffffffff [size=6G] [32-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:02.0 Display controller: Intel Corporation CometLake-S GT2 [UHD Graphics 630] (rev 05)
	Subsystem: Micro-Star International Co., Ltd. [MSI] CometLake-S GT2 [UHD Graphics 630]
	Flags: bus master, fast devsel, latency 0, IRQ 168
	Memory at 6011000000 (64-bit, non-prefetchable) [size=16M]
	Memory at 4000000000 (64-bit, prefetchable) [size=256M]
	I/O ports at 5000 [size=64]
	Capabilities: <access denied>
	Kernel driver in use: i915
	Kernel modules: i915

00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
	Subsystem: Micro-Star International Co., Ltd. [MSI] Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
	Flags: fast devsel, IRQ 255
	Memory at 6012027000 (64-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: <access denied>

00:14.0 USB controller: Intel Corporation Comet Lake PCH-V USB Controller (prog-if 30 [XHCI])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake PCH-V USB Controller
	Flags: bus master, medium devsel, latency 0, IRQ 130
	Memory at 6012010000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:14.2 Signal processing controller: Intel Corporation Comet Lake PCH-V Thermal Subsystem
	Subsystem: Intel Corporation Comet Lake PCH-V Thermal Subsystem
	Flags: fast devsel, IRQ 255
	Memory at 6012026000 (64-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: <access denied>

00:16.0 Communication controller: Intel Corporation Comet Lake PCH-V HECI Controller
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake PCH-V HECI Controller
	Flags: bus master, fast devsel, latency 0, IRQ 166
	Memory at 6012025000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:17.0 SATA controller: Intel Corporation 400 Series Chipset Family SATA AHCI Controller (prog-if 01 [AHCI 1.0])
	Subsystem: Micro-Star International Co., Ltd. [MSI] 400 Series Chipset Family SATA AHCI Controller
	Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 129
	Memory at 80324000 (32-bit, non-prefetchable) [size=8K]
	Memory at 80327000 (32-bit, non-prefetchable) [size=256]
	I/O ports at 5090 [size=8]
	I/O ports at 5080 [size=4]
	I/O ports at 5060 [size=32]
	Memory at 80326000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: <access denied>
	Kernel driver in use: ahci

00:1b.0 PCI bridge: Intel Corporation Device a3e9 (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Device 7c81
	Flags: bus master, fast devsel, latency 0, IRQ 123
	Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: 80200000-802fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1b.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #21 (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Comet Lake PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 124
	Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: 80100000-801fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1c.0 PCI bridge: Intel Corporation Device a392 (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Device 7c81
	Flags: bus master, fast devsel, latency 0, IRQ 125
	Bus: primary=00, secondary=06, subordinate=06, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: 80000000-800fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1c.6 PCI bridge: Intel Corporation Device a396 (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Device 7c81
	Flags: bus master, fast devsel, latency 0, IRQ 126
	Bus: primary=00, secondary=07, subordinate=07, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: 7fa00000-7fcfffff [size=3M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1d.0 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port 9 (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake PCI Express Root Port 9
	Flags: bus master, fast devsel, latency 0, IRQ 127
	Bus: primary=00, secondary=08, subordinate=08, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: 7ff00000-7fffffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1f.0 ISA bridge: Intel Corporation B460 Chipset LPC/eSPI Controller
	Subsystem: Micro-Star International Co., Ltd. [MSI] B460 Chipset LPC/eSPI Controller
	Flags: bus master, medium devsel, latency 0

00:1f.2 Memory controller: Intel Corporation Cannon Lake PCH Power Management Controller
	Subsystem: Micro-Star International Co., Ltd. [MSI] Cannon Lake PCH Power Management Controller
	Flags: fast devsel
	Memory at 80320000 (32-bit, non-prefetchable) [disabled] [size=16K]

00:1f.3 Audio device: Intel Corporation Comet Lake PCH-V cAVS
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake PCH-V cAVS
	Flags: bus master, fast devsel, latency 128, IRQ 171
	Memory at 6012020000 (64-bit, non-prefetchable) [size=16K]
	Memory at 6012000000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_cnl

00:1f.4 SMBus: Intel Corporation Comet Lake PCH-V SMBus Host Controller
	Subsystem: Micro-Star International Co., Ltd. [MSI] Comet Lake PCH-V SMBus Host Controller
	Flags: medium devsel, IRQ 16
	Memory at 6012024000 (64-bit, non-prefetchable) [size=256]
	I/O ports at efa0 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (11) I219-V
	Subsystem: Micro-Star International Co., Ltd. [MSI] Ethernet Connection (11) I219-V
	Flags: bus master, fast devsel, latency 0, IRQ 165
	Memory at 80300000 (32-bit, non-prefetchable) [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: e1000e
	Kernel modules: e1000e

01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev c5) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0, IRQ 16
	Memory at 7fe00000 (32-bit, non-prefetchable) [size=16K]
	Bus: primary=01, secondary=02, subordinate=03, sec-latency=0
	I/O behind bridge: 4000-4fff [size=4K] [16-bit]
	Memory behind bridge: 7fd00000-7fdfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: 4080000000-41ffffffff [size=6G] [32-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch (prog-if 00 [Normal decode])
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
	Flags: bus master, fast devsel, latency 0, IRQ 128
	Bus: primary=02, secondary=03, subordinate=03, sec-latency=0
	I/O behind bridge: 4000-4fff [size=4K] [16-bit]
	Memory behind bridge: 7fd00000-7fdfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: 4080000000-41ffffffff [size=6G] [32-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5) (prog-if 00 [VGA controller])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M]
	Flags: bus master, fast devsel, latency 0, IRQ 169
	Memory at 4100000000 (64-bit, prefetchable) [size=4G]
	Memory at 4080000000 (64-bit, prefetchable) [size=2M]
	I/O ports at 4000 [size=256]
	Memory at 7fd00000 (32-bit, non-prefetchable) [size=512K]
	Expansion ROM at 7fd80000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: amdgpu
	Kernel modules: amdgpu

03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI Audio
	Subsystem: Micro-Star International Co., Ltd. [MSI] Navi 10 HDMI Audio
	Flags: bus master, fast devsel, latency 0, IRQ 170
	Memory at 7fda0000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

04:00.0 USB controller: ASMedia Technology Inc. Device 3241 (prog-if 30 [XHCI])
	Subsystem: Micro-Star International Co., Ltd. [MSI] Device 7c81
	Flags: bus master, fast devsel, latency 0, IRQ 18
	Memory at 80200000 (64-bit, non-prefetchable) [size=32K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

05:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. A2000 NVMe SSD (rev 03) (prog-if 02 [NVM Express])
	Subsystem: Kingston Technology Company, Inc. A2000 NVMe SSD
	Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 0
	Memory at 80100000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme
	Kernel modules: nvme

06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller (rev 04)
	Subsystem: Micro-Star International Co., Ltd. [MSI] RTL8125 2.5GbE Controller
	Flags: bus master, fast devsel, latency 0, IRQ 18
	I/O ports at 3000 [size=256]
	Memory at 80000000 (64-bit, non-prefetchable) [size=64K]
	Memory at 80010000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: r8169
	Kernel modules: r8169

07:00.0 Network controller: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter (rev 03)
	Subsystem: Apple Inc. BCM4360 802.11ac Wireless Network Adapter
	Flags: bus master, fast devsel, latency 0, IRQ 18
	Memory at 7fc00000 (64-bit, non-prefetchable) [size=32K]
	Memory at 7fa00000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: <access denied>
	Kernel driver in use: wl
	Kernel modules: bcma, wl

08:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. A2000 NVMe SSD (rev 03) (prog-if 02 [NVM Express])
	Subsystem: Kingston Technology Company, Inc. A2000 NVMe SSD
	Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 0
	Memory at 7ff00000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme
	Kernel modules: nvme
```
