# vscode-devcontainer-raspberrypi-pico 

## Usage

Clone repository and include submodules: <br />
git clone --recurse-submodules https://github.com/boberace/rpi_pico_dc.git<br />

Add .bash_aliases file in .devcontainer folder and include next two lines: <br />
export PICO_UROS_PATH=/workspaces/rpi_pico_dc/micro_ros_raspberrypi_pico_sdk <br />
export PICO_EXAMPLES_PATH=/workspaces/rpi_pico_dc/pico-examples<br />

This is also usefull to add your own aliases and functions like: <br />
alias sba="source ~/.bash_aliases" <br />
alias mk="make -j20" <br />
alias cma="cmake .. -DPICO_BOARD=pico .." <br />
alias cmawdb="cmake .. -DCMAKE_BUILD_TYPE=Debug -DBTSTACK_EXAMPLES_ALL=1 -DPICO_BOARD=pico_w -DWIFI_SSID='''name''' -DWIFI_PASSWORD='''password''' -DTEST_TCP_SERVER_IP='''192.168.0.1'''.." <br />

The .bash_aliases file is ignored by git because of private network variables<br />
It is automatically loaded by ~/.bashrc in the container


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

