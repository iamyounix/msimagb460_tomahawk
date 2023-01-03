# Rename Device

This code demonstrates how to rename any device that macOS does not recognize. In this case, PCI devices shown in IORegistryExplorer such as `pci8086,1911@8` or `pci8086,9def@14,2` to something more meaningful such as ACPI Devices like `MCHC`, `TSUB` or `PGMM` etc.

#### MCHC (Memory Controller Hub Configuration)

It defines a device object with a single method, `_ADR`, which stands for `address`. The value of the `_ADR` method is `Zero`, which is a predefined constant in the ACPI language that represents the value zero. The purpose of the `_ADR` method is to return the address of the device. In the context of this code, the device is referred to as `MCHC`. The `_ADR` method is used to specify the address at which the device can be accessed.

```asl
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

It defines a device object with a single method, `_ADR`, which stands for `address`. The value of the `_ADR` method is `Zero`, which is a predefined constant in the ACPI language that represents the value zero. The purpose of the `_ADR` method is to return the address of the device. In the context of this code, the device is referred to as `PGMM`. The `_ADR` method is used to specify the address at which the device can be accessed.

```asl
DefinitionBlock ("", "SSDT", 2, "CpyPst", "PGMM", 0x50474D4D)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Device (PGMM)
            {
                Name (_ADR, 0x00080000)
            }
        }
    }
}
```

#### TSUB (Thermal Subsystem)

It defines a device object with a single method, `_ADR`, which stands for `address`. The value of the `_ADR` method is `Zero`, which is a predefined constant in the ACPI language that represents the value zero. The purpose of the `_ADR` method is to return the address of the device. In the context of this code, the device is referred to as `TSUB`. The `_ADR` method is used to specify the address at which the device can be accessed.

```asl
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

The `If (_OSI ("Darwin"))` statement tests whether the operating system is Darwin (which is the operating system used by macOS). If the operating system is `Darwin`, the block of code defined within the `If` statement will be executed. This block of code includes a Device statement, which defines a device object. The device object is named `MCHC` and has a single method, `_ADR`, with a value of `Zero`. So if another operating system other than macOS, this device is not rename.

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

In other cases, there is also a way to name an existing device. As an example `SAT0` to `SATA`. This is the best example for naming an existing devices.

Rename existing devices, with `If (_OSI ("Darwin"))` implementation. This block of code includes another Scope statement and two Device objects. The first Scope statement creates a namespace for the SAT0 object, and the second Scope statement defines a Method object named `_STA` for the `SAT0` object. The `_STA` object is a predefined method that is used to retrieve the current status of a device. The method is defined as taking no arguments and returning a value of `Zero`. The second Device object is named `SATA` and has two methods: `_ADR` and `_STA`. The `_ADR` method assigns the value `0x001F0002` to the `_ADR` method.
The specific meaning of this value depends on the device and is defined by the device's hardware or firmware. The `_STA` method
is identical to the `_STA` method defined for the `SAT0` object, with the exception that it returns a value of `0x0F` instead of `Zero`.

```asl
/*
* 
*/
DefinitionBlock ("", "SSDT", 2, "CpyPst", "SATA", 0x53415441)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SAT0, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            If (_OSI ("Darwin"))
            {
                Scope (SAT0)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (Zero)
                    }
                }

                Device (SATA)
                {
                    Name (_ADR, 0x001F0002)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
}
```
