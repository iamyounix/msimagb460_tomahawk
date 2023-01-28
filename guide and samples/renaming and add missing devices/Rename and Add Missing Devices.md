# Renaming and Add Missing Devices

![GUIDE](https://img.shields.io/badge/Guide-ACPI-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

**Table of contents**

- [Renaming and Add Missing Devices](#renaming-and-add-missing-devices)
  - [Renaming Devices](#renaming-devices)
  - [Add Missing Devices](#add-missing-devices)
- [Credits](#credits)

## Renaming Devices

-   **Example A: Unrecognize device without address**

    -   This code demonstrates how to rename any device that is not properly shown in IORegistryExplorer. As an example, the device appears as `pci8086,4321@0`. Do note that this is just cosmetic. This patch will not affect AppleACPI properties or calling certain kexts to load.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "DRAM", 0x12345678)
        {
            External (_SB_.PCI0, DeviceObj)

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Device (DRAM)
                    {
                        Name (_ADR, Zero)
                    }
                }
            }
        }
        ```

-   **Example B: Unrecognize device with address**

    -   This code demonstrates how to rename any device that is not properly shown in IORegistryExplorer. As an example, the device appears as `pci8086,1234@08`, which have an address. To fix this, look at your DSDT and find proper address according to the devices. Do note that this is just cosmetic. This patch will not affect AppleACPI properties or calling certain kexts to load. However, devices with addresses may make your machine unbootable.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "PGMM", 0x12345678)
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

-   **If (\_OSI ("Darwin")) implementation**

    -   The `If (_OSI ("Darwin"))` statement tests whether the operating system is Darwin (which is the operating system used by macOS). If the operating system is `Darwin`, the block of code defined within the `If` statement will be executed. This block of code includes a Device statement, which defines a device object. The device object is named `MCHC` and has a single method, `_ADR`, with a value of `Zero`. So if another operating system other than macOS, this device is not rename.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "MCHC", 0x12345678)
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

-   **If (\_OSI ("Darwin")) location**

    -   Where is the best location for `If (_OSI ("Darwin"))` arguement?. Depends, As long `If (_OSI ("Darwin"))` is fitted without an error, this arguement will work fine. If you have multiple device, below is the best way to get an idea about it. However, do not place this arguement before System Bus `\_SB`.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "XXXX", 0x12345678)
        {
            External (_SB_.PCI0, DeviceObj)

            Scope (\_SB)
            {
                If (_OSI ("Darwin"))
                {
                    Scope (PCI0)
                    {
                        Device (DRAM)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }

                        Device (PGMM)
                        {
                            Name (_ADR, 0x00080000)  // _ADR: Address
                        }
                    }
                }
            }
        }
        ```

-   **Rename with "If (\_OSI ("Darwin")) implementation"**

    1.  Rename existing devices, with `If (_OSI ("Darwin"))` implementation. In other cases, there is also a way to name an existing device. As an example `SAT0` to `SATA`. This is the best example for naming an existing devices.This block of code includes another Scope statement and two Device objects. The first Scope statement creates a namespace for the SAT0 object, and the second Scope statement defines a Method object named `_STA` for the `SAT0` object.
    2.  The `_STA` object is a predefined method that is used to retrieve the current status of a device. The method is defined as taking no arguments and returning a value of `Zero`. The second Device object is named `SATA` and has two methods: `_ADR` and `_STA`. The `_ADR` method assigns the value `0x001F0002` to the `_ADR` method. The specific meaning of this value depends on the device and is defined by the devices hardware or firmware. The `_STA` method is identical to the `_STA` method defined for the `SAT0` object, with the exception that it returns a value of `0x0F` instead of `Zero`.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "SATA", 0x12345678)
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

## Add Missing Devices

-   **Example: Missing PCI Bridge**

    1.  PXSX is a generic device identifier that is used to refer to a PCIe device in the system. It does not identify a specific device, but rather indicates that the device is a PCIe device that is connected to the system. Certain machines recognise PXSX as `pci-bridge`. In other case, PXSX is used as a USB device and most probably connected to the M.2 slot. ie:, `SB` / `PCI0` / `PEG0` / `PEGP` / `pcibridge`
    2.  The `PXSX` device has a single property, named `_ADR`, which is set to a value of zero. The `_ADR` property stands for `Address` and is used to specify the address of the device in the systems hardware address space. Overall, this SSDT appears to be defining a device tree that describes the hardware configuration of the system. The purpose of the code is to provide the operating system with information about the hardware components that are present in the system and their locations in the hardware address space.

        ```asl
        DefinitionBlock ("", "SSDT", 2, "CpyPst", "PXSX", 0x50585358)
        {
            External (_SB_.PCI0, DeviceObj)
            External (_SB_.PCI0.PEG0, DeviceObj)
            External (_SB_.PCI0.PEG0.PEGP, DeviceObj)

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Scope (PEG0)
                    {
                        Scope (PEGP)
                        {
                            Device (PXSX)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                            }
                        }
                    }
                }
            }
        }
        ```

# Credits

[acidanthera](https://github.com/acidanthera/) | [dortania](https://dortania.github.io)
