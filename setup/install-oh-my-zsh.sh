#!/bin/bash
# install-oh-my-zsh.sh

# Instalar o Oh My Zsh
echo "Instalando o Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Instalar o Powerlevel10k como tema
echo "Instalando o Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configurar o tema no .zshrc
echo "Configurando o Powerlevel10k como tema no Zsh..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc

echo "Powerlevel10k instalado e configurado. Ao iniciar o Zsh, você será guiado pela configuração interativa do Powerlevel10k."
