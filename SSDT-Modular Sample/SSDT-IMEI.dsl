DefinitionBlock ("", "SSDT", 2, "CpyPst", "IMEI", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.HECI, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (HECI)    //    Intel Management Engine Interface
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
			
			Device (IMEI)    //    Intel Management Engine Interface Rename
			{
				Name (_ADR, 0x00160000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
