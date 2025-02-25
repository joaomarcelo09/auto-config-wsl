#!/bin/bash
# install-zsh.sh

# Instalar Zsh
echo "Instalando Zsh..."
sudo apt install -y zsh

# Definir Zsh como shell padrão
echo "Definindo Zsh como shell padrão..."
chsh -s $(which zsh)
