#!/bin/bash

SCRIPT_NAME="buildapk"
SCRIPT_SOURCE="https://raw.githubusercontent.com/Rodyher/HTML_to_APK/main/buildapk"

LOCAL_BIN_DIR="$HOME/.local/bin"
SCRIPT_PATH="$LOCAL_BIN_DIR/$SCRIPT_NAME"

ZSHRC="$HOME/.zshrc"
BASHRC="$HOME/.bashrc"

echo "===================================="
echo "Instalador HTML_to_APK"
echo "===================================="
echo ""

check_install () {

if ! command -v "$1" &> /dev/null
then
    echo "Instalando $1..."
    sudo dnf install -y "$2"
else
    echo "$1 ya instalado"
fi

}

# -------- Node --------

if ! command -v node &> /dev/null
then
    echo "Instalando Node.js..."
    sudo dnf install -y nodejs
else
    echo "Node.js ya instalado"
fi

# -------- Java --------

if ! command -v java &> /dev/null
then
    echo "Instalando Java..."
    sudo dnf install -y java-11-openjdk-devel
else
    echo "Java ya instalado"
fi

# -------- Gradle --------

if ! command -v gradle &> /dev/null
then
    echo "Instalando Gradle..."
    sudo dnf install -y gradle
else
    echo "Gradle ya instalado"
fi

# -------- Cordova --------

if ! command -v cordova &> /dev/null
then
    echo "Instalando Cordova..."
    sudo npm install -g cordova
else
    echo "Cordova ya instalado"
fi

# -------- Cordova-res --------

if ! command -v cordova-res &> /dev/null
then
    echo "Instalando cordova-res..."
    sudo npm install -g cordova-res
else
    echo "cordova-res ya instalado"
fi

# -------- Crear bin --------

mkdir -p "$LOCAL_BIN_DIR"

# -------- Descargar buildapk --------

echo ""
echo "Verificando actualización de buildapk..."

curl -z "$SCRIPT_PATH" -o "$SCRIPT_PATH" "$SCRIPT_SOURCE" -s

chmod +x "$SCRIPT_PATH"

echo "buildapk instalado/actualizado"

# -------- Añadir PATH --------

add_path () {

FILE=$1

if [ -f "$FILE" ]; then

    if ! grep -q "$LOCAL_BIN_DIR" "$FILE"; then

        echo "Añadiendo $LOCAL_BIN_DIR al PATH en $FILE"

        echo "export PATH=\"$LOCAL_BIN_DIR:\$PATH\"" >> "$FILE"

    else

        echo "PATH ya configurado en $FILE"

    fi

fi

}

add_path "$ZSHRC"
add_path "$BASHRC"

echo ""
echo "===================================="
echo "Instalación finalizada"
echo "===================================="
echo ""
echo "Si el comando no funciona aún ejecuta:"
echo ""
echo "source ~/.bashrc"
echo "o"
echo "source ~/.zshrc"
echo ""