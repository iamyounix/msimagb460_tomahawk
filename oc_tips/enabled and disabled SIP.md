# Enabling and Disabling SIP

Table of contents

- [When to disabled SIP?](#when-to-disabled-sip)
- [NVRAM](#nvram)
- [Inject specific data](#inject-specific-data)
- [Check SIP](#check-sip)

## When to disabled SIP?

When we need to test and debug the driver of your software on a Mac. And if we debug our software from Xcode, we may need to disable SIP to install system extensions. Some Mac users also need to disable SIP temporarily to install incompatible apps on Mac. In certain case, disabled SIP is needed when use certain apps such as recovery.

## NVRAM

Each NVRAM variable consists of its name, value, attributes (refer to UEFI specification), and its GUID, representing which ‘section’ the NVRAM variable belongs to. The macOS operating system makes use of several GUIDs, including but not limited to:

- `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14` - `APPLE_VENDOR_VARIABLE_GUID`
- `7C436110-AB2A-4BBB-A880-FE41995C9F82` - `APPLE_BOOT_VARIABLE_GUID`
- `5EDDA193-A070-416A-85EB-2A1181F45B18` - `Apple Hardware Configuration Storage for MacPro7,1`
- `8BE4DF61-93CA-11D2-AA0D-00E098032B8C` - `EFI_GLOBAL_VARIABLE_GUID`
- `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` - `OC_VENDOR_VARIABLE_GUID`

The nvram command can be used to read NVRAM variable values from macOS by concatenating the GUID and name variables separated by a : symbol. For example, nvram:

- `7C436110-AB2A-4BBB-A880-FE41995C9F82`
  - boot-args
    - data
    - `XXXXXXXX`

## Inject specific data

Flag

- Enable
  - `00000000` - SIP completely enabled (0x0).

- Disable
  - `FF030000` - for High Sierra)
  - `EF070000` - for Mojave/Catalina)
  - `67080000` - for Big Sur and newer)
  - `EF0F0000` - for Big Sur and newer. and disables even more security features
  
Enable SIP

- Add / `7C436110-AB2A-4BBB-A880-FE41995C9F82` / `csr-active-config` / `data` / `00000000` 

Disable SIP

- Add / `7C436110-AB2A-4BBB-A880-FE41995C9F82` / `csr-active-config` / `data` / `EF0F0000`
  > Note: SIP is disable can be refered also as unknown.

![csr-enable](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/080debab-f734-431c-ac20-23e4239ac2ac)  
  
## Check SIP

- Use `csrutil status` on terminal

  ```zsh
  Configuration:
  Apple Internal: disabled
  Kext Signing: disabled
  Filesystem Protections: disabled
  Debugging Restrictions: disabled
  DTrace Restrictions: disabled
  NVRAM Protections: disabled
  BaseSystem Verification: disabled
  ```
- Use apps to determine SIP is enable or disable
  - Head to [MenuBarSIPDetector](https://github.com/ITzTravelInTime/MenuBarSIPDetector).

![Screenshot 2023-07-01 at 7 10 00 AM](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/e8c488da-6597-4e52-8a64-2d1647001714)
![Screenshot 2023-07-01 at 7 14 43 AM](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/f17f8ccf-cadd-4538-9fa6-4fdccf5741fd)
![Screenshot 2023-07-01 at 7 15 42 AM](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/071f9868-507e-4c7f-b3b1-8310479f5090)


