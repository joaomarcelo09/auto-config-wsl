#!/bin/bash

# Garante que o script pare em caso de erro
set -e 

# Ativa a permissao para rodar os scripts
chmod +x ./setup/*.sh

./setup/install-zsh.sh

# Muda para o Zsh e executa o main-zsh.sh
exec zsh ./main-zsh.sh

echo "Setup concluído!"
