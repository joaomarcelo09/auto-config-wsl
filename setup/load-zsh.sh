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

# Verificar se a configuração do ASDF está no .zshrc
echo "Verificando a configuração do ASDF no .zshrc..."
if grep -q '. "$HOME/.asdf/asdf.sh"' ~/.zshrc && grep -q '. "$HOME/.asdf/completions/asdf.bash"' ~/.zshrc; then
    echo "Configuração do ASDF já foi adicionada ao .zshrc!"
else
    echo "A configuração do ASDF não foi encontrada no .zshrc. Adicionando..."
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
    echo "Configuração do ASDF adicionada com sucesso!"
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

echo "Verificando se o ASDF está funcionando..."
if command -v asdf &> /dev/null; then
    echo "ASDF está funcionando corretamente!"
else
    echo "Erro: ASDF não está funcionando. Verifique as configurações."
fi

echo "O setup do NVM e ASDF foi verificado e as configurações foram aplicadas com sucesso!"
