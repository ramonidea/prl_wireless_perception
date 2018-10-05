#!/bin/bash

mkdir ../../../point_cloud && cd ../../../point_cloud
wstool init src
catkin init
catkin config --extend /opt/ros/kinetic
cd src
git clone https://github.com/intel-ros/realsense
git clone https://github.com/ros-perception/image_common
https://github.com/ros-perception/vision_opencv
https://github.com/ros-perception/image_pipeline
https://github.com/ros-perception/image_transport_plugins
cd ../
catkin_make install
