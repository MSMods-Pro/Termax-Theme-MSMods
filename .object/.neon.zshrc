ZSH_THEME="MSMods"
export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
[[ -f ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

clear
echo -e "\033[1;36m[*] BOOTING MSMods Pro..."
echo -ne "\033[1;31m[LOADING] \033[1;32m"
for i in {1..30}; do echo -ne "▓"; sleep 0.015; done
echo -e "\033[0m"
sleep 0.2
clear

echo -e "\e[1;31m"
echo "  ╔╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╗"
echo "  ╠╬╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╬╣"
echo -e "\e[1;35m"
figlet -c -w 52 "\PROC" 2>/dev/null | lolcat || echo -e "  \PROC" | lolcat
echo -e "\e[1;31m"
echo "  ╠╬╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╬╣"
echo "  ╚╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╩╝"
echo -e "\e[1;36m"
echo "   ⚡ NEON SHELL  |  \e[1;33mgithub.com/MSMods-Pro\e[1;36m"
echo "   ⚡ Telegram    |  \e[1;33mt.me/MSModsPro\e[0m"
echo ""
