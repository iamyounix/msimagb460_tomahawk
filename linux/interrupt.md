# Interrupt

```zsh
CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7       CPU8       CPU9       CPU10      CPU11
   0:         13          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    2-edge      timer
   8:          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    8-edge      rtc0
   9:          0         20          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    9-fasteoi   acpi
  14:          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC   14-fasteoi   INT3451:00
  16:          0          0          0          5          0          0          0          0          0          0          0          0  IR-IO-APIC   16-fasteoi   i801_smbus
  18:          0          0          0          0          0      64617          0          0          0          0          0          0  IR-IO-APIC   18-fasteoi   wlan0
 120:          0          0          0          0          0          0          0          0          0          0          0          0  DMAR-MSI    0-edge      dmar0
 121:          0          0          0          0          0          0          0          0          0          0          0          0  DMAR-MSI    1-edge      dmar1
 129:          0          0          0          0          0          0          0          0          0          0       2228          0  IR-PCI-MSI-0000:00:17.0    0-edge      ahci[0000:00:17.0]
 130:          0     427499          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
 131:          0          0         38          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    0-edge      nvme1q0
 132:          0          0          0         38          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    0-edge      nvme0q0
 133:         10          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    1-edge      nvme1q1
 134:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    2-edge      nvme1q2
 135:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    3-edge      nvme1q3
 136:          0          0          0          2          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    4-edge      nvme1q4
 137:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    5-edge      nvme1q5
 138:          0          0          0          0          0         12          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    6-edge      nvme1q6
 139:          0          0          0          0          0          0         56          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    7-edge      nvme1q7
 140:          0          0          0          0          0          0          0         14          0          0          0          0  IR-PCI-MSIX-0000:05:00.0    8-edge      nvme1q8
 141:          0          0          0          0          0          0          0          0         41          0          0          0  IR-PCI-MSIX-0000:05:00.0    9-edge      nvme1q9
 142:          0          0          0          0          0          0          0          0          0         50          0          0  IR-PCI-MSIX-0000:05:00.0   10-edge      nvme1q10
 143:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:05:00.0   11-edge      nvme1q11
 144:          0          0          0          0          0          0          0          0          0          0          0         26  IR-PCI-MSIX-0000:05:00.0   12-edge      nvme1q12
 145:      11435          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    1-edge      nvme0q1
 146:          0       6992          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    2-edge      nvme0q2
 147:          0          0       6322          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    3-edge      nvme0q3
 148:          0          0          0       4582          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    4-edge      nvme0q4
 149:          0          0          0          0       4718          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    5-edge      nvme0q5
 150:          0          0          0          0          0       7312          0          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    6-edge      nvme0q6
 151:          0          0          0          0          0          0      11887          0          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    7-edge      nvme0q7
 152:          0          0          0          0          0          0          0       9440          0          0          0          0  IR-PCI-MSIX-0000:08:00.0    8-edge      nvme0q8
 153:          0          0          0          0          0          0          0          0       6204          0          0          0  IR-PCI-MSIX-0000:08:00.0    9-edge      nvme0q9
 154:          0          0          0          0          0          0          0          0          0       6373          0          0  IR-PCI-MSIX-0000:08:00.0   10-edge      nvme0q10
 155:          0          0          0          0          0          0          0          0          0          0       6495          0  IR-PCI-MSIX-0000:08:00.0   11-edge      nvme0q11
 156:          0          0          0          0          0          0          0          0          0          0          0       6592  IR-PCI-MSIX-0000:08:00.0   12-edge      nvme0q12
 157:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    0-edge      xhci_hcd
 158:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    1-edge      xhci_hcd
 159:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    2-edge      xhci_hcd
 160:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    3-edge      xhci_hcd
 161:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    4-edge      xhci_hcd
 162:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    5-edge      xhci_hcd
 163:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    6-edge      xhci_hcd
 164:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:04:00.0    7-edge      xhci_hcd
 165:          0        951          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSI-0000:00:1f.6    0-edge      enp0s31f6
 166:          0          0         95          0          0          0          0          0          0          0          0          0  IR-PCI-MSI-0000:00:16.0    0-edge      mei_me
 167:          0          0          0          0          0          0          0          0          0          0          0          0  IR-PCI-MSIX-0000:06:00.0    0-edge      enp6s0
 168:          0          0          0          0        560          0          0          0          0          0          0          0  IR-PCI-MSI-0000:00:02.0    0-edge      i915
 169:          0          0          0          0          0          0     240623          0          0          0          0          0  IR-PCI-MSI-0000:03:00.0    0-edge      amdgpu
 170:          0          0          0          0          0          0          0        530          0          0          0          0  IR-PCI-MSI-0000:03:00.1    0-edge      snd_hda_intel:card1
 171:          0          0          0          0          0          0          0          0       1191          0          0          0  IR-PCI-MSI-0000:00:1f.3    0-edge      snd_hda_intel:card0
 NMI:          3          4          3          4          3          4          5          4          3          3          3          3   Non-maskable interrupts
 LOC:     182257     133431     119051     115104     120032     131928     126001     124874     144110     132788     147659     118303   Local timer interrupts
 SPU:          0          0          0          0          0          0          0          0          0          0          0          0   Spurious interrupts
 PMI:          3          4          3          4          3          4          5          4          3          3          3          3   Performance monitoring interrupts
 IWI:          5         12          7          0        124          6         14          0          2          6          2          0   IRQ work interrupts
 RTR:          0          0          0          0          0          0          0          0          0          0          0          0   APIC ICR read retries
 RES:       2323        403       7665        514       2042        314       4980       1845        416        402       5319       2352   Rescheduling interrupts
 CAL:      63317      43618      40598      46482      40469      36956      31449      40405      38659      38694      40903      38419   Function call interrupts
 TLB:      17116      18845      21581      25527      19424      16539      10153      22577      20562      18034      19327      17430   TLB shootdowns
 TRM:          0          0          0          0          0          0          0          0          0          0          0          0   Thermal event interrupts
 THR:          0          0          0          0          0          0          0          0          0          0          0          0   Threshold APIC interrupts
 DFR:          0          0          0          0          0          0          0          0          0          0          0          0   Deferred Error APIC interrupts
 MCE:          0          0          0          0          0          0          0          0          0          0          0          0   Machine check exceptions
 MCP:          7          8          8          8          8          8          8          8          8          8          8          8   Machine check polls
 ERR:          0
 MIS:          0
 PIN:          0          0          0          0          0          0          0          0          0          0          0          0   Posted-interrupt notification event
 NPI:          0          0          0          0          0          0          0          0          0          0          0          0   Nested posted-interrupt event
 PIW:          0          0          0          0          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event
```
