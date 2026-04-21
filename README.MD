# My Linux Setup 🐧 🚀

Este repositorio contiene un script de automatización (`setup.sh`) diseñado para configurar un entorno de trabajo completo en distribuciones basadas en Debian/Ubuntu (preferentemente Ubuntu 24.04 LTS o Pop!_OS).

Está optimizado para el perfil de un **Data Engineer** que también trabaja en **producción musical**.

## 🛠️ ¿Qué instala este script?

El script automatiza la instalación de las siguientes herramientas:

### 💻 Desarrollo y Lenguajes
* **Rust:** Instalación oficial vía `rustup` para desarrollo de alto rendimiento.
* **Python 3:** Entorno base y gestión de paquetes (`pip`, `venv`).
* **Docker & Docker Compose:** Containerización para orquestar motores de datos.
* **Zed:** Editor de código de ultra alto rendimiento escrito en Rust.
* **Visual Studio Code:** El estándar de la industria con soporte total de extensiones.
* **Zellij:** Multiplexor de terminal escrito en Rust, para gestionar múltiples flujos de trabajo en consola.

### 📊 Datos e Infraestructura
* **DuckDB:** Motor SQL para analítica ultrarrápida local de archivos CSV/Parquet.
* **DBeaver CE:** Gestor de bases de datos universal.
* **pgcli:** Cliente de línea de comandos para PostgreSQL con autocompletado avanzado.
* **jq:** Procesador JSON de línea de comandos, ideal para extraer datos de APIs.
* **Pritunl Client:** Cliente VPN para conexiones seguras.
* **Bruno:** Alternativa *open-source* y ligera a Postman para testeo de APIs.

### 🎵 Producción Musical y Creatividad
* **REAPER:** DAW profesional (vía Flatpak) para grabación y mezcla.
* **Figma Linux:** Aplicación de escritorio para visualización de diseños.

### 💬 Comunicación y Productividad
* **Obsidian:** Gestión de conocimiento y toma de notas en Markdown.
* **Discord / Telegram:** Comunicación con comunidades y equipos.
* **ZapZap:** Cliente de escritorio para WhatsApp.
* **Steam:** Para gaming nativo y vía Proton (optimizado para GPUs AMD).

## 🚀 Cómo usarlo

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/tu-usuario/nombre-del-repo.git](https://github.com/tu-usuario/nombre-del-repo.git)
   cd nombre-del-repo

👤 Autor
Valentin Kebat - Data Engineer ---
Este setup fue creado para maximizar la productividad en entornos Linux aprovechando el hardware AMD y optimizando los flujos de ingeniería de datos.