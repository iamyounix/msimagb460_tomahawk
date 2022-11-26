DefinitionBlock ("", "SSDT", 2, "CpyPst", "USB", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.RP05, DeviceObj)
	External (_SB_.PCI0.XHC_, DeviceObj)
	External (_SB_.PCI0.RP05.PXSX, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI Root Bridge
		{
			Scope (XHC)    // USB Device (XHC)
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply    
					}
				}
			}

			Device (XHC1)    // USB Device (XHC to XHC1 Rename)
			{
				Name (_ADR, 0x00140000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))
					{
						Return (Buffer ()
						{
							 0x03                                             // .
						})
					}

					Return (Package (0x02)    // XHC1 Device Properties
					{
						"acpi-wake-type",    // XHC1 Wake Fix 
						Buffer ()
						{
							 0x01                                             // .
						}
					})
				}
			}

			Scope (RP05)    // Root Port No. 05
			{
				Scope (PXSX)    // VL 805/806 xHCI USB Controller
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
						Else    // Other Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply    
						}
					}
				}

				Device (XHC2)    // VL 805/806 xHCI USB Controller (Renamed)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_SUN, 0x03)  // _SUN: Slot User Number
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))
						{
							Return (Buffer (One)
							{
								 0x03                                             // .
							})
						}

						Return (Package (0x06)    // XHC2 Device Properties
						{
							"acpi-wake-type",    // XHC2 Wake Fix 
							Buffer (One)
							{
								 0x01                                             // .
							}, 

							"built-in",    // Fake built-in (Applicable to PCI Card)
							Zero, 
							"model", 
							Buffer (0x21)
							{
								/* 0000 */  0x56, 0x4C, 0x38, 0x30, 0x35, 0x2F, 0x38, 0x30,  // VL805/80
								/* 0008 */  0x36, 0x20, 0x78, 0x48, 0x43, 0x49, 0x20, 0x55,  // 6 xHCI U
								/* 0010 */  0x53, 0x42, 0x20, 0x33, 0x2E, 0x30, 0x20, 0x43,  // SB 3.0 C
								/* 0018 */  0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x6C, 0x65,  // ontrolle
								/* 0020 */  0x72                                             // r
							}
						})
					}
				}
			}
		}

		Device (USBX)    // USB Power Management
		{
			Name (_ADR, Zero)  // _ADR: Address
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If ((Arg2 == Zero))
				{
					Return (Buffer ()
					{
						 0x03                                             // .
					})
				}

				Return (Package ()    // USB Power Properties
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

			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				If (_OSI ("Darwin"))    // Operating System Interfaces
				{
					Return (0x0F)    // Control Method Apply   
				}
				Else    // Other Operating System Interfaces
				{
					Return (Zero)    // Control Method Not Apply
				}
			}
		}
	}
}
