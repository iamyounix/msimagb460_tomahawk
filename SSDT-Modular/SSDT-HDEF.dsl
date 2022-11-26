DefinitionBlock ("", "SSDT", 2, "CpyPst", "HDEF", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.HDAS, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI root bridge
		{
			Scope (HDAS)    // High Definition Audio
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else     // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply
					}
				}
			}

			Device (HDEF)    // High Definition Audio (Renamed)
			{
				Name (_ADR, 0x001F0003)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))
					{
						Return (Buffer ()
						{
							 0x03                                             // .
						})
					}

					Return (Package ()    // High Definition Audio Properties
					{
						"No-hda-gfx",    // HDA GFX Properties 
						Buffer ()
						{
							 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
						}, 

						"layout-id",    // Enable Layout 01 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 

						"No-idle-support",    // Idle Support Disable
						Buffer ()
						{
							 0x00                                             // .
						}
					})
				}
			}
		}
	}
}
