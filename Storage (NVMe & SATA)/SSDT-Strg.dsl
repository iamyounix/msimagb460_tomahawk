DefinitionBlock("", "SSDT", 2, "CpyPst", "CP-Strg", 0x00000001) {
    External(_SB_, DeviceObj)
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.RP09, DeviceObj)
    External(_SB_.PCI0.RP09.PXSX, DeviceObj)
    External(_SB_.PCI0.RP09.PXSX._STA, UnknownObj)
    External(_SB_.PCI0.RP21, DeviceObj)
    External(_SB_.PCI0.RP21.PXSX, DeviceObj)
    External(_SB_.PCI0.RP21.PXSX._STA, UnknownObj)
    External(_SB_.PCI0.SAT0, DeviceObj)

    Scope(\_SB) {
        Scope(PCI0) {
            Scope(RP09) {
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

                Device(ANS0) {
                    Name(_ADR, Zero) // _ADR: Address
                    Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                    {
                        If((Arg2 == Zero)) {
                            Return(Buffer(One) {
                                0x03 // .
                            })
                        }

                        Return(Package(0x0A) {
                            "device_type",
                            "Non-Volatile memory controller",
                            "model",
                            "KINGSTON SA2000M8500G",
                            "name",
                            "ANS0",
                            "device-id",
                            Buffer(0x04) {
                                0x06,
                                0xA8,
                                0x00,
                                0x00 // ....
                            },

                            "vendor-id",
                            Buffer(0x04) {
                                0x4D,
                                0x14,
                                0x00,
                                0x00 // M...
                            }
                        })
                    }
                }
            }

            Scope(RP21) {
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

                Device(ANS1) {
                    Name(_ADR, Zero) // _ADR: Address
                    Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                    {
                        If((Arg2 == Zero)) {
                            Return(Buffer(One) {
                                0x03 // .
                            })
                        }

                        Return(Package(0x0A) {
                            "device_type",
                            "Non-Volatile memory controller",
                            "model",
                            "KINGSTON SA2000M8500G",
                            "name",
                            "ANS1",
                            "device-id",
                            Buffer(0x04) {
                                0x06,
                                0xA8,
                                0x00,
                                0x00 // ....
                            },

                            "vendor-id",
                            Buffer(0x04) {
                                0x4D,
                                0x14,
                                0x00,
                                0x00 // M...
                            }
                        })
                    }
                }
            }

            Scope(SAT0) {
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

            Device(SATA) {
                Name(_ADR, 0x00170000) // _ADR: Address
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
    }
}
