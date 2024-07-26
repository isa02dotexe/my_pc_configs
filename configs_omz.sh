#!/bin/zsh

sudo -v

# Verifica se o sudo foi autorizado
if [ $? -ne 0 ]; then
    echo "Senha do sudo incorreta. Encerrando o script."
    exit 1
fi

# Obtém o nome do usuário
USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"
DIRETORIO_OMZ="$HOME/.oh-my-zsh/plugins/"

source ~/.zshrc;
omz theme set jonathan 
omz plugin enable 			aws 				\
					vscode 				\
					vagrant 			\
					ubuntu 				\
					sudo 				\
					gitfast 			\
					golang				\
					docker 				\
					docker-compose 		\
					docker-machine 		\
					opentofu 			\
					terraform 			\
					zsh-interactive-cd	\

# # PLUGINS QUE NAO VEM NO OH MY ZSH
# # Verifica se a pasta .oh-my-zsh/plugins existe e navega até ela
if [ -d "$DIRETORIO_OMZ" ]; then
    cd "$DIRETORIO_OMZ"
    
    # # zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # # zsh-autosuggestiom
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	# # zsh-autocomplete
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
	
    sudo apt update
    
	# # Habilita os plugins
    echo "Habilitando plugins..."
    omz plugin enable zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete
else
    echo "Pasta .oh-my-zsh/plugins não encontrada."
    exit 1
fi

    # # Abre um novo terminal e executa os comandos em sequência
gnome-terminal -- zsh -c "neofetch; sudo reboot exec zsh"




