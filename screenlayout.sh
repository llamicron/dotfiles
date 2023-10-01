#!/bin/sh

readonly WALLPAPER_DIR=/home/llamicron/etc/wallpapers

readonly LEFT_WALLPAPER="$WALLPAPER_DIR/irl/yosemite_vertical.jpg"
readonly RIGHT_WALLPAPER="$WALLPAPER_DIR/irl/el_cap.jpg"

output=$(xrandr)

num_displays=$(echo "$output" | grep -c " connected")

if [ "$num_displays" -gt 1 ]; then
    # If we have both displays connected, then configure both
    xrandr \
        --output DisplayPort-0 --mode 2560x1440 --rotate right \
        --output HDMI-0 --mode 2560x1440 --rotate normal --right-of DisplayPort-0
else
    # otherwise, just configure the left one, rotated right.
    xrandr \
        --output DisplayPort-0 --mode 2560x1440 --rotate right
fi

# Set wallpaper
feh --bg-scale $LEFT_WALLPAPER --bg-scale $RIGHT_WALLPAPER

