# Ambient Light Sensor

![GUIDE](https://img.shields.io/badge/Guide-ACPI-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [Introduction](#introduction)
  - [ALSD](#alsd)
  - [ALSE](#alse)
  - [AppleLMUController](#applelmucontroller)
  - [Enabling AppleLMUController](#enabling-applelmucontroller)
- [Credits](#credits)

## Introduction

<div align="justify">A device that detects the amount of light in the vicinity. An ambient light sensor may be built into a smartphone or tablet to adjust the screen brightness based on the available light.</div>

### ALSD

<div align="justify"><b>ALSD</b> stands for <b>Ambient Light Sensor Device</b>, and is an ACPI device that measures the ambient light level in a device's environment. The ALS device can be used to adjust the display brightness of a device based on the ambient light level, in order to improve visibility and conserve power. The ALS device is typically found in laptops and other portable devices, and is often used in conjunction with the ALSE control method to further conserve power and reduce noise pollution.ALCD also kknown as <b>ALS0</b>.</div>

### ALSE

<div align="justify"><b>ALSE stands</b> for <b>Acoustic Level Sensor and Event</b>. It is an ACPI (Advanced Configuration and Power Interface) control method for managing the sound level of a device. The `ALSE` control method allows the operating system to set the maximum sound level for the device, and to monitor and control the current sound level. It can be used to reduce the volume of a device when it is not in use, or to prevent the volume from getting too loud. The `ALSE` control method is typically used in laptops and other portable devices to conserve power and prevent noise pollution.</div>

### AppleLMUController

<div align="justify">AppleLMUController is a system driver on macOS that manages the Light Management Unit (LMU) on Apple computers. The LMU is a component that is responsible for controlling the ambient light sensor (ALS) and keyboard backlighting on some Mac models. The ambient light sensor detects the level of ambient light in the room and adjusts the display brightness accordingly. The keyboard backlighting adjusts the brightness of the keyboard based on the level of ambient light to improve visibility in low-light conditions. The AppleLMUController driver communicates with the LMU hardware and sends commands to adjust the brightness of the display and keyboard backlighting based on the ambient light conditions. It is an essential component of the macOS operating system and ensures that the LMU functions properly.</div>

### Enabling AppleLMUController

#### Method 1 : Recommended if `_HID` `ACPI0008` exist in DSDT

Since `ALSD` and `ALSE` is connected to each other, it is easy to call `AppleLMUController`.

1. Open DSDT.

2. Find `ALSE.`

   ![ALSE][alse]

3. If exist, check the value. As example `0x02` is to enable. If nothing return, the value is `0x0B`

   ![ALSE0x02][alse2bit]

4. Below is conjunction method from `ALSE` to call `AppleLMUController` which is connected to `ALSD` / `ALS0`

   ```asl
   DefinitionBlock ("", "SSDT", 2, "CpyPst", "ALSE", 0x00001001)
   {
       External (ALSE, UnknownObj)
    
       Scope (\)
       {
           If (_OSI ("Darwin"))
           {
               ALSE = 0x02
           }
       }
   }
   ```
    
#### Method 2 : Recommended if `_HID` `ACPI0008` is not exist in DSDT

<div align="justify">Creating fake <code>ALS0</code> doesn't affect current ambient light sensor in original ACPI. However, correcting variable exist in multiple places may affect other components while achieving our desired effect. When there is an ambient light sensor device in the original ACPI, the name may not be <code>ALSD</code>, although no other name has been found yet.</div>

1. Open [Maciasl](https://github.com/acidanthera/MaciASL/releases) / [Xiasl](https://github.com/ic005k/Xiasl/releases)

2. Find any related device either <code>ALSD</code> or <code>ALS0</code>.
 
3. Check `ALI` and `ALR`.

5. Copy and paste SSDT table below. 

   ```asl
   DefinitionBlock ("", "SSDT", 2, "CpyPst", "ALS0", 0x00001002)
   {
       Scope (_SB)
       {
           Device (ALS0)
           {
               Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
               Name (_CID, "smc-als")  // _CID: Compatible ID
               Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
               Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
               {
                   Package (0x02)
                   {
                       0x64, 
                       0x012C
                   }
               })
               Method (_STA, 0, NotSerialized)  // _STA: Status
               {
                   If (_OSI ("Darwin"))
                   {
                       Return (0x0F)
                   }
                   Else
                   {
                       Return (Zero)
                   }
               }
           }
       }
   }
   ```

7. Adjust the path in the SSDT accordingly.

**References:** [oc-Little-Translate](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/Ambient_Light_Sensor_(SSDT-ALS0))

## Credits

[Acidanthera][dev0] | [Dortania][dev-group0] | [ic500k](dev1) | [5T33Z0](dev2)

[alse]: https://user-images.githubusercontent.com/72515939/210977256-8cd8f9a4-e46d-498d-a439-7fd7a91f9d40.png
[alse2bit]: https://user-images.githubusercontent.com/72515939/210977281-1e68af0d-1fe9-46bc-9b7f-99e2a52cfafa.png
[dev-group0]: https://dortania.github.io
[dev0]: https://github.com/acidanthera/
[dev1]: https://github.com/ic005k/
[dev2]: https://github.com/5T33Z0/
