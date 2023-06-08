# Enable GPU Tab in Activity Monitor

If the Device Properties of iGPU and dGPU are configured correctly, you will find the Tab "GPU" in the Activity Monitor App which lists the graphics devices and the tasks/processes assigned to each of them. Use this properties to enable gpu's tab. Requirement:

- Change iGPU  `AAPL,slot-name` to `Slot- 0`. Most iGPU attached to this slot.
- Add `AAPL,ig-platform-id` data `0300C59B` / `0300C89B` (headless Comet Lake platform)
- Add `device-id` data `9B3E0000`  (Kaby Lake device id is required to properly rename GPU as UHD 630 on Comet Lake platform)
- Add `enable-metal` data `01000000` (enable metal)
- Add `force-online` data `01000000` (always enable for offline or sometimes online rendering)

  ![GPUtab](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3f7d7626-4b39-440b-a053-33737df848f9)
  ![quicksync](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/36807524-6733-42b1-8e23-3d9aa1c6ff64)
