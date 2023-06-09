DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0.DRAM, DeviceObj)
	External (_SB_.PCI0.TSUB, DeviceObj)
	External (STAS, IntObj)
	External (_ADR, MethodObj)
	
	Method (OSDW, 0, NotSerialized)
	{
		If (CondRefOf (_OSI))
		{
			If (_OSI ("Darwin"))
			{
				Return (One)
			}
		}
		Return (Zero)
	}
	
	Method (_INI, 0, Serialized)  // _INI: Initialize
    {
        If (OSDW())
        {
            If (_ADR == 0x00140002)
            {
                Name (\_SB.PCI0.TSUB._STA, 0x0F)  // _STA: Status
            }
        }
    }
	
	Name (\_SB.PCI0.DRAM._STA, 0x0F)
}