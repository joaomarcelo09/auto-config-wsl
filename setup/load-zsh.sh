#!/bin/zsh

# Verificar se a configuração do NVM está no .zshrc
echo "Verificando a configuração do NVM no .zshrc..."
if grep -q 'export NVM_DIR="$HOME/.nvm"' ~/.zshrc && grep -q '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' ~/.zshrc; then
    echo "Configuração do NVM já foi adicionada ao .zshrc!"
else
    echo "A configuração do NVM não foi encontrada no .zshrc. Adicionando..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
    echo "Configuração do NVM adicionada com sucesso!"
fi

# Carregar as configurações do .zshrc
echo "Carregando as configurações do .zshrc..."
source ~/.zshrc

# Verificar se o NVM e o ASDF estão funcionando
echo "Verificando se o NVM está funcionando..."
if command -v nvm &> /dev/null; then
    echo "NVM está funcionando corretamente!"
else
    echo "Erro: NVM não está funcionando. Verifique as configurações."
fi

echo "O setup do NVM foi verificado e as configurações foram aplicadas com sucesso!"
