DefinitionBlock("", "SSDT", 2, "ASRock", "P1.20", 0x00000001) {
   External(_SB_, DeviceObj)
   External(_SB_.PCI0, DeviceObj)
   External(_SB_.PCI0.DRAM, DeviceObj)
   External(_SB_.PCI0.GFX0, DeviceObj)
   External(_SB_.PCI0.HDAS, DeviceObj)
   External(_SB_.PCI0.HECI, DeviceObj)
   External(_SB_.PCI0.LPCB, DeviceObj)
   External(_SB_.PCI0.LPCB.EC__, DeviceObj)
   External(_SB_.PCI0.LPCB.FWHD, DeviceObj)
   External(_SB_.PCI0.LPCB.HPET, DeviceObj)
   External(_SB_.PCI0.LPCB.PMCR, DeviceObj)
   External(_SB_.PCI0.PEG0, DeviceObj)
   External(_SB_.PCI0.PEG0.PEGP, DeviceObj)
   External(_SB_.PCI0.RP04, DeviceObj)
   External(_SB_.PCI0.RP04.PXSX, DeviceObj)
   External(_SB_.PCI0.RP04.PXSX._STA, UnknownObj)
   External(_SB_.PCI0.RP05, DeviceObj)
   External(_SB_.PCI0.RP05.PXSX, DeviceObj)
   External(_SB_.PCI0.RP05.PXSX._STA, UnknownObj)
   External(_SB_.PCI0.RP09, DeviceObj)
   External(_SB_.PCI0.RP09.PXSX, DeviceObj)
   External(_SB_.PCI0.RP09.PXSX._STA, UnknownObj)
   External(_SB_.PCI0.RP20, DeviceObj)
   External(_SB_.PCI0.RP20.PXSX, DeviceObj)
   External(_SB_.PCI0.RP20.PXSX._STA, UnknownObj)
   External(_SB_.PCI0.RP21, DeviceObj)
   External(_SB_.PCI0.RP21.PXSX, DeviceObj)
   External(_SB_.PCI0.RP21.PXSX._STA, UnknownObj)
   External(_SB_.PCI0.SAT0, DeviceObj)
   External(_SB_.PCI0.SBUS, DeviceObj)
   External(_SB_.PCI0.TSUB, DeviceObj)
   External(_SB_.PCI0.XHC_, DeviceObj)
   External(_SB_.USBX, DeviceObj)
   External(ALSE, IntObj)
   External(GPRW, MethodObj) // 2 Arguments
   External(STAS, IntObj)

   Scope(\) {
      If(_OSI("Darwin")) {
         ALSE = 0x02
      }
   }

   Scope(\_SB) {
      Method(_INI, 0, NotSerialized) // _INI: Initialize
      {
         If(_OSI("Darwin")) {
            STAS = One
         }
      }

      Scope(PCI0) {
         Device(DRAM) {
            Name(_ADR, Zero) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }
         }

         Scope(LPCB) {
            Device(EC) {
               Name(_HID, EisaId("PNP0C09") /* Embedded Controller Device */ ) // _HID: Hardware ID
               Name(_UID, One) // _UID: Unique ID
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(FWHD) {
               Name(_HID, EisaId("INT0800") /* Intel 82802 Firmware Hub Device */ ) // _HID: Hardware ID
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }

               Name(_CRS, ResourceTemplate() // _CRS: Current Resource Settings
                  {
                     Memory32Fixed(ReadOnly,
                        0xFF000000, // Address Base
                        0x01000000, // Address Length
                     )
                  })
            }

            Scope(HPET) {
               Name(_CRS, ResourceTemplate() // _CRS: Current Resource Settings
                  {
                     IRQNoFlags() {
                        0,
                        8,
                        11
                     }
                     Memory32Fixed(ReadWrite,
                        0xFED00000, // Address Base
                        0x00000400, // Address Length
                     )
                  })
            }

            Device(PMCR) {
               Name(_HID, EisaId("APP9876")) // _HID: Hardware ID
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(0x0B)
                  }
                  Else {
                     Return(Zero)
                  }
               }

               Name(_CRS, ResourceTemplate() // _CRS: Current Resource Settings
                  {
                     Memory32Fixed(ReadWrite,
                        0xFE000000, // Address Base
                        0x00010000, // Address Length
                     )
                  })
            }
         }

         Scope(GFX0) {
            Method(_STA, 0, NotSerialized) // _STA: Status
            {
               If(_OSI("Darwin")) {
                  Return(Zero)
               }
               Else {
                  Return(0x0F)
               }
            }
         }

         Device(IGPU) {
            Name(_ADR, 0x00020000) // _ADR: Address
            Name(_SUN, Zero) // _SUN: Slot User Number
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }

            Device(DD01) {
               Name(_ADR, One) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD02) {
               Name(_ADR, 0x02) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD03) {
               Name(_ADR, 0x03) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD04) {
               Name(_ADR, 0x04) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD05) {
               Name(_ADR, 0x05) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD06) {
               Name(_ADR, 0x06) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD07) {
               Name(_ADR, 0x07) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD08) {
               Name(_ADR, 0x08) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD09) {
               Name(_ADR, 0x09) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0A) {
               Name(_ADR, 0x0A) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0B) {
               Name(_ADR, 0x0B) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0C) {
               Name(_ADR, 0x0C) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0D) {
               Name(_ADR, 0x0D) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0E) {
               Name(_ADR, 0x0E) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD0F) {
               Name(_ADR, 0x0F) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }

            Device(DD1F) {
               Name(_ADR, 0x1F) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }
         }

         Scope(HDAS) {
            Method(_STA, 0, NotSerialized) // _STA: Status
            {
               If(_OSI("Darwin")) {
                  Return(Zero)
               }
               Else {
                  Return(0x0F)
               }
            }
         }

         Device(HDEF) {
            Name(_ADR, 0x001F0003) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If((Arg2 == Zero)) {
                  Return(Buffer(One) {
                     0x03 // .
                  })
               }

               Return(Package(0x04) {
                  "No-hda-gfx",
                  Buffer(0x08) {
                     0x00,
                     0x00,
                     0x00,
                     0x00,
                     0x00,
                     0x00,
                     0x00,
                     0x00 // ........
                  },

                  "No-idle-support",
                  Buffer(One) {
                     0x00 // .
                  }
               })
            }
         }

         Scope(HECI) {
            Method(_STA, 0, NotSerialized) // _STA: Status
            {
               If(_OSI("Darwin")) {
                  Return(Zero)
               }
               Else {
                  Return(0x0F)
               }
            }
         }

         Device(IMEI) {
            Name(_ADR, 0x00160000) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }
         }

         Scope(PEG0) {
            Scope(PEGP) {
               Device(BRG0) {
                  Name(_ADR, Zero) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }

                  Device(GFX0) {
                     Name(_ADR, Zero) // _ADR: Address
                     Name(_SUN, One) // _SUN: Slot User Number
                     Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                     {
                        If((Arg2 == Zero)) {
                           Return(Buffer(One) {
                              0x03 // .
                           })
                        }

                        Method(_PRW, 0, NotSerialized) // _PRW: Power Resources for Wake
                        {
                           Return(GPRW(0x69, 0x04))
                        }

                        Return(Package(0x02) {
                           "agdpmod",
                           "pikera"
                        })
                     }

                     Device(LCD) {
                        Name(_ADR, 0x0110) // _ADR: Address
                        Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                        {
                           If(_OSI("Darwin")) {
                              Return(0x0F)
                           }
                           Else {
                              Return(Zero)
                           }
                        }
                     }
                  }

                  Device(HDAU) {
                     Name(_ADR, One) // _ADR: Address
                     Name(_SUN, One) // _SUN: Slot User Number
                     Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                     {
                        If((Arg2 == Zero)) {
                           Return(Buffer(One) {
                              0x03 // .
                           })
                        }

                        Return(Package(0x02) {
                           "driver-version",
                           "10.0.1.24"
                        })
                     }
                  }
               }
            }
         }

         Scope(RP04) {
            Scope(PXSX) {
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(Zero)
                  }
                  Else {
                     Return(0x0F)
                  }
               }
            }

            Device(RTLK) {
               Name(_ADR, Zero) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }
         }

         Scope(RP05) {
            Scope(PXSX) {
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(Zero)
                  }
                  Else {
                     Return(0x0F)
                  }
               }
            }

            Device(XHC2) {
               Name(_ADR, Zero) // _ADR: Address
               Name(_SUN, 0x03) // _SUN: Slot User Number
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If((Arg2 == Zero)) {
                     Return(Buffer(One) {
                        0x03 // .
                     })
                  }

                  Return(Package(0x02) {
                     "built-in",
                     Zero
                  })
               }

               Device(HS01) {
                  Name(_ADR, One) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SSP1) {
                  Name(_ADR, 0x02) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SSP2) {
                  Name(_ADR, 0x03) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SSP3) {
                  Name(_ADR, 0x04) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SSP4) {
                  Name(_ADR, 0x05) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }
            }
         }

         Scope(RP09) {
            Scope(PXSX) {
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(Zero)
                  }
                  Else {
                     Return(0x0F)
                  }
               }
            }

            Device(ANS0) {
               Name(_ADR, Zero) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If((Arg2 == Zero)) {
                     Return(Buffer(One) {
                        0x03 // .
                     })
                  }

                  Return(Package(0x0A) {
                     "device_type",
                     "Non-Volatile memory controller",
                     "model",
                     "KINGSTON SA2000M8500G",
                     "name",
                     "ANS0",
                     "device-id",
                     Buffer(0x04) {
                        0x06,
                        0xA8,
                        0x00,
                        0x00 // ....
                     },

                     "vendor-id",
                     Buffer(0x04) {
                        0x4D,
                        0x14,
                        0x00,
                        0x00 // M...
                     }
                  })
               }
            }
         }

         Scope(RP20) {
            Scope(PXSX) {
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(Zero)
                  }
                  Else {
                     Return(0x0F)
                  }
               }
            }

            Device(ARPT) {
               Name(_ADR, Zero) // _ADR: Address
               Name(_SUN, 0x02) // _SUN: Slot User Number
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If((Arg2 == Zero)) {
                     Return(Buffer(One) {
                        0x03 // .
                     })
                  }

                  Return(Package(0x02) {
                     "built-in",
                     Zero
                  })
               }
            }
         }

         Scope(RP21) {
            Scope(PXSX) {
               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(Zero)
                  }
                  Else {
                     Return(0x0F)
                  }
               }
            }

            Device(ANS1) {
               Name(_ADR, Zero) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If((Arg2 == Zero)) {
                     Return(Buffer(One) {
                        0x03 // .
                     })
                  }

                  Return(Package(0x0A) {
                     "device_type",
                     "Non-Volatile memory controller",
                     "model",
                     "KINGSTON SA2000M8500G",
                     "name",
                     "ANS1",
                     "device-id",
                     Buffer(0x04) {
                        0x06,
                        0xA8,
                        0x00,
                        0x00 // ....
                     },

                     "vendor-id",
                     Buffer(0x04) {
                        0x4D,
                        0x14,
                        0x00,
                        0x00 // M...
                     }
                  })
               }
            }
         }

         Scope(SAT0) {
            Method(_STA, 0, NotSerialized) // _STA: Status
            {
               If(_OSI("Darwin")) {
                  Return(Zero)
               }
               Else {
                  Return(0x0F)
               }
            }
         }

         Device(SATA) {
            Name(_ADR, 0x00170000) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }
         }

         Scope(SBUS) {
            Device(BUS0) {
               Name(_ADR, Zero) // _ADR: Address
               Name(_CID, "smbus") // _CID: Compatible ID
               Device(DVL0) {
                  Name(_ADR, 0x57) // _ADR: Address
                  Name(_CID, "diagsvault") // _CID: Compatible ID
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(!Arg2) {
                        Return(Buffer(One) {
                           0x03 // .
                        })
                     }

                     Return(Package(0x02) {
                        "address",
                        Zero
                     })
                  }
               }

               Method(_STA, 0, NotSerialized) // _STA: Status
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }
            }
         }

         Device(TSUB) {
            Name(_ADR, 0x00140002) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }
         }

         Scope(XHC) {
            Method(_STA, 0, NotSerialized) // _STA: Status
            {
               If(_OSI("Darwin")) {
                  Return(Zero)
               }
               Else {
                  Return(0x0F)
               }
            }
         }

         Device(XHC1) {
            Name(_ADR, 0x00140000) // _ADR: Address
            Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
            {
               If(_OSI("Darwin")) {
                  Return(0x0F)
               }
               Else {
                  Return(Zero)
               }
            }

            Device(RHUB) {
               Name(_ADR, Zero) // _ADR: Address
               Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
               {
                  If(_OSI("Darwin")) {
                     Return(0x0F)
                  }
                  Else {
                     Return(Zero)
                  }
               }

               Device(HS01) {
                  Name(_ADR, One) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS02) {
                  Name(_ADR, 0x02) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS03) {
                  Name(_ADR, 0x03) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS04) {
                  Name(_ADR, 0x04) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS05) {
                  Name(_ADR, 0x05) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS06) {
                  Name(_ADR, 0x06) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS07) {
                  Name(_ADR, 0x07) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS08) {
                  Name(_ADR, 0x08) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS09) {
                  Name(_ADR, 0x09) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS10) {
                  Name(_ADR, 0x0A) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS11) {
                  Name(_ADR, 0x0B) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS12) {
                  Name(_ADR, 0x0C) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS13) {
                  Name(_ADR, 0x0D) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(HS14) {
                  Name(_ADR, 0x0E) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(USR1) {
                  Name(_ADR, Zero) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(USR2) {
                  Name(_ADR, Zero) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS01) {
                  Name(_ADR, Zero) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS02) {
                  Name(_ADR, One) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS03) {
                  Name(_ADR, 0x02) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS04) {
                  Name(_ADR, 0x03) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS05) {
                  Name(_ADR, 0x04) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS06) {
                  Name(_ADR, 0x05) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS07) {
                  Name(_ADR, 0x06) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS08) {
                  Name(_ADR, 0x07) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS09) {
                  Name(_ADR, 0x08) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }

               Device(SS10) {
                  Name(_ADR, 0x09) // _ADR: Address
                  Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
                  {
                     If(_OSI("Darwin")) {
                        Return(0x0F)
                     }
                     Else {
                        Return(Zero)
                     }
                  }
               }
            }
         }
      }

      Device(USBX) {
         Name(_ADR, Zero) // _ADR: Address
         Method(_DSM, 4, NotSerialized) // _DSM: Device-Specific Method
         {
            If((Arg2 == Zero)) {
               Return(Buffer(One) {
                  0x03 // .
               })
            }

            Return(Package(0x08) {
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

         Method(_STA, 0, NotSerialized) // _STA: Status
         {
            If(_OSI("Darwin")) {
               Return(0x0F)
            }
            Else {
               Return(Zero)
            }
         }
      }
   }
}
