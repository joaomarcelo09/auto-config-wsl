#!/bin/zsh

# Instalar plugins zsh-autosuggestions e zsh-syntax-highlighting
echo "Instalando plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Atualizar a configuração do Zsh para incluir os plugins
echo "Configurando plugins no .zshrc..."
# Verificar se a linha de plugins já existe e substituir, se necessário
if grep -q '^plugins=' ~/.zshrc; then
    sed -i 's/^plugins=(.*)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
else
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc
fi

# Rodar o source para carregar as novas configurações
echo "Aplicando configurações no Zsh..."
source ~/.zshrc

# Verificar se os plugins foram carregados corretamente
echo "Verificando se os plugins estão funcionando..."
if grep -q 'zsh-autosuggestions' ~/.zshrc && grep -q 'zsh-syntax-highlighting' ~/.zshrc; then
    echo "Plugins carregados com sucesso!"
else
    echo "Erro: Plugins não foram carregados corretamente. Verifique o arquivo .zshrc."
fi
