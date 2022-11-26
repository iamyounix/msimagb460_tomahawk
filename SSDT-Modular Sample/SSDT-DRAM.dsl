DefinitionBlock ("", "SSDT", 2, "CpyPst", "DRAM", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.DRAM, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Device (DRAM)    //    Dynamic Random Access Memory
			{
				Name (_ADR, Zero)  // _ADR: Address
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
