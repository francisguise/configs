#!/bin/bash

connected_displays=$( xrandr | grep ' connected ' | awk '{print $1}' )
for display in ${connected_displays} ; do
	eval $display=1
done

if [[ "$HDMI1" == 1 && "$VGA1" == 1 ]] ; then
	#Dual monitor setup
	xrandr --output HDMI1 --auto --left-of VGA1 --output VGA1 --auto
else
	#Just laptop
	xrandr --output LVDS1 --auto --output VGA1 --off
fi

i3-nagbar -t warning -m "You reconfigured the connected_displays: $connected_displays!"
#notify-send --icon=gtk-info Test "Displays $connected_displays reconfigured"
#_vga=$( xrandr  | sed -n 's/^\(VGA.\).*/\1/pg')
#alias laptop='xrandr --output LVDS1 --auto --output $_vga --off'
#alias monitor='xrandr --output LVDS1 --off --output $_vga --auto'
#alias dual='xrandr --output LVDS1 --auto --left-of $_vga --output $_vga --auto'
