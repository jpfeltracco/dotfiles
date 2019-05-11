#!/bin/sh

xdotool search --class "drop" \
  || kitty --class="drop" &
