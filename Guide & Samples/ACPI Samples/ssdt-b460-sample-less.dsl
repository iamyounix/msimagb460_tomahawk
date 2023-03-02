DefinitionBlock ("", "SSDT", 2, "MSI", "B460", 0x00002000)
{
	/**DefinitionBlock defines the scope of a system description table (SSDT) and the ACPI device associated with it.
	It is part of the ASL programming language and allows defining and managing of hardware devices.
	The syntax for this particular DefinitionBlock is as follows:
	The parameters in this command define the scope of the SSDT and the device it is associated with:
	-	The first two parameters are empty strings, they set up the scope of the DefinitionBlock - in this case meaning no parent or label.
	-	The next parameter, "SSDT", specifies that the type of object being defined is an SSDT.
	-	The fourth parameter "MSI", specifies the manufacturer name for the device.
	-	The fifth parameter "B460", specifies the model information for the device.
	-	The sixth parameter 0x00002000, is a hexidecimal value which specificies the ACPI Object Revision number associated with the 
		device.
	**/
	External (_SB_.PCI0, DeviceObj)
	External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.PEG0, DeviceObj)
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)
	External (STAS, IntObj)
	/**The code snippet is from the ACPI Specification Version 6.2, which provides an interface for Operating System (OS) to communicate
	with computer hardware. The following definitions are external objects in an ASL program.
	-	External (SB.PCI0, DeviceObj): This object is used to represent a PCI bus in the system. It connects all PCI devices in the system.
	-	External (SB.PCI0.LPCB, DeviceObj): This object represents the Low Pin Count Bridge device located on the PCI bus.
		It connects low pin-count devices such as COM port, audio devices, and other items.
	-	External (SB.PCI0.PEG0, DeviceObj): This object represents the PCI Express Graphics (PEG) device located on the PCI bus.
		It connects graphics cards, displays, and other items.
	-	External (SB.PCI0.PEG0.PEGP, DeviceObj): This object represents the PCI Express Graphics Processor (GPU).
		It is the processing unit responsible for driving displays connected to the PCIe bus.
	-	External (SB.PCI0.SBUS, DeviceObj): This object represents the System Bus node in the system. It serves as the primary
		communication path between different components in the system.
	-	External (STAS, IntObj): This object represents the System Time/Alarm Status register that holds time related values
	**/
	Scope (\_SB)
	/**The code Scope (\_SB) is a statement in the Advanced Configuration and Power Interface (ACPI) Specification language to indicate
	which namespace (Scope) should be used for the following statements. In this particular case, \_SB denotes the System Bus option,
	which refers to ACPI variables and operations that play a role in system-wide operations.
	**/
	{
		If (_OSI ("Darwin"))
		{
		/**The above snippet of code is written in ASL (Abstract Syntax Language), and it is an example of a conditional statement.
		It checks to see if the client's operating system is Darwin, and if it is, it executes a specific set of instructions.
		This kind of construct is commonly used in programming when certain conditions have to be met in order for the code to be executed.
		**/
			Method (_INI, 0, NotSerialized)  // _INI: Initialize
			{
				STAS = One
			}
			/**The method you have included begins with Method (_INI, 0, NotSerialized) - this specifying that the method does not require
			any parameters and will not return a value. It also tells the compiler that the block of code should not be serialized. The line
			following the headers specifies a StoreAccessAs operation. This line reads STAS = One, which means it stores the value 1 in the 
			local variable STAS. This method is used to initialize some internal variables before this portion of code is executed.
			It sets up the necessary environment so that later instructions can run properly. In short, this code sets a variable to the
			value of 1 so the rest of the instructions can be run correctly.
			**/
			Scope (PCI0)
			/**This code is written in the ASL programming language and is used to declare a scope associated with a Power Control Unit
			(PCU). The scope is defined by the brackets that follow the Scope command and contains instructions for controlling resources
			associated with the PCU.
			**/
			{
				Device (DRAM)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (0x0F)
					}
				}
				/**The _ADR field sets the address of the device to 0, which is typically assigned for devices that are part of the core
				system components. The _STA method will return 0x0F, which is the status code for a successfully loaded device.
				**/
				Scope (LPCB)
				{
					Device (EC)
					{
						Name (_HID, "ACID0001")  // _HID: Hardware ID
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}
				/**The Scope statement defines a named ACPI scope object, the acronym for which is LPCB. An ACPI device object with an associated
				EC (Embedded Controller) object. This objects has the hardware ID attribute _HID, which is set to 'ACID0001'. The second statement
				within the scope is the Name statement. This statement defines an attribute object, with the object name _HID and the value set 
				as "ACID0001". The final statement inside the scope is the Method statement which defines a named method, the name of which is _STA.
				This method has an integer return value, the value being 0x0F indicating that the device is enabled.
				**/
				Scope (PEG0)
				{
					Scope (PEGP)
					{
						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (Zero)
						}
					}

					Device (EGP0)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Device (EGP1)
						{
							Name (_ADR, Zero)  // _ADR: Address
						}

						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}
					}
				}
				/**The snippet's outer-most scope is called Scope (PEG0). Within this scope, there are child scopes and devices. The first child
				scope nested in Scope (PEG0) is called Scope (PEGP), which contains the _STA method. This method defines an optional status word
				that can be used to determine whether the device is present in the system. If the method returns a non-zero value, then the device
				is considered present. In this case, the status word is set to Zero, implying that the device is not present. The next child device
				of Scope (PEG0) is Device (EGP0) which contains the _ADR object with a value of Zero. This indicates that the device has no physical
				address. It also has another child device called Device (EGP1) with the same _ADR value. Finally, the Device (EGP0) contains the _STA
				method again with a return value of 0xF. This indicates that the device is present in the system and is active.
				**/
				Device (PGMM)
				{
					Name (_ADR, 0x00080000)  // _ADR: Address
					/**Use 0x0008 instead of using 0x00080000, this will rename the device properly and hide the IOreg registry.**/
				}
				/**Device referred to as PGMM. It uses the ACPI Object Name (_ADR) which is used to define its address. The address itself is "0x00080000".
				Any instructions which use this device will reference this address.
				**/
				Scope (SBUS)
				{
					Device (BUS0)
					{
						Name (_CID, "smbus")  // _CID: Compatible ID
						Name (_ADR, Zero)  // _ADR: Address
						Device (DVL0)
						{
							Name (_ADR, 0x57)  // _ADR: Address
							/**Decimal: 87**/
							Name (_CID, "diagsvault")  // _CID: Compatible ID
						}

						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)	//	Decimal: 15 (Enable)
						}
					}
				}
				/**The _SBUS device is specified inside the Scope block and it defines a physical connection or bus in the system. Within the _SBUS
				Device() block, two devices are defined: _BUS0 and _DVL0. The _CID field of _BUS0 receives the string "smbus", while the _ADR field
				of both CDL0 and _BUS0 specifies the address of the respective device. This address is expressed by hexadecimal notation (0x53 for
				_BUS0 and 0x57 for _DVL0, which correspond to decimal 87). The _STA method contains the status of _SBUS. It returns the binary value
				0x0F, which corresponds to decimal 15 and means enabled.
				**/
				Device (THSS)
				{
					Name (_ADR, 0x00140002)  // _ADR: Address
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						Return (0x0F)
						/**Decimal, 15 (Enable)**/
					}
				}
				/**This code creates a "Device" named THSS, which initializes an address with the value 0x00140002 and a method which returns the decimal
				value 15 (Enable).The "Method" in this example is called "_STA", with 0 as the argument, meaning it is not serialized. Then, when this
				method is called, it will return the decimal value 15, enabling the device.
				**/
			}
		}
		
		Device (USBX)
		{
			Name (_ADR, Zero)  // _ADR: Address
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If ((Arg2 == Zero))
				/**If the argument Arg2 is equal to the value Zero**/
				{
					Return (Buffer ()
					/** An array buffer from a given length.**/
					{
						 0x03 // 1B
						 /**Decimal, 3**/
					})
				}
				
				Return (Package ()
				{
					"kUSBSleepPowerSupply",
					/**Specifies the power supply's voltage in millivolt for low current during sleep**/
					0x13EC,
					/**Decimal, 5100**/
					"kUSBSleepPortCurrentLimit",
					/**Specifies the port current limit in milliamps during sleep**/
					0x0834,
					/**Decimal, 2100**/
					"kUSBWakePowerSupply",
					/**Specifies the power supply's voltage in millivolts for full current while awake**/
					0x13EC,
					/**Decimal, C5100**/
					"kUSBWakePortCurrentLimit",
					/**Specifies the port current limit in milliamps while awake**/	
					0x0834
					/**Decimal, 2100**/
				})
			}

			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				Return (0x0F)
				/**Decimal, 15 (Enable)**/
			}
		}
		/**This code block defines a device called USBX, and contains methods that are designed to manage its life cycle. The Name assignment determines
		the address of the thread within a computer hierarchy, while the Method definition refers to an executable operation. The first Method command 
		(_DSM: Device-Specific Method) contains an If statement. This checks whether the 2nd argument passed to this function is equal to zero. If it is,
		it returns a buffer of 3 bytes, representing the decimal number 3. The second Method command (_STA: Status) simply returns the decimal number 15
		(in hexadecimal value 0x0F), which indicates the enabling status of the device.
		**/
	}
}

