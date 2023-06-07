# Sorting Drivers and Kexts

Adding a `Plugins` folder inside `Lilu.kext` and certain kexts to improve stability (Recommended). Use only specific drivers. improve boot speed and sorting kexts in priority; improve `debug` log and `data` injection, especially debugging. This method requires [Propertree](https://github.com/corpnewt/ProperTree). Below is an example:

- Drivers

    ```zsh
    📁 Drivers
    ├── 📃 HfsPlus.efi                                        // 1
    ├── 📃 OpenCanopy.efi                                     // 2
    └── 📃 OpenRuntime.efi                                    // 3
    ```

- Kext

    ```zsh
    📁 Lilu
    └── Contents
        ├── 📃 Info.plist
        ├── 📁 MacOS
        │   └── 📃 Lilu
        └── 📁 Plugins                                        // release, plugin that depends on Lilu.kext
            ├── 📁 AppleALC.kext
            │   └── 📁 Contents
            │       ├── 📃 Info.plist
            │       └── 📁 MacOS
            │           └── 📃 AppleALC
            ├── 📁 DebugEnhancer.kext
            │   └── 📁 Contents
            │       ├── 📃 Info.plist
            │       └── 📁 MacOS
            │           └── 📃 DebugEnhancer                  // debug
            ├── 📁 VirtualSMC.kext
            │   └── Contents
            │       ├── 📃 Info.plist
            │       ├── 📁 MacOS
            │       │   └── 📃 VirtualSMC
            │       └── Plugins                               // release, plugin that depends on VirtualSMC.kext
            │           ├── 📁 SMCProcessor.kext
            │           │   └── 📃 Contents
            │           │       ├── 📁 Info.plist
            │           │       └── MacOS
            │           │           └── 📃 SMCProcessor
            │           └── SMCSuperIO.kext
            │               └── Contents
            │                   ├── 📃 Info.plist
            │                   └── 📁 MacOS
            │                       └── 📃 SMCSuperIO
            └── 📁 WhateverGreen.kext
                └── 📁 Contents
                    ├── 📃 Info.plist
                    └── 📁 MacOS
                        └── 📃 WhateverGreen
    ```

    > **Note:**  All kexts contained in the `Plugins` folder are the kexts that rely on Lilu. `DebugEnhancer.kext` is include with debug version.

  Open config.plist using [Propertree](https://github.com/corpnewt/ProperTree), and use **OC Clean Snapshot** function (`CMD`+`Shift`+`R`) to capture all kext (include plugins folder). [Here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/kext.plist) is an example in plist format. Below is the graphical structure:
  
  ![kexts_sort](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/6a64b331-62f9-431a-96fc-40f543acae43)
  
- Our EFI structure shall be like this:

    ```zsh
    📁 EFI
    ├── 📁 BOOT
    │   └── 📃 BOOTx64.efi
    └── OC
        ├── 📁 ACPI
        │   └── 📃 SSDT-YNXB460.aml
        ├── 📁 Drivers
        │   ├── 📃 HfsPlus.efi
        │   ├── 📃 OpenCanopy.efi
        │   ├── 📃 OpenRuntime.efi
        ├── 📁 Kexts
        │   ├── 📁 IntelMausi.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       └── 📁 MacOS
        │   │           └── 📃 IntelMausi
        │   ├── 📁 Lilu.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       ├── 📁 MacOS
        │   │       │   └── 📃 Lilu
        │   │       └── 📁 Plugins
        │   │           ├── 📁 AppleALC.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── AppleALC
        │   │           ├── 📁 DebugEnhancer.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── 📃 DebugEnhancer
        │   │           ├── 📁 RestrictEvents.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       └── 📁 MacOS
        │   │           │           └── 📃 RestrictEvents
        │   │           ├── 📁 VirtualSMC.kext
        │   │           │   └── 📁 Contents
        │   │           │       ├── 📃 Info.plist
        │   │           │       ├──📁  MacOS
        │   │           │       │   └── 📃 VirtualSMC
        │   │           │       └── 📁 Plugins
        │   │           │           ├── 📁 SMCProcessor.kext
        │   │           │           │   └── 📁 Contents
        │   │           │           │       ├── 📃 Info.plist
        │   │           │           │       └── 📁 MacOS
        │   │           │           │           └── 📃 SMCProcessor
        │   │           │           └── 📁 SMCSuperIO.kext
        │   │           │               └── 📁 Contents
        │   │           │                   ├── 📃 Info.plist
        │   │           │                   └── 📁 MacOS
        │   │           │                       └── 📃 SMCSuperIO
        │   │           └── 📁 WhateverGreen.kext
        │   │               └── 📁 Contents
        │   │                   ├── 📃 Info.plist
        │   │                   └── 📁 MacOS
        │   │                       └── 📃 WhateverGreen
        │   ├── 📁 LucyRTL8125Ethernet.kext
        │   │   └── 📁 Contents
        │   │       ├── 📃 Info.plist
        │   │       ├── 📁 MacOS
        │   │       │   └── 📃 LucyRTL8125Ethernet
        │   │       └── 📁 _CodeSignature
        │   │           └── 📃 CodeResources
        │   └── 📁 USBMap.kext
        │       └── 📁 Contents
        │           └── 📃 Info.plist
        ├── OpenCore.efi
        ├── 📁 Resources
        │   ├── 📁 Audio
        │   ├── 📁 Font
        │   ├── 📁 Image
        │   └── 📁 Label
        ├── 📁 Tools
        │   └── 📃 OpenShell.efi
        └── 📁 config.plist
    ```

  As we can see by using `kextstat -l | grep -v com.apple`, kext still running as usual. Below is an example:

  ![kexstat](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/68f1389b-7b8b-40b1-8017-f3b4225453cd)
