DefinitionBlock ("", "SSDT", 2, "CpyPst", "XHC1", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.XHC_, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (XHC)    //USB Device (XHC)
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

			Device (XHC1)    //USB Device (XHC to XHC1 Rename)
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

					Return (Package (0x02)
					{
						"acpi-wake-type", 
						Buffer ()
						{
							 0x01                                             // .
						}
					})
				}
			}
		}
	}
}
