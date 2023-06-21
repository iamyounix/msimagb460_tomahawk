# SBUS Check

Most 8th Gen and above actually do not require SSDT-SBUS.

- Try to load EFI without this patch and reboot. Refer [here](https://github.com/iamyounix/msimagb460_tomahawk/blob/main/ACPI_Sample/SSDT-YNXB460.dsl) as an example.
- After login, copy and paste this command, `kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"`. The result will shown as below:

  ![sbus](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/801d1c7b-5102-407c-8373-7d930803750e)

- Check AppleSMBusController and AppleSMBUSPCI kexts using **System Reports** / **Software** / **Extensions**. If both loads, SBUS is working native without any patches. Below is an example:

  ![sbus_check](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/a606a15f-4aef-48cc-bd0a-b205ba2fc8b0)

- Additionally, use this patch to allow both kexts AppleSMBusController and AppleSMBUSPCI showing up via IOreg.

    ```asl
    Scope (SBUS)    // Serial BUS
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Device (BLC0) // Dummy Host
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_CID, "smbus-blc")  // _CID: Compatible ID //Dummy compatible
            }
        }
    }
    ```
