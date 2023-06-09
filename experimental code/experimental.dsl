DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0.DRAM, DeviceObj)
	External (_SB_.PCI0.PGMM, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	External (_SB_.PCI0.PEG0.EGP0.ADR, DeviceObj)
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
	
	If (OSDW)
	{
        Method (_INI, 0, Serialized)  // _INI: Initialize
		{
            If (_ADR == 0x00080000)
            {
                Name (\_SB.PCI0.PGMM._STA, 0x0F)  // _STA: Status
            }
			
			If (_ADR == 0x00140002)
            {
                Name (\_SB.PCI0.TSUB._STA, 0x0F)  // _STA: Status
            }
			
			If (\_SB.PCI0.PEG0.PEGP)
			{
				Name (\_SB.PCI0.PEG0.EGP0._ADR, Zero)  // _STA: Status
			}
        }
		
		Name (\_SB.PCI0.DRAM._STA, 0x0F)
	}
}
