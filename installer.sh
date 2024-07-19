#!/bin/bash

# Definir las rutas de destino
KITTY_CONFIG_DIR="$HOME/.config/kitty"
ZSH_CONFIG_DIR="$HOME/.config/zsh"
PLUGINS_DIR="$ZSH_CONFIG_DIR/plugins"
STARSHIP_CONFIG="$HOME/.config/starship.toml"
XRESOURCES="$HOME/.Xresources"
ZSHENV="$HOME/.zshenv"

# Función para verificar rutas
verify_paths() {
    if [ ! -d "./kitty" ]; then
        echo "Error: El directorio './kitty' no existe."
        exit 1
    fi
    if [ ! -d "./plugins_zsh" ]; then
        echo "Error: El directorio './plugins_zsh' no existe."
        exit 1
    fi
    if [ ! -d "./zsh" ]; then
        echo "Error: El directorio './zsh' no existe."
        exit 1
    fi
    if [ ! -f "./starship/starship.toml" ]; then
        echo "Error: El archivo './starship/starship.toml' no existe."
        exit 1
    fi
    if [ ! -f "./.Xresources" ]; then
        echo "Error: El archivo './.Xresources' no existe."
        exit 1
    fi
    if [ ! -f "./.zshenv" ]; then
        echo "Error: El archivo './.zshenv' no existe."
        exit 1
    fi
}

# Preguntar confirmación
read -p "¿Estás seguro de que deseas continuar con la instalación? (s/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo "Instalación cancelada."
    exit 1
fi

# Verificar rutas
verify_paths

# Crear directorios si no existen
mkdir -p $KITTY_CONFIG_DIR
mkdir -p $ZSH_CONFIG_DIR
mkdir -p $PLUGINS_DIR

# Copiar archivos y directorios
cp -r ./kitty/* $KITTY_CONFIG_DIR/
cp -r ./plugins_zsh/* $PLUGINS_DIR/
cp -r ./zsh/* $ZSH_CONFIG_DIR/
cp ./starship/starship.toml $STARSHIP_CONFIG
cp ./.Xresources $XRESOURCES
cp ./.zshenv $ZSHENV

# Recargar configuraciones
xrdb -merge $XRESOURCES
source $ZSHENV

echo "Instalación completa."

