# Ambient Light Sensor

- Open DSDT
- Find ALSE.

![](file:///home/copypaste/Desktop/Screenshot_20230106_175531.png)

- If exist, check the value. As example `0x02 `is to enable. If nothing return, the value is `0x08`

![](file:///home/copypaste/Desktop/Screenshot_20230106_175444.png)

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
