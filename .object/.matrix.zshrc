ZSH_THEME="MSMods"
export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
[[ -f ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

clear
echo -e "\033[1;32m[*] Initializing matrix..."
echo -ne "\033[1;32m"
for i in {1..25}; do echo -ne "0"; sleep 0.01; done
echo -ne "\n"
sleep 0.2
clear

echo -e "\e[1;32m"
MATRIX_CHARS="01ﾊﾐﾋｰｳｼﾅﾓﾆｻﾜﾂｵﾘｱﾎﾃﾏｹﾒｴｶｷﾑﾕﾗｾﾈｪｩｸ"
for i in {1..3}; do
    line=""
    for j in {1..50}; do
        line+="${MATRIX_CHARS:$((RANDOM % ${#MATRIX_CHARS})):1}"
    done
    echo "   $line"
done
echo ""
echo -e "\e[1;32m  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
figlet -c -w 52 "\PROC" 2>/dev/null | while IFS= read -r line; do echo -e "\e[1;32m$line"; done || echo -e "\e[1;32m  \PROC"
echo -e "\e[1;32m  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
echo ""
for i in {1..2}; do
    line=""
    for j in {1..50}; do
        line+="${MATRIX_CHARS:$((RANDOM % ${#MATRIX_CHARS})):1}"
    done
    echo -e "\e[1;32m   $line\e[0m"
done
echo ""
echo -e "\e[1;32m  [MATRIX] \e[1;33mgithub.com/MSMods-Pro \e[1;32m| \e[1;33mt.me/MSModsPro\e[0m"
echo ""
