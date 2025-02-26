#!/bin/zsh

sudo chown -R $USER:$USER $ZSH_CUSTOM

# Definir ZSH_CUSTOM se não estiver definido
if [ -z "$ZSH_CUSTOM" ]; then
    export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
fi

# Verifique se o diretório ZSH_CUSTOM/plugins existe
if [ ! -d "$ZSH_CUSTOM/plugins" ]; then
    echo "Diretório de plugins não encontrado. Criando..."
    mkdir -p "$ZSH_CUSTOM/plugins"
fi

# Instalar plugins
echo "Instalando plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions || { echo "Erro ao clonar zsh-autosuggestions"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || { echo "Erro ao clonar zsh-syntax-highlighting"; exit 1; }

# Atualizar a configuração no .zshrc
echo "Configurando plugins no .zshrc..."
sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
