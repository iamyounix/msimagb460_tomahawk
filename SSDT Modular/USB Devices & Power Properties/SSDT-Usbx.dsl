DefinitionBlock("", "SSDT", 2, "CpyPst", "CP-Usbx", 0x00000001) {
    External(_SB_, DeviceObj)
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.RP05, DeviceObj)
    External(_SB_.PCI0.RP05.PXSX, DeviceObj)
    External(_SB_.PCI0.RP05.PXSX._STA, UnknownObj)
    External(_SB_.PCI0.XHC_, DeviceObj)
    External(_SB_.USBX, DeviceObj)

    Scope(\_SB) {
        Scope(PCI0) {
			
			Scope(XHC) {
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

            Device(XHC1) {
                Name(_ADR, 0x00140000) // _ADR: Address
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
			
            Scope(RP05) {
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

                Device(XHC2) {
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

        Device(USBX) {
            Name(_ADR, Zero) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
                If((Arg2 == Zero)) {
                    Return(Buffer(One) {
                        0x03 // .
                    })
                }

                Return(Package(0x08) {
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
}
