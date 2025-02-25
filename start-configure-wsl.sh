#!/bin/bash
# main.sh

# Ativa a permissao para rodar os scripts
chmod +x ./setup/*.sh

# Chama cada script em ordem
echo "Iniciando o setup..."

./setup/install-zsh.sh
./setup/install-zsh-plugins.sh
./setup/install-nvm.sh
./setup/configure-github.sh
./setup/install-docker.sh
./setup/install-asdf.sh

# Rodar os testes após o setup
echo "Iniciando os testes..."
./setup/run-tests.sh

# Instala a parte visual do zsh
echo "Instalando aparencia do shell"
./setup/install-oh-my-zsh.sh

echo "Setup concluído!"
