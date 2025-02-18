#!/bin/sh

killall waybar

if [[ $USER = "noir" ]]
then
  waybar -c ~/dotfiles/waybar/config & -s ~/dotfiles/waybar/style.css
else
  waybar &
fi
