DefinitionBlock ("", "SSDT", 2, "CpyPst", "IMEI", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.HECI, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI Root Bridge
		{
			Scope (HECI)    //    Intel Management Engine Interface
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply 
					}
				}
			}
			
			Device (IMEI)    //    Intel Management Engine Interface Rename
			{
				Name (_ADR, 0x00160000)  // _ADR: Address
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