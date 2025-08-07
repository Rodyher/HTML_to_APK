# HTML_to_APK
---

Herramienta de línea de comandos para empaquetar una página web (HTML, CSS, JS) en un archivo APK de Android de forma automática, sin usar Android Studio.

buildapk es una herramienta de línea de comandos para automatizar la creación de archivos APK de Android a partir de una página web estática (HTML, CSS y JS). Este script utiliza Apache Cordova para convertir tu web en una WebView sin necesidad de Android Studio, simplificando todo el proceso de empaquetado en un solo comando.
---

## 🚀 Características
Instalación con un solo comando: Configura automáticamente todas las dependencias necesarias en sistemas basados en Linux.

Automatización completa: Un solo comando para crear, configurar y compilar la APK de tu proyecto web.

Validación de archivos: El script verifica que todos los archivos necesarios (.html, .css, .js, icon.png, splash.png) existan antes de empezar.

Flujo de trabajo eficiente: Ideal para desarrolladores que buscan crear prototipos o aplicaciones simples de forma rápida.

## ⚙️ Instalación (para equipos nuevos)
Para instalar y configurar todas las dependencias necesarias en tu sistema, ejecuta el siguiente comando en tu terminal. Este proceso puede tardar varios minutos, ya que instala Node.js, Cordova, y configura el entorno de Android.

```Bash
curl -s https://raw.githubusercontent.com/Rodyher/HTML_to_APK/main/install_buildapk.sh | bash
```
---
## 🖥️ Uso
Una vez que la instalación haya finalizado, puedes usar el comando buildapk en el directorio de tu proyecto web.

Requisitos previos:

Asegúrate de que los siguientes archivos estén en el directorio donde ejecutes el comando:

index.html

style.css

script.js

icon.png (icono de la aplicación)

splash.png (pantalla de inicio de la aplicación)

Ejecución:

```Bash
buildapk <nombre_de_la_carpeta> <id_de_la_app> "Nombre visible de la app"
```
<nombre_de_la_carpeta>: El nombre de la carpeta donde se creará el proyecto de Cordova.

<id_de_la_app>: Un identificador de paquete único (ej. com.miempresa.mi_app).

"Nombre visible de la app": El nombre que aparecerá bajo el icono de la aplicación.

Ejemplo:

```Bash
buildapk mi-proyecto-web com.ejemplo.webapp "Mi App Web"
```
📦 Resultado
Al finalizar, el script creará un directorio con el nombre que especifiques y colocará el archivo APK de depuración (app-debug.apk) en la raíz de esa carpeta para que puedas encontrarlo fácilmente.
