#!/bin/bash
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y git python3-pip
sudo apt-get install -y libsm6 libxext6 && pip3 install -U opencv-python numpy 

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update && sudo apt-get install ros-kinetic-ros-base

sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools python-wstool
sudo apt-get install ros-kinetic-cv-bridge ros-kinetic-image-transport