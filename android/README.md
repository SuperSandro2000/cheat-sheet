# Required to run
sudo apt-get install unzip tar liblz4-tool android-tools-fsutils

# Windows fix
If you get this:
bash: ./extract.sh: /bin/bash^M: bad interpreter: No such file or directory
Then you have LFCR line endings from windows. To fix that run:
````
sed -i -e 's/\r$//' scriptname.sh
````