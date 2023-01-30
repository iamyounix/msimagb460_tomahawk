# Transferring OpenCore to Clover

![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [Introduction](#introduction)
  - [Boot](#boot)
  - [Bootloader Drivers](#bootloader-drivers)
  - [UEFI Drivers](#uefi-drivers)
  - [Kexts](#kexts)
  - [Tools](#tools)
  - [SSDT's](#ssdts)
  - [config.plist Settings (SMBIOS, Quirks and Others)](#configplist-settings-smbios-quirks-and-others)
  - [Credits](#credits)

# Introduction

It's not as tough as you may imagine to transfer things (plist data) from OpenCore to Clover. Let's keep in mind a few essential aspects, though. These include:

1. Boot (BOOTx64.efi)
2. Boot-loader Drivers (.efi)
3. UEFI Drivers (.efi)
4. Kexts
5. Tools (optional)
6. SSDT's
7. config.plist Settings (SMBIOS, Quirks and Others)

## Boot

The `BOOTx64.efi` is the default bootloader when nothing else works (BootNext, BootOrder). In theory it should never be used. On a box delivered with **Windows**, it will invoke \ `EFI` \ `Microsoft` \ `Boot` \ `bootmgfw.efi ` . You can put here whatever you like if you need to - but keep a copy of the original. **rEFInd** placed its driver in  \ `EFI` \ `refind` \ `refindx64.efi`. OpenCore and Clover is similar. Both placed its driver in \ `EFI` \ `BOOT` \ `BOOTx64.efi`. It is easy to change by swapping this file respectively.

## Bootloader Drivers

Here is the difference: As its drivers, OpenCore uses `OpenCore.efi`. While `CLOVERX64.efi` serves as Clover's driver file. Below is the difference:

1. OpenCore : `EFI`\ `OC` \ `OpenCore.efi`

2. Clover : `EFI`\ `Clover` \ `CLOVERX64.efi`

##  UEFI Drivers

This is my working Hackintosh example for my iHack MSI B460M Tomahawk with Intel® Comet Lake 10400:

- OpenCore : `EFI`\ `OC` \ `Drivers` \ `XXXXX.efi`
  - HFSPlus.efi
  - OpenCanopy.efi
  - OpenRuntime.efi
  - ResetNvramEntry.efi

- Clover : `EFI`\ `CLOVER` \ `drivers` \ `UEFI` \ `XXXXX.efi`
  - ApfsDriverLoader.efi
  - EnglishDxe.efi
  - HFSPlus.efi
  - OcQuirks.efi
  - OpenRuntime.efi
  - File Path:

## Kexts

In this case, both bootloaders shared the same kexts. However, all kexts need to be placed differently in their respective folders.

- OpenCore : `EFI`\ `OC` \ `Kext` \ `XXXXX.kext` (General)

- Clover : `EFI`\ `CLOVER` \ `kexts` \ `Other` \ `XXXXX.kext`  or `EFI`\ `CLOVER` \ `kexts` \ `nn` \ `XXXXX.kext` 

  > **Note** : `nn` is respective folder based on macOS version. ie: `12` for Monterey and `13` for Ventura.

## Tools

Please refer to the developer guide and tools for the bootloaders you use, as they may have a different approach. Below is an example based on this build:

1. OpenCore : `EFI`\ `OC` \ `Tools` \ `XXXXX.efi`
2. Clover : `EFI`\ `CLOVER` \ `tools` \ `XXXXX.efi` 
   - bsdmesg.efi
   - ControlMsrE2.efi
   - Shell32.efi
   - Shell64.efi
   - Shell64U.efi

## SSDT's

Same as OpenCore, nothing change. Use the same `.aml` file as provided except path.

1. OpenCore : `EFI`\ `OC` \ `ACPI` \ `XXXXX.aml`
2. Clover : `EFI`\ `CLOVER` \ `ACPI` \ `patched` \ `XXXXX.aml`

## config.plist Settings (SMBIOS, Quirks and Others)

The distinction between the two configurations is shown below. Normally, OpenCore and Clover Quirks is the same. Check all the Quirks needed and compare. 

1. OpenCore : [opencore_config.plist][OC.plist]
2. Clover : [clover_config.plist][Clover.plist]

### Transferring SMBIOS

Use OCAuxiliary to transfer respective SMBIOS to another bootloader `config.plist`.

1. Head to `PI` (Platform Info).
2. Export SMBIOS to a Clover configuration file.

![Step 1 & 2][Step 1 and 2]

3. Select Clover Config file (*.plist) option.
4. Choose Clover config.plist respectively.
5. Open the file. This method will transfer your current OpenCore SMBIOS to Clover config. 

![Step 3,4 and 5][Step 3,4 and 5]

## Credits

[acidanthera][Acidanthera] | [dortania][Dortania] | [ic005k][ic005k - ocauxiliary] | [5T33Z0][5T33Z0 Guide]

[5T33Z0 Guide]: https://github.com/5T33Z0
[Acidanthera]: https://github.com/acidanthera
[Clover.plist]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/transferring%20opencore%20to%20clover/clover_config.plist
[Dortania]: https://github.com/dortania
[ic005k - ocauxiliary]: https://github.com/ic005k
[OC.plist]: https://github.com/theofficialcopypaste/ihackmsimagb460tomahawk/blob/main/guide%20and%20samples/transferring%20opencore%20to%20clover/opencore_config.plist
[Step 1 and 2]: https://user-images.githubusercontent.com/72515939/215377592-637c6b67-9d85-43e7-b155-9140dbc833cf.png
[Step 3,4 and 5]: https://user-images.githubusercontent.com/72515939/215377609-d0e8f2e1-618c-4d83-afd6-3a0bc9638479.png