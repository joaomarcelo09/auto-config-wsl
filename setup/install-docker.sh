#!/bin/zsh
# install-docker.sh

# Remover pacotes antigos relacionados ao Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove $pkg -y
done

echo "Adicionando chave GPG do Docker..."
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Adicionar o repositório Docker ao Apt
echo "Adicionando repositório do Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Instalar Docker e dependências
echo "Instalando Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Testando Docker
echo "Testando Docker..."
sudo docker run hello-world
echo -n "O resultado é como o esperado? (Exemplo: Hello from Docker!) [s/n]: "
read docker_result
if [[ "$docker_result" != "s" ]]; then
    echo "Verifique a instalação do Docker!"
else
    echo "Docker instalado corretamente!"
fi

# # Configurar Docker para rodar sem sudo
# echo "Configurando Docker para rodar sem sudo..."
# sudo usermod -aG docker $USER
# newgrp docker

# Testar novamente o Docker sem sudo
# echo "Testando Docker novamente..."
# docker run hello-world
