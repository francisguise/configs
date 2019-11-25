#!/bin/bash -i

echo "$(date +'%F-%H_%M') - $(zenity --entry --title='Timesheets!' --text='What have you been doing?'  --display=:0.0 2>/dev/null )" >> /space/fguise/ts/timesheet.$(date +'%F')
