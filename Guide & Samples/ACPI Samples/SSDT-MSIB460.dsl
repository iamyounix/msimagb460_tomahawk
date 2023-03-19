DefinitionBlock("", "SSDT", 2, "MSI", "B460", 0x00002000) {
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.LPCB, DeviceObj)
    External(_SB_.PCI0.PEG0, DeviceObj)
    External(_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External(_SB_.PCI0.SBUS, DeviceObj)
    External(GPRW, MethodObj) // 2 Arguments
    External(STAS, IntObj)

    Scope(\_SB) {
        If(_OSI("Darwin")) {
            Method(_INI, 0, NotSerialized) // _INI: Initialize
            {
                STAS = One
            }

            Scope(PCI0) {
                Device(DRAM) {
                    Name(_ADR, Zero) // _ADR: Address
                    Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        Return(0x0F)
                    }
                }

                Scope(LPCB) {
					Device(EC) {
						Name(_HID, "ACID0001") // _HID: Hardware ID
						Method(_STA, 0, NotSerialized) // _STA: Status
						{
							Return(0x0F)
						}
					}

                    Device(FWHD) {
                        Name(_HID, EisaId("INT0800") /* Intel 82802 Firmware Hub Device */ ) // _HID: Hardware ID
                        Name(_CRS, ResourceTemplate() // _CRS: Current Resource Settings
                            {
                                Memory32Fixed(ReadOnly,
                                    0xFF000000, // Address Base
                                    0x01000000, // Address Length
                                )
                            })
                        Method(_STA, 0, NotSerialized) // _STA: Status
                        {
                            Return(0x0F)
                        }
                    }
                }
                Scope(PEG0) {
                    Scope(PEGP) {
                        Method(_STA, 0, NotSerialized) // _STA: Status
                        {
                            Return(Zero)
                        }
                    }

                    Device(EGP0) {
                        Name(_ADR, Zero) // _ADR: Address
                        Device(EGP1) {
                            Name(_ADR, Zero) // _ADR: Address
                            Method(_PRW, 0, NotSerialized) // _PRW: Power Resources for Wake
                            {
                                Return(GPRW(0x69, 0x04))
                            }

                            Device(GFX0) {

                                Name(_ADR, Zero) // _ADR: Address
								Method(_STA, 0, NotSerialized) // _STA: Status
								{
									Return(0x0F)
								}

                                Device(LCD) {
                                    Method(_ADR, 0, NotSerialized) // _ADR: Address
                                    {
                                        Return(0x0100)
                                    }
                                    Name(_CID, "monitor") // _CID: Compatible ID
									Method(_STA, 0, NotSerialized) // _STA: Status
									{
										Return(0x0F)
									}
                                }
                            }
                            Device(HDAU) {
                                Name(_ADR, One) // _ADR: Address
								Method(_STA, 0, NotSerialized) // _STA: Status
								{
									Return(0x0F)
								}
                            }
                        }

                        Method(_STA, 0, NotSerialized) // _STA: Status
                        {
                            Return(0x0F)
                        }
                    }
                }

                Device(PGMM) {
                    Name(_ADR, 0x00080000) // _ADR: Address
					Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        Return(0x0F)
                    }
                }
                Scope(SBUS) {
                    Device(BUS0) {
                        Name(_CID, "smbus") // _CID: Compatible ID
                        Name(_ADR, Zero) // _ADR: Address
                        Device(DVL0) {
                            Name(_ADR, 0x57) // _ADR: Address
                            Name(_CID, "diagsvault") // _CID: Compatible ID
                            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                            {
                                If(!Arg2) {
                                    Return(Buffer() {
                                        0x57
                                    })
                                }

                                Return(Package() {
                                    "address",0x57,
                                    "command",Zero,
                                    "fault-len",0x04,
                                    "fault-off",0x03,
                                    "refnum",Zero,
                                    "type",0x49324300,
                                    "version",0x03
                                })
                            }
                        }

                        Method(_STA, 0, NotSerialized) // _STA: Status
                        {
                            Return(0x0F)
                        }
                    }
                }

                Device(THSS) {
                    Name(_ADR, 0x00140002) // _ADR: Address
                    Method(_STA, 0, NotSerialized) // _STA: Status
                    {
                        Return(0x0F)
                    }
                }
            }

            Device(PNLF) {
                Name(_HID, EisaId("APP0002")) // _HID: Hardware ID
                Name(_CID, "backlight") // _CID: Compatible ID
                Name(_UID, 0x10) // _UID: Unique ID
                Name(_STA, 0x0B) // _STA: Status
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If((Arg2 == Zero)) {
                        Return(Buffer() {
                            0x03
                        })
                    }

                    Return(Package() {
                        "address",Zero,
						"refnum",Zero,
                        "type",0x49324300,
                        "version",0x03
                    })
                }
            }

            Device(USBX) {
                Name(_ADR, Zero) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If((Arg2 == Zero)) {
                        Return(Buffer() {
                            0x03
                        })
                    }

                    Return(Package() {
                        "kUSBSleepPowerSupply",0x13EC,
                        "kUSBSleepPortCurrentLimit",0x0834,
                        "kUSBWakePowerSupply",0x13EC,
                        "kUSBWakePortCurrentLimit",0x0834
                    })
                }

                Method(_STA, 0, NotSerialized) // _STA: Status
                {
                    Return(0x0F)
                }
            }
        }
    }
}
