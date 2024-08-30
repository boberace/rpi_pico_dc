
# Personal Alias definitions. You must create in same directory
# ignored by git, so you can store personal data and aliases
# like your wifi credentials WIFI_SSID WIFI_PASSWORD
if [ -f .devcontainer/.bash_personal ]; then
    . .devcontainer/.bash_personal
fi



export PICO_UROS_PATH=/workspaces/rpi_pico_dc/micro_ros_raspberrypi_pico_sdk
export PICO_EXAMPLES_PATH=/workspaces/rpi_pico_dc/pico-examples
export LIB_LORAMAC_NODE_PATH=/workspaces/rpi_pico_dc/loramac-node
export LIB_WEB_SOCKETS=/workspaces/rpi_pico_dc/libwebsockets

alias sba="source ~/.bash_aliases"

alias cmawdb="cmake .. -DCMAKE_BUILD_TYPE=Debug -DBTSTACK_EXAMPLES_ALL=1 -DPICO_BOARD=pico_w .."
alias cmaw="cmake .. -DBTSTACK_EXAMPLES_ALL=1 -DPICO_BOARD=pico_w .."
alias cmadb="cmake .. -DCMAKE_BUILD_TYPE=Debug -DPICO_BOARD=pico .."
alias cma="cmake .. -DPICO_BOARD=pico .."

alias cmadb2="cmake .. -DCMAKE_BUILD_TYPE=Debug -DPICO_BOARD=pico2 .."
alias cma2="cmake .. -DPICO_BOARD=pico2 .."

alias mk="make -j20"

ppc() { sudo openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -s tcl ;}
alias gdbm="gdb-multiarch"
# target remote localhost:3333
ppp() { sudo openocd -f interface/cmsis-dap.cfg -c "adapter speed 5000" -f target/rp2040.cfg -c "program \"$@\" verify reset exit" ;}
# ppr() { sudo openocd -f interface/cmsis-dap.cfg -c "adapter speed 5000" -f target/rp2040.cfg -c "init; reset; exit" ;}

ppr() { sudo openocd -f interface/cmsis-dap.cfg -c "adapter speed 5000" -f target/rp2040.cfg -c "init ; reset halt ; rp2040.core0 arp_reset assert 0 ; rp2040.core1 arp_reset assert 0 ; exit" ;}

ptp() { sudo picotool load -F -x $@;}

alias mca0="sudo minicom -D /dev/ttyACM0"
alias mca1="sudo minicom -D /dev/ttyACM1"