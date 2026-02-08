#!/bin/bash

TRACK="$(nowplaying-cli get title)"
if [ "$TRACK" != "null" ]; then
    ARTIST="$(nowplaying-cli get artist)"
    ALBUM="$(nowplaying-cli get album)"
    APP="$(base64 -d <<< "$(nowplaying-cli get clientPropertiesData)" | awk -F ':' '{print $2}')"
    APP="${APP:1}" # extra character at the front
fi

if [ "$APP" = "Spotify" ]; then
    TITLE="$TRACK - $ARTIST ($ALBUM)"
elif [ -n "$APP" ]; then
    TITLE="Media playing on $APP"
fi

args=(
    --set media_ctrl_title label="$TITLE"
)

sketchybar -m "${args[@]}"
