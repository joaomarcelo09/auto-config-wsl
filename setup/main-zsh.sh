#!/bin/zsh

# Chama cada script em ordem
echo "Iniciando o setup..."

./setup/install-oh-my-zsh.sh
./setup/install-zsh-plugins.sh
./setup/install-nvm.sh
./setup/configure-github.sh
./setup/install-docker.sh
./setup/install-asdf.sh
./setup/load-zsh.sh

# # Rodar os testes após o setup
# echo "Iniciando os testes..."
# ./setup/run-tests.sh
