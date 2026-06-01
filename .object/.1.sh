#!/usr/bin/bash
PUT(){ echo -en "\033[${1};${2}H";}
clear
toilet -t -f mono12 "MSMods" --gay -F border 2>/dev/null || figlet "MSMods" | lolcat
echo ""
PUT 11 40
echo -e "\e[92mBy\e[1;93m MSMods Pro\e[1;95m /\e[1;96m Termux Suite"
PUT 12 3
echo ""
echo -e "\e[1;31m  [\e[32m✔\e[31m] \e[1;91m by \e[1;36mMSMods Pro \e[93m/ \e[100;92mt.me/MSModsPro\e[0m"
echo ""
echo -e "  \e[101;1;39mNOTE\e[0;1;33m Use upto 8 words for shell name\e[0m"
echo ""
cd ~/MSMods/.object
echo -e '\e[1;96m'
read -p '  Type Shell Name ❯ ' name
sed -e "s/\H4ck3r/$name/g" .MSMods.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme
