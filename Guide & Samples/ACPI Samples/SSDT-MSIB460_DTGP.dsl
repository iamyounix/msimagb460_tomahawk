DefinitionBlock("", "SSDT", 2, "MSI", "B460", 0x00002000) {
    External(_SB_.PCI0, DeviceObj)
    External(_SB_.PCI0.LPCB, DeviceObj)
    External(_SB_.PCI0.PEG0, DeviceObj)
    External(_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External(_SB_.PCI0.SBUS, DeviceObj)
    External(STAS, IntObj)

    Scope(\_SB) {
        If(_OSI("Darwin")) {
            Method(_INI, Zero, NotSerialized) // _INI: Initialize
            {
                STAS = One
            }

            Scope(PCI0) {
                Device(DRAM) {
                    Name(_ADR, Zero) // _ADR: Address
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }

                Scope(LPCB) {
                    Device(EC) {
                        Name(_HID, "PNP0C09") // _HID: Hardware ID
                        Method(_STA, Zero, NotSerialized) // _STA: Status
                        {
                            Return(0x0F)
                        }
                    }
                }

                Scope(PEG0) {
                    Scope(PEGP) {
                        Method(_STA, Zero, NotSerialized) // _STA: Status
                        {
                            Return(Zero)
                        }
                    }

                    Device(EGP0) {
                        Name(_ADR, Zero) // _ADR: Address
                        Device(EGP1) {
                            Name(_ADR, Zero) // _ADR: Address
                        }
                    }
					
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }

                Device(PGMM) {
                    Name(_ADR, 0x00080000) // _ADR: Address
                }

                Scope(SBUS) {
                    Device(BUS0) {
                        Name(_CID, "smbus") // _CID: Compatible ID
                        Name(_ADR, Zero) // _ADR: Address
                        Device(DVL0) {
                            Name(_ADR, 0x57) // _ADR: Address
                            Name(_CID, "diagsvault") // _CID: Compatible ID
                        }

                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                            Return (Local0)
                        }
                    }
                }

                Device(THSS) {
                    Name(_ADR, 0x00140002) // _ADR: Address
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

            Device (USBX)
			{
				Name (_ADR, Zero)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					Local0 = Package (0x08)
						{
							"kUSBSleepPowerSupply", 
							0x13EC, 
							"kUSBSleepPortCurrentLimit", 
							0x0834, 
							"kUSBWakePowerSupply", 
							0x13EC, 
							"kUSBWakePortCurrentLimit", 
							0x0834
						}
					DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
					Return (Local0)
				}
			}
        }
    }
	
	Method (DTGP, 5, NotSerialized)
    {
        If (Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d"))
        {
            If (Arg1 == One)
            {
                If (Arg2 == Zero)
                {
                    Arg3 = Buffer (One)
                        {
                             0x03                                             /* . */
                        }
                    Return (One)
                }

                If (Arg2 == One)
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             /* . */
            }
        Return (Zero)
    }
}

