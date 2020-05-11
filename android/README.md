# Android

## Table of Contents

- [Extract Samung Firmware](extract_samsung_firmware/README.md)
- [Porting](#porting)- [Android](#android)
  - [Table of Contents](#table-of-contents)
  - [Porting](#porting)

## Porting

List dependencies of a shared object file (.so)

```shell
sudo apt install binutils
echo 'readelf -d $1 | grep "\(NEEDED\)" | sed -r "s/.*\[(.*)\]/\1/"' | sudo tee -a /usr/local/bin/ldd-arm
sudo chmod +x /usr/local/bin/ldd-arm
```
