
#!/bin/bash

mkdir point_cloud && cd point_cloud
wstool init src
catkin init
catkin config --extend /opt/ros/kinetic
cd src
cp -a ../../image_common ./
cp -a ../../image_geometry ./
cp -a ../../image_pipeline ./
cp -a ../../image_transport_plugins ./
cd ../
catkin build
