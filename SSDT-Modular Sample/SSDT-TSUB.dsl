DefinitionBlock ("", "SSDT", 2, "CpyPst", "TSUB", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.TSUB, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{			
			Device (TSUB) // Thermal Subsystem
			{
				Name (_ADR, 0x00140002)  // _ADR: Address
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
