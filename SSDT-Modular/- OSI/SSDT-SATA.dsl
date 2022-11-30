DefinitionBlock ("", "SSDT", 2, "CpyPst", "SATA", 0x00000001)
{
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.SAT0, DeviceObj)

	Scope (\_SB)
	{
		Scope (PCI0)
		{
			Scope (SAT0)    // SAT0 Generic HDD/SSD Device
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					Return (Zero)    // Control Method Not Apply
				}
			}

			Device (SATA)    // Generic HDD/SSD Device, SATO to SATA Rename
			{
				Name (_ADR, 0x00170000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					Return (0x0F)    // Control Method Apply
				}
			}
		}
	}
}