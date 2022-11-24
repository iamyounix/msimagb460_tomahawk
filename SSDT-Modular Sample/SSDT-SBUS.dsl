DefinitionBlock ("", "SSDT", 2, "CpyPst", "SBUS", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (SBUS)    // Serial BUS
			{
				Device (BUS0)    //BUS Bridge
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_CID, "smbus")  // _CID: Compatible ID
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
									 0x03                                             // .
								})
							}

							Return (Package ()
							{
								"address", 
								Zero
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
		}
	}
}
