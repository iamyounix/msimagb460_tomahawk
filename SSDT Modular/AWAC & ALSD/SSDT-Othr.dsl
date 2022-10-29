DefinitionBlock("", "SSDT", 2, "CpyPst", "CP-Othr", 0x00000001) {
    External(_SB_, DeviceObj)
    External(ALSE, IntObj)
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
    }
}
