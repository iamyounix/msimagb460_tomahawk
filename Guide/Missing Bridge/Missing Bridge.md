# Missing Bridge

PXSX is a generic device identifier that is used to refer to a PCIe device in the system. It does not identify a specific device, but rather indicates that the device is a PCIe device that is connected to the system. Certain machines recognise PXSX as `pci-bridge`. In other case, PXSX is used as a USB device and most probably connected to the M.2 slot. 

ie:, `SB` / `PCI0` / `PEG0` / `PEGP` / `pcibridge`

```asl
/*
* The PXSX device has a single property, named _ADR, which is set to a value of zero. 
The _ADR property stands for "Address" and is used to specify the address of the device 
in the system's hardware address space. Overall, this SSDT appears to be defining a device 
tree that describes the hardware configuration of the system. The purpose of the code is to 
provide the operating system with information about the hardware components that are present
in the system and their locations in the hardware address space.
*/
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
