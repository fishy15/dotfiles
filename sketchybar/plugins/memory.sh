#!/usr/bin/env bash

# based on https://github.com/FelixKratz/SketchyBar/discussions/12#discussioncomment-1556226
sketchybar -m --set memory_util label=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5"%"}')
