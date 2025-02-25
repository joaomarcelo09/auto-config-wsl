#!/bin/bash
# install-plugins.sh

# Instalar plugins zsh-autosuggestions e zsh-syntax-highlighting
echo "Instalando plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Atualizar a configuração do Zsh para incluir os plugins
echo "Configurando plugins no .zshrc..."
sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Rodar o source para carregar as novas configurações
echo "Aplicando configurações no Zsh..."
source ~/.zshrc
