# SSDT for GPU

SSDT for GPUs is not as complicated as it seems. It is used for several reasons. Either to

- spoof and
- improve 

As example, `agdpmod=pikera`and is often injected via NVRAM. There are two permanent ways to get permanent injection effects: either through 

- DeviceProperties or
-  ACPI


## Method 1

- Inject properties via DeviceProperties (config.plist). Below is an example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>DeviceProperties</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Slot- 0</string>
				<key>agdpmod</key>
				<data>
				cGlrZXJhAA==
				</data>
				<key>enable-metal</key>
				<data>
				AQAAAA==
				</data>
				<key>igfxfw</key>
				<data>
				AgAAAA==
				</data>
				<key>igfxonln</key>
				<data>
				AQAAAA==
				</data>
			</dict>
		</dict>
		<key>Delete</key>
		<dict/>
	</dict>
</dict>
</plist>
```

ie: `adgpmod` | `data` | `70696b65726100`

## Method 2

- Inject properties via ACPI (SSDTs). This is an example of Navi14 based GPU:

```asl
DefinitionBlock ("", "SSDT", 2, "CpyPst", "EXT", 0x00455854)
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
                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer ()
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package ()
                                {
                                    "AAPL,slot-name", 
                                    "Slot- 1", 
                                    "agdpmod", 
                                    "pikera"
                                })
                            }
                        }
                    }
                }
            }
        }
    }
}
```

> **Note**: On my experience, `agdpmod=pikera` can work on:
> - GFX0 via ACPI
> - IGPU via DeviceProperties
