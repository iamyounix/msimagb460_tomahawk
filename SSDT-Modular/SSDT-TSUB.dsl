DefinitionBlock ("", "SSDT", 2, "CpyPst", "TSUB", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.TSUB, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI Root Bridge
		{			
			Device (TSUB) // Thermal Subsystem
			{
				Name (_ADR, 0x00140002)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply   
					}
					Else    // Other Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
			    }
		    }
	    }
    }
}