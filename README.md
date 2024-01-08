# vscode-devcontainer-raspberrypi-pico 

## Usage

Clone repository and include submodules: <br />
git clone --recurse-submodules https://github.com/boberace/rpi_pico_dc.git<br />

.bash_aliases file is in the .devcontainer folder
It is automatically loaded by ~/.bashrc in the container

create a .bash_personal file in the .devcontainer folder for personal info such as passwords
It is automatically loaded by .bash_aliases in the .devcontainer folder and ignored by git


Copy the file https://github.com/raspberrypi/openocd/blob/rp2040/contrib/60-openocd.rules to /etc/udev/rules.d on your host computer and restart udev (systemctl restart udev)

Open the folder, and allow the container to build.

## To know
* SDK and others are installed in /home/vscode/pico
* All USB devices are exported to container - so the picoprobe can be found and used.
* USB Device /dev/ttyACM0 is exported to container for monitoring


## This container includes
* pico-sdk
* openocd - compiled for picoprobe
* picotool
* FreeRTOS

