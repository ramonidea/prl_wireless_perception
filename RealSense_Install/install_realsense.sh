#!/bin/bash

#Use in Ubuntu 16 LTS
cd ~
mkdir Realsense && cd Realsense
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
echo "=============!Warning!============="
echo "-----------------------------------"
echo "Please unplug all realsense camera!!!"
echo "-----------------------------------"
sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
sudo apt-get install libglfw3-dev
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/ 
sudo udevadm control --reload-rules && udevadm trigger 
sh ./scripts/patch-realsense-ubuntu-lts.sh
cd ~/Realsense/librealsense/
mkdir build && cd build
cmake ../ -DBUILD_EXAMPLES=true
cmake ../ -DBUILD_PYTHON_BINDINGS=bool:true
sudo make uninstall && make clean && make -j4 && sudo make install


