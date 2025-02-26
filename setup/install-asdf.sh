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

# Instalar o plugin Java
echo "Instalando o plugin do Java..."
asdf plugin-add java

# Instalar a versão mais recente do Java
echo "Instalando a versão mais recente do Java..."
asdf install java latest

# Definir a versão global do Java
echo "Definindo a versão mais recente do Java como global..."
asdf global java latest

# Verificar a versão instalada do Java
echo "Verificando a versão do Java..."
java -version

echo "Java instalado e configurado com sucesso!"


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

# Instalar o plugin Golang
echo "Instalando o plugin do Golang..."
asdf plugin-add golang

# Instalar a versão mais recente do Golang
echo "Instalando a versão mais recente do Golang..."
asdf install golang latest

# Definir a versão global do Golang
echo "Definindo a versão mais recente do Golang como global..."
asdf global golang latest

# Verificar a versão instalada do Golang
echo "Verificando a versão do Golang..."
go version

echo "Golang instalado e configurado com sucesso!"

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
