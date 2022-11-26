DefinitionBlock ("", "SSDT", 2, "CpyPst", "RTLK", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.RP04, DeviceObj)
	External (_SB_.PCI0.RP04.PXSX, DeviceObj)

	Scope (\_SB)    // System BUS
	{
		Scope (PCI0)    // PCI Root Bridge
		{
			Scope (RP04)    // Root Port No. 04
			{
				Scope (PXSX)    // TL8125 2.5 GB Ethernet Controller
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

				Device (RTLK)    // RTL8125 2.5 GB Ethernet Controller (Renamed)
				{
					Name (_ADR, Zero)  // _ADR: Address
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
}