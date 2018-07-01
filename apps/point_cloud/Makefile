.PHONY: help
help:
		@echo "Possible make targets:"

.PHONY: prereqs_joule
prereqs_joule:
	./prereqs.sh

.PHONY: prereqs
prereqs:
	./prereqs_client.sh

.PHONY: run_opt_1_joule
run_opt_1_joule: 
	echo "Running Option 1 with C++ ROS Wrapper"
	source ./point_cloud/devel/setup.bash
	source /opt/ros/kinetic/setup.bash
	#if you are running with RS415 Please run this one:
	./camera_init_scripts/run_camera.sh
	#if you are running with RS435 Please run this one:
	#TODO: Still have bug on different FOV on RS435

.PHONY: run_opt_1_client
run_opt_1_client:
	source ./point_cloud/devel/setup.bash
	source /opt/ros/kinetic/setup.bash
	roslaunch depth_image_proc cloudify.launch

.PHONY: run_opt_2_joule
run_opt_2_joule: 
	echo "Running Option 1 with C++ ROS Wrapper"
	source ./point_cloud/devel/setup.bash
	source /opt/ros/kinetic/setup.bash
	#if you are running with RS415 Please run this one:
	./camera_init_scripts/run_py_camera.sh
	#if you are running with RS435 Please run this one:
	#TODO: Still have bug on different FOV on RS435

.PHONY: run_opt_2_client
run_opt_2_client:
	source ./point_cloud/devel/setup.bash
	source /opt/ros/kinetic/setup.bash
	./camera_init_scripts/decompress_py.sh


