DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    /*
    External (_SB_.PCI0.XHC_, DeviceObj)
    */
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR1, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR2, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (_TZ_.FAN0, DeviceObj)
    External (_TZ_.FAN1, DeviceObj)
    External (_TZ_.FAN2, DeviceObj)
    External (_TZ_.FAN3, DeviceObj)
    External (_TZ_.FAN4, DeviceObj)
    External (STAS, IntObj)

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
            Scope (PR00)
            {
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
                        "plugin-type", 
                        One
                    })
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                STAS = One
            }

            Scope (PCI0)
            {
                Device (DRAM)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }

                Scope (LPCB)
                {
                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
                    }
                }

                Scope (PEG0)
                {
                    Scope (PEGP)
                    {
                        Device (PBRG)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Device (GFX0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                            }

                            Device (HDAU)
                            {
                                Name (_ADR, One)  // _ADR: Address
                            }
                        }
                    }
                }

                Device (PGMM)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                }

                Scope (SBUS)
                {
                    Device (BUS0)
                    {
                        Name (_CID, "smbus")  // _CID: Compatible ID
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (I2C)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_CID, "i2c_i801")  // _CID: Compatible ID
                        }
                    }
                }

                Device (TSUB)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                }

                Scope (XHC)
                {
                    Scope (RHUB)
                    {
                        Scope (USR1)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Scope (USR2)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }
                    }
                }
            }

            Scope (\_TZ)
            {
                Scope (FAN0)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Scope (FAN1)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Scope (FAN2)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Scope (FAN3)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Scope (FAN4)
                {
                    Name (_STA, Zero)  // _STA: Status
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
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }
}
