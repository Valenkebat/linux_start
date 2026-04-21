#!/bin/bash

# Detener el script si hay un error
set -e 

echo ">>> Actualizando el sistema base..."
sudo apt update && sudo apt upgrade -y

echo ">>> Instalando utilidades básicas, soporte para Flatpak y utilidades de red..."
sudo apt install -y git curl wget htop build-essential apt-transport-https gnupg flatpak unzip jq
# Agregar el repositorio Flathub para apps como Reaper
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo ">>> Instalando Entorno de Python (Clave para scraping y dbt)..."
sudo apt install -y python3 python3-pip python3-venv

echo ">>> Instalando Docker y Docker Compose..."
sudo apt install -y docker.io docker-compose
# Agregamos tu usuario al grupo de Docker
sudo usermod -aG docker $USER

echo ">>> Instalando Rust (Automático)..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env" # Cargamos Rust en la sesión actual para poder instalar Zellij ahora

echo ">>> Instalando Zellij (Multiplexor de terminal en Rust)..."
cargo install zellij

echo ">>> Instalando Zed (Editor de código de ultra alto rendimiento)..."
curl -f https://zed.dev/install.sh | sh

echo ">>> Instalando aplicaciones de productividad y comunicación (Snap)..."
sudo snap install code --classic
sudo snap install obsidian --classic
sudo snap install discord
sudo snap install telegram-desktop
sudo snap install zapzap  # WhatsApp
sudo snap install bruno   # Alternativa a Postman
sudo snap install steam

echo ">>> Instalando herramientas específicas de Data e Interfaces..."
sudo snap install dbeaver-ce
sudo snap install figma-linux
sudo apt install -y pgcli # Cliente de Postgres para la terminal con autocompletado

echo ">>> Instalando DuckDB (Analítica local rápida)..."
wget https://github.com/duckdb/duckdb/releases/latest/download/duckdb_cli-linux-amd64.zip
unzip duckdb_cli-linux-amd64.zip
sudo mv duckdb /usr/local/bin/
rm duckdb_cli-linux-amd64.zip

echo ">>> Instalando Pritunl Client..."
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt jammy main
EOF
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --export --armor 7568D9BB55FF9E5287D586017AE645C0CF8E292A | sudo tee /etc/apt/trusted.gpg.d/pritunl.asc
sudo apt update
sudo apt install -y pritunl-client-electron


echo ">>> Instalando Bitwarden (Gestor de Contraseñas)..."
sudo snap install bitwarden
sudo snap install bw

echo ">>> Instalando Reaper (Producción de Audio vía Flatpak)..."
flatpak install flathub fm.reaper.Reaper -y

echo "====================================================="
echo "¡Configuración completada!"
echo "1. Reiniciá la PC para aplicar todos los cambios de grupos (Docker/Audio)."
echo "2. Para el audio, el sistema ya viene con PipeWire por defecto, así que Reaper debería reconocer tu interfaz."
echo "====================================================="