DefinitionBlock ("", "SSDT", 2, "CpyPst", "IGPU", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.GFX0, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI root bridge
		{	
			Scope (GFX0)    // Integrated Graphic Processor Unit
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

			Device (IGPU)    // Integrated Graphic Processor Unit Rename
			{
				Name (_ADR, 0x00020000)  // _ADR: Address
				Name (_SUN, Zero)  // _SUN: Slot User Number
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))
					{
						Return (Buffer ()
						{
							 0x03                                             // .
						})
					}

					Return (Package ()    // IGPU (UHD 630) Properties
					{
						"AAPL,ig-platform-id", 
						Buffer ()
						{
							 0x03, 0x00, 0x92, 0x3E                           // ...>
						}, 

						"AAPL,slot-name", 
						Buffer ()
						{
							 0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x30         // Slot- 0
						}, 

						"built-in", 
						Zero, 
						"device-id", 
						Buffer ()
						{
							 0x9B, 0x3E, 0x00, 0x00                           // .>..
						}, 

						"enable-metal", 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 

						"igfxfw", 
						Buffer ()
						{
							 0x02, 0x00, 0x00, 0x00                           // ....
						}, 

						"igfxonln", 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 

						"iommu-selection", 
						Buffer ()
						{
							 0x00, 0x00, 0x00, 0x00                           // ....
						}
					})
				}
			}
		}
	}
}