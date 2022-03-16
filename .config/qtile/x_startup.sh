#!/bin/sh

hdmi=`xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}'`

if [ "$hdmi" = "HDMI-1" ]; then
  xrandr --output HDMI-1 --primary --mode 1366x768 --pos 0x0 --output eDP-1 --mode 1366x768 --pos 1366x0 &
else
  xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off &
fi

picom --experimental-backends &
tint2 &
setxkbmap -layout es -variant dvorak -option caps:swapescape &

# Prevent the screens off
xset s off # Disable X windows screen saver
xset -dpms # Disable display power management system
