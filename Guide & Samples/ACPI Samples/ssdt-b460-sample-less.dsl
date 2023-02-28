/**This line defines the SSDT (Secondary System Description Table). This is an ACPI table which includes control methods and memory devices.*/
DefinitionBlock ("", "SSDT", 2, "MSI", "B460", 0x00002000)
{
    /**The following lines define external objects that the current object depends on. These objects are found in other tables and referred to here so they can be used in the current definition block.*/
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (STAS, IntObj)
	/**This block defines the location of the new object, which is under _SB_.*/
    Scope (\_SB)
	{
		/**This method goes through all the necessary steps for initializing the new object. The "If (_OSI ("Darwin"))" statement checks whether the operating system is Darwin platform or not.*/
		
		Method (_INI, 0, NotSerialized)  // _INI: Initialize
		{
			//Check if OS is type Darwin
			If (_OSI ("Darwin"))
			{
				STAS = One
			}
			
			Scope (PCI0)
			{
				/**These two devices provide generic functions, such as address and status.*/
				Device (DRAM)
				{
					Name (_ADR, Zero)  // _ADR: Address
				}
				
				Scope (LPCB)
				{
					Device (EC)
					{
						Name (_HID, "ACID0001")  // _HID: Hardware ID
					}
				}
				
				Scope (PEG0)
				{
					Scope (PEGP)
					{                        
					}
					/**These two devices provide a specific type of function depending on the name. In this case EGP stands for Enhanced Graphics Port.*/
					Device (EGP0)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Device (EGP1)
						{
							Name (_ADR, Zero)  // _ADR: Address
						}
					}
				}
				/**This device sets port range that the new object is allowed to access.*/
				Device (PGMM)
				{
					Name (_ADR, 0x00080000)  // _ADR: Address
				}
				/**These two devices provide a specific type of function depending on their names. In this case BUS stands for Bus Interface Unit and DVL stands for Diagnostics Vault Logic devices.*/
				Scope (SBUS)
				{
					Device (BUS0)
					{
						Name (_CID, "smbus")  // _CID: Compatible ID
						Name (_ADR, Zero)  // _ADR: Address
						Device (DVL0)
						{
							Name (_ADR, 0x57)  // _ADR: Address
							Name (_CID, "diagsvault")  // _CID: Compatible ID
						}
					}
				}
				/**This device definitions Thermal Subsystem information.*/
				Device (THSS)
				{
					Name (_ADR, 0x00140002)  // _ADR: Address
				}
			}
			
			// _STA: Status
			Method (_STA, 0, NotSerialized) 
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