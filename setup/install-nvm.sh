#!/bin/zsh
# install-nvm.sh

# Instalar NVM (Node Version Manager)
echo "Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Carregar NVM (necessário para a sessão atual)
echo "Carregando NVM..."
source ~/.zshrc

# Instalar a versão LTS do Node.js
echo "Instalando a versão LTS do Node.js..."
nvm install --lts

# Instalar o PNPM
echo "Instalando PNPM..."
npm i -g pnpm
