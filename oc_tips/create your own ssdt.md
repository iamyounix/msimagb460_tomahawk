# Create Your Own SSDT

> Note: These are some known guides to manipulate ACPI. Any failed results such as boot failure, mulfuction device, system brick and are not my responsibility. The best move is to use EFI from USB.

Table of Contents

- [Operating System Interface Injection](#operating-system-interface-injection)
- [Method Injection](#method-injection)
- [Plugin Type Injection from Processor](#plugin-type-injection-from-processor)
- [Disable Device](#disable-device)
- [New Device](#new-device)
- [Disable and Create New Device](#disable-and-create-new-device)
- [Example](#example)
  
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
        Scope (\) // Root
        {
            Scope (_SB)    // System BUS
            {
                Scope (PCI0)    // PCI Root
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

### Simple explanation:

- The code starts with the DefinitionBlock statement, which provides information about the block itself. It includes a signature ("SSDT"), the revision number (2), the OEM ID ("Younix"), the OEM table ID ("B460"), and the OEM revision number (0x00002000).
- The block then declares a list of external devices using the External statements. These devices are defined in the ACPI namespace and are referenced later in the block.
- Next, there is an If statement that checks if the operating system is "Darwin" (which typically refers to macOS).
- Inside the If statement, there is a Scope statement that sets the current scope to the root of the ACPI namespace.
- Within the root scope, there are two methods defined: _INI (Initialize) and _STA (Status). These methods are used for device initialization and reporting the device status, respectively.
- Inside the root scope, there is another scope called _SB, which represents the system bus. This scope contains the definitions of various devices in the system.
- The first device defined is the PR00 device, which represents a processor object. It has a method called _DSM (Device-Specific Method) used for device-specific operations.
- Inside the _SB scope, there is the PCI0 scope, representing the PCI bus. It contains multiple devices, including DRAM, LPCB, GLAN, GIGE, PEG0, PGMM, RP03, RP07, RP09, RP19, RP21, SAT0, SBUS, THSS, and XHC.
- Each device within the PCI0 scope has an _ADR (Address) defined, specifying its unique address on the bus. Some devices also have a _STA (Status) defined, which indicates the status of the device.
- The PEG0 device has sub-devices EGP0 and EGP1, which represent the PCIe graphics card and High Definition Audio (HDAU) device, respectively.
- The RP03, RP07, RP09, RP19, and RP21 devices represent PCIe root ports, and each has a corresponding sub-device with an address defined.
- The SATA device represents a Serial ATA controller.
- The SBUS scope contains the BUS0 device, which represents the SMBus (System Management Bus). It also has a sub-device BLC0, which is a backlight controller.
- The THSS device represents a thermal subsystem.
- The XHC scope represents the USB (Universal Serial Bus) eXtensible Host Controller and contains a sub-scope RHUB, which represents the USB root hub. The RHUB scope has two sub-devices, USR1 and USR2, each having a _STA (Status) defined.
- Finally, the block defines a device called USBX, which represents a USB device. It has an _ADR (Address) defined and a _DSM (Device-Specific Method) used for device-specific operations related to USB.
