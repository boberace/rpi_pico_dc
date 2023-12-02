ARG VARIANT="ubuntu-20.04"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
        cmake \
        build-essential \
        wget \
        ca-certificates \
        gdb-multiarch \
        binutils-multiarch \
        automake \
        autoconf \
        libtool \
        libftdi-dev \
        libusb-1.0-0-dev \
        pkg-config \
        clang-format \
        minicom
WORKDIR /home/vscode/pico
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \ 
    tar xjf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 
RUN mv gcc-arm-none-eabi-10.3-2021.10 /home/vscode/pico/gcc-arm-none && \
    ln -s /home/vscode/pico/gcc-arm-none/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc && \
    rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 
ENV PATH=$PATH:/home/vscode/pico/gcc-arm-none/bin
RUN cd /home/vscode/pico && git clone -b master https://github.com/raspberrypi/pico-sdk.git --depth=1 && cd pico-sdk && git submodule update --init 
ENV PICO_SDK_PATH=/home/vscode/pico/pico-sdk
RUN cd /home/vscode/pico && git clone https://github.com/raspberrypi/openocd.git -b picoprobe --depth=1 && \
    cd openocd && ./bootstrap && ./configure --enable-ftdi --enable-sysfsgpio --enable-picoprobe && make -j 24 install 
RUN cd /home/vscode/pico && git clone https://github.com/raspberrypi/picotool.git --depth=1 && \
    cd picotool && mkdir build && cd build && cmake ../ && make -j 24 && cp picotool /usr/local/bin 
RUN cd /home/vscode/pico && git clone https://github.com/FreeRTOS/FreeRTOS-Kernel.git --depth=1 && git -C FreeRTOS-Kernel submodule update --init
ENV FREERTOS_KERNEL_PATH=/home/vscode/pico/FreeRTOS-Kernel
RUN cd /usr/bin && ln -s /usr/bin/objdump objdump-multiarch && ln -s /usr/bin/nm nm-multiarch 


