// Readme First:
// SSDT-EXT is a safe way for multiboot, espaeciall on Windows + macOS
// This require "Kernel / Quirks / CustomSMBIOSGuid = Yes" and "PlatformInfo / UpdateSMBIOSMode = Custom" via config.plist

DefinitionBlock ("", "SSDT", 2, "CpyPst", "EXT", 0x00000001)
{
    External (_SB_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.DRAM, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.RP04, DeviceObj)
    External (_SB_.PCI0.RP04.PXSX, DeviceObj)
    External (_SB_.PCI0.RP04.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP20, DeviceObj)
    External (_SB_.PCI0.RP20.PXSX, DeviceObj)
    External (_SB_.PCI0.RP20.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP21, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.TSUB, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.USBX, DeviceObj)
    External (ALSE, IntObj)
    External (STAS, IntObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            ALSE = 0x02
        }
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }

        Scope (PCI0)
        {
            Device (DRAM)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

            Scope (LPCB)
            {
                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
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
            }

            Scope (GFX0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (_SUN, Zero)  // _SUN: Slot User Number
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x10)
                    {
                        "AAPL,ig-platform-id", 
                        Buffer (0x04)
                        {
                             0x03, 0x00, 0x92, 0x3E                           // ...>
                        }, 

                        "AAPL,slot-name", 
                        Buffer (0x07)
                        {
                             0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x30         // Slot- 0
                        }, 

                        "built-in", 
                        Zero, 
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x9B, 0x3E, 0x00, 0x00                           // .>..
                        }, 

                        "enable-metal", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "igfxfw", 
                        Buffer (0x04)
                        {
                             0x02, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "igfxonln", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "iommu-selection", 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    })
                }
            }

            Scope (HDAS)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x06)
                    {
                        "No-hda-gfx", 
                        Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, 

                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "No-idle-support", 
                        Buffer (One)
                        {
                             0x00                                             // .
                        }
                    })
                }
            }

            Scope (HECI)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

            Scope (PEG0)
            {
                Scope (PEGP)
                {
                    Device (BRG0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x42)
                                {
                                    "@0,AAPL,boot-display", 
                                    Buffer (0x04)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
                                    }, 

                                    "@0,ATY,EFIDisplay", 
                                    Buffer (0x03)
                                    {
                                         0x44, 0x50, 0x31                                 // DP1
                                    }, 

                                    "@0,compatible", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@0,device_type", 
                                    Buffer (0x07)
                                    {
                                         0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
                                    }, 

                                    "@0,display-type", 
                                    Buffer (0x03)
                                    {
                                         0x4C, 0x43, 0x44                                 // LCD
                                    }, 

                                    "@0,display_type", 
                                    Buffer (0x07)
                                    {
                                         0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
                                    }, 

                                    "@0,name", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@1,compatible", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@1,device_type", 
                                    Buffer (0x07)
                                    {
                                         0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
                                    }, 

                                    "@1,display-type", 
                                    Buffer (0x04)
                                    {
                                         0x4E, 0x4F, 0x4E, 0x45                           // NONE
                                    }, 

                                    "@1,name", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@2,compatible", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@2,device_type", 
                                    Buffer (0x07)
                                    {
                                         0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
                                    }, 

                                    "@2,display-type", 
                                    Buffer (0x04)
                                    {
                                         0x4E, 0x4F, 0x4E, 0x45                           // NONE
                                    }, 

                                    "@2,name", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@3,compatible", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "@3,device_type", 
                                    Buffer (0x07)
                                    {
                                         0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
                                    }, 

                                    "@3,display-type", 
                                    Buffer (0x04)
                                    {
                                         0x4E, 0x4F, 0x4E, 0x45                           // NONE
                                    }, 

                                    "@3,name", 
                                    Buffer (0x0A)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
                                        /* 0008 */  0x6F, 0x6E                                       // on
                                    }, 

                                    "AAPL,slot-name", 
                                    Buffer (0x07)
                                    {
                                         0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x31         // Slot- 1
                                    }, 

                                    "ATY,EFIBootMode", 
                                    Buffer (0x0203)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0028 */  0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0030 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
                                        /* 0038 */  0x00, 0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00,  // .P......
                                        /* 0040 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00,  // .....@..
                                        /* 0048 */  0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00,  // .....R..
                                        /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0060 */  0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00,  // .0... ..
                                        /* 0068 */  0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
                                        /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                                        /* 0078 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
                                        /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,  // ........
                                        /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
                                        /* 00A0 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x50, 0xCF, 0xCD,  // .....P..
                                        /* 00A8 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
                                        /* 00B0 */  0x00, 0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00,  // .@......
                                        /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00C0 */  0x00, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // .R......
                                        /* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00,  // .....0..
                                        /* 00D0 */  0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x03, 0x00,  // . ......
                                        /* 00D8 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0118 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0128 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0138 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0140 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0150 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0160 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0168 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0180 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0190 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01B8 */  0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01C0 */  0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
                                        /* 01C8 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
                                        /* 01D0 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
                                        /* 01D8 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01E0 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
                                        /* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01F0 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
                                        /* 01F8 */  0x01, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,  // ........
                                        /* 0200 */  0x00, 0x00, 0x00                                 // ...
                                    }, 

                                    "ATY,EFICompileDate", 
                                    Buffer (0x0B)
                                    {
                                        /* 0000 */  0x4F, 0x63, 0x74, 0x20, 0x31, 0x32, 0x20, 0x32,  // Oct 12 2
                                        /* 0008 */  0x30, 0x31, 0x39                                 // 019
                                    }, 

                                    "ATY,EFIDriverType", 
                                    Buffer (0x02)
                                    {
                                         0x30, 0x32                                       // 02
                                    }, 

                                    "ATY,EFIEnabledMode", 
                                    Buffer (0x02)
                                    {
                                         0x30, 0x34                                       // 04
                                    }, 

                                    "ATY,EFIVersion", 
                                    Buffer (0x0C)
                                    {
                                        /* 0000 */  0x33, 0x31, 0x2E, 0x30, 0x2E, 0x31, 0x32, 0x30,  // 31.0.120
                                        /* 0008 */  0x32, 0x36, 0x2E, 0x33                           // 26.3
                                    }, 

                                    "ATY,EFIVersionB", 
                                    Buffer (0x12)
                                    {
                                        /* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x4D, 0x53, 0x49, 0x54,  // 113-MSIT
                                        /* 0008 */  0x56, 0x33, 0x38, 0x32, 0x4D, 0x48, 0x2E, 0x31,  // V382MH.1
                                        /* 0010 */  0x36, 0x31                                       // 61
                                    }, 

                                    "ATY,Rom#", 
                                    Buffer (0x10)
                                    {
                                        /* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x45, 0x58, 0x54, 0x33,  // 113-EXT3
                                        /* 0008 */  0x37, 0x36, 0x33, 0x35, 0x2D, 0x30, 0x30, 0x31   // 7635-001
                                    }, 

                                    "ATY,copyright", 
                                    Buffer (0x32)
                                    {
                                        /* 0000 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  // Copyrigh
                                        /* 0008 */  0x74, 0x20, 0x41, 0x4D, 0x44, 0x20, 0x49, 0x6E,  // t AMD In
                                        /* 0010 */  0x63, 0x2E, 0x20, 0x20, 0x41, 0x6C, 0x6C, 0x20,  // c.  All 
                                        /* 0018 */  0x52, 0x69, 0x67, 0x68, 0x74, 0x20, 0x52, 0x65,  // Right Re
                                        /* 0020 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2E, 0x20,  // served. 
                                        /* 0028 */  0x20, 0x32, 0x30, 0x30, 0x35, 0x2D, 0x32, 0x30,  //  2005-20
                                        /* 0030 */  0x31, 0x39                                       // 19
                                    }, 

                                    "Force_Load_FalconSMUFW", 
                                    Buffer (One)
                                    {
                                         0x01                                             // .
                                    }, 

                                    "PP_WorkLoadPolicyMask", 
                                    Buffer (One)
                                    {
                                         0x32                                             // 2
                                    }, 

                                    "StartupDisplay", 
                                    Buffer (0x010C)
                                    {
                                        /* 0000 */  0x47, 0x4E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // GN......
                                        /* 0008 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
                                        /* 0010 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
                                        /* 0018 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
                                        /* 0020 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
                                        /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0038 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
                                        /* 0040 */  0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                                        /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0050 */  0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x10, 0x06, 0x32, 0xAE,  // ......2.
                                        /* 0060 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0068 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
                                        /* 0070 */  0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00, 0x00,  // P.......
                                        /* 0078 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
                                        /* 0080 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
                                        /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0098 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
                                        /* 00A0 */  0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,  // ........
                                        /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00B0 */  0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00B8 */  0x10, 0x06, 0x32, 0xAE, 0x02, 0x00, 0x00, 0x00,  // ..2.....
                                        /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
                                        /* 00C8 */  0x40, 0x0B, 0x00, 0x00, 0x50, 0xCF, 0xCD, 0x1C,  // @...P...
                                        /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
                                        /* 00D8 */  0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00,  // @.......
                                        /* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00E8 */  0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // R.......
                                        /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00,  // ....0...
                                        /* 00F8 */  0x20, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  //  .......
                                        /* 0100 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0108 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }, 

                                    "hdagfx", 
                                    Buffer (0x09)
                                    {
                                        /* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
                                        /* 0008 */  0x31                                             // 1
                                    }, 

                                    "agdpmod", 
                                    "pikera"
                                })
                            }
                        }

                        Device (HDAU)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x06)
                                {
                                    "driver-version", 
                                    Buffer (0x09)
                                    {
                                        /* 0000 */  0x31, 0x30, 0x2E, 0x30, 0x2E, 0x31, 0x2E, 0x32,  // 10.0.1.2
                                        /* 0008 */  0x34                                             // 4
                                    }, 

                                    "hdagfx", 
                                    Buffer (0x09)
                                    {
                                        /* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
                                        /* 0008 */  0x31                                             // 1
                                    }, 

                                    "model", 
                                    Buffer (0x12)
                                    {
                                        /* 0000 */  0x4E, 0x61, 0x76, 0x69, 0x20, 0x31, 0x30, 0x20,  // Navi 10 
                                        /* 0008 */  0x48, 0x44, 0x4D, 0x49, 0x20, 0x41, 0x75, 0x64,  // HDMI Aud
                                        /* 0010 */  0x69, 0x6F                                       // io
                                    }
                                })
                            }
                        }
                    }
                }
            }

            Scope (RP04)
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (RTLK)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
            }

            Scope (RP05)
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (XHC2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x03)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x04)
                        {
                            "built-in", 
                            Zero, 
                            "model", 
                            Buffer (0x21)
                            {
                                /* 0000 */  0x56, 0x4C, 0x38, 0x30, 0x35, 0x2F, 0x38, 0x30,  // VL805/80
                                /* 0008 */  0x36, 0x20, 0x78, 0x48, 0x43, 0x49, 0x20, 0x55,  // 6 xHCI U
                                /* 0010 */  0x53, 0x42, 0x20, 0x33, 0x2E, 0x30, 0x20, 0x43,  // SB 3.0 C
                                /* 0018 */  0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x6C, 0x65,  // ontrolle
                                /* 0020 */  0x72                                             // r
                            }
                        })
                    }
                }
            }

            Scope (RP09)
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (ANS0)
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

                        Return (Package (0x08)
                        {
                            "device_type", 
                            Buffer (0x1E)
                            {
                                /* 0000 */  0x4E, 0x6F, 0x6E, 0x2D, 0x56, 0x6F, 0x6C, 0x61,  // Non-Vola
                                /* 0008 */  0x74, 0x69, 0x6C, 0x65, 0x20, 0x6D, 0x65, 0x6D,  // tile mem
                                /* 0010 */  0x6F, 0x72, 0x79, 0x20, 0x63, 0x6F, 0x6E, 0x74,  // ory cont
                                /* 0018 */  0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72               // roller
                            }, 

                            "model", 
                            Buffer (0x15)
                            {
                                /* 0000 */  0x4B, 0x49, 0x4E, 0x47, 0x53, 0x54, 0x4F, 0x4E,  // KINGSTON
                                /* 0008 */  0x20, 0x53, 0x41, 0x32, 0x30, 0x30, 0x30, 0x4D,  //  SA2000M
                                /* 0010 */  0x38, 0x35, 0x30, 0x30, 0x47                     // 8500G
                            }, 

                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "vendor-id", 
                            Buffer (0x04)
                            {
                                 0x4D, 0x14, 0x00, 0x00                           // M...
                            }
                        })
                    }
                }
            }

            Scope (RP20)
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x02)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x04)
                        {
                            "built-in", 
                            Zero, 
                            "model", 
                            Buffer (0x29)
                            {
                                /* 0000 */  0x42, 0x43, 0x4D, 0x34, 0x33, 0x36, 0x30, 0x20,  // BCM4360 
                                /* 0008 */  0x38, 0x30, 0x32, 0x2E, 0x31, 0x31, 0x61, 0x63,  // 802.11ac
                                /* 0010 */  0x20, 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73,  //  Wireles
                                /* 0018 */  0x73, 0x20, 0x4E, 0x65, 0x74, 0x77, 0x6F, 0x72,  // s Networ
                                /* 0020 */  0x6B, 0x20, 0x41, 0x64, 0x61, 0x70, 0x74, 0x65,  // k Adapte
                                /* 0028 */  0x72                                             // r
                            }
                        })
                    }
                }
            }

            Scope (RP21)
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (ANS1)
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

                        Return (Package (0x08)
                        {
                            "device_type", 
                            Buffer (0x1E)
                            {
                                /* 0000 */  0x4E, 0x6F, 0x6E, 0x2D, 0x56, 0x6F, 0x6C, 0x61,  // Non-Vola
                                /* 0008 */  0x74, 0x69, 0x6C, 0x65, 0x20, 0x6D, 0x65, 0x6D,  // tile mem
                                /* 0010 */  0x6F, 0x72, 0x79, 0x20, 0x63, 0x6F, 0x6E, 0x74,  // ory cont
                                /* 0018 */  0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72               // roller
                            }, 

                            "model", 
                            Buffer (0x15)
                            {
                                /* 0000 */  0x4B, 0x49, 0x4E, 0x47, 0x53, 0x54, 0x4F, 0x4E,  // KINGSTON
                                /* 0008 */  0x20, 0x53, 0x41, 0x32, 0x30, 0x30, 0x30, 0x4D,  //  SA2000M
                                /* 0010 */  0x38, 0x35, 0x30, 0x30, 0x47                     // 8500G
                            }, 

                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "vendor-id", 
                            Buffer (0x04)
                            {
                                 0x4D, 0x14, 0x00, 0x00                           // M...
                            }
                        })
                    }
                }
            }

            Scope (SAT0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

            Scope (SBUS)
            {
                Device (BUS0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_CID, "diagsvault")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If (!Arg2)
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package (0x02)
                            {
                                "address", 
                                Zero
                            })
                        }
                    }

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
            }

            Device (TSUB)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

            Scope (XHC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
        }

        Device (USBX)
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

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834
                })
            }

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
    }
}

