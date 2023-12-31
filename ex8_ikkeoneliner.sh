#!/bin/bash

while true; do 
    read -p "Enter a state (or type 'exit' to quit): " state; 
    if [[ "$state" == "exit" ]]; then
        echo "Exiting script..."
        exit 0
    fi
    grep -E "^[0-9]+,[^,]+,${state}," us-population-data-1000-cities.txt | awk -F',' '{print $2", "$4; s+=$4} END{print "Total: "s}'; 
done
