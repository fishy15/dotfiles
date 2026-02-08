#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

HOUR="$(date '+%H')"
LABEL="AM"
if [[ $HOUR -eq 0 ]]; then
	HOUR="12"
elif [[ $HOUR -eq 12 ]]; then
	LABEL="PM"
elif [[ $HOUR -gt 12 ]]; then
	HOUR="$(($HOUR - 12))"
	LABEL="PM"
fi

sketchybar --set "$NAME" label="$(date "+%m/%d $HOUR:%M:%S $LABEL")"

