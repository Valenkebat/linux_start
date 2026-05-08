#!/bin/bash

# ==============================================================================
# Setup CachyOS / Arch Linux
# ==============================================================================

# Detener el script si hay un error
set -e

echo ">>> Actualizando el sistema base..."
paru -Syu --noconfirm

echo ">>> Instalando utilidades básicas y dependencias del sistema..."
paru -S --needed --noconfirm base-devel git curl wget htop flatpak unzip jq wl-clipboard

echo ">>> Configurando Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo ">>> Instalando Entornos de Ejecución (Python y Node.js)..."
paru -S --needed --noconfirm python python-pip python-pipx nodejs npm pnpm

echo ">>> Instalando Rust y utilidades modernas de terminal..."
paru -S --needed --noconfirm rustup eza bat zoxide fzf
rustup default stable

echo ">>> Instalando Zellij y Zed (Desarrollo)..."
paru -S --needed --noconfirm zellij zed

echo ">>> Instalando Docker y herramientas de Contenedores..."
paru -S --needed --noconfirm docker docker-compose
sudo usermod -aG docker $USER
sudo systemctl enable --now docker.service

echo ">>> Instalando Herramientas de Data Engineering y Bases de Datos..."
paru -S --needed --noconfirm duckdb dbeaver penpot-desktop-bin pgcli aws-cli-v2 mitmproxy

echo ">>> Instalando Navegadores y Herramientas Web (Scraping)..."
paru -S --needed --noconfirm chromium

echo ">>> Instalando Control de Versiones..."
paru -S --needed --noconfirm bitbucket-cli

echo ">>> Instalando IA Local y Asistentes de Código..."
paru -S --needed --noconfirm ollama
pipx install aider-chat

echo ">>> Instalando Productividad, Comunicación y Privacidad..."
paru -S --needed --noconfirm visual-studio-code-bin obsidian discord telegram-desktop bruno-bin steam proton-vpn-gtk-app bitwarden bitwarden-cli

echo ">>> Instalando Ecosistema de Audio y Planificación de Rutas..."
paru -S --needed --noconfirm qpwgraph gpxsee
flatpak install flathub fm.reaper.Reaper -y

echo ">>> Configurando Alias y Utilidades en la shell..."
SHELL_RC="$HOME/.bashrc"
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
fi

if ! grep -q "zoxide init" "$SHELL_RC"; then
    echo -e "\n# Inicializar zoxide" >> "$SHELL_RC"
    echo 'eval "$(zoxide init '"$(basename $SHELL)"')"' >> "$SHELL_RC"
fi

if ! grep -q "ia-on" "$SHELL_RC"; then
    echo -e "\n# Alias para Ollama (IA Local)" >> "$SHELL_RC"
    echo "alias ia-on='sudo systemctl start ollama && echo \"Ollama iniciado\"'" >> "$SHELL_RC"
    echo "alias ia-off='sudo systemctl stop ollama && echo \"Ollama detenido\"'" >> "$SHELL_RC"
fi

if ! grep -q "alias ls=" "$SHELL_RC"; then
    echo -e "\n# Reemplazos modernos de terminal" >> "$SHELL_RC"
    echo "alias ls='eza --icons'" >> "$SHELL_RC"
    echo "alias cat='bat'" >> "$SHELL_RC"
fi

echo "====================================================="
echo "¡Setup completado y listo para pushear!"
echo "Pasos post-instalación:"
echo "1. Reiniciá para aplicar cambios (Docker, grupos)."
echo "2. Ejecutá 'aws configure' para setear credenciales."
echo "3. Ejecutá 'ia-on' cuando quieras usar IA y 'ollama run llama3' para bajar tu primer modelo."
echo "4. Recordá usar 'python -m venv' para entornos locales de dbt o scrapers."
echo "5. Asegurate de agregar ~/.local/bin a tu PATH para usar las apps de pipx (como Aider)."
echo "====================================================="
