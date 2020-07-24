# AxpertPi

An easy to use script to install https://github.com/ned-kelly/docker-voltronic-homeassistant.

To install run the following command in bash on your pi:

## Prerequisites

- Raspberry Pi 2/3/4 ( only tested on 3 and 4 )
- Docker-compose
- [Voltronic/Axpert/MPPSolar] based inverter that you want to monitor

## Configuration & Standing Up

1. Download Raspberry Pi Imager from https://www.raspberrypi.org/downloads/
2. Flash either Raspberry Pi OS or Raspberry Pi OS Lite onto an sd card.
3. Copy the following files to the boot partition of your sd card: ssh, wpa_supplicant.conf
4. Change wpa_supplicant.conf and replace the following credentials with your wifi name, password and country code :
```
country=ZA
ssid=“mywifi"
psk="mypassword"
```

5. SSH into your pi and run the following command:
```
curl -s https://raw.githubusercontent.com/BionicWeb/AxpertPi/master/axpertpi.sh?$(date +%s) | sudo bash
```

6. If you have a different inverter than the Axpert King 5KW, set the configuration files in the `config/` directory:

```bash
cd /opt/ha-inverter-mqtt-agent

# Configure the 'device=' directive (in inverter.conf) to suit for RS232 or USB.. 
sudo nano config/inverter.conf
```

7. Then, plug in your Serial or USB cable to the Inverter & stand up the container:
8. Open your browser and navigate to your pi's ip example: http://192.168.1.50:8123
9. Login with username pi and password raspberry.
