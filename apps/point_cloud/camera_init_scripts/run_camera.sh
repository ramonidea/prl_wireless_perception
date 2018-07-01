#!/bin/bash

#Please modify the IP to your client IP address.
export ROS_MASTER_URI="http://192.168.2.171:11311"
#Please modify the IP to the Joule IP Address
export ROS_IP="192.168.2.176"

#You may indicate the camera settings in this file.
roslaunch realsense realsense2_camera rs_camera.launch



