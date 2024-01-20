#!/bin/bash

sudo openocd -c "gdb_port 50000" -c "tcl_port 50001" -c "telnet_port 50002" -c "adapter speed 5000" -s /home/vscode/pico/openocd/tcl -f /home/vscode/.vscode-server-insiders/extensions/marus25.cortex-debug-1.12.1/support/openocd-helpers.tcl -f interface/cmsis-dap.cfg -f target/rp2040.cfg