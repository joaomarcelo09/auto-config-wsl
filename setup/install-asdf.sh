#!/bin/zsh

# Instalar asdf
echo "Instalando asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Configurar o asdf na sessão atual
echo "Carregando o asdf na sessão atual..."
export ASDF_DIR="$HOME/.asdf"
. "$ASDF_DIR/asdf.sh"
. "$ASDF_DIR/completions/asdf.bash"

# Adicionar configuração no ~/.zshrc se ainda não estiver lá
if ! grep -q 'export ASDF_DIR="$HOME/.asdf"' ~/.zshrc; then
  echo "Adicionando asdf ao ~/.zshrc..."
  echo 'export ASDF_DIR="$HOME/.asdf"' >> ~/.zshrc
  echo '. "$ASDF_DIR/asdf.sh"' >> ~/.zshrc
  echo '. "$ASDF_DIR/completions/asdf.bash"' >> ~/.zshrc
  echo "Configuração do asdf adicionada ao ~/.zshrc!"
else
  echo "O asdf já está configurado no ~/.zshrc."
fi

# Instalar plugins conforme escolha do usuário
install_plugin() {
  local plugin_name=$1
  local command_name=$2

  read -p "Deseja instalar o plugin do $plugin_name? (y/n): " install_choice
  if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
    echo "Instalando o plugin do $plugin_name..."
    asdf plugin-add "$plugin_name"
    
    echo "Instalando a versão mais recente do $plugin_name..."
    asdf install "$plugin_name" latest
    
    echo "Definindo o $plugin_name mais recente como global..."
    asdf global "$plugin_name" latest
    
    echo "Verificando a versão instalada do $plugin_name..."
    $command_name --version
  fi
}

# Perguntar se o usuário deseja instalar os plugins
install_plugin "java" "java"
install_plugin "golang" "go"

# Testando Java
echo "Testando Java..."
java -version
echo -n "O resultado é como o esperado? (Exemplo: openjdk version \"17.0.1\" 2021-10-19) [s/n]: "
read java_result
if [[ "$java_result" != "s" ]]; then
    echo "Verifique a instalação do Java!"
else
    echo "Java instalado corretamente!"
fi

# Testando Go
echo "Testando Go..."
go version
echo -n "O resultado é como o esperado? (Exemplo: go version go1.18.1 linux/amd64) [s/n]: "
read go_result
if [[ "$go_result" != "s" ]]; then
    echo "Verifique a instalação do Go!"
else
    echo "Go instalado corretamente!"
fi

echo "Instalação do asdf e plugins concluída!"
