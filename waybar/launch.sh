#!/bin/sh

killall waybar

if [[ $USER = "noir" ]]
then
  waybar -c ~/dotconfig/waybar/config & -s ~/dotconfig/waybar/style.css
else
  waybar &
fi
