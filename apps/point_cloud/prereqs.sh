#!/bin/bash

mkdir point_cloud && cd point_cloud
wstool init src
catkin init
catkin config --extend /opt/ros/kinetic
cd src
git clone https://github.com/intel-ros/realsense.git
cp ../../image_common ./
cp ../../immage_geometry ./
cp ../../image_pipeline ./
cp ../../image_transport_plugins ./
cd ../
catkin build
