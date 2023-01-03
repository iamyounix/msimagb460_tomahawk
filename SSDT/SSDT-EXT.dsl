DefinitionBlock("", "SSDT", 2, "CpyPst", "EXT", 0x00455854) {
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.LPCB, DeviceObj)
    External(_SB_.PCI0.PEG0, DeviceObj)
    External(_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External(_SB_.PCI0.SBUS, DeviceObj)
    External(STAS, IntObj)

    Scope(\_SB) {
        Method(_INI, 0, NotSerialized) {
            If(_OSI("Darwin")) {
                STAS = One
            }
        }

        Scope(PCI0) {
            Scope(LPCB) {
                Device(EC) {
                    Name(_HID, "ACID0001")
                    Method(_STA, 0, NotSerialized) {
                        If(_OSI("Darwin")) {
                            Return(0x0F)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                }
            }

            Device(MCHC) {
                Name(_ADR, Zero)
            }

            Scope(PEG0) {
                Scope(PEGP) {
                    Device(PXSX) {
                        Name(_ADR, Zero)
                    }
                }
            }

            Device(PGMM) {
                Name(_ADR, 0x00080000)
            }

            Scope(SBUS) {
                Device(BUS0) {
                    Name(_ADR, Zero)
                    Name(_CID, "smbus")
                    Device(DVL0) {
                        Name(_ADR, 0x57)
                        Name(_CID, "diagsvault")
                        Method(_DSM, 4, NotSerialized) {
                            If(!Arg2) {
                                Return(Buffer() {
                                    0x03
                                })
                            }

                            Return(Package() {
                                "address",
                                Zero
                            })
                        }
                    }

                    Method(_STA, 0, NotSerialized) {
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
                Name(_ADR, 0x00140002)
            }
        }

        Device(USBX) {
            Name(_ADR, Zero)
            Method(_DSM, 4, NotSerialized) {
                If((Arg2 == Zero)) {
                    Return(Buffer() {
                        0x03
                    })
                }

                Return(Package() {
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

            Method(_STA, 0, NotSerialized) {
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
