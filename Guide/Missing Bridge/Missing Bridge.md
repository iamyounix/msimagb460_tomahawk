# Missing Bridge

PXSX is a generic device identifier that is used to refer to a PCIe device in the system. It does not identify a specific device, but rather indicates that the device is a PCIe device that is connected to the system. Certain machines recognise PXSX as `pci-bridge`. In other case, PXSX is used as a USB device and most probably connected to the M.2 slot. 

ie: `SB` / `PCI0` / `PEG0` / `PEGP` / `pcibridge` / `GFX0`

```asl
/**
 * GPU Bridge missiing fix
 */
DefinitionBlock ("", "SSDT", 2, "CpyPst", "PXSX", 0x00001002)
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

> **Note**: Only for dGPU (GFX0) purpose.