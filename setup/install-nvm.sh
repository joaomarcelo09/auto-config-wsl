#!/bin/zsh

# Instalar NVM (Node Version Manager)
echo "Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Definir as variáveis do NVM para esta sessão
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Testando NVM
echo "Testando NVM..."
nvm -v
echo -n "O resultado é como o esperado? (Exemplo: 0.algumacoisa) [s/n]: "
read nvm_result
if [[ "$nvm_result" != "s" ]]; then
    echo "Verifique a instalação do NVM!"
else
    echo "NVM instalado corretamente!"
fi

# Instalar a versão LTS do Node.js
echo "Instalando a versão LTS do Node.js..."
nvm install --lts

# Carregar o Node.js corretamente
nvm use --lts

# Testando npm
echo "Testando npm..."
npm -v
echo -n "O resultado é como o esperado? (Exemplo: 7.21.0) [s/n]: "
read npm_result
if [[ "$npm_result" != "s" ]]; then
    echo "Verifique a instalação do npm!"
else
    echo "npm instalado corretamente!"
fi

# Instalar o PNPM
echo "Instalando PNPM..."
npm i -g pnpm

# Testando pnpm
echo "Testando pnpm..."
pnpm -v
echo -n "O resultado é como o esperado? (Exemplo: 6.11.0) [s/n]: "
read pnpm_result
if [[ "$pnpm_result" != "s" ]]; then
    echo "Verifique a instalação do pnpm!"
else
    echo "pnpm instalado corretamente!"
fi
