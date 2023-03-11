# iHack MSI MAG B460 Tomahawk

![Check](https://img.shields.io/badge/Status-Pass-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/theofficialcopypaste/ASRockB460MSL-OC?color=blue&label=Issues)
[![Bootloader](https://img.shields.io/badge/Bootloader-OpenCore-yellow)](https://github.com/theofficialcopypaste/ASRockB460MSL-OC/releases)
[![Monterey](https://img.shields.io/badge/Compatible-Monterey-purple)](https://www.apple.com/ge/macos/monterey/)
[![Ventura](https://img.shields.io/badge/Compatible-Ventura-orange)](https://www.apple.com/my/macos/ventura/)
[![Version](https://img.shields.io/badge/Version-0.8.8-white)](https://github.com/acidanthera/OpenCorePkg/releases)

Table of contents

- [Introduction](#introduction)
  - [Devices](#devices)
  - [Plist Configuration](#plist-configuration)
  - [Changelog](#changelog)
- [Guide and Samples](#guide-and-samples)
- [Credits](#credits)

## Introduction

This is my current EFI clone that I built according to my hardware. Feel free to read my content. If you have a similar build but different settings, you might consider checking this out. Before read, below is the best way to checkout the latest OpenCore guide and news.

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) Getting Started.
- Checkout latest [post](https://dortania.github.io), news and update directly from developer.

> **Reminder**: Since my build boot only Linux and macOS, my ACPI code would be less / different (lack of `Else`, `Zero` and `0x0F` methods), and may cause an issue in booting Windows. If you need help or ACPI related issue in dual- or multiple-booting, especially Windows; add `Zero` and `0xFF` method to patched device as example below:

**Enable Device on Darwin Kernel:**

```asl
Device(XXXX) {
    Name CID / HID / ADR / XXX
    Method(_XXX, 0, NotSerialized) // _STA: Status
    {
        If(_OSI("Darwin")) {
            Return(0x0F) //  Enable
        }
        Else {
            Return(Zero) //  Disable
        }
    }
}
```

**Disable Device on Darwin Kernel:**

```asl
Device(XXXX) {
    Name CID / HID / ADR / XXX
    Method(_XXX, 0, NotSerialized) // _STA: Status
    {
        If(_OSI("Darwin")) {
            Return(Zero) //  Disable
        }
        Else {
            Return(0x0F) //  Enable
        }
    }
}
```

### Devices

- **Untouched**
  - 400 Series Chipset Family SATA AHCI Controller
  - 6th-10th Gen Core Processor PCIe Controller (x16)
  - B460 Chipset LPC/eSPI Controller
  - Cannon Lake PCH Power Management Controller
  - Comet Lake PCH-V HECI Controller
  - Comet Lake PCI Express Root Port #03
  - Comet Lake PCI Express Root Port #05
  - Comet Lake PCI Express Root Port #07
  - Comet Lake PCI Express Root Port #09
  - Comet Lake PCI Express Root Port #19
  - Comet Lake PCI Express Root Port #21
  - Navi 10 XL Upstream Port of PCI Express Switch

> **Note**: Device above is untouched, no acpi, kext and config.plist **patch** required.

- **Touched**
  - ASM3241 USB 3.2 Host Controller
  - BCM4360 802.11ac Wireless Network Adapter
  - Comet Lake PCH-V cAVS
  - Comet Lake PCH-V SMBus Host Controller
  - Comet Lake PCH-V Thermal Subsystem
  - Comet Lake PCH-V USB Controller
  - Comet Lake-S 6c Host Bridge/DRAM Controller
  - Ethernet Connection (11) I219-V
  - Intel CoffeeLake-H GT2 (UHD Graphics 630 Headless)
  - Kingston A2000 NVMe SSD1
  - Kingston A2000 NVMe SSD2
  - Navi 10 HDMI Audio
  - Navi 10 XL Downstream Port of PCI Express Switch
  - Navi 14 Radeon RX 5500/5500M / Pro 5500M
  - RTL8125 2.5GbE Controller
  - VL805/806 xHCI USB 3.0 Controller
  - Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen

### Plist Configuration

Settings should be based on the type of CPU, motherboard, and GPU. This is a Comet Lake, B460, and AMD Navi 14 configuration via `config.plist`.

- **ACPI**

  - Check out my [sample](Guide%20&%20Samples/ACPI%20Samples/SSDT-MSIB460.dsl).

- **Booter**

  - Quirks
  
    - AvoidRuntimeDefrag - boolean - `Yes`
    - DevirtualiseMmio - boolean - `Yes`
    - EnableSafeModeSlide - boolean - `Yes`
    - ProvideCustomSlide - boolean - `Yes`
    - SyncRuntimePermissions - boolean - `Yes`
    - ProvideMaxSlide - number - `0`
    - ResizeAppleGpuBars - number - `-1` (2020+ BIOS Notes: When enabling Above4G, Resizable BAR Support may become an available on some Z490 and newer motherboards. Please ensure that Booter -> Quirks -> ResizeAppleGpuBars is set to `0` if this is enabled.)
  
  > **Note**: Other than above is `No`

- **DeviceProperties**

  Use Linux to configure proper slot:

  `sudo dmidecode`

  ```zsh
  Handle 0x0004, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J1A1
          Internal Connector Type: None
          External Reference Designator: PS2Mouse
          External Connector Type: PS/2
          Port Type: Mouse Port

  Handle 0x0005, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J1A1
          Internal Connector Type: None
          External Reference Designator: Keyboard
          External Connector Type: PS/2
          Port Type: Keyboard Port

  Handle 0x0006, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2A1
          Internal Connector Type: None
          External Reference Designator: TV Out
          External Connector Type: Mini Centronics Type-14
          Port Type: Other

  Handle 0x0007, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2A2A
          Internal Connector Type: None
          External Reference Designator: COM A
          External Connector Type: DB-9 male
          Port Type: Serial Port 16550A Compatible

  Handle 0x0008, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2A2B
          Internal Connector Type: None
          External Reference Designator: Video
          External Connector Type: DB-15 female
          Port Type: Video Port

  Handle 0x0009, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J3A1
          Internal Connector Type: None
          External Reference Designator: USB1
          External Connector Type: Access Bus (USB)
          Port Type: USB

  Handle 0x000A, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9A1 - TPM HDR
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x000B, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9C1 - PCIE DOCKING CONN
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x000C, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2B3 - CPU FAN
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x000D, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J6C2 - EXT HDMI
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x000E, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J3C1 - GMCH FAN
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x000F, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J1D1 - ITP
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0010, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9E2 - MDC INTPSR
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0011, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9E4 - MDC INTPSR
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0012, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9E3 - LPC HOT DOCKING
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0013, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9E1 - SCAN MATRIX
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0014, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J9G1 - LPC SIDE BAND
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0015, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J8F1 - UNIFIED
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0016, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J6F1 - LVDS
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0017, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2F1 - LAI FAN
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0018, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J2G1 - GFX VID
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x0019, DMI type 8, 9 bytes
  Port Connector Information
          Internal Reference Designator: J1G6 - AC JACK
          Internal Connector Type: Other
          External Reference Designator: Not Specified
          External Connector Type: None
          Port Type: Other

  Handle 0x001A, DMI type 9, 17 bytes
  System Slot Information
          Designation: J6B2
          Type: x16 PCI Express
          Current Usage: In Use
          Length: Long
          ID: 0
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:01.0

  Handle 0x001B, DMI type 9, 17 bytes
  System Slot Information
          Designation: J6B1
          Type: x1 PCI Express
          Current Usage: In Use
          Length: Short
          ID: 1
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1c.3

  Handle 0x001C, DMI type 9, 17 bytes
  System Slot Information
          Designation: J6D1
          Type: x1 PCI Express
          Current Usage: In Use
          Length: Short
          ID: 2
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1c.4

  Handle 0x001D, DMI type 9, 17 bytes
  System Slot Information
          Designation: J7B1
          Type: x1 PCI Express
          Current Usage: In Use
          Length: Short
          ID: 3
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1c.5

  Handle 0x001E, DMI type 9, 17 bytes
  System Slot Information
          Designation: J8B4
          Type: x1 PCI Express
          Current Usage: In Use
          Length: Short
          ID: 4
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1c.6

  Handle 0x001F, DMI type 9, 17 bytes
  System Slot Information
          Designation: J8D1
          Type: x1 PCI Express
          Current Usage: In Use
          Length: Short
          ID: 5
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1c.7

  Handle 0x0020, DMI type 9, 17 bytes
  System Slot Information
          Designation: J8B3
          Type: 32-bit PCI
          Current Usage: In Use
          Length: Short
          ID: 6
          Characteristics:
                  3.3 V is provided
                  Opening is shared
                  PME signal is supported
          Bus Address: 0000:00:1e.0

  Handle 0x0021, DMI type 11, 5 bytes
  OEM Strings
          String 1: Default string

  Handle 0x0022, DMI type 12, 5 bytes
  System Configuration Options
          Option 1: Default string

  Handle 0x0023, DMI type 32, 20 bytes
  System Boot Information
          Status: No errors detected

  Handle 0x0024, DMI type 34, 11 bytes
  Management Device
          Description: LM78-1
          Type: LM78
          Address: 0x00000000
          Address Type: I/O Port

  Handle 0x0025, DMI type 26, 22 bytes
  Voltage Probe
          Description: LM78A
          Location: Motherboard
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0026, DMI type 36, 16 bytes
  Management Device Threshold Data
          Lower Non-critical Threshold: 1
          Upper Non-critical Threshold: 2
          Lower Critical Threshold: 3
          Upper Critical Threshold: 4
          Lower Non-recoverable Threshold: 5
          Upper Non-recoverable Threshold: 6

  Handle 0x0027, DMI type 35, 11 bytes
  Management Device Component
          Description: Default string
          Management Device Handle: 0x0024
          Component Handle: 0x0025
          Threshold Handle: 0x0026

  Handle 0x0028, DMI type 28, 22 bytes
  Temperature Probe
          Description: LM78A
          Location: Motherboard
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0029, DMI type 36, 16 bytes
  Management Device Threshold Data
          Lower Non-critical Threshold: 1
          Upper Non-critical Threshold: 2
          Lower Critical Threshold: 3
          Upper Critical Threshold: 4
          Lower Non-recoverable Threshold: 5
          Upper Non-recoverable Threshold: 6

  Handle 0x002A, DMI type 35, 11 bytes
  Management Device Component
          Description: Default string
          Management Device Handle: 0x0024
          Component Handle: 0x0028
          Threshold Handle: 0x0029

  Handle 0x002B, DMI type 27, 15 bytes
  Cooling Device
          Temperature Probe Handle: 0x0028
          Type: Power Supply Fan
          Status: OK
          Cooling Unit Group: 1
          OEM-specific Information: 0x00000000
          Nominal Speed: Unknown Or Non-rotating
          Description: Cooling Dev 1

  Handle 0x002C, DMI type 36, 16 bytes
  Management Device Threshold Data
          Lower Non-critical Threshold: 1
          Upper Non-critical Threshold: 2
          Lower Critical Threshold: 3
          Upper Critical Threshold: 4
          Lower Non-recoverable Threshold: 5
          Upper Non-recoverable Threshold: 6

  Handle 0x002D, DMI type 35, 11 bytes
  Management Device Component
          Description: Default string
          Management Device Handle: 0x0024
          Component Handle: 0x002B
          Threshold Handle: 0x002C

  Handle 0x002E, DMI type 27, 15 bytes
  Cooling Device
          Temperature Probe Handle: 0x0028
          Type: Power Supply Fan
          Status: OK
          Cooling Unit Group: 1
          OEM-specific Information: 0x00000000
          Nominal Speed: Unknown Or Non-rotating
          Description: Not Specified

  Handle 0x002F, DMI type 36, 16 bytes
  Management Device Threshold Data
          Lower Non-critical Threshold: 1
          Upper Non-critical Threshold: 2
          Lower Critical Threshold: 3
          Upper Critical Threshold: 4
          Lower Non-recoverable Threshold: 5
          Upper Non-recoverable Threshold: 6

  Handle 0x0030, DMI type 35, 11 bytes
  Management Device Component
          Description: Default string
          Management Device Handle: 0x0024
          Component Handle: 0x002E
          Threshold Handle: 0x002F

  Handle 0x0031, DMI type 29, 22 bytes
  Electrical Current Probe
          Description: ABC
          Location: Motherboard
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0032, DMI type 36, 16 bytes
  Management Device Threshold Data

  Handle 0x0033, DMI type 35, 11 bytes
  Management Device Component
          Description: Default string
          Management Device Handle: 0x0024
          Component Handle: 0x0031
          Threshold Handle: 0x0032

  Handle 0x0034, DMI type 26, 22 bytes
  Voltage Probe
          Description: LM78A
          Location: Power Unit
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0035, DMI type 28, 22 bytes
  Temperature Probe
          Description: LM78A
          Location: Power Unit
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0036, DMI type 27, 15 bytes
  Cooling Device
          Temperature Probe Handle: 0x0035
          Type: Power Supply Fan
          Status: OK
          Cooling Unit Group: 1
          OEM-specific Information: 0x00000000
          Nominal Speed: Unknown Or Non-rotating
          Description: Cooling Dev 1

  Handle 0x0037, DMI type 29, 22 bytes
  Electrical Current Probe
          Description: ABC
          Location: Power Unit
          Status: OK
          Maximum Value: Unknown
          Minimum Value: Unknown
          Resolution: Unknown
          Tolerance: Unknown
          Accuracy: Unknown
          OEM-specific Information: 0x00000000
          Nominal Value: Unknown

  Handle 0x0038, DMI type 39, 22 bytes
  System Power Supply
          Power Unit Group: 1
          Location: To Be Filled By O.E.M.
          Name: To Be Filled By O.E.M.
          Manufacturer: To Be Filled By O.E.M.
          Serial Number: To Be Filled By O.E.M.
          Asset Tag: To Be Filled By O.E.M.
          Model Part Number: To Be Filled By O.E.M.
          Revision: To Be Filled By O.E.M.
          Max Power Capacity: Unknown
          Status: Present, OK
          Type: Switching
          Input Voltage Range Switching: Auto-switch
          Plugged: Yes
          Hot Replaceable: No
          Input Voltage Probe Handle: 0x0034
          Cooling Device Handle: 0x0036
          Input Current Probe Handle: 0x0037

  Handle 0x0039, DMI type 43, 31 bytes
  TPM Device
          Vendor ID: INTC
          Specification Version: 2.0
          Firmware Revision: 500.16
          Description: INTEL
          Characteristics:
                  Family configurable via platform software support
          OEM-specific Information: 0x00000000

  Handle 0x003A, DMI type 16, 23 bytes
  Physical Memory Array
          Location: System Board Or Motherboard
          Use: System Memory
          Error Correction Type: None
          Maximum Capacity: 64 GB
          Error Information Handle: Not Provided
          Number Of Devices: 4

  Handle 0x003B, DMI type 17, 84 bytes
  Memory Device
          Array Handle: 0x003A
          Error Information Handle: Not Provided
          Total Width: 64 bits
          Data Width: 64 bits
          Size: 8 GB
          Form Factor: DIMM
          Set: None
          Locator: ChannelA-DIMM0
          Bank Locator: BANK 0
          Type: DDR4
          Type Detail: Synchronous
          Speed: 2133 MT/s
          Manufacturer: 01BA
          Serial Number: 00000000
          Asset Tag: 9876543210
          Part Number: 8GBF1X08QFHH38-135-K
          Rank: 1
          Configured Memory Speed: 2133 MT/s
          Minimum Voltage: Unknown
          Maximum Voltage: Unknown
          Configured Voltage: 1.2 V
          Memory Technology: DRAM
          Memory Operating Mode Capability: Volatile memory
          Firmware Version: Not Specified
          Module Manufacturer ID: Bank 2, Hex 0xBA
          Module Product ID: Unknown
          Memory Subsystem Controller Manufacturer ID: Unknown
          Memory Subsystem Controller Product ID: Unknown
          Non-Volatile Size: None
          Volatile Size: 8 GB
          Cache Size: None
          Logical Size: None

  Handle 0x003C, DMI type 17, 84 bytes
  Memory Device
          Array Handle: 0x003A
          Error Information Handle: Not Provided
          Total Width: 64 bits
          Data Width: 64 bits
          Size: 8 GB
          Form Factor: DIMM
          Set: None
          Locator: ChannelA-DIMM1
          Bank Locator: BANK 1
          Type: DDR4
          Type Detail: Synchronous
          Speed: 2133 MT/s
          Manufacturer: 01BA
          Serial Number: 00000000
          Asset Tag: 9876543210
          Part Number: 8GBF1X08QFHH38-135-K
          Rank: 1
          Configured Memory Speed: 2133 MT/s
          Minimum Voltage: Unknown
          Maximum Voltage: Unknown
          Configured Voltage: 1.2 V
          Memory Technology: DRAM
          Memory Operating Mode Capability: Volatile memory
          Firmware Version: Not Specified
          Module Manufacturer ID: Bank 2, Hex 0xBA
          Module Product ID: Unknown
          Memory Subsystem Controller Manufacturer ID: Unknown
          Memory Subsystem Controller Product ID: Unknown
          Non-Volatile Size: None
          Volatile Size: 8 GB
          Cache Size: None
          Logical Size: None

  Handle 0x003D, DMI type 17, 84 bytes
  Memory Device
          Array Handle: 0x003A
          Error Information Handle: Not Provided
          Total Width: 64 bits
          Data Width: 64 bits
          Size: 8 GB
          Form Factor: DIMM
          Set: None
          Locator: ChannelB-DIMM0
          Bank Locator: BANK 2
          Type: DDR4
          Type Detail: Synchronous
          Speed: 2133 MT/s
          Manufacturer: 01BA
          Serial Number: 00000000
          Asset Tag: 9876543210
          Part Number: 8GBF1X08QFHH38-135-K
          Rank: 1
          Configured Memory Speed: 2133 MT/s
          Minimum Voltage: Unknown
          Maximum Voltage: Unknown
          Configured Voltage: 1.2 V
          Memory Technology: DRAM
          Memory Operating Mode Capability: Volatile memory
          Firmware Version: Not Specified
          Module Manufacturer ID: Bank 2, Hex 0xBA
          Module Product ID: Unknown
          Memory Subsystem Controller Manufacturer ID: Unknown
          Memory Subsystem Controller Product ID: Unknown
          Non-Volatile Size: None
          Volatile Size: 8 GB
          Cache Size: None
          Logical Size: None

  Handle 0x003E, DMI type 17, 84 bytes
  Memory Device
          Array Handle: 0x003A
          Error Information Handle: Not Provided
          Total Width: 64 bits
          Data Width: 64 bits
          Size: 8 GB
          Form Factor: DIMM
          Set: None
          Locator: ChannelB-DIMM1
          Bank Locator: BANK 3
          Type: DDR4
          Type Detail: Synchronous
          Speed: 2133 MT/s
          Manufacturer: 01BA
          Serial Number: 00000000
          Asset Tag: 9876543210
          Part Number: 8GBF1X08QFHH38-135-K
          Rank: 1
          Configured Memory Speed: 2133 MT/s
          Minimum Voltage: Unknown
          Maximum Voltage: Unknown
          Configured Voltage: 1.2 V
          Memory Technology: DRAM
          Memory Operating Mode Capability: Volatile memory
          Firmware Version: Not Specified
          Module Manufacturer ID: Bank 2, Hex 0xBA
          Module Product ID: Unknown
          Memory Subsystem Controller Manufacturer ID: Unknown
          Memory Subsystem Controller Product ID: Unknown
          Non-Volatile Size: None
          Volatile Size: 8 GB
          Cache Size: None
          Logical Size: None

  Handle 0x003F, DMI type 19, 31 bytes
  Memory Array Mapped Address
          Starting Address: 0x00000000000
          Ending Address: 0x007FFFFFFFF
          Range Size: 32 GB
          Physical Array Handle: 0x003A
          Partition Width: 4

  Handle 0x0040, DMI type 20, 35 bytes
  Memory Device Mapped Address
          Starting Address: 0x00000000000
          Ending Address: 0x001FFFFFFFF
          Range Size: 8 GB
          Physical Device Handle: 0x003B
          Memory Array Mapped Address Handle: 0x003F
          Partition Row Position: Unknown
          Interleave Position: 1
          Interleaved Data Depth: 2

  Handle 0x0041, DMI type 20, 35 bytes
  Memory Device Mapped Address
          Starting Address: 0x00400000000
          Ending Address: 0x005FFFFFFFF
          Range Size: 8 GB
          Physical Device Handle: 0x003C
          Memory Array Mapped Address Handle: 0x003F
          Partition Row Position: Unknown
          Interleave Position: 1
          Interleaved Data Depth: 2

  Handle 0x0042, DMI type 20, 35 bytes
  Memory Device Mapped Address
          Starting Address: 0x00200000000
          Ending Address: 0x003FFFFFFFF
          Range Size: 8 GB
          Physical Device Handle: 0x003D
          Memory Array Mapped Address Handle: 0x003F
          Partition Row Position: Unknown
          Interleave Position: 2
          Interleaved Data Depth: 2

  Handle 0x0043, DMI type 20, 35 bytes
  Memory Device Mapped Address
          Starting Address: 0x00600000000
          Ending Address: 0x007FFFFFFFF
          Range Size: 8 GB
          Physical Device Handle: 0x003E
          Memory Array Mapped Address Handle: 0x003F
          Partition Row Position: Unknown
          Interleave Position: 2
          Interleaved Data Depth: 2

  Handle 0x0044, DMI type 221, 26 bytes
  OEM-specific Type
          Header and Data:
                  DD 1A 44 00 03 01 00 09 00 45 10 00 02 00 00 00
                  00 F0 00 03 00 01 0D 15 00 00
          Strings:
                  Reference Code - CPU
                  uCode Version
                  TXT ACM version

  Handle 0x0045, DMI type 221, 26 bytes
  OEM-specific Type
          Header and Data:
                  DD 1A 45 00 03 01 00 09 00 45 10 00 02 00 00 00
                  00 00 00 03 04 0E 05 20 75 05
          Strings:
                  Reference Code - ME
                  MEBx version
                  ME Firmware Version
                  Consumer SKU

  Handle 0x0046, DMI type 221, 47 bytes
  OEM-specific Type
          Header and Data:
                  DD 2F 46 00 06 01 00 09 00 45 10 00 02 03 FF FF
                  FF FF FF 04 00 FF FF FF 00 00 05 00 FF FF FF 00
                  00 06 00 FF FF FF FF FF 07 00 0B 00 00 00 00
          Strings:
                  Re.erence Code - CML PCH
                  PCH-CRID Status
                  Disabled
                  PCH-CRID Original Value
                  PCH-CRID New Value
                  OPROM - RST - RAID
                  CMLV PCH H Ax Hsio Version

  Handle 0x0047, DMI type 221, 54 bytes
  OEM-specific Type
          Header and Data:
                  DD 36 47 00 07 01 00 09 00 45 10 00 02 00 00 00
                  00 52 00 03 00 09 00 45 10 00 04 05 FF FF FF FF
                  FF 06 00 00 00 00 05 00 07 00 00 00 00 05 00 08
                  00 FF FF FF FF FF
          Strings:
                  Reference Code - SA - System Agent
                  Reference Code - MRC
                  SA - PCIe Version
                  SA-CRID Status
                  Disabled
                  SA-CRID Original Value
                  SA-CRID New Value
                  OPROM - VBIOS

  Handle 0x0048, DMI type 221, 12 bytes
  OEM-specific Type
          Header and Data:
                  DD 0C 48 00 01 01 00 04 00 00 00 00
          Strings:
                  FSP Binary Version

  Handle 0x0049, DMI type 7, 27 bytes
  Cache Information
          Socket Designation: L1 Cache
          Configuration: Enabled, Not Socketed, Level 1
          Operational Mode: Write Back
          Location: Internal
          Installed Size: 384 kB
          Maximum Size: 384 kB
          Supported SRAM Types:
                  Synchronous
          Installed SRAM Type: Synchronous
          Speed: Unknown
          Error Correction Type: Parity
          System Type: Unified
          Associativity: 8-way Set-associative

  Handle 0x004A, DMI type 7, 27 bytes
  Cache Information
          Socket Designation: L2 Cache
          Configuration: Enabled, Not Socketed, Level 2
          Operational Mode: Write Back
          Location: Internal
          Installed Size: 1536 kB
          Maximum Size: 1536 kB
          Supported SRAM Types:
                  Synchronous
          Installed SRAM Type: Synchronous
          Speed: Unknown
          Error Correction Type: Single-bit ECC
          System Type: Unified
          Associativity: 4-way Set-associative

  Handle 0x004B, DMI type 7, 27 bytes
  Cache Information
          Socket Designation: L3 Cache
          Configuration: Enabled, Not Socketed, Level 3
          Operational Mode: Write Back
          Location: Internal
          Installed Size: 12 MB
          Maximum Size: 12 MB
          Supported SRAM Types:
                  Synchronous
          Installed SRAM Type: Synchronous
          Speed: Unknown
          Error Correction Type: Multi-bit ECC
          System Type: Unified
          Associativity: 16-way Set-associative

  Handle 0x004C, DMI type 4, 48 bytes
  Processor Information
          Socket Designation: U3E1
          Type: Central Processor
          Family: Core i5
          Manufacturer: Intel(R) Corporation
          ID: 55 06 0A 00 FF FB EB BF
          Signature: Type 0, Family 6, Model 165, Stepping 5
          Flags:
                  FPU (Floating-point unit on-chip)
                  VME (Virtual mode extension)
                  DE (Debugging extension)
                  PSE (Page size extension)
                  TSC (Time stamp counter)
                  MSR (Model specific registers)
                  PAE (Physical address extension)
                  MCE (Machine check exception)
                  CX8 (CMPXCHG8 instruction supported)
                  APIC (On-chip APIC hardware supported)
                  SEP (Fast system call)
                  MTRR (Memory type range registers)
                  PGE (Page global enable)
                  MCA (Machine check architecture)
                  CMOV (Conditional move instruction supported)
                  PAT (Page attribute table)
                  PSE-36 (36-bit page size extension)
                  CLFSH (CLFLUSH instruction supported)
                  DS (Debug store)
                  ACPI (ACPI supported)
                  MMX (MMX technology supported)
                  FXSR (FXSAVE and FXSTOR instructions supported)
                  SSE (Streaming SIMD extensions)
                  SSE2 (Streaming SIMD extensions 2)
                  SS (Self-snoop)
                  HTT (Multi-threading)
                  TM (Thermal monitor supported)
                  PBE (Pending break enabled)
          Version: Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz
          Voltage: 0.8 V
          External Clock: 100 MHz
          Max Speed: 8300 MHz
          Current Speed: 2871 MHz
          Status: Populated, Enabled
          Upgrade: Other
          L1 Cache Handle: 0x0049
          L2 Cache Handle: 0x004A
          L3 Cache Handle: 0x004B
          Serial Number: To Be Filled By O.E.M.
          Asset Tag: To Be Filled By O.E.M.
          Part Number: To Be Filled By O.E.M.
          Core Count: 6
          Core Enabled: 6
          Thread Count: 12
          Characteristics:
                  64-bit capable
                  Multi-Core
                  Hardware Thread
                  Execute Protection
                  Enhanced Virtualization
                  Power/Performance Control

  Handle 0x004D, DMI type 131, 64 bytes
  OEM-specific Type
          Header and Data:
                  83 40 4D 00 31 00 00 00 00 00 00 00 00 00 00 00
                  F8 00 C8 A3 00 00 00 00 01 00 00 00 05 00 0E 00
                  75 05 20 00 00 00 00 00 FE 00 4D 0D 00 00 00 00
                  00 00 00 00 E2 01 00 00 76 50 72 6F 00 00 00 00

  Handle 0x004E, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 1
          Bus Address: 0000:00:00.0

  Handle 0x004F, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Video
          Type: Video
          Status: Enabled
          Type Instance: 1
          Bus Address: 0000:00:02.0

  Handle 0x0050, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 2
          Bus Address: 0000:00:08.0

  Handle 0x0051, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 3
          Bus Address: 0000:00:14.0

  Handle 0x0052, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 4
          Bus Address: 0000:00:14.2

  Handle 0x0053, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 5
          Bus Address: 0000:00:16.0

  Handle 0x0054, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - SATA
          Type: SATA Controller
          Status: Enabled
          Type Instance: 1
          Bus Address: 0000:00:17.0

  Handle 0x0055, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 6
          Bus Address: 0000:00:1f.0

  Handle 0x0056, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 7
          Bus Address: 0000:00:1f.2

  Handle 0x0057, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Sound
          Type: Sound
          Status: Enabled
          Type Instance: 1
          Bus Address: 0000:00:1f.3

  Handle 0x0058, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Other
          Type: Other
          Status: Enabled
          Type Instance: 8
          Bus Address: 0000:00:1f.4

  Handle 0x0059, DMI type 41, 11 bytes
  Onboard Device
          Reference Designation: Onboard - Ethernet
          Type: Ethernet
          Status: Enabled
          Type Instance: 1
          Bus Address: 0000:00:1f.6

  Handle 0x005A, DMI type 221, 89 bytes
  OEM-specific Type
          Header and Data:
                  DD 59 5A 00 0C 01 00 00 00 00 A6 00 02 00 FF FF
                  FF FF FF 03 04 FF FF FF FF FF 05 06 FF FF FF FF
                  FF 07 08 FF FF FF FF FF 09 00 00 00 00 00 00 0A
                  00 FF FF FF FF FF 0B 00 FF FF 00 00 00 0C 00 00
                  09 00 07 11 0D 00 FF FF FF FF FF 0E 00 00 07 00
                  00 00 0F 00 00 02 00 0F 00
          Strings:
                  Lan Phy Version
                  Sensor Firmware Version
                  Debug Mode Status
                  Disabled
                  Performance Mode Status
                  Disabled
                  Debug Use USB(Disabled:Serial)
                  Disabled
                  ICC Overclocking Version
                  UNDI Version
                  EC FW Version
                  GOP Version
                  Royal Park Version
                  Platform Version
                  Client Silicon Version

  Handle 0x005B, DMI type 143, 16 bytes
  OEM-specific Type
          Header and Data:
                  8F 10 5B 00 00 01 02 03 04 05 06 07 08 09 0A 0B
          Strings:
                  MEFW-14.5.32.1397
                  GOP1-[9.0.1107]
                  RAID-17.8
                  PXEU1-v0.0.24
                  PXEU2-v2.052
                  AMI-AptioV
                  GSES-5/1
                  MsiFlash-17
                  N/A
                  N/A
                  N/A
                  N/A

  Handle 0x005C, DMI type 14, 8 bytes
  Group Associations
          Name: $MEI
          Items: 1
                  0x0000 (OEM-specific)

  Handle 0x005D, DMI type 219, 106 bytes
  OEM-specific Type
          Header and Data:
                  DB 6A 5D 00 01 04 01 55 02 00 90 06 01 10 80 20
                  00 00 00 00 40 08 00 00 00 00 00 06 00 00 00 02
                  FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
                  FF FF FF FF FF FF FF FF 03 00 00 00 80 00 00 00
                  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                  00 04 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
                  FF FF FF FF FF FF FF FF FF FF
          Strings:
                  MEI1
                  MEI2
                  MEI3
                  MEI4

  Handle 0x005E, DMI type 136, 6 bytes
  OEM-specific Type
          Header and Data:
                  88 06 5E 00 00 00

  Handle 0x005F, DMI type 14, 23 bytes
  Group Associations
          Name: Firmware Version Info
          Items: 6
                  0x0044 (OEM-specific)
                  0x0045 (OEM-specific)
                  0x0046 (OEM-specific)
                  0x0047 (OEM-specific)
                  0x0048 (OEM-specific)
                  0x005A (OEM-specific)

  Handle 0x0060, DMI type 127, 4 bytes
  End Of Table

  ```
  
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

  **Results:**

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
  
    - `@0,name` - string - `ATY,Python`
    - `@1,name` - string - `ATY,Python`
    - `@2,name` - string - `ATY,Python`
    - `@3,name` - string - `ATY,Python`
    - `AAPL,slot-name` - string - `J6B2`
    - `AAPL00,override-no-connect` - data - `Your dumped EDID from Linux` (Optional)
    - `ATY,EFIVersion` - string - `31.0.120.26.3`
    - `device_type` - string - `ATY,PythonParent`

  - PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)
  
    - `AAPL,slot-name` - string - `J6B2`
    - `model` - string - `Navi 10 HDMI Audio`
  
  - PciRoot(0x0)/Pci(0x14,0x0)
  
    - `AAPL,slot-name` - string - `Onboard`
    - `acpi-wake-type` - data - `01`
    - `model` - string - `Comet Lake PCH-V USB Controller`
  
  - PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)
  
    - `AAPL,slot-name` - string - `Onboard`
    - `acpi-wake-type` - data - `01`
    - `model` - string `ASM3241 USB 3.2 USB Controller`
  
  - PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)
  
    - `AAPL,slot-name` - string - `J6D1`
    - `acpi-wake-type` - data - `01`
    - `model` - string - `VL805/806 USB 3.0 Controller`
  
  - PciRoot(0x0)/Pci(0x1C,0x6)/Pci(0x0,0x0)
  
    - `AAPL,slot-name` - string - `J8B4`
    - `model` - string - `BCM4360 802.11ac Wireless Network Adapter`
  
  - PciRoot(0x0)/Pci(0x1F,0x3)
  
    - `AAPL,slot-name` - string - `Onboard`
    - `layout-id` - data - `01000000`
    - `model` - string - `Comet Lake PCH-V Converged Audio Voice Speech`
  
  - PciRoot(0x0)/Pci(0x2,0x0)
  
    - `AAPL,ig-platform-id` - data - `0300923E`
    - `AAPL,slot-name` - string - `Onboard`
    - `agdpmod` - data - `70696B65726100`
    - `device-id` - data - `9B3E0000`
    - `enable-metal` - data - `01000000`
    - `igfxfw` - data - `02000000`
    - `igfxonln` - data - `01000000`

> **Note**: Check device properties in plist layout [here](Device%20Properties/deviceproperties.plist)

- **Kext**

  - Add
  
    - [x] [AppleALC](Kexts/AppleALC.kext)
    - [x] [IntelMausi](Kexts/IntelMausi.kext)
    - [x] [Lilu](Kexts/Lilu.kext)
    - [x] [LucyRTL8125Ethernet](Kexts/LucyRTL8125Ethernet.kext)
    - [x] [SMCProcessor](Kexts/SMCProcessor.kext)
    - [x] [SMCSuperIO](Kexts/SMCSuperIO.kext)
    - [x] [USBMap](Kexts/USBMap.kext)
    - [x] [VirtualSMC](Kexts/VirtualSMC.kext)
    - [x] [WhateverGreen](Kexts/WhateverGreen.kext)

  > **Note**: Others than above should remain as empty

- Quirks
  
  - AppleXcpmCfgLock - boolean - `Yes`
  - DisableIoMapper - boolean - `Yes`
  - PanicNoKextDump - boolean - `Yes`
  - PowerTimeoutKernelPanic - boolean - `Yes`
  - SetApfsTrimTimeout - number - `0`

  > **Note**: Others than shall remain as `No`

- **Misc**

  - ConsoleAttributes - boolean - `Yes`
  - HibernateMode - boolean - `Yes`
  - HideAuxiliary - string - `Auto`
  - LauncherOption - string - `Full`
  - LauncherPath - string - `Default`
  - PickerAttributes - number - `147`
  - PickerMode - string - `External`
  - PickerVariant - string - `Acidanthera\GoldenGate` or `your custom theme`
  - ShowPicker - boolean - `Yes`
  - TakeoffDelay - number - `0`
  - Timeout - number - `5`

  > **Note**: Other than above is `No`

- **PlatformInfo**

  - SMBIOS: [iMac20,1](https://everymac.com/ultimate-mac-lookup/?search_keywords=iMac20,1)

  > **Note**: Refer real iMac20,1 Apple. Inc [BIOS Vendor](BIOS/BIOSVendor:%20%22Apple%20Inc.%22.yml)

- **UEFI**

  - APFS
  
    - EnableJumpstart - boolean - `Yes`
    - HideVerbose - boolean - `Yes`
    - MinDate - number - `0` (use `-1` for Catalina)
    - MinVolume - number - `0` (use `-1` for Catalina)
  
  - Drivers
  
    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `OpenRuntime.efi`
    - Path - boolean - `HFSPlus.efi`
    - Path - boolean - `ResetNvramEntry.efi`

  > **Note**: Enable - `boolean` all driver as `Yes`

  - Input
  
    - KeyForgetThreshold - number - `5`
    - LeySupport - boolean - `Yes`
    - KeySupportMode - boolean - `Auto`
    - PointerSupportMode - string - `ASUS`
    - TimerResolution - number - `50000`

  > **Note**: Other than above is `No`

  - Output
  
    - GopPassThrough - string - `Disable`
    - ProvideConsoleGop - boolean - `Yes`
    - Resolution - string - `max`
    - TextRenderer - string - `BuiltinGraphics`
    - UIScale - number - `-1`

  > **Note**: Other than above is `No`

  - ProtocolOverrides
  
    - FirmwareVolume - boolean - `Yes`

  > **Note**: Other than above is `No`

  - Quirks
  
    - EnableVectorAcceleration - boolean - `Yes`
    - ExitBootServicesDelay - number - `0`
    - RequestBootVarRouting - boolean - `Yes`
    - ResizeGpuBars - number - `-1`
    - TscSyncTimeout - number - `0`

  > **Note**: Other than above is `No`

### Changelog

- March 11, 2023 6:19 AM [OC](https://github.com/acidanthera/OpenCorePkg) ver: [0.9.0](https://github.com/acidanthera/OpenCorePkg/releases)

  - [x] Add fake FWHD (only run on macOS)
  - [x] Clean ACPI code


## Guide and Samples

- Guide

  - [Ambient Light Sensors](Guide%20&%20Samples/Ambient%20Light%20Sensors/Ambient%20Light%20Sensors.md)
  - [Fix SBUS and MCHC](Guide%20&%20Samples/Fix%20SBUS%20and%20MCHC/Fix%20SBUS%20and%20MCHC.md)
  - [Fix USB Wake](Guide%20&%20Samples/USB%20Devices%20Related%20Fix/Fix%20USB%20Wake.md)
  - [Migrate EFI Properties](Guide%20&%20Samples/Migrate%20EFI%20Properties/Migrate%20EFI%20Properties.md)
  - [Rename and Add Missing Devices](Guide%20&%20Samples/Rename%20&%20Add%20Missing%20Devices/Rename%20&%20Add%20Missing%20Devices.md)
  - [Unsupported USB Advance](Guide%20&%20Samples/USB%20Devices%20Related%20Fix/Unsupported%20USB%20Advance.md)

## Credits

[Acidanthera](https://github.com/acidanthera/) | [corpnewt](https://github.com/corpnewt) | [Dortania](https://github.com/dortania) | [dreamwhite](https://github.com/dortania) | [khronokernel](https://github.com/khronokernel)
