DefinitionBlock ("", "SSDT", 2, "CpyPst", "ARPT", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.RP20, DeviceObj)
	External (_SB_.PCI0.RP20.PXSX, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (RP20)    //    Change according to DSDT
			{
				Scope (PXSX)
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))
						{
							Return (Zero)
						}
						Else
						{
							Return (0x0F)
						}
					}
				}

				Device (ARPT)    //    Broadcom Wi-Fi
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_SUN, 0x02)  // _SUN: Slot User Number
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))
						{
							Return (Buffer ()
							{
								 0x03                                             // .
							})
						}

						Return (Package (0x04)
						{
							"built-in", 
							Zero, 
							"model", 
							Buffer ()
							{
								/* 0000 */  0x42, 0x43, 0x4D, 0x34, 0x33, 0x36, 0x30, 0x20,  // BCM4360 
								/* 0008 */  0x38, 0x30, 0x32, 0x2E, 0x31, 0x31, 0x61, 0x63,  // 802.11ac
								/* 0010 */  0x20, 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73,  //  Wireles
								/* 0018 */  0x73, 0x20, 0x4E, 0x65, 0x74, 0x77, 0x6F, 0x72,  // s Networ
								/* 0020 */  0x6B, 0x20, 0x41, 0x64, 0x61, 0x70, 0x74, 0x65,  // k Adapte
								/* 0028 */  0x72                                             // r
							}
						})
					}
				}
			}
        }
	}
}
