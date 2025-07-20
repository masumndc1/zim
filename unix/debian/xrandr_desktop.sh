#!/usr/bin/env bash

xrandr --output LVDS --auto --primary
xrandr --output HDMI-0 --auto --right-of LVDS --rotate normal
#xrandr --output HDMI-0 --auto --right-of LVDS --rotate left
