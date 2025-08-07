#!/bin/bash

# Este script automatiza la instalación de dependencias para buildapk en Fedora.

# --- Variables y Archivos ---
SCRIPT_NAME="buildapk"
SCRIPT_SOURCE="https://raw.githubusercontent.com/Rodyher/HTML_to_APK/refs/heads/main/buildapk"
LOCAL_BIN_DIR="$HOME/.local/bin"
ZSHRC_FILE="$HOME/.zshrc"

echo "--- Iniciando la instalación de dependencias para buildapk en Fedora ---"
echo "Este proceso puede tomar varios minutos."
echo ""

# 1. Instalar Node.js y npm (si no están instalados)
if ! command -v node &> /dev/null; then
    echo "-> Paso 1: Instalando Node.js y npm..."
    sudo dnf install -y nodejs
else
    echo "-> Paso 1: Node.js y npm ya están instalados. Saltando."
fi

# 2. Instalar el Java Development Kit (JDK)
if ! command -v java &> /dev/null; then
    echo "-> Paso 2: Instalando el Java JDK..."
    sudo dnf install -y java-11-openjdk-devel
else
    echo "-> Paso 2: Java JDK ya está instalado. Saltando."
fi

# 3. Instalar Cordova y cordova-res de forma global
echo "-> Paso 3: Instalando Cordova y cordova-res..."
npm install -g cordova
npm install -g cordova-res

# 4. Verificar y configurar el Android SDK
echo "-> Paso 4: Verificando el Android SDK..."

ANDROID_SDK_PATH=""

# A. Buscar en las variables de entorno
if [ -n "$ANDROID_HOME" ]; then
    ANDROID_SDK_PATH="$ANDROID_HOME"
elif [ -n "$ANDROID_SDK_ROOT" ]; then
    ANDROID_SDK_PATH="$ANDROID_SDK_ROOT"
fi

# B. Si no se encuentra, buscar en ubicaciones comunes
if [ -z "$ANDROID_SDK_PATH" ]; then
    if [ -d "$HOME/Android/Sdk" ]; then
        ANDROID_SDK_PATH="$HOME/Android/Sdk"
    elif [ -d "$HOME/flutter/Android/Sdk" ]; then
        ANDROID_SDK_PATH="$HOME/flutter/Android/Sdk"
    fi
fi

# C. Si se encontró el SDK, confirmar y configurar PATH
if [ -n "$ANDROID_SDK_PATH" ] && [ -d "$ANDROID_SDK_PATH" ]; then
    echo "-> Android SDK encontrado en: $ANDROID_SDK_PATH"
    echo "Añadiendo variables de entorno al PATH si es necesario."
    if ! grep -q "ANDROID_HOME" "$ZSHRC_FILE"; then
        echo "export ANDROID_HOME=\"$ANDROID_SDK_PATH\"" >> "$ZSHRC_FILE"
        echo "export PATH=\"\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools\"" >> "$ZSHRC_FILE"
    fi
else
    # D. Si no se encontró en ninguna parte, instruir al usuario
    echo "-> No se pudo encontrar el Android SDK en ubicaciones comunes."
    echo "Para la instalación del SDK de Android, recomendamos que lo descargues manualmente."
    echo "  https://developer.android.com/studio#command-line-tools"
    echo "Luego, asegúrate de configurar las variables de entorno ANDROID_HOME y PATH en tu ~/.zshrc."
    read -p "Presiona Enter para continuar una vez que el SDK esté configurado..."
fi

# 5. Descargar el script buildapk y darle permisos de ejecución
echo "-> Paso 5: Descargando y configurando el script '$SCRIPT_NAME'..."
mkdir -p "$LOCAL_BIN_DIR"
wget -O "$LOCAL_BIN_DIR/$SCRIPT_NAME" "$SCRIPT_SOURCE"
chmod +x "$LOCAL_BIN_DIR/$SCRIPT_NAME"

# 6. Asegurarse de que ~/.local/bin esté en el PATH
if ! grep -q "$LOCAL_BIN_DIR" "$ZSHRC_FILE"; then
    echo "-> Paso 6: Añadiendo '$LOCAL_BIN_DIR' al PATH de Zsh..."
    echo "export PATH=\"$LOCAL_BIN_DIR:\$PATH\"" >> "$ZSHRC_FILE"
fi

echo ""
echo "--- ¡Instalación completa! ---"
echo "Ahora puedes usar el comando '$SCRIPT_NAME' después de reiniciar tu terminal o ejecutar 'source $ZSHRC_FILE'."
