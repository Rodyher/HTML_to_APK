# HTML_to_APK

**HTML_to_APK** es una herramienta de línea de comandos que permite
convertir fácilmente una página web estática (**HTML, CSS y
JavaScript**) en una **aplicación Android (.APK)** utilizando **Apache
Cordova**, sin necesidad de instalar ni usar **Android Studio**.

El objetivo del proyecto es simplificar al máximo el proceso de
empaquetar una web en una app Android, permitiendo hacerlo con **un solo
comando**.

------------------------------------------------------------------------

# 🚀 Características

-   ⚡ **Instalación automática** de dependencias necesarias.
-   📦 **Compilación de APK con un solo comando**.
-   🔍 **Verificación automática de archivos requeridos**.
-   🔁 **Evita reinstalar dependencias ya instaladas**.
-   🧩 Utiliza **Apache Cordova** para generar la aplicación Android.
-   🖥️ Diseñado para **Linux (especialmente distribuciones basadas en
    Debian/Ubuntu)**.
-   🧪 Ideal para **prototipos rápidos**, **apps simples** o **convertir
    webs en apps móviles**.

------------------------------------------------------------------------

# ⚙️ Instalación

Para instalar todas las dependencias necesarias en un sistema nuevo,
ejecuta:

``` bash
curl -s https://raw.githubusercontent.com/Rodyher/HTML_to_APK/main/install_buildapk.sh | bash
```

Este script instalará automáticamente:

-   Node.js
-   npm
-   Apache Cordova
-   Dependencias del SDK de Android
-   Configuración necesaria del entorno

Además, el instalador:

-   Verifica si las dependencias ya están instaladas.
-   Evita reinstalar componentes innecesarios.
-   Configura el comando global **buildapk**.

------------------------------------------------------------------------

# 🖥️ Uso

Una vez instalado, puedes usar el comando **buildapk** dentro del
directorio donde se encuentre tu proyecto web.

## Comando

``` bash
buildapk <nombre_de_la_carpeta> <id_de_la_app> "Nombre visible de la app"
```

### Parámetros

  -----------------------------------------------------------------------
  Parámetro                      Descripción
  ------------------------------ ----------------------------------------
  `<nombre_de_la_carpeta>`       Carpeta donde se generará el proyecto
                                 Cordova

  `<id_de_la_app>`               Identificador único del paquete Android

  `"Nombre visible de la app"`   Nombre que aparecerá en el dispositivo
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 📂 Archivos requeridos

Antes de ejecutar el comando, asegúrate de que tu proyecto contenga:

    index.html
    style.css
    script.js
    icon.png
    splash.png

Estos archivos deben estar **en el mismo directorio donde ejecutes
`buildapk`**.

------------------------------------------------------------------------

# 📌 Ejemplo

``` bash
buildapk mi-proyecto-web com.ejemplo.webapp "Mi App Web"
```

Este comando:

1.  Crea un proyecto Cordova.
2.  Copia los archivos de tu web.
3.  Configura el proyecto Android.
4.  Compila la aplicación.

------------------------------------------------------------------------

# 📦 Resultado

Al finalizar el proceso, encontrarás el archivo:

    app-debug.apk

Dentro de la carpeta generada:

    mi-proyecto-web/

La estructura final será similar a:

    mi-proyecto-web/
     ├── platforms/
     ├── www/
     ├── config.xml
     └── app-debug.apk

Este archivo APK puede instalarse directamente en un dispositivo Android
para pruebas.

------------------------------------------------------------------------

# 🔧 Flujo de trabajo recomendado

1️⃣ Crear una carpeta para tu proyecto web

    mi-web-app/

2️⃣ Colocar los archivos:

    index.html
    style.css
    script.js
    icon.png
    splash.png

3️⃣ Ejecutar:

``` bash
buildapk mi-app com.miempresa.miapp "Mi Web App"
```

4️⃣ Instalar el APK en tu dispositivo Android.

------------------------------------------------------------------------

# ⚠️ Notas importantes

-   El APK generado es un **APK de depuración (debug)**.
-   Para publicar en **Google Play**, se recomienda generar un **APK
    firmado (release)**.
-   Esta herramienta está pensada principalmente para **apps WebView
    simples**.

------------------------------------------------------------------------

# 🧠 ¿Para qué sirve esta herramienta?

Este proyecto es ideal para:

-   Convertir **proyectos web en apps móviles**
-   Crear **MVPs rápidamente**
-   Probar **ideas de apps sin Android Studio**
-   Distribuir **herramientas internas**
-   Convertir **dashboards o utilidades web en apps**

------------------------------------------------------------------------

# 📜 Licencia

Este proyecto se distribuye bajo licencia **MIT**.

Puedes modificarlo, mejorarlo y adaptarlo libremente.

------------------------------------------------------------------------

# 👨‍💻 Autor

Proyecto creado por:

**Rodyher Viloria**

GitHub: https://github.com/Rodyher

------------------------------------------------------------------------

⭐ Si este proyecto te resulta útil, considera darle una estrella en
GitHub.