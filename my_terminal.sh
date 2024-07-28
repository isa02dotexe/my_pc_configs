#!/bin/bash

sudo -v

# Verifica se o sudo foi autorizado
if [ $? -ne 0 ]; then
    echo "Senha do sudo incorreta. Encerrando o script."
    exit 1
fi

USER_NAME=$(whoami)
USER_HOME="/home/$USER_NAME"
DIRETORIO_OMZ="/home/$(ls /home)/.oh-my-zsh/plugins/"

sudo apt install curl

echo "======================="
echo "   INSTALANDO O GIT    "
echo "======================="
sudo apt-get install git -y

#Ubuntu 22.04.1
#CONFIGURAÇÃO DO TERMINAL
sudo apt update -y

# Configuração do Git
echo "======================="
echo "   CONFIGURANDO O GIT  "
echo "======================="
read -p 'Insira seu nome e seu sobrenome: ' NOME
read -p 'Insira seu email: ' EMAIL

git config --global user.name "$NOME"
git config --global user.email "$EMAIL"

# Obter o nome e e-mail configurados
CONFIGURED_NAME=$(git config --global user.name)
CONFIGURED_EMAIL=$(git config --global user.email)

# Exibir as configurações
echo "O nome configurado é: $CONFIGURED_NAME"
echo "O e-mail configurado é: $CONFIGURED_EMAIL"

# Gerar a chave SSH
read -p "Insira o nome da chave RSA: " NOME_CHAVE
ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f ~/.ssh/$NOME_CHAVE

ssh-add ~/.ssh/$NOME_CHAVE
echo "========Chave RSA adicionada========="

#INSTALANDO O SNAP
sudo apt install snapdspor

#INSTALANDO O SPOTIFY
echo "======================="
echo "       SPOTIFY        "
echo "======================="
sudo snap install spotify 
spotify .

#INSTALANDO O OBSIDIAN
sudo snap install obsidian --classic
obsidian .

#INSTALANDO O DISCORD
sudo snap install discord 
discord .

#INSTALANDO O VSCODE
sudo apt install wget gpg apt-transport-https -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo apt update
sudo apt install code -y
code .

#O VIVALDI
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' 
sudo apt update && sudo apt install vivaldi-stable


sudo apt install neofetch -y
neofetch

#Instalando o ZSH
echo "=========================="
echo "     Instalando o ZSH     "
echo "=========================="
sudo apt install zsh -y
sudo chsh -s $(which zsh)    #zsh para ser o default

sudo reboot 
echo "========================="
echo "   Bem-vinda Isabelle!   "
echo "========================="
echo "
                                                              
                                                                      
                                               ------==               
                             ----------      --------====             
                        --:::::::::::----------------===++            
               ---------+=::::-+:==::::-------------====++            
             =--------=.-=::::*:.=*::::------------====+++            
            ==-------+=:%=:::=@@@@+:::-----------=====++++            
            ==-------@@@%-:::*@@@@=------------=====++++++            
            ===-----=@%%*::::=%###-------------====++++++             
            +==------%##------+**---=====+==--=====+++++              
            ++==++=-------=----------===============+++               
             ==++==-------#+-----=+*###*+==========++++               
            ======--------==--=*###########+======+++++               
            ===========-======####%%%%%%#####+=++++++++               
            ++==============+##%%%%%%%%%%%%%##*++++++++               
            +++============+#%%%%%%%%%%%%%%%%%%#+++++++               
            +++++==========*%%%%%%%%%%%%%%%%%%%%*++++++               
             ++++++++++++++#%%%%%%%%%%%%%%%%%%%%#++++++               
              +++++++++++++%%%%%%%%%%%%%%%%%%%%%%*++++                
               +++++++++++*%%%%%%%%%%%%%%%%%%%%%%#+++                 
               +++++++++++*#%%%%%%%%%%%%%%%%%%%%%%++                  
                 +++++++++*#%%%%%%%%%%%%%%%%%%%%%%+                   
                  +++++++++*#%%%%%%%%%%%%%%%%%%%%%                    
                     *++++++*%%%%%%%%%%%%%%%%%%%%                     
                     %%%#*++++*%%%%%%%%%%%%%%%%%                      
                     %%%%%%%%#***#%%%%%%%%%%%%                        
                      %%%%%%%%%%%%%%%%%%%%%                           
                      #%%##%%%%%%%%%%%%%%%%                           
                       #%%###%%%%%%%%%%%%%%                           
                        %%%%%###%%%%%%%%%%                            
                         %%%%%%%%%%%%%%%%%                            
                          %%%%%%%%%%%%%%%%                            
                           %%%%%%%%%%%%%%                             
                             %%%%%%%%%%%                              
                                %%%%%%                                
                                                                      
"     

echo "=========================="
echo "  Instalando o OH MY ZSH  "
echo "=========================="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

