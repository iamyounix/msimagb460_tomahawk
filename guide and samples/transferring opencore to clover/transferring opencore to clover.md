# Transferring OpenCore to Clover

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

- OpenCore 
  - `EFI`\ `OC` \ `OpenCore.efi`
  
- Clover 
  - `EFI`\ `Clover` \ `CLOVERX64.efi`
	

## 	UEFI Drivers

This is my working Hackintosh example for my iHack MSI B460M Tomahawk with Intel® Comet Lake 10400:

- OpenCore 
  - HFSPlus.efi
  - OpenCanopy.efi
  - OpenRuntime.efi
  - ResetNvramEntry.efi
  
> **Folder**: `EFI`\ `OC` \ `Drivers` \ `XXXXX.efi`
  
- Clover 
  - ApfsDriverLoader.efi
  - EnglishDxe.efi
  - HFSPlus.efi
  - OcQuirks.efi
  - OpenRuntime.efi
  
> **Folder**: `EFI`\ `CLOVER` \ `drivers` \ `UEFI` \ `XXXXX.efi`

## Kexts

In this case, both bootloaders shared the same kexts. However, all kexts need to be placed differently in their respective folders.

- OpenCore 
  - `EFI`\ `OC` \ `Kext` \ `XXXXX.kext` (General)
  
- Clover 
  - `EFI`\ `CLOVER` \ `kexts` \ `Other` \ `XXXXX.kext` (General)
  - `EFI`\ `CLOVER` \ `kexts` \ `nn` \ `XXXXX.kext` (Specific & Optional)
  	- Folder number ie: `nn` is respective folder based on macOS version. ie: `12` for Monterey and `13` for Ventura.
	
## Tools

Please refer to the developer guide and tools for the bootloaders you use, as they may have a different approach. Below is an example based on this build:

- OpenCore 
  - NIL
  
> **Folder**: `EFI`\ `OC` \ `Tools` \ `XXXXX.efi`
  
- Clover 
  - bsdmesg.efi
  - ControlMsrE2.efi
  - Shell32.efi
  - Shell64.efi
  - Shell64U.efi
  
> **Folder**: `EFI`\ `CLOVER` \ `tools` \ `XXXXX.efi` 

## SSDT's

Same as OpenCore, nothing change. Use the same `.aml` file as provided except path.

- OpenCore
  - `EFI`\ `OC` \ `ACPI` \ `XXXXX.aml`
  
- Clover
  - `EFI`\ `CLOVER` \ `ACPI` \ `patched` \ `XXXXX.aml`
  
## config.plist Settings (SMBIOS, Quirks and Others)

The distinction between the two configurations is shown below. Normally, OpenCore and Clover Quirks is the same.. Check all the Quirks needed and compare. 

- OpenCore
  - 
  
- Clover
  - 
  
### Transferring SMBIOS



