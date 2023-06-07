# Useful PowerShell Command

This command help us to specify need information in order to build our own hackintosh and set `AAPL,slot-name` properly. Please check `SlotDesignation` as references.

- Open Windows Powershell, copy and paste `Get-WmiObject -class "Win32_SystemSlot"`. As an example, PCI x16 Slot.

    ```pws
    SlotDesignation : Slot1 / X16PCIEXP // Refer to x16 slot capability
    Tag             : System Slot 0 // Root Slot connected to SlotDesignation. 
    SupportsHotPlug : False
    Status          : OK
    Shared          : False
    PMESignal       : True
    MaxDataWidth    : 10
    ```

- Slot1 X16PCIEXP is refered to x16 PCI slot capabilities. The exact match for `AAPL,slot-name` is `Slot- 1`. Remember, most iGPU built-in with processor is considered as `Slot- 0`.
- Another way is using `Get-WmiObject -class "Win32_PnPEntity"`. Copy all dumped info from Powershell and paste to any text editor as references.
