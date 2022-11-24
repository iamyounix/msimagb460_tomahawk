DefinitionBlock ("", "SSDT", 2, "CpyPst", "LPCB_EC", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{			
			Scope (LPCB)
			{
				Device (EC)    //    Fake Embedded Controller
				{
					Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
					Name (_UID, One)  // _UID: Unique ID
					Method (_STA, 0, NotSerialized)  // _STA: Status
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
}
