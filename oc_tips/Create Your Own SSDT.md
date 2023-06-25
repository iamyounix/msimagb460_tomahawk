# Create Your Own SSDT

> Note: These are some known guides to manipulate ACPI. Any failed results such as boot failure, mmulfuction device, system brick and are not my responsibility. The best move is to use EFI from USB.



## Operating System Interface Injection

```dsl
DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0.SAT0, DeviceObj)

	If (_OSI ("Darwin")) // Argument to calling Darwin Kernel / macOS
	{
		Scope (\)
		{
			XXX
```



## Method Injection

```dsl
External (STAS, IntObj)

Scope (\)
{
	Method (_INI, 0, NotSerialized)
	{
		STAS = One
	}

	Method (_STA, 0, NotSerialized)
	{
		Return (0x0F)
	}
}
```



## Plugin Type Injection from Processor

```dsl

External (_SB_.PR00, ProcessorObj)

Scope (_SB)
{
	Scope (PR00)
	{
		Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
		{
			If ((Arg2 == Zero))
			{
				Return (Buffer (One)
				{
					 0x03                                             // .
				})
			}

			Return (Package (0x02)
			{
				"plugin-type",	// Plugin Type 
				One	// Number
			})
		}
	}
}
```



## Disable Device

```dsl
DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0.SAT0, DeviceObj)

	If (_OSI ("Darwin"))
	{
		Scope (\)
		{
			Scope (_SB)
			{
				Scope (PCI0)
				{
					Name (SAT0._STA, Zero)  // Disable Device using _STA Method
				}
			}
		}
	}
}
```



## New Device

```dsl
Device (THSS)	// New device, most common to rename unrecognized pciXXXX,XXXX via IOreg
{
	Name (_ADR, 0x00140002)  // _ADR is require to create new device
}
```



## Disable and Create New Device

```dsl
DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
	External (_SB_.PCI0.SAT0, DeviceObj)

	If (_OSI ("Darwin"))
	{
		Scope (\)
		{
			Scope (_SB)	// System BUS
			{
				Scope (PCI0)	// PCI Root
				{
					Name (SAT0._STA, Zero)  // Disable Device
					Device (SATA)	// New Device (Rename SAT0 to SATA)
					{
						Name (_ADR, 0x00170000)  // _ADR is require to create new device
					}
				}
			}
		}
	}
}
```



## Example

```dsl
DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.RP03, DeviceObj)
    External (_SB_.PCI0.RP03.PXSX, DeviceObj)
    External (_SB_.PCI0.RP07, DeviceObj)
    External (_SB_.PCI0.RP07.PXSX, DeviceObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.RP19, DeviceObj)
    External (_SB_.PCI0.RP19.PXSX, DeviceObj)
    External (_SB_.PCI0.RP21, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR1, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR2, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (STAS, IntObj)

    If (_OSI ("Darwin"))
    {
        Scope (\)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                STAS = One
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Scope (_SB)
            {
                Scope (PR00)
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }

                Scope (PCI0)
                {
                    Device (DRAM)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                    }

                    Scope (LPCB)
                    {
                        Name (H_EC._STA, Zero)  // _STA: Status
                    }

                    Name (GLAN._STA, Zero)  // _STA: Status
                    Device (GIGE)
                    {
                        Name (_ADR, 0x001F0006)  // _ADR: Address
                    }

                    Scope (PEG0)
                    {
                        Name (PEGP._STA, Zero)  // _STA: Status
                        Device (EGP0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Device (EGP1)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Device (GFX0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                }

                                Device (HDAU)
                                {
                                    Name (_ADR, One)  // _ADR: Address
                                }
                            }
                        }
                    }

                    Device (PGMM)
                    {
                        Name (_ADR, 0x00080000)  // _ADR: Address
                    }

                    Scope (RP03)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Device (RTLK)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }
                    }

                    Scope (RP07)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Device (ARPT)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }
                    }

                    Scope (RP09)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Device (ANS0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }
                    }

                    Scope (RP19)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Device (XHC2)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }
                    }

                    Scope (RP21)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Device (ANS1)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }
                    }

                    Name (SAT0._STA, Zero)  // _STA: Status
                    Device (SATA)
                    {
                        Name (_ADR, 0x00170000)  // _ADR: Address
                    }

                    Scope (SBUS)
                    {
                        Device (BUS0)
                        {
                            Name (_CID, "smbus")  // _CID: Compatible ID
                            Name (_ADR, Zero)  // _ADR: Address
                            Device (BLC0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Name (_CID, "smbus-blc")  // _CID: Compatible ID
                            }
                        }
                    }

                    Device (THSS)
                    {
                        Name (_ADR, 0x00140002)  // _ADR: Address
                    }

                    Scope (XHC)
                    {
                        Scope (RHUB)
                        {
                            Name (USR1._STA, Zero)  // _STA: Status
                            Name (USR2._STA, Zero)  // _STA: Status
                        }
                    }
                }

                Device (USBX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x08)
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
                }
            }
        }
    }
}
```

