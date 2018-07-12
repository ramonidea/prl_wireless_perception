# Jetson Tx2 Install

## Flash OS and Other packages (CuDnn, CUDA..)
> Install the Jetpack first. Here is the [link](https://developer.nvidia.com/embedded/jetpack)
> [Youtube Tutorial on Installation of Tx2](https://www.youtube.com/watch?v=D7lkth34rgM)

## Install OpenCV
[Tutorial Link](https://jkjung-avt.github.io/opencv3-on-tx2/)

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

## SSD MobileNet (For Benchmark)

## Deep Pose Estimator (PRL)
