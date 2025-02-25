#!/bin/bash
# install-asdf.sh

# Instalar asdf
echo "Instalando asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Adicionar configuração no .zshrc
echo "Configurando o .zshrc para carregar o asdf..."
echo '# Carregar o asdf' >> ~/.zshrc
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc

# Rodar o source para carregar as novas configurações
echo "Aplicando configurações no Zsh..."
source ~/.zshrc

# Perguntar se o usuário deseja instalar o Java
read -p "Deseja instalar o plugin do Java? (y/n): " install_java
if [[ "$install_java" == "y" || "$install_java" == "Y" ]]; then
  # Instalar o plugin do Java
  echo "Instalando o plugin do Java..."
  asdf plugin-add java
  
  # Instalar a versão mais recente do Java
  echo "Instalando a versão mais recente do Java..."
  asdf install java latest
  
  # Definir a versão global do Java
  echo "Definindo o Java mais recente como global..."
  asdf global java latest
  
  # Verificar a versão do Java instalada
  echo "Verificando a versão do Java..."
  java -version
fi

# Perguntar se o usuário deseja instalar o Go
read -p "Deseja instalar o plugin do Go? (y/n): " install_go
if [[ "$install_go" == "y" || "$install_go" == "Y" ]]; then
  # Instalar o plugin do Go
  echo "Instalando o plugin do Go..."
  asdf plugin-add golang
  
  # Instalar a versão mais recente do Go
  echo "Instalando a versão mais recente do Go..."
  asdf install golang latest
  
  # Definir a versão global do Go
  echo "Definindo o Go mais recente como global..."
  asdf global golang latest
  
  # Verificar a versão do Go instalada
  echo "Verificando a versão do Go..."
  go version
fi

echo "Instalação do asdf e plugins concluída!"
