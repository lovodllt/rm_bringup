#!/bin/bash

service_name="rm_ecat_start.service"
target_ip="192.168.100.2/24"
restarted=false

while true; do
    if ! ip addr show | grep -q -w "$target_ip"; then
        if [ "$restarted" = false ]; then
            echo "IP $target_ip not found."
            
            if [[ "$ROBOT_TYPE" == "engineer" || "$ROBOT_TYPE" == "engineer2" ]]; then
                echo "Restarting services: $service_name, start_master.service..."
                sudo systemctl restart "$service_name" start_master.service
            else
                echo "Restarting services: $service_name, start_master.service, vision_start_service..."
                sudo systemctl restart "$service_name" start_master.service vision_start.service
            fi

            echo "Services restarted successfully.Exiting."
            restarted=true
            break
        fi
    else
        echo "IP $target_ip exists. No action needed."
    fi
    sleep 20
done



