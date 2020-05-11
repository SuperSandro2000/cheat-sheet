# Extract Samsung firmware

- [Extract Samsung firmware](#extract-samsung-firmware)
  - [Required packages](#required-packages)
    - [Windows fix](#windows-fix)

## Required packages

```shell
sudo apt install unzip tar liblz4-tool android-tools-fsutils
```

### Windows fix

If you get this error:

```shell
bash: ./extract.sh: /bin/bash^M: bad interpreter: No such file or directory
```

Then you have LFCR line endings from windows. To fix that run:

```shell
sed -i -e 's/\r$//' extract.sh
```
