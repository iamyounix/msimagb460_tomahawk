DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.PEG0, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	
	/* // Most 8th Gen above not require SBUS
	External (_SB_.PCI0.SBUS, DeviceObj)
	*/
	
    /* // Remove this part for Big Sur and above
	External (_SB_.PR00, DeviceObj)
    */
    
	External (STAS, IntObj)

	Scope (\_SB)    // System BUS 
	{
    
        // Enable acpi injection if Darwin Kernel is loaded
		If (_OSI ("Darwin"))
		{
			
			/* // Remove this part for Big Sur and above
			Scope (PR00)    //    Processor
			{
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One)
						{
							 0x03                                             // .
						})
					}

					Return (Package (0x02)    // XNU's CPU Power Management
					{
						"plugin-type", 
						One
					})
				}
			}
			*/
			
			Method (_INI, 0, NotSerialized)  // _INI: Initialize
			{
				STAS = One
			}

			Scope (PCI0)    // PCI Root Bridge
			{
				Device (DRAM)    // Rename from pci8086,9b53 
				{
					Name (_ADR, Zero)  // _ADR: Address
				}

				Scope (LPCB)	// Low Pin Count Board
				{
					Device (EC)    //  Fake Embedded Controller
					{
						Name (_HID, "ACID0001")  // _HID: Hardware ID
					}
				}
                
				Scope (PEG0)    // pci-bridge
				{
					Scope (PEGP)    // pci-bridge 
					{
						Device (PBRG)    // pci-bridge
						{
							Name (_ADR, Zero)  // _ADR: Address
							Device (GFX0)    // AMD Radeon RX 5500 XT 4 GB
							{
								Name (_ADR, Zero)  // _ADR: Address
							}

							Device (HDAU)    // AMD Radeon RX 5500 XT High Definition Audio
							{
								Name (_ADR, One)  // _ADR: Address
							}
						}
					}
				}

				Device (PGMM)    // Platform Power Management
				{
					Name (_ADR, 0x00080000)  // _ADR: Address
				}
				
				/* // Most 8th Gen above not require SBUS. If required, remove this part.	
				Scope (SBUS)    // System Management Bus
				{
					Device (BUS0)
					{
						Name (_CID, "smbus")  // _CID: Compatible ID
						Name (_ADR, Zero)  // _ADR: Address
						Device (DVL0)
						{
							Name (_ADR, Zero)  // _ADR: Address
							Name (_CID, "diagsvault")  // _CID: Compatible ID
						}
					}
				}
				*/
					
				Device (THSS)    // Rename from pci8086,a3b1 (Thermal Subsystem)
				{
					Name (_ADR, 0x00140002)  // _ADR: Address
				}
			}

			Device (USBX)    // Virtual USB Power Properties
			{
				Name (_ADR, Zero)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer ()
						{
							 0x03                                             // .
						})
					}

					Return (Package ()    // Apple Power Properties
					{
						"kUSBSleepPowerSupply", 
						0x13EC,	// Decimal = 5100
						"kUSBSleepPortCurrentLimit", 
						0x0834,	// Decimal = 2100 
						"kUSBWakePowerSupply", 
						0x13EC,	// Decimal = 5100 
						"kUSBWakePortCurrentLimit", 
						0x0834	// Decimal = 2100
					})
				}
			}
			
			// Enable STA_ Method to all device listed	
			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				Return (0x0F)
			}
		}
	}
}
