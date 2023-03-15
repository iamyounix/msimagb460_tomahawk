# EDID Fix

![GUIDE](https://img.shields.io/badge/Guide-EDIDFix-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [Introduction](#introduction)
  - [Step 1](#step-1)
  - [Step 2](#step-2)
  - [Step 3](#step-3)
  - [Step 4](#step-4)
- [Credits](#credits)

## Introduction

This guide will help us patch the correct EDID for iGPU and dGPU, especially when using the OpenCore configuration. Plist using the "AAPL00, override-no-connect` variable.

### Step 1

Boot into Linux. This patch requires Python to be installed.

### Step 2

Parse `xrandr` information using the command. Open Terminal, type, and hit Enter:

```zsh
xrandr --props
```

![XRANDREDID](XRANDR%20EDID.png)

We will see a bunch of information related to our monitor. Then...

### Step 3

Head to [edid-refreshrate-patcher](https://github.com/iamyounix/edid-refreshrate-patcher) and clone the project.

```zsh
git clone https://github.com/iamyounix/edid-refreshrate-patcher.git
```

### Step 4

Follow the project path, copy the patched edid, and paste it into config.plist.

```zsh
cd edid-refreshrate-patcher && python3 patcher.py 
```

- **Output:**

    ```zsh
    Patched your EDID!
    Please add it to DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0) like this:
    Create a new entry: AAPL00,override-no-connect (with type data)
    And set the value to:

    00FFFFFFFFFFFF0006AFEB3100000000101B0104A522137802CEB5A65434B6250E505400000001010101010101010101010101010101A6A600A0F0703E803020350058C110000018000000000000000000000000000000000018000000FE0041554F0A202020202020202020000000FE00423135365A414E30332E31200A00BD
    ```

Do note, `AAPL00,override-no-connect` can be use in dGPU and iGPU. Below is and example:

- **iGPU:**

    `PciRoot(0x0)/Pci(0x2,0x0)` - `data` - `00FFFFFFFFFFFF0006AFEB3100000000101B0104A522137802CEB5A65434B6250E505400000001010101010101010101010101010101A6A600A0F0703E803020350058C110000018000000000000000000000000000000000018000000FE0041554F0A202020202020202020000000FE00423135365A414E30332E31200A00BD`

- **dGPU:**

    `PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)` - `data` - `00FFFFFFFFFFFF0006AFEB3100000000101B0104A522137802CEB5A65434B6250E505400000001010101010101010101010101010101A6A600A0F0703E803020350058C110000018000000000000000000000000000000000018000000FE0041554F0A202020202020202020000000FE00423135365A414E30332E31200A00BD`

## Credits

[BlvckBytes](https://github.com/BlvckBytes/EDID-RefreshRate-Patcher)
