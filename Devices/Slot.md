# Devices

## dmidecode

- Display Bus and Slots

    `sudo dmidecode -t slot | grep -E 'Slot|Address'`

    **Output:**

    ```zsh
    System Slot Information
            Bus Address: 0000:00:01.0
    System Slot Information
            Bus Address: 0000:00:1c.3
    System Slot Information
            Bus Address: 0000:00:1c.4
    System Slot Information
            Bus Address: 0000:00:1c.5
    System Slot Information
            Bus Address: 0000:00:1c.6
    System Slot Information
            Bus Address: 0000:00:1c.7
    System Slot Information
            Bus Address: 0000:00:1e.0
    ```

- Print Bus address and slot-id

    `sudo dmidecode -t 9 |awk '/ID:/ {id=$2} /Bus Address/ {print "Slot",id+1,"PCIe",$3}'`

    ```zsh
    Slot 1 PCIe 0000:00:01.0
    Slot 2 PCIe 0000:00:1c.3
    Slot 3 PCIe 0000:00:1c.4
    Slot 4 PCIe 0000:00:1c.5
    Slot 5 PCIe 0000:00:1c.6
    Slot 6 PCIe 0000:00:1c.7
    Slot 7 PCIe 0000:00:1e.0
    ```
