DefinitionBlock ("", "SSDT", 2, "CpyPst", "EXT", 0x00000001)    // Foundation of every SSDT
{
	External (_SB_.PCI0, DeviceObj)    // External References
	External (_SB_.PCI0.DRAM, DeviceObj)    // External References
	External (_SB_.PCI0.GFX0, DeviceObj)    // External References
	External (_SB_.PCI0.HDAS, DeviceObj)    // External References
	External (_SB_.PCI0.HECI, DeviceObj)    // External References
	External (_SB_.PCI0.LPCB, DeviceObj)    // External References
	External (_SB_.PCI0.PEG0, DeviceObj)    // External References
	External (_SB_.PCI0.PEG0.PEGP, DeviceObj)    // External References    
	External (_SB_.PCI0.RP04, DeviceObj)    // External References
	External (_SB_.PCI0.RP04.PXSX, DeviceObj)    // External References
	External (_SB_.PCI0.RP05, DeviceObj)    // External References    
	External (_SB_.PCI0.RP05.PXSX, DeviceObj)    // External References
	External (_SB_.PCI0.RP09, DeviceObj)    // External References
	External (_SB_.PCI0.RP09.PXSX, DeviceObj)    // External References
	External (_SB_.PCI0.RP20, DeviceObj)    // External References
	External (_SB_.PCI0.RP20.PXSX, DeviceObj)    // External References
	External (_SB_.PCI0.RP21, DeviceObj)    // External References
	External (_SB_.PCI0.RP21.PXSX, DeviceObj)    // External References
	External (_SB_.PCI0.SAT0, DeviceObj)    // External References
	External (_SB_.PCI0.SBUS, DeviceObj)    // External References
	External (_SB_.PCI0.TSUB, DeviceObj)    // External References
	External (_SB_.PCI0.XHC_, DeviceObj)    // External References
	External (STAS, IntObj)    // External References

	Scope (\_SB)    // System BUS
	{
		Method (_INI, 0, NotSerialized)  // _INI: Initialize
		{
			If (_OSI ("Darwin"))    // Operating System Interfaces
			{
				STAS = One    // Handler
			}
		}

		Scope (PCI0)
		{
			Device (DRAM)    // Comet Lake-S 6c Host Bridge/DRAM Controller 
			{
				Name (_ADR, Zero)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply   
					}
					Else    // Other Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
				}			
			}

			Scope (LPCB)
			{
				Device (EC)    // Fake Embedded Controller
				{
					Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
					Name (_UID, One)  // _UID: Unique ID
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply   
						}
						Else    // Other Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
					}
				}
			}

			Scope (GFX0)    // Integrated Graphic Processor Unit
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply  
					}
				}
			}
			
			Device (IGPU)    // Intel CoffeeLake-H GT2 [UHD Graphics 630] 
			{
				Name (_ADR, 0x00020000)  // _ADR: Address
				Name (_SUN, Zero)  // _SUN: Slot User Number
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))    // Arguement        
					{
						Return (Buffer ()    // Device Specific Method (Arg2)
						{
							 0x03                                             // .
						})
					}
			
					Return (Package ()    // Device Properties
					{
						"AAPL,ig-platform-id",    // Device Platform 
						Buffer ()
						{
							 0x03, 0x00, 0x92, 0x3E                           // ...>
						}, 
			
						"AAPL,slot-name",    // Device Slot 
						Buffer ()
						{
							 0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x30         // Slot- 0
						}, 
			
						"built-in",    // Fake built-in (Applicable to PCI Card) 
						Zero, 
						"device-id",    // Device ID 
						Buffer ()    
						{
							 0x9B, 0x3E, 0x00, 0x00                           // .>..
						}, 
			
						"enable-metal",    // Metal 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 
			
						"igfxfw",    // IGFX Firmware 
						Buffer ()
						{
							 0x02, 0x00, 0x00, 0x00                           // ....
						}, 
			
						"igfxonln",    // Always Online 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 
			
						"iommu-selection",    //IOMMU 
						Buffer ()
						{
							 0x00, 0x00, 0x00, 0x00                           // ....
						}
					})
				}
			}
			
			Scope (HDAS)    // High Definition Audio System
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else     // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply
					}
				}
			}
			
			Device (HDEF)    // Comet Lake PCH-V cAVS
			{
				Name (_ADR, 0x001F0003)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))    // Arguement
					{
						Return (Buffer ()        // Device Specific Method (Arg2)
						{
							 0x03                                             // .
						})
					}
			
					Return (Package ()    // Device Properties
					{
						"No-hda-gfx",    // HDA GFX Properties 
						Buffer ()
						{
							 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
						}, 
			
						"layout-id",    // Enable Layout 01 
						Buffer ()
						{
							 0x01, 0x00, 0x00, 0x00                           // ....
						}, 
			
						"No-idle-support",    // Idle Support Disable
						Buffer ()
						{
							 0x00                                             // .
						}
					})
				}
			}
			
			Scope (HECI)    //    Intel Management Engine Interface
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply 
					}
				}
			}
			
			Device (IMEI)    //    Comet Lake PCH-V HECI Controller
			{
				Name (_ADR, 0x00160000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply 
					}
					Else    // Other Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
				}
			}
			
			Scope (PEG0)    // 6th-10th Gen Core Processor PCIe Controller (x16)
			{
				Scope (PEGP)    // Navi 10 XL Upstream Port of PCI Express Switch (Bridge 0)
				{
					Device (BRG0)    // Navi 10 XL Downstream Port of PCI Express Switch (Bridge 1)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (_OSI ("Darwin"))    // Operating System Interfaces
							{
								Return (0x0F)    // Control Method Apply   
							}
							Else    // Other Operating System Interfaces
							{
								Return (Zero)    // Control Method Not Apply
							}
						}
			
						Device (GFX0)    // Navi 14 [Radeon RX 5500/5500M / Pro 5500M
						{
							Name (_ADR, Zero)  // _ADR: Address
							Name (_SUN, One)  // _SUN: Slot User Number
							Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
							{
								If ((Arg2 == Zero))    // Arguement
								{
									Return (Buffer ()        // Device Specific Method (Arg2)
									{
										 0x03                                             // .
									})
								}
			
								Return (Package ()    //    Device Properties
								{
									"@0,AAPL,boot-display",    // ATY,Python Framebuffer Data
									Buffer ()
									{
										 0x01, 0x00, 0x00, 0x00                           // ....
									}, 
			
									"@0,ATY,EFIDisplay",    // ATY,Python Framebuffer Data
									Buffer ()
									{
										 0x44, 0x50, 0x31                                 // DP1
									}, 
			
									"@0,compatible",    // ATY,Python Framebuffer Data  
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@0,device_type",    // ATY,Python Framebuffer Data
									Buffer ()
									{
										 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
									}, 
			
									"@0,display-type",    // ATY,Python Framebuffer Data
									Buffer ()
									{
										 0x4C, 0x43, 0x44                                 // LCD
									}, 
			
									"@0,display_type",    // ATY,Python Framebuffer Data  
									Buffer ()
									{
										 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
									}, 
			
									"@0,name",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@1,compatible",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@1,device_type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
									}, 
			
									"@1,display-type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x4E, 0x4F, 0x4E, 0x45                           // NONE
									}, 
			
									"@1,name",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@2,compatible",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@2,device_type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
									}, 
			
									"@2,display-type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x4E, 0x4F, 0x4E, 0x45                           // NONE
									}, 
			
									"@2,name",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@3,compatible",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"@3,device_type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x64, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79         // display
									}, 
			
									"@3,display-type",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x4E, 0x4F, 0x4E, 0x45                           // NONE
									}, 
			
									"@3,name",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74, 0x68,  // ATY,Pyth
										/* 0008 */  0x6F, 0x6E                                       // on
									}, 
			
									"AAPL,slot-name",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x53, 0x6C, 0x6F, 0x74, 0x2D, 0x20, 0x31         // Slot- 1
									}, 
			
									"ATY,EFIBootMode",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
										/* 0008 */  0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
										/* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0028 */  0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0030 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
										/* 0038 */  0x00, 0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00,  // .P......
										/* 0040 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00,  // .....@..
										/* 0048 */  0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00,  // .....R..
										/* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0060 */  0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00,  // .0... ..
										/* 0068 */  0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
										/* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
										/* 0078 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
										/* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,  // ........
										/* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
										/* 00A0 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x50, 0xCF, 0xCD,  // .....P..
										/* 00A8 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
										/* 00B0 */  0x00, 0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00,  // .@......
										/* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00C0 */  0x00, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // .R......
										/* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00,  // .....0..
										/* 00D0 */  0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x03, 0x00,  // . ......
										/* 00D8 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0118 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0128 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0138 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0140 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0150 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0160 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0168 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0180 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0190 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01B8 */  0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01C0 */  0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
										/* 01C8 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
										/* 01D0 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
										/* 01D8 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01E0 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
										/* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 01F0 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
										/* 01F8 */  0x01, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,  // ........
										/* 0200 */  0x00, 0x00, 0x00                                 // ...
									}, 
			
									"ATY,EFICompileDate",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x4F, 0x63, 0x74, 0x20, 0x31, 0x32, 0x20, 0x32,  // Oct 12 2
										/* 0008 */  0x30, 0x31, 0x39                                 // 019
									}, 
			
									"ATY,EFIDriverType",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x30, 0x32                                       // 02
									}, 
			
									"ATY,EFIEnabledMode",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x30, 0x34                                       // 04
									}, 
			
									"ATY,EFIVersion",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x33, 0x31, 0x2E, 0x30, 0x2E, 0x31, 0x32, 0x30,  // 31.0.120
										/* 0008 */  0x32, 0x36, 0x2E, 0x33                           // 26.3
									}, 
			
									"ATY,EFIVersionB",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x4D, 0x53, 0x49, 0x54,  // 113-MSIT
										/* 0008 */  0x56, 0x33, 0x38, 0x32, 0x4D, 0x48, 0x2E, 0x31,  // V382MH.1
										/* 0010 */  0x36, 0x31                                       // 61
									}, 
			
									"ATY,Rom#",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x45, 0x58, 0x54, 0x33,  // 113-EXT3
										/* 0008 */  0x37, 0x36, 0x33, 0x35, 0x2D, 0x30, 0x30, 0x31   // 7635-001
									}, 
			
									"ATY,copyright",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  // Copyrigh
										/* 0008 */  0x74, 0x20, 0x41, 0x4D, 0x44, 0x20, 0x49, 0x6E,  // t AMD In
										/* 0010 */  0x63, 0x2E, 0x20, 0x20, 0x41, 0x6C, 0x6C, 0x20,  // c.  All 
										/* 0018 */  0x52, 0x69, 0x67, 0x68, 0x74, 0x20, 0x52, 0x65,  // Right Re
										/* 0020 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2E, 0x20,  // served. 
										/* 0028 */  0x20, 0x32, 0x30, 0x30, 0x35, 0x2D, 0x32, 0x30,  //  2005-20
										/* 0030 */  0x31, 0x39                                       // 19
									}, 
			
									"Force_Load_FalconSMUFW",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x01                                             // .
									}, 
			
									"PP_WorkLoadPolicyMask",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										 0x32                                             // 2
									}, 
			
									"StartupDisplay",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x47, 0x4E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // GN......
										/* 0008 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
										/* 0010 */  0x10, 0x8F, 0xEC, 0x37, 0x00, 0x00, 0x00, 0x00,  // ...7....
										/* 0018 */  0x00, 0x14, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
										/* 0020 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0028 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
										/* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0038 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
										/* 0040 */  0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
										/* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0050 */  0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0058 */  0x00, 0x00, 0x00, 0x00, 0x10, 0x06, 0x32, 0xAE,  // ......2.
										/* 0060 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0068 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
										/* 0070 */  0x50, 0xCF, 0xCD, 0x1C, 0x00, 0x00, 0x00, 0x00,  // P.......
										/* 0078 */  0x00, 0x0A, 0x00, 0x00, 0x40, 0x0B, 0x00, 0x00,  // ....@...
										/* 0080 */  0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0088 */  0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00,  // ....R...
										/* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0098 */  0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,  // 0... ...
										/* 00A0 */  0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,  // ........
										/* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00B0 */  0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00B8 */  0x10, 0x06, 0x32, 0xAE, 0x02, 0x00, 0x00, 0x00,  // ..2.....
										/* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
										/* 00C8 */  0x40, 0x0B, 0x00, 0x00, 0x50, 0xCF, 0xCD, 0x1C,  // @...P...
										/* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
										/* 00D8 */  0x40, 0x0B, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00,  // @.......
										/* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 00E8 */  0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // R.......
										/* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00,  // ....0...
										/* 00F8 */  0x20, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  //  .......
										/* 0100 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
										/* 0108 */  0x00, 0x00, 0x00, 0x00                           // ....
									}, 
			
									"hdagfx",    // ATY,Python Framebuffer Data 
									Buffer ()
									{
										/* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
										/* 0008 */  0x31                                             // 1
									}, 
			
									"agdpmod",    // Navi Black Screen Fix 
									"pikera"
								})
							}
						}
			
						Device (HDAU)    // Navi 10 HDMI Audio
						{
							Name (_ADR, One)  // _ADR: Address
							Name (_SUN, One)  // _SUN: Slot User Number
							Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
							{
								If ((Arg2 == Zero))    // Arguement
								{
									Return (Buffer ()    // Device Specific Method (Arg2)
									{
										 0x03                                             // .
									})
								}
			
								Return (Package ()    // Device Properties
								{
									"driver-version",    // Additional Data 
									Buffer ()
									{
										/* 0000 */  0x31, 0x30, 0x2E, 0x30, 0x2E, 0x31, 0x2E, 0x32,  // 10.0.1.2
										/* 0008 */  0x34                                             // 4
									}, 
			
									"hdagfx",    // Additional HDAGFX Data 
									Buffer ()
									{
										/* 0000 */  0x6F, 0x6E, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x2D,  // onboard-
										/* 0008 */  0x31                                             // 1
									}, 
			
									"model",    // Device Model 
									Buffer ()
									{
										/* 0000 */  0x4E, 0x61, 0x76, 0x69, 0x20, 0x31, 0x30, 0x20,  // Navi 10 
										/* 0008 */  0x48, 0x44, 0x4D, 0x49, 0x20, 0x41, 0x75, 0x64,  // HDMI Aud
										/* 0010 */  0x69, 0x6F                                       // io
									}
								})
							}
						}
					}
				}
			}
				
			Scope (RP04)    // Root Port No. 04
			{
				Scope (PXSX)    // Generic PCIe Controller
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
						Else    // Other Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply    
						}
					}
				}

				Device (RTLK)    // RTL8125 2.5 GB Ethernet Controller
				{
					Name (_ADR, Zero)  // _ADR: Address
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply   
						}
						Else    // Other Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
					}
				}
			}
			
			Scope (RP05)    // Root Port No. 05
			{
				Scope (PXSX)    // Generic PCIe Controller
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
						Else    // Other Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply    
						}
					}
				}
			
				Device (XHC2)    // VL 805/806 xHCI USB Controller
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_SUN, 0x03)  // _SUN: Slot User Number
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))    // Arguement
						{
							Return (Buffer ()    // Device Specific Method (Arg2)    
							{
								 0x03                                             // .
							})
						}
			
						Return (Package ()    // Device Properties
						{
							"acpi-wake-type",    // XHC2 Wake Fix 
							Buffer ()
							{
								 0x01                                             // .
							}, 
			
							"built-in",    // Fake built-in (Applicable to PCI Card)
							Zero, 
							"model",    // Device Model     
							Buffer (0x21)
							{
								/* 0000 */  0x56, 0x4C, 0x38, 0x30, 0x35, 0x2F, 0x38, 0x30,  // VL805/80
								/* 0008 */  0x36, 0x20, 0x78, 0x48, 0x43, 0x49, 0x20, 0x55,  // 6 xHCI U
								/* 0010 */  0x53, 0x42, 0x20, 0x33, 0x2E, 0x30, 0x20, 0x43,  // SB 3.0 C
								/* 0018 */  0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x6C, 0x65,  // ontrolle
								/* 0020 */  0x72                                             // r
							}
						})
					}
				}
			}
				
			Scope (RP09)    // Root Port No. 21
			{
				Scope (PXSX)    // Generic PCIe Controller   
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
						Else    // Other Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply
						}
					}
				}
				
				Device (ANS0)    // Kingston A2000 NVMe
				{
					Name (_ADR, Zero)  // _ADR: Address
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))    // Arguement
						{
							Return (Buffer ()    // Device Specific Method (Arg2)
							{
								 0x03                                             // .
							})
						}
			
						Return (Package ()    // Device Properties
						{
							"device_type",    // Device Type 
							Buffer ()
							{
								/* 0000 */  0x4E, 0x6F, 0x6E, 0x2D, 0x56, 0x6F, 0x6C, 0x61,  // Non-Vola
								/* 0008 */  0x74, 0x69, 0x6C, 0x65, 0x20, 0x6D, 0x65, 0x6D,  // tile mem
								/* 0010 */  0x6F, 0x72, 0x79, 0x20, 0x63, 0x6F, 0x6E, 0x74,  // ory cont
								/* 0018 */  0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72               // roller
							}, 
			
							"model",    // Device Model 
							Buffer ()
							{
								/* 0000 */  0x4B, 0x49, 0x4E, 0x47, 0x53, 0x54, 0x4F, 0x4E,  // KINGSTON
								/* 0008 */  0x20, 0x53, 0x41, 0x32, 0x30, 0x30, 0x30, 0x4D,  //  SA2000M
								/* 0010 */  0x38, 0x35, 0x30, 0x30, 0x47                     // 8500G
							}, 
			
							"device-id",    // Fake Device ID 
							Buffer ()
							{
								 0x06, 0xA8, 0x00, 0x00                           // ....
							}, 
			
							"vendor-id",    // Fake Vendor ID 
							Buffer ()
							{
								 0x4D, 0x14, 0x00, 0x00                           // M...
							}
						})
					}
				}
			}
			
			Scope (RP20)    // Root Port No. 20
			{
				Scope (PXSX)    // Generic PCIe Controller 
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					 {
						 If (_OSI ("Darwin"))    // Operating System Interfaces
						 {
							 Return (Zero)    // ontrol Method Not Apply
						 }
						 Else    // Other Operating System Interfaces
						 {
							 Return (0x0F)    // Control Method Apply    
						 }
					 }
				 }
			
				Device (ARPT)    // BCM4360 802.11ac Wireless Network Adapter
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_SUN, 0x02)  // _SUN: Slot User Number
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))    // Arguement
						{
							Return (Buffer ()    // Device Specific Method (Arg2)
							{
								 0x03                                             // .
							})
						}
			
						Return (Package ()    // Device Properties
						{
							"built-in",    // Fake built-in (Applicable to PCI Card) 
							Zero, 
							"model",     // Device Model
							Buffer ()
							{
								/* 0000 */  0x42, 0x43, 0x4D, 0x34, 0x33, 0x36, 0x30, 0x20,  // BCM4360 
								/* 0008 */  0x38, 0x30, 0x32, 0x2E, 0x31, 0x31, 0x61, 0x63,  // 802.11ac
								/* 0010 */  0x20, 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73,  //  Wireles
								/* 0018 */  0x73, 0x20, 0x4E, 0x65, 0x74, 0x77, 0x6F, 0x72,  // s Networ
								/* 0020 */  0x6B, 0x20, 0x41, 0x64, 0x61, 0x70, 0x74, 0x65,  // k Adapte
								/* 0028 */  0x72                                             // r
							}
						})
					}
				}
			}
			
			Scope (RP21)    // Root Port No. 09
			{
				Scope (PXSX)    // Generic PCIe Controller
				{
					Method (_STA, 0, NotSerialized)  // _STA: Status
					 {
						 If (_OSI ("Darwin"))    // Operating System Interfaces
						 {
							 Return (Zero)    // ontrol Method Not Apply
						 }
						 Else    // Other Operating System Interfaces
						 {
							 Return (0x0F)    // Control Method Apply    
						 }
					 }
				 }
				
				Device (ANS1)    // Kingston A2000 NVMe
				{
					Name (_ADR, Zero)  // _ADR: Address
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))    // Arguement
						{
							Return (Buffer ()    // Device Specific Method (Arg2)
							{
								 0x03                                             // .
							})
						}
			
						Return (Package ()    // Device Properties
						{
							"device_type",    // Device Type 
							Buffer ()
							{
								/* 0000 */  0x4E, 0x6F, 0x6E, 0x2D, 0x56, 0x6F, 0x6C, 0x61,  // Non-Vola
								/* 0008 */  0x74, 0x69, 0x6C, 0x65, 0x20, 0x6D, 0x65, 0x6D,  // tile mem
								/* 0010 */  0x6F, 0x72, 0x79, 0x20, 0x63, 0x6F, 0x6E, 0x74,  // ory cont
								/* 0018 */  0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72               // roller
							}, 
			
							"model",    // Device Model 
							Buffer ()
							{
								/* 0000 */  0x4B, 0x49, 0x4E, 0x47, 0x53, 0x54, 0x4F, 0x4E,  // KINGSTON
								/* 0008 */  0x20, 0x53, 0x41, 0x32, 0x30, 0x30, 0x30, 0x4D,  //  SA2000M
								/* 0010 */  0x38, 0x35, 0x30, 0x30, 0x47                     // 8500G
							}, 
			
							"device-id",    // Fake Device ID
							Buffer ()
							{
								 0x06, 0xA8, 0x00, 0x00                           // ....
							}, 
			
							"vendor-id",    // Fake Vendor ID 
							Buffer ()
							{
								 0x4D, 0x14, 0x00, 0x00                           // M...
							}
						})
					}
				}
			}
			
			Scope (SAT0)    // SAT0 Generic HDD/SSD Device
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply    
					}
				}
			}
			
			Device (SATA)    // Generic HDD/SSD Device, SATO to SATA Rename
			{
				Name (_ADR, 0x00170000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply   
					}
					Else    // Other Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
				}
			}
			
			Scope (SBUS)    // Comet Lake PCH-V SMBus Host Controller
			{
				Device (BUS0)    // BUS Bridge
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_CID, "smbus")  // _CID: Compatible ID
					Device (DVL0)
					{
						Name (_ADR, 0x57)  // _ADR: Address
						Name (_CID, "diagsvault")  // _CID: Compatible ID
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (!Arg2)    // Arguement
							{
								Return (Buffer ()    // Device Specific Method (Arg2)
								{
									 0x03                                             // .
								})
							}
			
							Return (Package ()    // Device Properties
							{
								"address",    // DVL0 Address 
								Zero
							})
						}
					}
			
					Method (_STA, 0, NotSerialized)  // _STA: Status
					{
						If (_OSI ("Darwin"))    // Operating System Interfaces
						{
							Return (0x0F)    // Control Method Apply   
						}
						Else    // Other Operating System Interfaces
						{
							Return (Zero)    // Control Method Not Apply
						}
					}
				}
			}
			
			Device (TSUB) // Comet Lake PCH-V Thermal Subsystem 
			{
				Name (_ADR, 0x00140002)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply   
					}
					Else    // Other Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
				}
			}
			
			Scope (XHC)    // USB Controller
			{
				Method (_STA, 0, NotSerialized)  // _STA: Status
				{
					If (_OSI ("Darwin"))    // Operating System Interfaces
					{
						Return (Zero)    // Control Method Not Apply
					}
					Else    // Other Operating System Interfaces
					{
						Return (0x0F)    // Control Method Apply    
					}
				}
			}
			
			Device (XHC1)    // Comet Lake PCH-V USB Controller
			{
				Name (_ADR, 0x00140000)  // _ADR: Address
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If ((Arg2 == Zero))    // Arguement
					{
						Return (Buffer ()    // Device Specifiv Method (Arg2)
						{
							 0x03                                             // .
						})
					}
			
					Return (Package ()    // Device Properties
					{
						"acpi-wake-type",    // XHC1 Wake Fix 
						Buffer ()
						{
							 0x01                                             // .
						}
					})
				}
			}
		}	
		
		Device (USBX)    // USB Power Management
		{
			Name (_ADR, Zero)  // _ADR: Address
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If ((Arg2 == Zero))        // Arguement
				{
					Return (Buffer ()    // Device Specifiv Method (Arg2)
					{
						 0x03                                             // .
					})
				}

				Return (Package ()    // USB Power Properties
				{
					"kUSBSleepPowerSupply", 
					0x13EC,    // 5100
					"kUSBSleepPortCurrentLimit", 
					0x0834,    // 2100 
					"kUSBWakePowerSupply", 
					0x13EC,    // 5100
					"kUSBWakePortCurrentLimit", 
					0x0834     // 2100
				})
			}

			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				If (_OSI ("Darwin"))    // Operating System Interfaces
				{
					Return (0x0F)    // Control Method Apply   
				}
				Else    // Other Operating System Interfaces
				{
					Return (Zero)    // Control Method Not Apply
				}
			}
		}
	}
}
