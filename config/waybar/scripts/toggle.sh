#!/usr/bin/env bash

CONFIG="$HOME/.config/waybar/config.jsonc"
STYLE="$HOME/.config/waybar/style.css"

if pgrep -x waybar >/dev/null; then
    pkill -x waybar
else
    waybar -c "$CONFIG" -s "$STYLE" >/dev/null 2>&1 &
fi

