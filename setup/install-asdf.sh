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

echo "Instalação do asdf e plugins concluída!"
