# Boot Arg to Properties

## AGDPMod Pikera

### History

A long time ago, [Pike R. Alpha](https://github.com/Piker-Alpha) blogged about the changes in the AGDP (Apple Graphics Device Policy) and had to came up with a workaround for an issue in AppleGraphicsDevicePolicy.kext so that we could use a MacPro6,1 board-id/model combination, without the usual hang with a black screen. He presents an alternative route for this and this time it is a patch that can be used with Clover’s kext patching feature. Below is an example:

```zml
<key>KextsToPatch</key>        
<array>
    <dict>
        <key>Comment</key>
        <string>AppleGraphicsDevicePolicy (board-id) Patch (c) Pike R. Alpha</string>
        <key>Find</key>
        <data>
        Ym9hcmQtaWQ=
        </data>
        <key>Name</key>
        <string>AppleGraphicsDevicePolicy</string>
        <key>Replace</key>
        <data>
        Ym9hcmQtaXg=
        </data>
</dict>
</array>
```

Basically, this patch search for “board-id” and replace it with “board-ix” – or anything that we want to use instead. Original thread: [Patching AppleGraphicsDevicePolicy](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/). Nowadays, this patch is integrated with [Whatevergreen.kext](https://github.com/acidanthera/WhateverGreen). This is modern patch with a lot of improvements. This days, normally  `agdpmod=pikera` is often injected via NVRAM. There are two permanent ways to get permanent injection effects: either through 

- DeviceProperties or
-  ACPI

### Method 1

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

> **Note**: `pikera` (text) is equivalent to `70696B657261` (hex) and `cGlrZXJh` (base64). The reason it became `cGlrZXJhAA==` (base64) and `70696B65726100` (hex) is because of this patch consist of `0` bit for workspace. 

### Method 2

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
                                         0x03
                                    })
                                }

                                Return (Package ()
                                { 
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
