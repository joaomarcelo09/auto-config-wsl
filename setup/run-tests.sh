#!/bin/bash
# run-tests.sh

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
