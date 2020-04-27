# bartendro-config

Deployment script for bartendro. One script should install everything needed.
IMPORTANT: It is important to reboot right after the raspi-config command!

Download and write the 2020-02-13 Raspian Buster-lite distro to an SD Card: 

 https://downloads.raspberrypi.org/raspbian_lite_latest

Boot the RPi, write a file called ssh to the boot folder of the sd card, to access via SSH and then log in as user 'pi' with password 'raspberry'. Then:

Run raspi-config:
* Advanced: Expand the filesystem
* Boot Options: B1:Boot into console, require password
* Interfacing: P6 Disable console on serial port, allow serial port
* Interfacing: P5 Enable I2C
* Localisation: Change timezone

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
The script includes a dummy wpa_supplicant.conf file, you need to go to /etc/wpa_supplicant/
and do:
sudo nano wpa_supplicant.conf
to edit it, then modify the appropriate lines for your SSID, your Password and your country.
Then save the file and reboot, your Bartendro should be live on the Wifi and ethernet interfaces.

Finally, to delete pi user and just leave bartendro:

    sudo deluser --force --remove-home --remove-all-files pi

From now you can no longer log in with the standard pi user. 

In theory that should be it. Your bartendro should work. You should however login and change the password with passwd.
