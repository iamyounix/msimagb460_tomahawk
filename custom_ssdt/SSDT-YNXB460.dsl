DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (STAS, IntObj)

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
            Scope (PCI0)
            {
                Device (DRAM)
                {
                    Name (_ADR, Zero)  // _ADR: Address
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

                Scope (LPCB)
                {
                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
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
                        Device (DVL0)
                        {
                            Name (_ADR, 0x57)  // _ADR: Address
                            Name (_CID, "diagsvault")  // _CID: Compatible ID
                        }
                    }
                }

                Device (THSS)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (!Arg2)
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

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Return (0x0F)
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                STAS = One
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }
}
