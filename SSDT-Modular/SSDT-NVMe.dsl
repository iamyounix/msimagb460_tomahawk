DefinitionBlock ("", "SSDT", 2, "CpyPst", "NVMe", 0x00000001)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.RP21, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Scope (RP09)
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
        }
    }
}
