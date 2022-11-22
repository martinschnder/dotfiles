#!/bin/sh
USER="$(who | grep :0\) | cut -f 1 -d ' ')"
XAUTHORITY=/home/$USER/.Xauthority
export XAUTHORITY
export DISPLAY=:0

########### Settings ###########

echo "test ok!" > ~/.config/i3/scripts/hdmi.log

# Use 'xrandr' to find these
INTERNAL_DISPLAY="eDP"
HDMI="HDMI-A-0"

# Check /sys/class/drm for the exact location
HDMI_STATUS="$(cat /sys/class/drm/card0-HDMI-A-1/status)"

# Do no change!
EXTERNAL_DISPLAY=""

# Check to see if the external display is connected
if [ "${HDMI_STATUS}" = connected ]; then
EXTERNAL_DISPLAY=$HDMI
fi

# The external display is connected
if [ $EXTERNAL_DISPLAY=$HDMI ]; then

# Set the display settings
xrandr --output eDP --auto  --output $HDMI --auto --above eDP

# The external display is not connected
else

# Restore to single display
xrandr eDP --output $EXTERNAL_DISPLAY --off

fi
exit 0
