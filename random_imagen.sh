#!/bin/bash

# buscar la imagen
WALLPAPER_DIR="$HOME/Images/.wallpaper/niri/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)


# crear imagen con blur
BLURRED_WALLPAPER="/tmp/wallpaper_blurred.png"
# magick "$WALLPAPER" -blur 0x12 "$BLURRED_WALLPAPER"
magick "$WALLPAPER" -resize 10% -blur 0x2 -resize 1000% "$BLURRED_WALLPAPER"


# tipos de transitions 
TYPE_LIST=("simple" "outer" "center" "wipe" "top" "bottom" "left" "right")
TYPE=${TYPE_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# positions transitions
POS_LIST=("0,0" "0.5,0.5" "0.999,0" "0.999,0.999" "0,0.999" "0.2,0.4" "0.8,0.8" "0.3,0.3")
POS=${POS_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# angle transitions
ANGLE_LIST=("30" "120" "210" "300" "15" "135" "225" "315")
ANGLE=${ANGLE_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# inciciar swww
awww-daemon &
awww-daemon -n overlay &


# poner las imagenes
awww img "$WALLPAPER" --transition-type="$TYPE" --transition-pos="$POS" --transition-angle="$ANGLE" --transition-duration=2 &

awww img -n overlay "$BLURRED_WALLPAPER" --transition-type="$TYPE" --transition-pos="$POS" --transition-angle="$ANGLE" --transition-duration=2 &


# eliminar la imagen con blur
wait
rm "$BLURRED_WALLPAPER"


