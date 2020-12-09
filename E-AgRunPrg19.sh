#!/bin/bash
suser=$(sudo loginctl list-users|head -3|tail -1|awk '{print $2}')
sudo cp /home/$suser/.Xauthority /root
export DISPLAY=:1
sudo xhost +si:localuser:root

