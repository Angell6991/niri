#!/bin/bash

# Nombre del proceso que buscamos, ajusta si es necesario
PROCESS_NAME="terminal-bg --script cava"

# Verificar si el proceso está corriendo
PID=$(pgrep -f "terminal-bg --script cava")

if [ -z "$PID" ]; then
  # Si PID está vacío, el proceso no está corriendo, lo iniciamos
  terminal-bg --script cava &
  echo "Programa iniciado."
else
  # Si el proceso está corriendo, lo terminamos
  kill "$PID"
  echo "Programa detenido."
fi
