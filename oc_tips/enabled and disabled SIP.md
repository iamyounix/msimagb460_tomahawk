# Enabling and Disabling SIP

SIP is disable by default by using debug mode (`csr-active-config` / `data` / `67000000`) - can be refered as `unknown`.

![sipdisabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/4621e112-7a6e-4f20-968c-41d67da1babb)

SIP is enable by default by using release version (`csr-active-config` / `data` / `00000000`).

![sipenabled](https://github.com/iamyounix/msimagb460_tomahawk/assets/72515939/3a4f13de-c965-483b-baca-730ef1c56c68)

> **Note:**  Please set `ToggleSIP` to `enable` after switch from `debug` to `release`
