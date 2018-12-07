# **Wireless Perception Module** - Software Installation Repo

First, please clone this repo to both your host machine and Intel Joule. 

`git clone https://github.com/ramonidea/prl_wireless_perception`

## Install Joule Prereqs

`./Joule_Install/install.sh`

Please ssh to your Intel Joule, and run the above bash command. 
The bash script will help you to install ROS and necessary libraries. 

## Install LibRealSense on Joule

`./RealSense_Install/install_realsense.sh`

By running this bash command on Joule, you will be ready to use Intel Realsense Cameras. And the Realsense Wrapper will be installed in the `catkin_ws` folder under path `~/`
