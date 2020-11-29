#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
killall -q zscroll

# Wait until the processes have been shut down
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini main &
# polybar main -c ~/.config/polybar/config1.ini &
# polybar main -c ~/.config/polybar/config2.ini &
# polybar main -c ~/.config/polybar/config3.ini &
