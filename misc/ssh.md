# SSH

## Table of Contents

* [2FA](#2fa)

## 2FA

Source: <https://www.linux.com/blog/securing-ssh-two-factor-authentication-using-google-authenticator>

Build google-authenticator from source

```shell
aptitude install libpam0g-dev
wget https://github.com/google/google-authenticator-libpam/archive/1.05.zip
cd google-authenticator-libpam-1.05
unzip 1.05.zip
./bootstrap.sh
./configure
make
sudo make install
```

Build libqrencode from source

```shell
wget https://github.com/fukuchi/libqrencode/archive/v4.0.0.zip
unzip v4.0.0.zip
cd libqrencode-4.0.0
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
```

Configure ssh-server

```shell
sudo google-authenticator
```

Use the QR code to add it to your favorite authenticator app and backup your emergency scratch codes. Disallow multiple uses of the same token, don't increase the valid time frame of tokens and enable rate limiting.

Edit `sudo nano /etc/pam.d/sshd` and add

```shell
auth       required     pam_google_authenticator.so
```

Edit `sudo nano /etc/ssh/sshd_config` and change `ChallengeResponseAuthentication no` to `yes`.
Now restart `sudo systemctl restart ssh` and done.
