DefinitionBlock("", "SSDT", 2, "CpyPst", "CP-AuVd", 0x00000001) {
    External(_SB_, DeviceObj)
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.GFX0, DeviceObj)
    External(_SB_.PCI0.HDAS, DeviceObj)
    External(_SB_.PCI0.PEG0, DeviceObj)
    External(_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External(GPRW, MethodObj) // 2 Arguments
    Scope(\_SB) {
        Scope(PCI0) {
            Scope(GFX0) {
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
            Device(IGPU) {
                Name(_ADR, 0x00020000) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If((Arg2 == Zero)) {
                        Return(Buffer(One) {
                            0x03 // .
                        })
                    }
                    Return(Package() {
                        "AAPL,ig-platform-id",
                        Buffer() {
                            0x03,
                            0x00,
                            0x92,
                            0x3E,
                        },
                        "AAPL,slot-name",
                        "Slot- 0",
                        "built-in",
                        Buffer() {
                            0x00,
                        },
                        "device-id",
                        Buffer() {
                            0x9B,
                            0x3E,
                            0x00,
                            0x00,
                        },
                        "enable-metal",
                        Buffer() {
                            0x01,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                        },
                        "igfxfw",
                        Buffer() {
                            0x02,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                        },
                        "igfxonln",
                        Buffer() {
                            0x01,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                        },
                        "iommu-selection",
                        Buffer() {
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                        },
                        "No-hda-gfx",
                        Buffer() {
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            // ........
                        },
                        "No-idle-support",
                        Buffer() {
                            0x00 // .
                        }
                    })
                }
            }
            Scope(HDAS) {
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
            Device(HDEF) {
                Name(_ADR, 0x001F0003) // _ADR: Address
                Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                {
                    If((Arg2 == Zero)) {
                        Return(Buffer(One) {
                            0x03 // .
                        })
                    }
                    Return(Package() {
                        "layout-id",
                        Buffer() {
                            0x01,
                            0x00,
                            0x00,
                            0x00
                        },
                        "No-hda-gfx",
                        Buffer() {
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00,
                            0x00 // ........
                        },
                        "No-idle-support",
                        Buffer(One) {
                            0x00 // .
                        }
                    })
                }
            }
            Scope(PEG0) {
                Scope(PEGP) {
                    Device(BRG0) {
                        Name(_ADR, Zero) // _ADR: Address
                        Device(GFX0) {
                            Name(_ADR, Zero) // _ADR: Address
                            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                            {
                                If((Arg2 == Zero)) {
                                    Return(Buffer(One) {
                                        0x03 // .
                                    })
                                }
                                Method(_PRW, 0, NotSerialized) // _PRW: Power Resources for Wake
                                {
                                    Return(GPRW(0x69, 0x04))
                                }
                                Return(Package() {
                                    "@0,AAPL,boot-display",
                                    Buffer() {
                                        0x01,
                                        0x00,
                                        0x00,
                                        0x00
                                    },
                                    "@0,ATY,EFIDisplay",
                                    "DP1",
                                    "@0,compatible",
                                    "ATY,Python",
                                    "@0,display-type",
                                    "LCD",
                                    "@0,display_type",
                                    "display",
                                    "@0,name",
                                    "@1,compatible",
                                    "ATY,Python",
                                    "@1,display-type",
                                    "NONE",
                                    "@1,display_type",
                                    "display",
                                    "@1,name",
                                    "ATY,Python",
                                    "@2,compatible",
                                    "ATY,Python",
                                    "@2,display-type",
                                    "NONE",
                                    "@2,display_type",
                                    "display",
                                    "@2,name",
                                    "ATY,Python",
                                    "@3,compatible",
                                    "ATY,Python",
                                    "@3,display-type",
                                    "NONE",
                                    "@3,display_type",
                                    "display",
                                    "@3,name",
                                    "ATY,Python",
                                    "AAPL,slot-name",
                                    "Slot- 1",
                                    "ATY,EFIEnabledMode",
                                    Buffer() {
                                        0x04,
                                    },
                                    "ATY,EFIVersion",
                                    "31.0.12026.3",
                                    "ATY,EFIVersionB",
                                    "113-MSITV382MH.161",
                                    "ATY,Rom#",
                                    "113-EXT37635-001",
                                    "ATY,copyright",
                                    "Copyright AMD Inc.  All Right Reserved.  2005-2019",
                                    "agdpmod",
                                    "pikera",
                                    "hda-gfx",
                                    "onboard-1"
                                })
                            }
                        }
                        Device(HDAU) {
                            Name(_ADR, One) // _ADR: Address
                            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                            {
                                If((Arg2 == Zero)) {
                                    Return(Buffer(One) {
                                        0x03 // .
                                    })
                                }
                                Return(Package() {
                                    "hda-gfx",
                                    "onboard-1",
                                    "model",
                                    "Navi 10 HDMI Audio",
                                    "name",
                                    "HDAU",
                                })
                            }
                        }
                    }
                }
            }
        }
    }
}
