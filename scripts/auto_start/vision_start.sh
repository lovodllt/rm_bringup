#!/bin/bash
source /opt/ros/noetic/setup.bash
source ~/rm_ws/devel/setup.bash
source /opt/intel/openvino_2022/setupvars.sh
source ~/environment.sh
if [[ $HAS_SWITCH == has ]]; then
  export ROS_IP=192.168.100.2
else
  export ROS_IP=127.0.0.1
fi
sudo chmod -t /tmp
mon launch --disable-ui rm_bringup vision_start.launch
