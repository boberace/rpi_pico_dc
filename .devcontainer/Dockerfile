ARG VARIANT="ubuntu-22.04"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
        git \
        cmake \
        gcc-arm-none-eabi \
        libstdc++-arm-none-eabi-newlib \
        gcc \
        g++ \
        gdb-multiarch \
        automake \
        autoconf \
        build-essential \
        texinfo \
        libtool \
        libftdi-dev \
        libusb-1.0-0-dev \
        minicom

#pico_setup.sh    
#GIT_DEPS="git"
#SDK_DEPS="cmake gcc-arm-none-eabi gcc g++"
#OPENOCD_DEPS="gdb-multiarch automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev"
#VSCODE_DEPS="code" // not used in WSL, Install if using on Linux
#UART_DEPS="minicom"

ARG WD_PATH=/usr/local/pico
WORKDIR $WD_PATH

# sdk
RUN cd $WD_PATH && \
    git clone -b master https://github.com/raspberrypi/pico-sdk.git && \
    cd pico-sdk && \
    git submodule update --init

ENV PICO_SDK_PATH=$WD_PATH/pico-sdk

# picotool
RUN cd $WD_PATH && \
    git clone -b master https://github.com/raspberrypi/picotool.git && \
    cd picotool && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make -j$(nproc) && \
    cp picotool /usr/local/bin 

# openocd
RUN cd $WD_PATH && \
    git clone https://github.com/raspberrypi/openocd.git --depth=1 --no-single-branch && \
    cd openocd && \
    ./bootstrap && \
    ./configure --enable-picoprobe && \
    make -j$(nproc) && \
    make install   

# FreeRTOS
RUN cd $WD_PATH && \
    # git clone https://github.com/FreeRTOS/FreeRTOS-Kernel.git && \
    git clone https://github.com/raspberrypi/FreeRTOS-Kernel.git && \
    cd FreeRTOS-Kernel && \
    git submodule update --init

ENV FREERTOS_KERNEL_PATH=$WD_PATH/FreeRTOS-Kernel