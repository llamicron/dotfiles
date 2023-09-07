#!/bin/sh
xrandr \
    --output DisplayPort-0 --primary --mode 2560x1440 --pos 1920x0 --rotate normal \
    --output HDMI-0 --mode 2560x1440 --pos 0x180 --rotate normal \
    --output DVI-0 --mode 2560x1440 --pos 4480x0 --rotate normal \
    --output DVI-1 --off

