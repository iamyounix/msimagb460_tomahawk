DefinitionBlock ("", "SSDT", 2, "CpyPst", "AWAC", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (STAS, IntObj)

	Scope (\_SB)    //    System BUS
	{
		Method (_INI, 0, NotSerialized)  // _INI: Initialize
		{
			If (_OSI ("Darwin"))
			{
				STAS = One
			}
		}
	}
}
