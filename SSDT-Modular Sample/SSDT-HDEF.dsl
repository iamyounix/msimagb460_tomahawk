DefinitionBlock ("", "SSDT", 2, "CpyPst", "HDEF", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.HDAS, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (HDAS)    //    High Definition Audio System
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))
					{
						Return (Zero)
					}
					Else
					{
						Return (0x0F)
					}
				}
			}

			Device (HDEF)    //    High Definition Audio System (macOS)
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

					Return (Package ()
					{
						"No-hda-gfx", 
						Buffer ()
						{
							 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
						}, 

						"layout-id", 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 

						"No-idle-support", 
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
