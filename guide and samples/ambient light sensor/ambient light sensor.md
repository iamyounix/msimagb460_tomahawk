# Ambient Light Sensor

![GUIDE](https://img.shields.io/badge/Guide-ACPI-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [What is ALSD?](#what-is-alsd)
- [What is ALSE?](#what-is-alse)
- [Enabling AppleLMUController](#enabling-applelmucontroller)
- [Credits](#credits)

## What is ALSD?

- `ALSD/ALS0` stands for "Ambient Light Sensor Device/Ambient Light Sensor," and is an ACPI device that measures the ambient light level in a device's environment. The `ALS` device can be used to adjust the display brightness of a device based on the ambient light level, in order to improve visibility and conserve power. The `ALS` device is typically found in laptops and other portable devices, and is often used in conjunction with the `ALSE` (Acoustic Level Sensor and Event) control method to further conserve power and reduce noise pollution.

## What is ALSE?

- `ALSE` stands for "Acoustic Level Sensor and Event." It is an ACPI (Advanced Configuration and Power Interface) control method for managing the sound level of a device. The `ALSE` control method allows the operating system to set the maximum sound level for the device, and to monitor and control the current sound level. It can be used to reduce the volume of a device when it is not in use, or to prevent the volume from getting too loud. The `ALSE` control method is typically used in laptops and other portable devices to conserve power and prevent noise pollution.

## Enabling AppleLMUController

### Method 1

> **Note**: Recommended if `_HID` `ACPI0008` exist in DSDT.

- Since `ALSD` and `ALSE` is connected to each other, it is easy to call `AppleLMUController`.
  - Open DSDT
  - Find `ALSE`.

    ![Screenshot_20230106_175531](https://user-images.githubusercontent.com/72515939/210977256-8cd8f9a4-e46d-498d-a439-7fd7a91f9d40.png)

- If exist, check the value. As example `0x02` is to enable. If nothing return, the value is `0x0B`

    ![Screenshot_20230106_175444](https://user-images.githubusercontent.com/72515939/210977281-1e68af0d-1fe9-46bc-9b7f-99e2a52cfafa.png)

- Below is conjunction method from `ALSE` to call `AppleLMUController` which is connected to `ALSD` / `ALS0`

    ```asl
    DefinitionBlock ("", "SSDT", 2, "CpyPst", "EXT", 0x414C5345)
    {
        External (ALSE, UnknownObj)
        External (STAS, IntObj)

        Scope (\)
        {
            If (_OSI ("Darwin"))
            {
                ALSE = 0x02
            }
        }
    }
    ```

### Method 2

> **Note**: Recommended if `_HID` `ACPI0008` is not exist in DSDT.

- Creating fake `ALSO` doesn't affect current ambient light sensor in original ACPI. However, correcting `variable` exist in multiple places may affect other components while achieving our desired effect. When there is an ambient light sensor device in the original ACPI, the name may not be ALSD, although no other name has been found yet. If so, adjust the path in the SSDT accordingly. Below is the an example code:

  ```asl
  DefinitionBlock ("", "SSDT", 2, "ACDT", "ALS0", 0)
  {
      Scope (_SB)
      {
          Device (ALS0)
          {
              Name (_HID, "ACPI0008")
              Name (_CID, "smc-als")
              Name (_ALI, 0x012C)
              Name (_ALR, Package (0x01)
              Name (_ALR, Package (0x01)) {
                  Package (0x02)
                  {
                      0x64,
                      0x012C
                  }
              })
              Method (_STA, 0, NotSerialized)
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
  
## Credits

[acidanthera](https://github.com/acidanthera/) | [dortania](https://dortania.github.io)
