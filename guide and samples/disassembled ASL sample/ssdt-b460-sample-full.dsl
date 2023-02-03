/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL6dCFhK.aml, Sat Feb  4 04:07:06 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000406 (1030)
 *     Revision         0x02
 *     Checksum         0xF7
 *     OEM ID           "MSI"
 *     OEM Table ID     "B460"
 *     OEM Revision     0x42343630 (1110718000)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "MSI", "B460", 0x42343630)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.GLAN, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.PEG0, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	External (_SB_.PCI0.RP03, DeviceObj)
	External (_SB_.PCI0.RP03.PXSX, DeviceObj)
	External (_SB_.PCI0.RP07, DeviceObj)
	External (_SB_.PCI0.RP07.PXSX, DeviceObj)
	External (_SB_.PCI0.RP09, DeviceObj)
	External (_SB_.PCI0.RP09.PXSX, DeviceObj)
	External (_SB_.PCI0.RP21, DeviceObj)
	External (_SB_.PCI0.RP21.PXSX, DeviceObj)
	External (_SB_.PCI0.SAT0, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)
	External (STAS, IntObj)

	Scope (\_SB)
	{
		If (_OSI ("Darwin"))
		{
			Method (_INI, 0, NotSerialized)  // _INI: Initialize
			{
				STAS = One
			}
		}

		If (_OSI ("Darwin"))
		{
			Scope (PCI0)
			{
				Device (DRAM)
				{
					Name (_ADR, Zero)  // _ADR: Address
				}

				Scope (GLAN)
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (Zero)
					}
				}

				Device (LAN0)
				{
					Name (_ADR, 0x001F0006)  // _ADR: Address
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (0x0F)
					}
				}

				Scope (LPCB)
				{
					Device (EC)
					{
						Name (_HID, "ACID0001")  // _HID: Hardware ID
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
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

				Scope(SBUS) {
					Device(BUS0) {
						Name(_CID, "smbus") // _CID: Compatible ID
						Name(_ADR, Zero) // _ADR: Address
						Device(DVL0) {
							Name(_ADR, 0x57) // _ADR: Address
							Name(_CID, "diagsvault") // _CID: Compatible ID
							Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
							{
								Return(0x0F)
							}
						}

						Method(_STA, 0, NotSerialized) // _STA: Status
						{
							Return(0x0F)
						}
					}
				}

				Scope (RP03)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (Zero)
						}
					}

					Device (LAN1)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}

				Scope (RP07)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (Zero)
						}
					}

					Device (ARPT)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}

				Scope (RP09)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (Zero)
						}
					}

					Device (ANS1)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}

				Scope (RP21)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (Zero)
						}
					}

					Device (ANS2)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}

				Scope (SAT0)
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (Zero)
					}
				}

				Device (SATA)
				{
					Name (_ADR, 0x00170000)  // _ADR: Address
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (0x0F)
					}
				}

				Device (THSS)
				{
					Name (_ADR, 0x00140002)  // _ADR: Address
				}
			}
		}

		If (_OSI ("Darwin"))
		{
			Device (USBX)
			{
				Name (_ADR, Zero)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))
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

				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					Return (0x0F)
				}
			}
		}
	}
}

