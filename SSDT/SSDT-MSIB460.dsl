
/*!
 * The code defines a number of external devices, such as the PCI0 device and the LPCB device, as well as a number of internal devices, such as the EC
 * device and the MCHC device. It also defines a number of methods, such as the _INI method and the _DSM method, which are used to initialise and configure
 * the devices and perform other tasks. One notable feature of the code is the use of the "If(_OSI("Darwin"))" construct, which checks whether the operating
 * system is Darwin (i.e., MacOS). This allows the code to behave differently depending on the operating system that is running on the system. Overall, the
 * purpose of this code is to provide the operating system with information about the hardware and software configuration of the system and to define methods
 * for controlling and managing power and configuration settings on the system.
 */
DefinitionBlock ("", "SSDT", 2, "MSI", "B460", 0x42343630)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.PEG0, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)
	External (ALSE, IntObj)
	External (STAS, IntObj)

	Scope (\)
	{
		If (_OSI ("Darwin"))
		{
			ALSE = 0x02
		}
	}

	Scope (\_SB)
	{
		Method (_INI, 0, NotSerialized)  // _INI: Initialize
		{
			If (_OSI ("Darwin"))
			{
				STAS = One
			}
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
					Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))
						{
							Return (0x0F)
						}
						Else
						{
							Return (Zero)
						}
					}
				}
			}

			Scope (PEG0)
			{
				Scope (PEGP)
				{
					Device (PXSX)
					{
						Name (_ADR, Zero)  // _ADR: Address
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
					Device (DVL0)
					{
						Name (_ADR, 0x57)  // _ADR: Address
						Name (_CID, "diagsvault")  // _CID: Compatible ID
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (!Arg2)
							{
								Return (Buffer ()
								{
									 0x57                                             // W
								})
							}

							Return (Package ()
							{
								"address", 
								0x57
							})
						}
					}

					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))
						{
							Return (0x0F)
						}
						Else
						{
							Return (Zero)
						}
					}
				}
			}

			Device (TSUB)
			{
				Name (_ADR, 0x00140002)  // _ADR: Address
			}
		}

		Device (USBX)
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

				Return (Package ()
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
				If (_OSI ("Darwin"))
				{
					Return (0x0F)
				}
				Else
				{
					Return (Zero)
				}
			}
		}
	}
}