#!/bin/bash
sudo apt-get -f -y install git g++ make cmake automake libtool pkg-config
sudo apt-get -f -y install libboost-all-dev libboost-dev
sudo apt-get -f -y install python-setuptools python python-numpy python-scipy python-sklearn python-matplotlib python-tk
sudo apt-get -f -y install libv4l-0 libv4l-dev

#Install OpenCV
cd ~/.local/
git clone --branch 2.4 --depth 1 https://github.com/Itseez/opencv.git
cd opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$HOME/.local ..
make -j4
make install
# Install ros packages
sudo apt-get -f install ros-kinetic-moveit-commander ros-kinetic-moveit-planners ros-kinetic-moveit-plugins ros-kinetic-moveit-ros ros-kinetic-moveit-resources ros-kinetic-cmake-modules ros-kinetic-usb-cam  ros-kinetic-rviz-visual-tools
sudo apt-get -f install ros-kinetic-joy
sudo apt-get -f install ros-kinetic-urdfdom-py ros-kinetic-kdl-parser-py
echo "ROS_DISTR=kinetic " >> ~/.bashrc
echo ". /opt/ros/$ROS_DISTR/setup.bash" >> ~/.bashrc
echo " . ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo " . /opt/ros/$ROS_DISTR/share/rosbash/rosbash" >> ~/.bashrc
echo " export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:$HOME/ros_ws:$HOME/prg/testl/ros_sandbox" >> ~/.bashc
sudo apt-get -f install python-rosinstall
sudo apt-get -f install python-qt4 tmux rxvt-unicode-256color
mkdir ~/ros_ws/
cd ~/ros_ws/
rosws init
rosws merge https://raw.githubusercontent.com/akihikoy/ay_common/master/ay_ros/ay_tools.rosinstall
rosws update
rospack profile
source ~/.bashrc
#TODO: Add the CMAKELIST to the folder.

rosmake ay_util
rosmake ay_vision
rosmake ay_sim
rosmake ay_3dvision
rosmake fingervision 






