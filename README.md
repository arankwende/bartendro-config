# bartendro-config

Deployment script for bartendro. One script should install everything needed.
IMPORTANT: It is important to reboot right after the raspi-config command!

Download and write the 2020-02-13 Raspian Buster-lite distro to an SD Card: 

 https://downloads.raspberrypi.org/raspbian_lite_latest

Boot the RPi, write a file called ssh to the boot folder of the sd card, to access via SSH and then log in as user 'pi' with password 'raspberry'. Then:

Run raspi-config:
* Advanced: Expand the filesystem
* Startup: Boot into console, require password
* Interfacing: Disable console on serial port, allow serial port
* Interfacing: Enable I2C
* Localisation: select timezone

Finish raspi-config by allowing it to reboot. 

Once the RPi comes back up, log in again and follow these steps:

```
sudo apt update
sudo apt install git
git clone https://github.com/arankwende/bartendro-config.git
cd bartendro-config
sudo sh install.sh
```

Once done rebooting, log into the RPi with user 'bartendro' and password 'hackme!'. 
Finally:

    sudo deluser --force --remove-home --remove-all-files pi

From now you can no longer log in with the standard pi user. 

In theory that should be it. Your SD card should be ready to rock.
