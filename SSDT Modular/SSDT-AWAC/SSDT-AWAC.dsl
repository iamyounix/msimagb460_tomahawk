DefinitionBlock("", "SSDT", 2, "CpyPst", "AWAC", 0x00000001) {
    External(_SB_, DeviceObj)
    External(STAS, IntObj)
    
    Scope(\_SB) {
        Method(_INI, 0, NotSerialized) // _INI: Initialize
        {
            If(_OSI("Darwin")) {
                STAS = One
            }
        }
    }
}