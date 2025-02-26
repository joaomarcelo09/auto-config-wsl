#!/bin/bash
# install-zsh.sh

# Instala o Zsh se ainda não estiver instalado
if ! command -v zsh &> /dev/null; then
    echo "Instalando Zsh..."
    sudo apt update && sudo apt install -y zsh
fi

# Definir Zsh como shell padrão
echo "Definindo Zsh como shell padrão..."
chsh -s $(which zsh)
