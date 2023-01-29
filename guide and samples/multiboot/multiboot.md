# Multiboot

![GUIDE](https://img.shields.io/badge/Guide-ACPI-purple)
![OperatingSystem](https://img.shields.io/badge/OS-Hackintosh-blue)
![Check](https://img.shields.io/badge/Status-Pass-brightgreen)

Table of contents

- [Multiboot with OpenCore](#multiboot-with-opencore)
- [Labeling Disk](#labeling-disk)
- [Credits](#credits)

## Multiboot with OpenCore

Multi-boot or Multi-booting is the act of installing multiple operating systems on a computer, and being able to choose which one to boot when starting the computer. The term dual-booting refers to the common configuration of specifically two operating systems. Multi-booting may require a custom boot loader.

> **Reminder :** This guide is not applicable for **Bootcamp**.

- Separate disk is encourage. In order to install an operating system using multi-boot configurations, one thing must be kept in mind:

  - What is current OS you have?
  - Which OS first to install?

    - The first operating system need to install:

        | Which 1st | Working?    |
        |-----------|-------------|
        | Linux     | ~~Yes~~, No |
        | macOS     | ~~Yes~~, No |
        | Windows   | Yes, ~~No~~ |

- Why Windows first? Windows will share the EFI with other operating systems and cause an error if one of systems breaks. Sometimes, windows overwriting other operating partition / system structure since GPT disk format require EFI partition.
- Another issue we need to take care is:

  - Prevent ACPI injection on other OS

    - The `If _OSI ("Darwin")` is an implementation method to call Darwin kernel used by macOS. Please make sure compiled SSDT's is using this argument on all patched device. There are several reasons:

      - To provide compatibility with many OS

      - To provide the variable `on` / `enable` and `off` / `disable`switch for devices.

      - To prevent `BSOD` issues when booting into Windows.

        ![OSIDarwin](https://user-images.githubusercontent.com/72515939/202378529-b787b94e-2744-4a81-9bba-3b1ac78d93fa.png)
  - Quirks
    - Combining SSDT with `If _OSI ("Darwin")` implementation with OpenCore quirks is the best approach in multiboot. Below is required quirks needed:

      - `Kernel` - `Quirks` - `CustomSMBIOSGuid` = `Yes`

      - `PlatformInfo` - `UpdateSMBIOSMode` = `Custom`

  - Unmount un-support storage format

    - Always mounting un-supported storage format may cause:

      - Storage lifespan short

      - Disk R/W error

    - By using `vifs`, this tool help Apple Mac from automatically mounting the `NTFS` file format. Every time a new filesystem is added to a system, it is handled in accordance with a set of rules . This tools even enables the user to prevent load order mistakes that could waste time and effort.
      - Solution
        - Open "Disk Utility" - "Info".

        - Find File System `UUID`

        - Select `UUID` and hit `CMD` + `C` to copy the value

        - Open terminal, type `sudo vifs` and hit Enter

        - Press `o` to edit `/etc/fstab`.

        - Add `UUID="Volume UUID" none ntfs rw,noauto`. Below is an example:

                    ```zsh
                    #
                    # Warning - this file should only be modified with vifs(8)
                    #
                    # Failure to do so is unsupported and may be destructive.
                    #
                    UUID=5EB38DF0-4018-4876-8983-B48D089C91C7 none ntfs rw,noauto 
                    ~
                    ~
                    ```

        - Hit `Esc` to stop editing and press `Shift` + `ZZ` (twice) to exit `vifs`.

        - Type `sudo automount -vc` to `reset` auto mounter

        - Restart.

## Labeling Disk

Disk Label, a special area of every disk is set aside for storing information about the disk's controller, geometry, and slices. That information is called the disk's label. Another term that is used to described the disk label is the `VTOC` (Volume Table of Contents). To label a disk means to write slice information onto the disk. We usually label a disk after change its slices. If we fail to label a disk after you create slices, the slices will be unavailable because the operating system has no way of “knowing” about the slices.

**Reminder :** This method only applicable on for disk with `EFI` system partition.

- Download the latest [OpenCore Package](https://github.com/acidanthera/OpenCorePkg/releases) and unzip it.

- Find `Utilities`/`disklabel` (unix executable file) inside OpenCore folder.

- Run Terminal.

- Drag the executable unix file disklabel (not the .exe) into the Terminal and hit Enter. Below is sample command to disk labeling: `-e "Arch" .disk_label .disk_label_2x`
  
- Hit `Enter`. Find disk label file will be in the `home` folder, it is hidden.

- Go to your `Home` folder.

- Press `cmd` + `shift` + `>` to display hidden files. The process before should dumped copy of `.disk_label` and `.disk_label_x2`.

- Move the `.disk_label` and `.disk_label_x2` label files into

  - Windows: `Microsoft`/`Boot`

  - Linux: `EFI`/`boot`

- Press `cmd` + `shift` + `>` again to mask the hidden files. Now, adjust `Misc` / `PickerAttributes` value to `147`.

## Credits

[**acidanthera**](https://github.com/acidanthera) | [**dortania**](https://dortania.github.io/OpenCore-Install-Guide/)
