DefinitionBlock ("", "SSDT", 2, "Younix", "B460", 0x00002000)
{

// Reminder: This SSDT if not for anyone. If you tend to use it, please change it properly according to your need.
    
   /*
    *    Device Disabled Section
    */
    
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.WMI1, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR1, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.USR2, DeviceObj)
    External (_SB_.WFDE, DeviceObj)
    External (_SB_.WFTE, DeviceObj)
    External (_SB_.WFTF, DeviceObj)
    External (_SB_.WMIC, DeviceObj)
    External (_SB_.WMIO, DeviceObj)
    External (_SB_.WTBT, DeviceObj)
    External (_TZ_.FAN0, DeviceObj)
    External (_TZ_.FAN1, DeviceObj)
    External (_TZ_.FAN2, DeviceObj)
    External (_TZ_.FAN3, DeviceObj)
    External (_TZ_.FAN4, DeviceObj)
    
   /*
    * 1.    External declarations: The block starts with external declarations that indicate the existence of certain device objects in the system. 
    *       These declarations establish references to the device objects without defining their actual implementation. The referenced device objects
    *       include PCI devices, USB controllers, USB hubs, and temperature sensors (fans).
    *
    * 2.    Conditional statement: The code then checks if the operating system is "Darwin" (referring to macOS). This conditional statement ensures
    *       that the following device object modifications are specific to macOS.
    *
    * 3.    Device object modifications: Within the conditional block, the code modifies the status (_STA) of several device objects. The "_STA" method
    *       returns the status of a device and can be used to enable or disable a device or change its behavior. In this case, all the modified device
    *       objects have their status set to zero (Zero), effectively disabling them.
    *
    * 4.    Scopes and names: The code defines various scopes to group related device objects together. Scopes are used to organize the ACPI namespace.
    *       Within each scope, the code assigns a status (Zero) to specific device objects using the "Name" method.
    */
    
    If (_OSI ("Darwin"))
    {
        Scope (\_SB)
        {
            Scope (PCI0)
            {
                Name (WMI1._STA, Zero)  // _STA: Status
                Scope (XHC)
                {
                    Scope (RHUB)
                    {
                        Name (USR1._STA, Zero)  // _STA: Status
                        Name (USR2._STA, Zero)  // _STA: Status
                    }
                }
            }

            Name (WFDE._STA, Zero)  // _STA: Status
            Name (WFTE._STA, Zero)  // _STA: Status
            Name (WFTF._STA, Zero)  // _STA: Status
            Name (WMIC._STA, Zero)  // _STA: Status
            Name (WMIO._STA, Zero)  // _STA: Status
            Name (WTBT._STA, Zero)  // _STA: Status
        }

        Scope (\_TZ)
        {
            Name (FAN0._STA, Zero)  // _STA: Status
            Name (FAN1._STA, Zero)  // _STA: Status
            Name (FAN2._STA, Zero)  // _STA: Status
            Name (FAN3._STA, Zero)  // _STA: Status
            Name (FAN4._STA, Zero)  // _STA: Status
        }
    }
    /*
    
    Device Enabled Section
    
    */ 
       
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (STAS, IntObj)
    
   /*
    * 1.    External declarations: The block starts with external declarations that indicate the existence of certain device objects in the ACPI namespace. These
    *       declarations establish references to the device objects without defining their actual implementation. The referenced device objects include LPCB
    *       (Low Pin Count Bus), PEG0 (PCI Express Graphics), SBUS (System Bus), PR00 (Processor), and STAS (Status).
    *
    * 2.    Conditional statement: The code checks if the operating system is "Darwin" (referring to macOS). This conditional statement ensures that the following
    *       device object modifications are specific to macOS.
    *
    * 3.    Device object modifications: Within the conditional block, the code modifies certain device objects by setting their properties and characteristics.
    *
    *       a.    PR00 Scope: This scope defines a processor object (PR00) and contains a Device-Specific Method (_DSM). The _DSM method is used to provide device-specific
    *             functionality to the processor object. It returns different values based on the input arguments.
    *    
    *       b.    PCI0 Scope: This scope contains several devices and sub-scopes related to the PCI bus.
    *
    *       c.    LPCB Scope: This scope contains devices related to the Low Pin Count Bus. It defines an EC (Embedded Controller) and devices named FWHD (Firmware Hub Device)
    *             and PMCR (Power Management Controller).
    *    
    *       d.    PEG0 Scope: This scope defines devices related to the PCI Express Graphics (PEG) bus. It contains a sub-scope named PEGP (PCI Express Graphics Port) and
    *             devices named GFX0 (Graphics Device) and HDAU (High Definition Audio Unit).
    *    
    *       e.    PGMM Device: This device represents a specific device with an address defined by the _ADR field. Its purpose is not explicitly mentioned in the code snippet.
    *
    *       f.    SBUS Scope: This scope contains a device named BUS0, representing a device on the system bus. It also contains a sub-device named BLC0 (Backlight Controller)
    *             with its own characteristics.
    *    
    *       g.    TSUB Device: This device represents a specific device with an address defined by the _ADR field. Its purpose is not explicitly mentioned in the code snippet.
    *
    *       h.    USBX Device: This device represents a USB controller and has its own _DSM method. The _DSM method returns different values based on the input arguments.
    *
    * 4.    Method definitions: The code snippet defines the _INI and _STA methods within the _SB scope. The _INI method is used for initialization, and in this case,
    *       it sets the STAS object to One. The _STA method is used to provide the status of the device object, and in this case, it returns 0x0F.
    */
    
    If (_OSI ("Darwin"))
    {
        Scope (\_SB)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                STAS = One
            }

            Scope (PR00)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (!Arg2)
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
                
               /*
                *    Dynamic Random-Access Memory (DRAM) is a type of memory that stores each bit of data in a separate capacitor within a memory cell.
                *    Note:    Do not use DMAC if motherboard equipped with This device.
                */
                
                Device (DRAM)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
                
                Scope (LPCB)
                {
                
                   /*
                    *    Fake Device (Direct Memory Access Controller)
                    *    -    Direct Memory Access (DMA) enables high-speed data transfer by bypassing the CPU and transferring data directly between an I/O device and memory.
                    *
                    */
                    
                    Device (DMAC)
                    {
                        Name (_HID, EisaId ("PNP0200"))
                        Name (_CRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IO (Decode16,
                                0x0081,             // Range Minimum
                                0x0081,             // Range Maximum
                                0x01,               // Alignment
                                0x11,               // Length
                                )
                            IO (Decode16,
                                0x0093,             // Range Minimum
                                0x0093,             // Range Maximum
                                0x01,               // Alignment
                                0x0D,               // Length
                                )
                            IO (Decode16,
                                0x00C0,             // Range Minimum
                                0x00C0,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {4}
                        })
                    }
                    
                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
                    }
                    
                   /*
                    *    Fake Device (Firmware Hub Device)
                    */
                    
                    Device (FWHD)
                    {
                        Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadOnly,
                                0xFF000000,         // Address Base
                                0x01000000,         // Address Length
                                )
                        })
                    }
                    
                   /*
                    *    Fake Device (Performance Monitors Control Register)
                    */

                    Device (PMCR)
                    {
                        Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFE000000,         // Address Base
                                0x00010000,         // Address Length
                                )
                        })
                    }
                }
                
                Scope (PEG0)
                {
                    Scope (PEGP)
                    {
                        Name (_CID, "pci-bridge")  // _CID: Compatible ID
                        Device (PBRG)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_CID, "pci-bridge")  // _CID: Compatible ID
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
                
               /*
                *    Set Compatible macOS SBUS Patch (if needed)
                */
                
                Scope (SBUS)
                {
                    Device (BUS0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (_CID, "smbus")  // _CID: Compatible ID
                        Device (BLC0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_CID, "smbus-blc")  // _CID: Compatible ID
                        }
                    }
                }

                Device (TSUB)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                }
            }
            
           /*
            *    Apply USBX properties
            */
            
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

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }
}
