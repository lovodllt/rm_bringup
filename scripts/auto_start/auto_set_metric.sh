#!/bin/bash
echo "Starting auto_set_metric.sh!"
cd /home/dynamicx
sudo ifmetric enp86s0 200
echo "enp86s0 Metric: $(route -n | grep '0.0.0.0' | grep 'enp86s0' | awk '{print $5}'
)"
sudo ifmetric enx081f71632e17 100
echo "enx081f71632e17 Metric: $(route -n | grep '0.0.0.0' | grep 'enx081f71632e17' | awk '{print $5}'
)"
echo "auto_set_metric.sh executed successfully!"