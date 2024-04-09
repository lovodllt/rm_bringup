#!/bin/bash

source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash

declare -A nodes=(
#    ["/node_name"]="package node_executable"
    ["/rm_dbus"]="rm_dbus rm_dbus"
    ["/rm_referee"]="rm_referee rm_referee"
)

check_and_restart_node() {
    local node=$1
    local package_exec=($2)
    local package=${package_exec[0]}
    local executable=${package_exec[1]}

    if ! rosnode list | grep -q $node; then
        echo "node ${node} not run,trying to restart..."
        rosnode kill $node 2>/dev/null
        sleep 1
        rosrun $package $executable &
    fi
}

while true; do
    for node in "${!nodes[@]}"; do
        check_and_restart_node $node "${nodes[$node]}"
    done
    sleep 5
done

