#!/bin/bash

# Verificamos si hypridle está corriendo

if pgrep -x "hypridle" > /dev/null; then
    notify-send "󱚳  System security:" "automatic screen lock disabled"
    ~/.eww/target/release/eww -c ~/.config/niri/widget_eww/widget_starcarft  open adjutora-icon-glass  &
    pkill -x hypridle

else
    notify-send "󱎚  System security:" "automatic screen lock activated"
    ~/.eww/target/release/eww -c ~/.config/niri/widget_eww/widget_starcarft kill &
    hypridle &

    hyprctl reload &

fi
