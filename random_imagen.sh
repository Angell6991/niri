#!/bin/bash

# buscar la imagen
WALLPAPER_DIR="$HOME/Images/.wallpaper/niri/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)

# crear imagen con blur
BLURRED_WALLPAPER="/tmp/wallpaper_blurred.png"
# magick "$WALLPAPER" -blur 0x12 "$BLURRED_WALLPAPER"
magick "$WALLPAPER" -resize 10% -blur 0x2 -resize 1000% "$BLURRED_WALLPAPER"

# inciciar swww
swww-daemon
swww-daemon -n overlay

# poner las imagenes
swww img "$WALLPAPER" --transition-type=any --transition-duration=2
swww img -n overlay "$BLURRED_WALLPAPER" --transition-type=any --transition-duration=2

# eliminar la imagen con blur
wait
rm "$BLURRED_WALLPAPER"
