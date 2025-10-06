#!/bin/zsh

echo "Iniciando o setup..."

./setup/install-oh-my-zsh.sh
./setup/install-zsh-plugins.sh
./setup/install-nvm.sh
./setup/configure-github.sh
./setup/install-docker.sh
./setup/load-zsh.sh

# echo "Iniciando os testes..."
# ./setup/run-tests.sh
