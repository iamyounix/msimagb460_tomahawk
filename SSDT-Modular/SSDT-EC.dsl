DefinitionBlock ("", "SSDT", 2, "CpyPst", "EC", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{			
			Scope (LPCB)
			{
				Device (EC)    // Fake Embedded Controller
				{
					Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
					Name (_UID, One)  // _UID: Unique ID
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				    {
					    If (_OSI ("Darwin"))
					    {
						    Return (0x0F)    // Control Method Apply   
					    }
					    Else
					    {
						    Return (Zero)    // Control Method Not Apply
					    }
				    }
				}
			}
		}
	}
}
