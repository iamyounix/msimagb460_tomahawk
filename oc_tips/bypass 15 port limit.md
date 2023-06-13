# Bypass 15 USB Port Limit

So the process of USB mapping is defining your ports to macOS and telling it what kind they are, the reasons we want to do this are:

- macOS is very bad at guessing what kind of ports you have
- Some ports may run below their rated speed (3.1 ports running at 2.0)
- Some ports may outright not work
- Bluetooth not working
- Certain services like Handoff may not work correctly
- Sleep may break
- Broken Hot-Plug
- Even data corruption from XhciPortLimit

We can choose either USB Port Mapping using standard USBMap.kext/USBPorts.kext or bypass macOS restriction usb port limit.

Step:

  1. Enable XHCPIPortLimit to `YES` via config.plist.
  ![xhciportlimit](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3fb7b8bf-09fd-4def-987d-b292e31415c1)

  2. Modified USBMap.kext by enabling all port. Most B400+ motherboard require XHCI-Unsupported properties.
  ![Step 2](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/950ed557-2b15-4d19-958c-fdfd7a9d3ba7)

  3. Apply Patch. In this case, i am using Monterey. For macOS Sonoma, patches is not quaranteed. Refer: https://github.com/acidanthera/bugtracker/issues/2297#issuecomment-1586504398
  ![Step 3](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3dcf25bc-a45d-4704-9094-d9e953f3f678)

Results:

  ![Hackintool](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/188e8063-b267-4263-9617-49e165216e0f)

  ![IOreg](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/94591441-9d9b-439a-8041-131f7a56d3bd)
