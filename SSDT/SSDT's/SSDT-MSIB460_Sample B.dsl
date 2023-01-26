/*!
 * ACPI Definition Block is a structural representation of the power management
 * and device settings of a computer system, defined in a specific format and
 * syntax and stored in the firmware of the system. It is read by the operating
 * system to configure the system's power management and device settings.
 *
 * Note: Certain device is handled by specific kext. ie: HDEF - "AppleALC.kext"
 * IGPU - "Whatevergreen.kext". Do not rename known device. Renaming doesn't
 * affect performance. Less code used is recommended.
 */
 
DefinitionBlock ("", "SSDT", 2, "MSI", "B460", 0x42343630)
{
	
    /*
	 * Hey, lets clean up ACPI code. This is an example how we can clean up multiple
     * device / device properties is single SSDT.
	 */

    External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.GLAN, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.PEG0, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	External (_SB_.PCI0.RP03, DeviceObj)
	External (_SB_.PCI0.RP03.PXSX, DeviceObj)
	External (_SB_.PCI0.RP07, DeviceObj)
	External (_SB_.PCI0.RP07.PXSX, DeviceObj)
	External (_SB_.PCI0.RP09, DeviceObj)
	External (_SB_.PCI0.RP09.PXSX, DeviceObj)
	External (_SB_.PCI0.RP21, DeviceObj)
	External (_SB_.PCI0.RP21.PXSX, DeviceObj)
	External (_SB_.PCI0.SAT0, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)
	External (STAS, IntObj)
	
	/*
	 * System BUS
	 */
	 
	Scope (\_SB)
	{
		/*
		 * "If (_OSI ("Darwin"))" is a preprocessor directive in C or C++ that checks
		 * if the target operating system is Darwin (macOS), which is the core of the open-source
		 * operating system macOS. This directive is used to include or exclude specific
		 * sections of code that are specific to Darwin-based systems. If the target system
		 * is Darwin, the code within the if statement will be executed, otherwise
		 * it will be ignored. Normally, "Else" is required when other OSe's is installed. 
		 * This workaround is better solution to use "less acpi code" in multiple device with
		 * in the same root.
		 */
		 
		If (_OSI ("Darwin"))
		{
			
		/*
		 * This is a workaround to patch "If ((STAS == Zero))" in DSDT.
		 * AWAC/RTC0 system clocks fix found on newer hardware. ie: B360, B365, H310, 
		 * Z370 (Gigabyte and AsRock boards with newer BIOS versions), Z390, B460, Z490,
		 * X99, and X299. 
		 */
		
			Method (_INI, 0, NotSerialized)  // _INI: Initialize
			{
				STAS = One
			}
		}
		
		If (_OSI ("Darwin"))
		{
			/*
			 * PCI Root Bridge
			 */
			 
			Scope (PCI0)
			{
				/*
				Enabling DRAM instead of MCHC.
				*/
				
				Device (DRAM)
				{
					Name (_ADR, Zero)  // _ADR: Address
				}
				
				/*
				Rename GLAN to LAN0 (EN0).
				*/
				
				Scope (GLAN)
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (Zero)
					}
				}
				
				Device (LAN0)
				{
					Name (_ADR, 0x001F0006)  // _ADR: Address
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (0x0F)
					}
				}
				
				/*
				Low Pin Count BUS.
				*/

				Scope (LPCB)
				{
					
					/*
					 * Fake Embedded Controller for Hackintosh Purpose. On desktops, the EC (or better known as
					 * the embedded controller) isn't compatible with AppleACPIEC driver, this is a workaround 
					 * to disable this device when running macOS. Desktops will want real EC off, and a fake EC 
					 * created.
					 */
					
					Device (EC)
					{
						Name (_HID, EisaId ("ACID001") /* Embedded Controller Device */)  // _HID: Hardware ID
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}

				Scope (PEG0)
				{
					Scope (PEGP)
					{
						
						/*
						 * Workaround to fix missing ACPI device. This is a PCI bridge device present on PEGP.
						 * Normally seen as "pci-bridge" in I/O Registry.
						 */
						 
						Device (PXSX)
						{
							Name (_ADR, Zero)  // _ADR: Address
						}
					}
				}
				
				/*
				 * Workaround to fix missing ACPI device. Normally seen as "pci8086,XXXX" in I/O Registry.
				 */

				Device (PGMM)
				{
					Name (_ADR, 0x00080000)  // _ADR: Address
				}
				
				/*
				 * ACPI Patch to handles the System Management Bus, which has many functions like:
				 * - AppleSMBusController (Aids with correct temperature, fan, voltage, ICH, etc readings)
				 * - AppleSMBusPCI (Same idea as AppleSMBusController except for low bandwidth PCI devices)
				 * - Memory Reporting (Aids in proper memory reporting and can aid in getting better kernel
				 * 	 panic details if memory related) and etc.
				 */
				
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
							Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
							{
								If (!Arg2)
								{
									Return (Buffer ()
									{
										 0x57
									})
								}
	
								Return (Package ()
								{
									"address", 
									0x57
								})
							}
						}
	
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}
				
				/*
				Cosmetics: Rename PXSX to LAN1 (EN1).
				*/
				
				Scope (RP03)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)
					   {
						   Return (Zero)
					   }
					}
				
					Device (LAN1)
					{   
						Name (_ADR, Zero)
						Method (_STA, 0, NotSerialized)
						{
							Return (0x0F)
						}
					}
				}
				
				/*
				Cosmetics: Rename PXSX to ARPT (EN2).
				*/
				
				Scope (RP07)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)
					   {
						   Return (Zero)
					   }
					}
				
					Device (ARPT)
					{   
						Name (_ADR, Zero)
						Method (_STA, 0, NotSerialized)
						{
							Return (0x0F)
						}
					}
				}
				
				/*
				Cosmetics: Rename PXSX to ANS1 (NVME2).
				*/
	
				Scope (RP09)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)
					   {
						   Return (Zero)
					   }
					}
			
					Device (ANS1)
					{   
						Name (_ADR, Zero)
						Method (_STA, 0, NotSerialized)
						{
							Return (0x0F)
						}
					}
				}
				
				/*
				Cosmetics: Rename PXSX to ANS2 (NVME2).
				*/
	
				Scope (RP21)
				{
					Scope (PXSX)
					{
						Method (_STA, 0, NotSerialized)
					   {
						   Return (Zero)
					   }
					}
			
					Device (ANS2)
					{   
						Name (_ADR, Zero)
						Method (_STA, 0, NotSerialized)
						{
							Return (0x0F)
						}
					}
				}
				
				/*
				Cosmetics: Rename SATO to SATA (Disk).
				*/
				
				Scope (SAT0)
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (Zero)
					}
				}
				
				Device (SATA)
				{
					Name (_ADR, 0x00170000)  // _ADR: Address
					Method (_STA, 0, NotSerialized)
					{
						Return (0x0F)
					}
				}
				
				/*
				 * Workaround to fix missing ACPI device. Normally seen as "pci8086,XXXX" in I/O Registry.
				 */
			
				Device (TSUB)
				{
					Name (_ADR, 0x00140002)  // _ADR: Address
				}
			}
		}
		
		/*
		 * Workaround to fix USB Power Management/Power Properties for Skylake and newer.
		 */
				 
		If (_OSI ("Darwin"))
		{
			Device (USBX)
			{
				Name (_ADR, Zero)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))
					{
						Return (Buffer ()
						{
							 0x03
						})
					}
	
					Return (Package ()
					{
						"kUSBSleepPowerSupply", 
						0x13EC, 
						"kUSBSleepPortCurrentLimit", 
						0x0834, 
						"kUSBWakePowerSupply", 
						0x13EC, 
						"kUSBWakePortCurrentLimit", 
						0x0834
					})
				}
	
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					Return (0x0F)
				}
			}
		}
	}
}