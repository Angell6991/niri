#!/bin/bash

# Ruta a la carpeta con wallpapers
WALLPAPER_DIR="$HOME/Images/.wallpaper/gifs/"

# Selecciona una imagen aleatoria (ajusta extensión si tienes otros formatos)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.gif' -o -iname '*.gif' \) | shuf -n 1)

# Poner el wallpaper con swww
swww-daemon
swww img "$WALLPAPER" --transition-type=any --transition-duration=2
