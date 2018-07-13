# Jetson Tx2 Install

## Flash OS and Other packages (CuDnn, CUDA..)
-  Install the Jetpack first. Here is the [link](https://developer.nvidia.com/embedded/jetpack)

- [Youtube Tutorial on Installation of Tx2](https://www.youtube.com/watch?v=D7lkth34rgM)

## Install OpenCV
[Tutorial Link](https://jkjung-avt.github.io/opencv3-on-tx2/)

> Potential Issue on Python3. `ImportError: /opt/ros/kinetic/lib/python2.7/dist-packages/cv2.so: undefined symbol: PyCObject_Type`. You may remove the dir from Sys.path temporarily. `sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')` 

## Install ROS 

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update && sudo apt-get install ros-kinetic-ros-base

sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools python-wstool
sudo apt-get install ros-kinetic-cv-bridge ros-kinetic-image-transport
```

## Install LibRealSense
[Git Repo Link](https://github.com/jetsonhacks/installLibrealsenseTX2)

## Install RealSense ROS Wrapper

## Install PyTorch
```
#!/bin/bash
#
# Modified from https://gist.github.com/dusty-nv/ef2b372301c00c0a9d3203e42fd83426
# Modified by Yiren Qu
# pyTorch install script for NVIDIA Jetson TX1/TX2,
# from a fresh flashing of JetPack 2.3.1 / JetPack 3.0 / JetPack 3.1
#
# for the full source, see jetson-reinforcement repo:
#   https://github.com/dusty-nv/jetson-reinforcement/blob/master/CMakePreBuild.sh
#
# note:  pyTorch documentation calls for use of Anaconda,
#        however Anaconda isn't available for aarch64.
#        Instead, we install directly from source using setup.py
#
sudo apt-get install python-pip3

# clone pyTorch repo
git clone http://github.com/pytorch/pytorch
cd pytorch
git submodule update --init

# install prereqs
sudo pip3 install -U setuptools
sudo pip3 install -r requirements.txt

# Develop Mode:
#python3 setup.py build_deps
#sudo python3 setup.py develop

# Install Mode:  (substitute for Develop Mode commands)
sudo python3 setup.py install

# Install TensorboardX
pip3 install tensorboardX

#Install Torchvision
git clone https://github.com/pytorch/vision
cd vision
sudo python3 setup.py install


# Verify CUDA (from python interactive terminal)
# import torch
# print(torch.__version__)
# print(torch.cuda.is_available())
# a = torch.cuda.FloatTensor(2)
# print(a)
# b = torch.randn(2).cuda()
# print(b)
# c = a + b
# print(c)
```

## SSD MobileNet (For Benchmark)

## Deep Pose Estimator (PRL)
