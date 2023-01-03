# Rename Device

This code demonstrates how to rename any device that macOS does not recognize. In this case, PCI devices shown in IORegistryExplorer such as `pci8086,1911@8` or `pci8086,9def@14,2` to something more meaningful such as ACPI Devices like MCHC, TSUB or PGMM etc.

#### MCHC (Memory Controller Hub Configuration)

```asl
/*
* It defines a device object with a single method, _ADR, which stands for "address". The value of the _ADR method is Zero, 
which is a predefined constant in the ACPI language that represents the value zero. The purpose of the _ADR method is to 
return the address of the device. In the context of this code, the device is referred to as MCHC. The _ADR method is used
to specify the address at which the device can be accessed.
*/
DefinitionBlock ("", "SSDT", 2, "CpyPst", "MCHC", 0x4D434843)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Device (MCHC)
            {
                Name (_ADR, Zero)
            }
        }
    }
}
```

#### PGMM (Processor Gaussian Mixture Model)

```asl
/*
* It defines a device object with a single method, _ADR, which stands for "address". The value of the _ADR method is Zero, 
which is a predefined constant in the ACPI language that represents the value zero. The purpose of the _ADR method is to 
return the address of the device. In the context of this code, the device is referred to as PGMM. The _ADR method is used
to specify the address at which the device can be accessed.
*/
DefinitionBlock ("", "SSDT", 2, "CpyPst", "MCHC", 0x50474D4D)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Device (TSUB)
            {
                Name (_ADR, 0x00080000)
            }
        }
    }
}
```

#### TSUB (Thermal Subsystem)

```asl
/*
* It defines a device object with a single method, _ADR, which stands for "address". The value of the _ADR method is Zero, 
which is a predefined constant in the ACPI language that represents the value zero. The purpose of the _ADR method is to 
return the address of the device. In the context of this code, the device is referred to as TSUB. The _ADR method is used
to specify the address at which the device can be accessed.
*/
DefinitionBlock ("", "SSDT", 2, "CpyPst", "MCHC", 0x54535542)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Device (TSUB)
            {
                Name (_ADR, 0x00140002)
            }
        }
    }
}
```

#### If (_OSI ("Darwin")) implementation:

The `If (_OSI ("Darwin"))` statement tests whether the operating system is Darwin (which is the operating system used by macOS). If the operating system is Darwin, the block of code defined within the If statement will be executed. This block of code includes a Device statement, which defines a device object. The device object is named MCHC and has a single method, _ADR, with a value of Zero.

```asl
DefinitionBlock ("", "SSDT", 2, "CpyPst", "MCHC", 0x4D434843)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            If (_OSI ("Darwin"))
            {
                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }
        }
    }
}
```
