DefinitionBlock("", "SSDT", 2, "CpyPst", "CP-DvPr", 0x00000001) {
    External(_SB_, DeviceObj)
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.DRAM, DeviceObj)
    External(_SB_.PCI0.HECI, DeviceObj)
    External(_SB_.PCI0.RP04, DeviceObj)
    External(_SB_.PCI0.RP04.PXSX, DeviceObj)
    External(_SB_.PCI0.RP04.PXSX._STA, UnknownObj)
    External(_SB_.PCI0.RP20, DeviceObj)
    External(_SB_.PCI0.RP20.PXSX, DeviceObj)
    External(_SB_.PCI0.RP20.PXSX._STA, UnknownObj)
    External(_SB_.PCI0.SBUS, DeviceObj)
    External(_SB_.PCI0.TSUB, DeviceObj)
  
    Scope(\_SB) {
        Scope(PCI0) {
            Device(DRAM) {
                Name(_ADR, Zero) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If(_OSI("Darwin")) {
                        Return(0x0F)
                    }
                    Else {
                        Return(Zero)
                    }
                }
            }
            Scope(HECI) {
                Method(_STA, 0, NotSerialized) // _STA: Status
                {
                    If(_OSI("Darwin")) {
                        Return(Zero)
                    }
                    Else {
                        Return(0x0F)
                    }
                }
            }
            Device(IMEI) {
                Name(_ADR, 0x00160000) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If(_OSI("Darwin")) {
                        Return(0x0F)
                    }
                    Else {
                        Return(Zero)
                    }
                }
            }
            Scope(SBUS) {
                Device(BUS0) {
                    Name(_ADR, Zero) // _ADR: Address
                    Name(_CID, "smbus") // _CID: Compatible ID
                    Device(DVL0) {
                        Name(_ADR, 0x57) // _ADR: Address
                        Name(_CID, "diagsvault") // _CID: Compatible ID
                        Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                        {
                            If(!Arg2) {
                                Return(Buffer(One) {
                                    0x03 // .
                                })
                            }
                            Return(Package(0x02) {
                                "address",
                                Zero
                            })
                        }
                    }
                    Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        If(_OSI("Darwin")) {
                            Return(0x0F)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                }
            }
            Device(TSUB) {
                Name(_ADR, 0x00140002) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If(_OSI("Darwin")) {
                        Return(0x0F)
                    }
                    Else {
                        Return(Zero)
                    }
                }
            }
            Scope(RP04) {
                Scope(PXSX) {
                    Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        If(_OSI("Darwin")) {
                            Return(Zero)
                        }
                        Else {
                            Return(0x0F)
                        }
                    }
                }
                Device(RTLK) {
                    Name(_ADR, Zero) // _ADR: Address
                    Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                    {
                        If(_OSI("Darwin")) {
                            Return(0x0F)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                }
            }
            Scope(RP20) {
                Scope(PXSX) {
                    Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        If(_OSI("Darwin")) {
                            Return(Zero)
                        }
                        Else {
                            Return(0x0F)
                        }
                    }
                }
                Device(ARPT) {
                    Name(_ADR, Zero) // _ADR: Address
                    Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                    {
                        If((Arg2 == Zero)) {
                            Return(Buffer(One) {
                                0x03 // .
                            })
                        }
                        Return(Package(0x02) {
                            "built-in",
                            Zero
                        })
                    }
                }
            }
        }
    }
}
