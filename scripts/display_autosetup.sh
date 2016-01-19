
[ $# -ne 0 ] && [ $1 == "quiet" ] && quiet=1 || quiet=0

connected_displays=$( xrandr | grep ' connected ' | awk '{print $1}' )

#iter=0
#for display in ${connected_displays} ; do
#	eval export DISP${iter}=$display
#	iter+=1
#done

if [ ${#connected_displays[@]} -gt 1 ] ; then
	#Dual monitor setup
	[ $quiet ] || xrandr --output HDMI1 --auto --left-of VGA1 --output VGA1 --auto
	export DISP1=HDMI1
	export DISP2=VGA1
else
	#Just laptop
	[ $quiet ] || xrandr --output ${connected_displays[0]} --auto
	export DISP1=LVDS1
	export DISP2=LVDS1
fi

# reset background
[ $quiet ] || sh ~/.fehbg
[ $quiet ] ||  i3-nagbar -t warning -m "You reconfigured the connected_displays: $connected_displays!"

