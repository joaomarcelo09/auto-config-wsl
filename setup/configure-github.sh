#!/bin/zsh
# configure-github.sh

# Perguntar ao usuário se deseja configurar o GitHub
read -p "Você deseja configurar o GitHub? (sim/nao): " configurar_github

if [[ "$configurar_github" == "sim" ]]; then
    # Instalar o GitHub CLI e configurar GitHub
    echo "Instalando GitHub CLI..."
    (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y

    # Login no GitHub CLI
    echo "Efetuando login no GitHub..."
    gh auth login

    # Configurar Git com as informações do usuário
    read -p "Digite seu nome para o Git: " nome_git
    git config --global user.name "$nome_git"

    read -p "Digite seu e-mail para o Git: " email_git
    git config --global user.email "$email_git"

    # Configurar editor padrão do Git
    git config --global core.editor "code --wait"
    
    echo "Configuração do GitHub e Git concluída!"
fi
