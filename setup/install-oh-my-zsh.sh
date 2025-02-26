#!/bin/zsh

# Evita que o script pare ao entrar no Zsh automaticamente
export RUNZSH=no

# Instalar o Oh My Zsh sem interação
echo "Instalando o Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Instalar o Powerlevel10k como tema
echo "Instalando o Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configurar o tema no ~/.zshrc
echo "Configurando o Powerlevel10k como tema no Zsh..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "Powerlevel10k instalado e configurado. Ao iniciar o Zsh, você será guiado pela configuração interativa do Powerlevel10k."

# Garante que o script não fique preso dentro do Zsh
echo "Finalizando instalação..."
exit 0
