#!/bin/bash
# ╔══════════════════════════════════════════════════════╗
# ║         MSMods Pro - Termux Enhancement Suite        ║
# ║     github.com/MSMods-Pro | t.me/MSModsPro           ║
# ╚══════════════════════════════════════════════════════╝

R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;93m'
B='\033[1;94m'
C='\033[1;96m'
M='\033[1;95m'
W='\033[1;97m'
RS='\033[0m'
DIM='\033[2m'
BLINK='\033[5m'

term_width=$(tput cols 2>/dev/null || echo 70)
BOX_WIDTH=$(( term_width > 64 ? 62 : term_width - 2 ))
margin=$(( (term_width - BOX_WIDTH) / 2 ))
left_pad=$(printf '%*s' "$margin" "")

draw_line() {
    printf "${C}${left_pad}%s" "$1"
    for ((i=0; i<BOX_WIDTH-2; i++)); do printf "═"; done
    printf "%s${RS}\n" "$2"
}
draw_thin() {
    printf "${DIM}${C}${left_pad}%s" "$1"
    for ((i=0; i<BOX_WIDTH-2; i++)); do printf "─"; done
    printf "%s${RS}\n" "$2"
}
print_center() {
    local text="$1" color="$2"
    local len=${#text}
    local sp=$(( (BOX_WIDTH - 2 - len) / 2 ))
    printf "${C}${left_pad}║%*s${color}%s${C}%*s║${RS}\n" $sp "" "$text" $(( BOX_WIDTH - 2 - len - sp )) ""
}
loading_bar() {
    local msg="$1" width=32
    echo -ne "${left_pad}${C}${msg} [${RS}"
    for ((i=0; i<width; i++)); do
        echo -ne "${G}█${RS}"
        sleep 0.015
    done
    echo -e "${C}] ${G}✔ DONE${RS}"
}

banner() {
    clear
    echo -e "${C}"
    echo -e "${left_pad}  ███╗   ███╗███████╗███╗   ███╗ ██████╗ ██████╗ ███████╗"
    echo -e "${left_pad}  ████╗ ████║██╔════╝████╗ ████║██╔═══██╗██╔══██╗██╔════╝"
    echo -e "${left_pad}  ██╔████╔██║███████╗██╔████╔██║██║   ██║██║  ██║███████╗"
    echo -e "${left_pad}  ██║╚██╔╝██║╚════██║██║╚██╔╝██║██║   ██║██║  ██║╚════██║"
    echo -e "${left_pad}  ██║ ╚═╝ ██║███████║██║ ╚═╝ ██║╚██████╔╝██████╔╝███████║"
    echo -e "${left_pad}  ╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝${RS}"
    echo -e ""
    echo -e "${left_pad}${W}         ──[ ${M}Termux Enhancement Suite PRO ${W}]──${RS}"
    echo -e "${left_pad}${DIM}${C}         ────────────────────────────────────────────${RS}"
    echo -e ""
    echo -e "${left_pad}${R} ◈${W}  Author  : ${C}MSMods"
    echo -e "${left_pad}${R} ◈${W}  Version : ${Y}v2.0 (Pro)"
    echo -e "${left_pad}${R} ◈${W}  GitHub  : ${G}github.com/MSMods-Pro"
    echo -e "${left_pad}${R} ◈${W}  Telegram: ${B}t.me/MSModsPro"
    echo -e ""
    echo -e "${left_pad}${G} ══════════════════════════════════════════════${RS}"
    echo ""
}

# ─── FEATURE FUNCTIONS ───────────────────────────────────────────

# [01] Full Setup
1line() {
    banner
    echo -e "${left_pad}${C}⟦ FULL SYSTEM SETUP ⟧${RS}"
    echo ""
    loading_bar " Updating packages    "
    apt update -y && apt upgrade -y
    loading_bar " Installing tools     "
    pkg install zsh git figlet toilet ruby wget curl exa lolcat -y
    gem install lolcat 2>/dev/null
    clear
    cd ~/MSMods/.object/ 2>/dev/null
    cp -r 'ANSI Shadow.flf' $PREFIX/share/figlet/ASCII-Shadow.flf 2>/dev/null
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh 2>/dev/null
    loading_bar " Applying configs     "
    rm -rf ~/.termux/colors.properties
    rm -rf /data/data/com.termux/files/usr/etc/motd
    cp -r .colors.properties ~/.termux/colors.properties 2>/dev/null
    cp -r .termux.properties ~/.termux.properties 2>/dev/null
    curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf > ~/.termux/font.ttf 2>/dev/null
    termux-reload-settings 2>/dev/null
    echo -e "\n${left_pad}${G} ✔ Full Setup Complete!${RS}"
    sleep 1
    cd ~/MSMods && bash os.sh
}

# [02] Zsh Setup
2line() {
    banner
    echo -e "${left_pad}${C}⟦ ZSH SETUP ⟧${RS}"
    echo ""
    loading_bar " Setting up Zsh       "
    rm -rf ~/.zshrc
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh 2>/dev/null
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 2>/dev/null
    echo -e "\n${left_pad}${G} ✔ Zsh Configured!${RS}"
    sleep 1
    cd ~/MSMods && bash os.sh
}

# [03] Switch to Zsh
3line() {
    pkg install zsh -y
    chsh -s zsh
    echo -e "\n${left_pad}${G} ✔ Shell switched to ZSH!${RS}"
    sleep 1
    cd ~/MSMods && bash os.sh
}

# [04] Switch to Bash
4line() {
    chsh -s bash
    echo -e "\n${left_pad}${G} ✔ Shell switched to BASH!${RS}"
    sleep 1
    cd ~/MSMods && bash os.sh
}

# [05] Zsh Banner (Multi-Design)
5line() {
    banner
    echo -e "${left_pad}${C}⟦ ZSH BANNER DESIGNER ⟧${RS}"
    echo ""
    echo -e "${left_pad}${W}Choose Banner Design Style:${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${M} Style 1 - ANSI Shadow Box (Lolcat)    ${DIM}[Colorful]${RS}\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Style 2 - Figlet Slant (Cyan Box)     ${DIM}[Slanted]${RS}\n"
    printf "${left_pad}${C}[${W}3${C}]${Y} Style 3 - Toilet Gay Border           ${DIM}[Rainbow]${RS}\n"
    printf "${left_pad}${C}[${W}4${C}]${B} Style 4 - Pixel Art Blocks (Static)   ${DIM}[Blocky]${RS}\n"
    printf "${left_pad}${C}[${W}5${C}]${R} Style 5 - Neon Glitch Cyber           ${DIM}[Hacker]${RS}\n"
    printf "${left_pad}${C}[${W}6${C}]${C} Style 6 - Matrix Rain Effect          ${DIM}[Matrix]${RS}\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back${RS}\n"
    echo ""
    echo -ne "${left_pad}${C}Select Design [1-6]: ${RS}"
    read dstyle
    [ "$dstyle" = "0" ] && cd ~/MSMods && bash os.sh && return

    echo ""
    echo -e "${left_pad}${Y}  ⚠ Type your banner name (up to 8 words):${RS}"
    echo -ne "${left_pad}${C}  ❯ Name: ${RS}"
    read banner_name

    rm -rf ~/.zshrc
    cd ~/MSMods/.object

    case $dstyle in
        1) sed -e "s/\PROC/$banner_name/g" .2zshrc > $HOME/.zshrc ;;
        2) sed -e "s/\PROC/$banner_name/g" .slant.zshrc > $HOME/.zshrc 2>/dev/null || sed -e "s/\PROC/$banner_name/g" .2zshrc > $HOME/.zshrc ;;
        3) sed -e "s/\PROC/$banner_name/g" .toilet.zshrc > $HOME/.zshrc 2>/dev/null || sed -e "s/\PROC/$banner_name/g" .1zshrc > $HOME/.zshrc ;;
        4) sed -e "s/\PROC/$banner_name/g" .blocks.zshrc > $HOME/.zshrc 2>/dev/null || sed -e "s/\PROC/$banner_name/g" .2zshrc > $HOME/.zshrc ;;
        5) sed -e "s/\PROC/$banner_name/g" .neon.zshrc > $HOME/.zshrc 2>/dev/null || sed -e "s/\PROC/$banner_name/g" .2zshrc > $HOME/.zshrc ;;
        6) sed -e "s/\PROC/$banner_name/g" .matrix.zshrc > $HOME/.zshrc 2>/dev/null || sed -e "s/\PROC/$banner_name/g" .2zshrc > $HOME/.zshrc ;;
    esac

    echo -e "\n${left_pad}${G} ✔ Banner Applied: '${banner_name}' with Style $dstyle!${RS}"
    sleep 1
    clear
    cd ~/MSMods && bash os.sh
}

# [06] Zsh Theme (Prompt Style)
6line() {
    banner
    echo -e "${left_pad}${C}⟦ ZSH PROMPT THEME ⟧${RS}"
    echo ""
    echo -e "${left_pad}${W}Choose Prompt Style:${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${M} Cyber Hacker   → [MSMods@termux]─[~/path] ❯❯❯${RS}\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Minimal Clean  → user@host ~/path $${RS}\n"
    printf "${left_pad}${C}[${W}3${C}]${Y} Powerline      → ❯ ~/path git:(branch) ✗${RS}\n"
    printf "${left_pad}${C}[${W}4${C}]${B} Neon Grid      → ╔═[user]═[path] \\n╚═❯${RS}\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back${RS}\n"
    echo ""
    echo -ne "${left_pad}${C}Select Style [1-4]: ${RS}"
    read pstyle
    [ "$pstyle" = "0" ] && cd ~/MSMods && bash os.sh && return

    echo ""
    echo -ne "${left_pad}${C}  ❯ Shell display name (e.g. H4ck3r, Root, MSMods): ${RS}"
    read sname

    cd ~/MSMods/.object
    case $pstyle in
        1) sed -e "s/\H4ck3r/$sname/g" .MSMods.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme ;;
        2) sed -e "s/\H4ck3r/$sname/g" .minimal.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme 2>/dev/null || sed "s/\H4ck3r/$sname/g" .MSMods.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme ;;
        3) sed -e "s/\H4ck3r/$sname/g" .power.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme 2>/dev/null || sed "s/\H4ck3r/$sname/g" .MSMods.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme ;;
        4) sed -e "s/\H4ck3r/$sname/g" .neon.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme 2>/dev/null || sed "s/\H4ck3r/$sname/g" .MSMods.zsh-theme > $HOME/.oh-my-zsh/themes/MSMods.zsh-theme ;;
    esac

    echo -e "\n${left_pad}${G} ✔ Theme Applied: '$sname' with Style $pstyle!${RS}"
    sleep 1
    clear
    cd ~/MSMods && bash os.sh
}

# [07] Highlight + AutoSuggest
7line() {
    banner
    echo -e "${left_pad}${C}⟦ ZSH PLUGINS SETUP ⟧${RS}"
    echo ""
    loading_bar " Installing plugins   "
    cd ~/MSMods/.object
    rm -rf ~/.zshrc
    chsh -s zsh
    bash .3.sh
    echo -e "\n${left_pad}${G} ✔ Plugins Installed!${RS}"
    sleep 1
    clear
    cd ~/MSMods && bash os.sh
}

# [08] Random Color Theme on Startup
8line() {
    banner
    echo -e "${left_pad}${C}⟦ AUTO COLOR CHANGER ⟧${RS}"
    echo ""
    echo -e "${left_pad}${W}Auto Color Mode: Each Termux open = new random color!${RS}"
    echo ""

    # Write the color changer script to .termux
    cat > ~/.termux/auto_color.sh << 'COLOREOF'
#!/bin/bash
# MSMods Pro - Auto Color Changer
COLORS_DIR=~/.termux/msmods_colors
mkdir -p "$COLORS_DIR"

# Define multiple color schemes
declare -a SCHEMES=(
    "cyber_blue" "neon_purple" "hacker_green" "fire_red" "golden_sun"
    "ocean_teal" "plasma_pink" "arctic_white" "shadow_dark" "matrix_green"
)

# Count current index
INDEX_FILE=~/.termux/color_index
if [ ! -f "$INDEX_FILE" ]; then
    echo "0" > "$INDEX_FILE"
fi
IDX=$(cat "$INDEX_FILE")
SCHEME=${SCHEMES[$IDX % ${#SCHEMES[@]}]}

# Write color based on scheme
case $SCHEME in
    cyber_blue)
        cat > ~/.termux/colors.properties << 'EOF'
background=#050d1a
foreground=#00cfff
cursor=#00cfff
color0=#050d1a
color8=#1a3a5c
color1=#ff4466
color9=#ff6688
color2=#00ff99
color10=#33ffbb
color3=#ffdd00
color11=#ffee55
color4=#0099ff
color12=#33bbff
color5=#cc44ff
color13=#dd77ff
color6=#00e5ff
color14=#66f0ff
color7=#c8d8f0
color15=#ffffff
EOF
        ;;
    neon_purple)
        cat > ~/.termux/colors.properties << 'EOF'
background=#0a0010
foreground=#dd88ff
cursor=#ff44ff
color0=#0a0010
color8=#330055
color1=#ff3355
color9=#ff6680
color2=#55ff99
color10=#77ffbb
color3=#ffcc00
color11=#ffee55
color4=#7744ff
color12=#9966ff
color5=#ff00ff
color13=#ff55ff
color6=#aa44ff
color14=#cc88ff
color7=#ddaaff
color15=#ffffff
EOF
        ;;
    hacker_green)
        cat > ~/.termux/colors.properties << 'EOF'
background=#000d00
foreground=#00ff44
cursor=#00ff44
color0=#000d00
color8=#004400
color1=#ff3333
color9=#ff6666
color2=#00ff44
color10=#55ff77
color3=#ccff00
color11=#eeff44
color4=#00aaff
color12=#44ccff
color5=#00ffaa
color13=#44ffcc
color6=#00ffee
color14=#55ffee
color7=#aaffaa
color15=#ffffff
EOF
        ;;
    fire_red)
        cat > ~/.termux/colors.properties << 'EOF'
background=#110000
foreground=#ffaa44
cursor=#ff4400
color0=#110000
color8=#440000
color1=#ff2200
color9=#ff5533
color2=#aaff00
color10=#ccff44
color3=#ffcc00
color11=#ffee44
color4=#ff6600
color12=#ff8833
color5=#ff2244
color13=#ff5566
color6=#ff8800
color14=#ffaa44
color7=#ffddcc
color15=#ffffff
EOF
        ;;
    golden_sun)
        cat > ~/.termux/colors.properties << 'EOF'
background=#0d0a00
foreground=#ffd700
cursor=#ffd700
color0=#0d0a00
color8=#3d3000
color1=#ff4444
color9=#ff7777
color2=#88ff44
color10=#aaff66
color3=#ffd700
color11=#ffe744
color4=#ffaa00
color12=#ffcc44
color5=#ff8800
color13=#ffaa44
color6=#ffdd00
color14=#ffee66
color7=#fff8cc
color15=#ffffff
EOF
        ;;
    ocean_teal)
        cat > ~/.termux/colors.properties << 'EOF'
background=#00080d
foreground=#00ddcc
cursor=#00ffee
color0=#00080d
color8=#003344
color1=#ff4466
color9=#ff6688
color2=#00ffcc
color10=#44ffdd
color3=#ffdd00
color11=#ffee55
color4=#0088ff
color12=#44aaff
color5=#00ccdd
color13=#44ddee
color6=#00eedd
color14=#55eedd
color7=#aaeedd
color15=#ffffff
EOF
        ;;
    plasma_pink)
        cat > ~/.termux/colors.properties << 'EOF'
background=#0d0008
foreground=#ff88cc
cursor=#ff44aa
color0=#0d0008
color8=#440022
color1=#ff2266
color9=#ff5588
color2=#88ff44
color10=#aaffcc
color3=#ffcc00
color11=#ffee55
color4=#aa44ff
color12=#cc88ff
color5=#ff44aa
color13=#ff88cc
color6=#ff00cc
color14=#ff55ee
color7=#ffccee
color15=#ffffff
EOF
        ;;
    arctic_white)
        cat > ~/.termux/colors.properties << 'EOF'
background=#080d10
foreground=#cce8ff
cursor=#88ccff
color0=#080d10
color8=#203040
color1=#ff6688
color9=#ff88aa
color2=#55ffaa
color10=#77ffcc
color3=#ffee66
color11=#fff088
color4=#66aaff
color12=#88ccff
color5=#aa88ff
color13=#ccaaff
color6=#55ddff
color14=#88eeff
color7=#cce8ff
color15=#ffffff
EOF
        ;;
    shadow_dark)
        cat > ~/.termux/colors.properties << 'EOF'
background=#0a0a0a
foreground=#c8c8c8
cursor=#888888
color0=#0a0a0a
color8=#333333
color1=#cc3333
color9=#dd5555
color2=#33aa44
color10=#55cc66
color3=#aaaa00
color11=#cccc44
color4=#3355cc
color12=#5577dd
color5=#883388
color13=#aa55aa
color6=#338888
color14=#55aaaa
color7=#bbbbbb
color15=#eeeeee
EOF
        ;;
    matrix_green)
        cat > ~/.termux/colors.properties << 'EOF'
background=#000800
foreground=#00ee00
cursor=#00ff00
color0=#000800
color8=#003300
color1=#cc0000
color9=#ee4444
color2=#00ee00
color10=#00ff44
color3=#aaee00
color11=#ccff44
color4=#004488
color12=#0066cc
color5=#00aa44
color13=#44cc88
color6=#00dd88
color14=#00ffaa
color7=#88ee88
color15=#ccffcc
EOF
        ;;
esac

# Increment index
echo $(( (IDX + 1) % ${#SCHEMES[@]} )) > "$INDEX_FILE"
termux-reload-settings 2>/dev/null
COLOREOF

    chmod +x ~/.termux/auto_color.sh

    # Add to .bashrc and .zshrc so it runs every time
    for rcfile in ~/.bashrc ~/.zshrc; do
        if [ -f "$rcfile" ]; then
            # Remove old entry if exists
            sed -i '/auto_color.sh/d' "$rcfile"
            # Add at top (after first line)
            echo "" >> "$rcfile"
            echo "# MSMods Pro - Auto Color" >> "$rcfile"
            echo "bash ~/.termux/auto_color.sh 2>/dev/null" >> "$rcfile"
        fi
    done
    # Also init for bash if no .bashrc
    if [ ! -f ~/.bashrc ]; then
        echo "bash ~/.termux/auto_color.sh 2>/dev/null" > ~/.bashrc
    fi

    echo -e "\n${left_pad}${G} ✔ Auto Color Changer ACTIVATED!${RS}"
    echo -e "${left_pad}${Y}   → 10 color themes will rotate every Termux open!${RS}"
    echo -e "${left_pad}${C}   Themes: Cyber Blue, Neon Purple, Hacker Green, Fire Red,${RS}"
    echo -e "${left_pad}${C}           Golden Sun, Ocean Teal, Plasma Pink, Arctic White,${RS}"
    echo -e "${left_pad}${C}           Shadow Dark, Matrix Green${RS}"
    sleep 2
    menu
}

# [09] Disable Auto Color
9line() {
    for rcfile in ~/.bashrc ~/.zshrc; do
        [ -f "$rcfile" ] && sed -i '/auto_color.sh/d' "$rcfile" && sed -i '/MSMods Pro - Auto Color/d' "$rcfile"
    done
    echo -e "\n${left_pad}${G} ✔ Auto Color Disabled.${RS}"
    sleep 1
    menu
}

# [10] Cyber Lock
10line() {
    banner
    echo -e "${left_pad}${C}⟦ CYBER LOCK SETUP ⟧${RS}"
    echo ""
    echo -ne "${left_pad}${Y} Create Access Key: ${RS}"
    read -s new_pass
    echo

    lock_code="#LOCK_START
clear
echo -e '\033[1;32m'
echo '  Initializing MSMods secure environment...'
sleep 0.2
echo '  Verifying encrypted credentials...'
sleep 0.2
clear
attempt=1
while [ \$attempt -le 3 ]; do
    echo -e \"\n\033[1;36m╔══════════════════════════════════════╗\"
    echo -e \"║     \033[1;31m MSMods SECURE SHELL \033[1;36m           ║\"
    echo -e \"║   \033[1;33m github.com/MSMods-Pro \033[1;36m           ║\"
    echo -e \"╚══════════════════════════════════════╝\033[0m\"
    echo -ne \"\033[1;33m [Attempt \$attempt/3] Enter Key: \033[0m\"
    read -s pass_input
    echo
    if [ \"\$pass_input\" = \"$new_pass\" ]; then
        echo -e \"\033[1;32m ✔ ACCESS GRANTED. Welcome back!\\033[0m\"
        sleep 1
        clear
        break
    else
        echo -e \"\033[1;31m ✘ ACCESS DENIED.\\033[0m\"
        if [ \$attempt -eq 3 ]; then
            exit
        fi
        attempt=\$((attempt + 1))
    fi
done
#LOCK_END"

    add_to_top() {
        local file=$1
        if [ -f "$file" ]; then
            echo "$lock_code" > "$file.tmp"
            cat "$file" >> "$file.tmp"
            mv "$file.tmp" "$file"
        else
            echo "$lock_code" > "$file"
        fi
    }
    add_to_top ~/.bashrc
    [ -f ~/.zshrc ] && add_to_top ~/.zshrc
    echo -e "\n${left_pad}${G} ✔ Cyber Lock Activated!${RS}"
    sleep 2
    menu
}

# [11] Remove Lock
11line() {
    sed -i '/#LOCK_START/,/#LOCK_END/d' ~/.bashrc
    [ -f ~/.zshrc ] && sed -i '/#LOCK_START/,/#LOCK_END/d' ~/.zshrc
    echo -e "\n${left_pad}${G} ✔ Lock Removed.${RS}"
    sleep 1
    menu
}

# [12] System Info Dashboard
12line() {
    banner
    echo -e "${left_pad}${C}⟦ SYSTEM INFO DASHBOARD ⟧${RS}"
    echo ""
    draw_line "╔" "╗"
    print_center "◈  MSMods Pro System Monitor  ◈" "$M"
    draw_thin "╠" "╣"
    DEVICE=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
    ANDROID=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    KERNEL=$(uname -r)
    ARCH=$(uname -m)
    UPTIME=$(uptime -p 2>/dev/null | sed 's/up //' || echo "N/A")
    CPU_CORES=$(nproc)
    STORAGE=$(df -h /data 2>/dev/null | awk 'NR==2{print $3"/"$2" ("$5" used)"}' || echo "N/A")
    MEM=$(free -m 2>/dev/null | awk 'NR==2{printf "%sMB / %sMB", $3, $2}' || echo "N/A")
    IP=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1 || echo "N/A")
    DATE_TIME=$(date "+%Y-%m-%d  %H:%M:%S")
    print_center " Device   : $DEVICE" "$W"
    print_center " Android  : $ANDROID" "$G"
    print_center " Kernel   : $KERNEL" "$C"
    print_center " Arch     : $ARCH" "$Y"
    print_center " Uptime   : $UPTIME" "$W"
    print_center " CPU Cores: $CPU_CORES" "$G"
    print_center " Storage  : $STORAGE" "$C"
    print_center " Memory   : $MEM" "$Y"
    print_center " Local IP : $IP" "$W"
    print_center " DateTime : $DATE_TIME" "$M"
    print_center "" "$W"
    draw_line "╚" "╝"
    echo ""
    echo -e "${left_pad}${C}Press ENTER to return...${RS}"
    read
    menu
}

# [13] Package Manager
13line() {
    banner
    echo -e "${left_pad}${C}⟦ PACKAGE MANAGER HUB ⟧${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${G} Update & Upgrade All\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Install a Package\n"
    printf "${left_pad}${C}[${W}3${C}]${R} Remove a Package\n"
    printf "${left_pad}${C}[${W}4${C}]${Y} Search Package\n"
    printf "${left_pad}${C}[${W}5${C}]${W} List Installed Packages\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back\n\n"
    echo -ne "${left_pad}${C}Select: ${RS}"
    read pkg_choice
    case $pkg_choice in
        1) apt update && apt upgrade -y ;;
        2) echo -ne "${left_pad}${Y}Package: ${RS}"; read pname; pkg install "$pname" -y ;;
        3) echo -ne "${left_pad}${Y}Package: ${RS}"; read pname; pkg remove "$pname" -y ;;
        4) echo -ne "${left_pad}${Y}Search: ${RS}"; read pname; pkg search "$pname" ;;
        5) pkg list-installed 2>/dev/null | less ;;
        0) menu; return ;;
    esac
    echo -e "\n${left_pad}${C}Press ENTER to continue...${RS}"; read
    13line
}

# [14] Network Tools
14line() {
    banner
    echo -e "${left_pad}${C}⟦ NETWORK TOOLS ⟧${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${G} My Public IP\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Ping a Host\n"
    printf "${left_pad}${C}[${W}3${C}]${Y} DNS Lookup\n"
    printf "${left_pad}${C}[${W}4${C}]${Y} Traceroute\n"
    printf "${left_pad}${C}[${W}5${C}]${M} Port Scan (nmap)\n"
    printf "${left_pad}${C}[${W}6${C}]${C} Download Speed Test\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back\n\n"
    echo -ne "${left_pad}${C}Select: ${RS}"
    read net_choice
    case $net_choice in
        1) echo -e "\n${left_pad}${G}Public IP: $(curl -s ifconfig.me || curl -s api.ipify.org)${RS}" ;;
        2) echo -ne "${left_pad}${Y}Host: ${RS}"; read host; ping -c 4 "$host" ;;
        3) echo -ne "${left_pad}${Y}Domain: ${RS}"; read domain; nslookup "$domain" 2>/dev/null || host "$domain" ;;
        4) pkg install inetutils -y 2>/dev/null; echo -ne "${left_pad}${Y}Target: ${RS}"; read host; traceroute "$host" ;;
        5) pkg install nmap -y 2>/dev/null; echo -ne "${left_pad}${Y}Target: ${RS}"; read host; nmap -sV "$host" ;;
        6) echo -e "${left_pad}${C}Testing speed...${RS}"; curl -o /dev/null -s --progress-bar https://speed.hetzner.de/100MB.bin ;;
        0) menu; return ;;
    esac
    echo -e "\n${left_pad}${C}Press ENTER to continue...${RS}"; read
    14line
}

# [15] File Manager
15line() {
    banner
    echo -e "${left_pad}${C}⟦ FILE MANAGER ⟧${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${G} List Files\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Navigate to Dir\n"
    printf "${left_pad}${C}[${W}3${C}]${Y} Create File\n"
    printf "${left_pad}${C}[${W}4${C}]${Y} Create Folder\n"
    printf "${left_pad}${C}[${W}5${C}]${R} Delete File/Folder\n"
    printf "${left_pad}${C}[${W}6${C}]${M} Copy File\n"
    printf "${left_pad}${C}[${W}7${C}]${M} Move/Rename\n"
    printf "${left_pad}${C}[${W}8${C}]${C} Disk Usage\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back\n\n"
    echo -ne "${left_pad}${C}Select: ${RS}"
    read fm_choice
    case $fm_choice in
        1) ls -la --color=auto ;;
        2) echo -ne "${left_pad}${Y}Path: ${RS}"; read fpath; cd "$fpath" 2>/dev/null && echo -e "${G}Now in: $(pwd)${RS}" ;;
        3) echo -ne "${left_pad}${Y}Filename: ${RS}"; read fname; touch "$fname" && echo -e "${G}Created.${RS}" ;;
        4) echo -ne "${left_pad}${Y}Folder: ${RS}"; read fname; mkdir -p "$fname" && echo -e "${G}Created.${RS}" ;;
        5) echo -ne "${left_pad}${R}Delete: ${RS}"; read fname; rm -rf "$fname" && echo -e "${G}Deleted.${RS}" ;;
        6) echo -ne "${left_pad}${Y}Src: ${RS}"; read src; echo -ne "${left_pad}${Y}Dst: ${RS}"; read dst; cp -r "$src" "$dst" && echo -e "${G}Copied.${RS}" ;;
        7) echo -ne "${left_pad}${Y}Src: ${RS}"; read src; echo -ne "${left_pad}${Y}Dst: ${RS}"; read dst; mv "$src" "$dst" && echo -e "${G}Moved.${RS}" ;;
        8) du -sh * 2>/dev/null | sort -h ;;
        0) menu; return ;;
    esac
    echo -e "\n${left_pad}${C}Press ENTER to continue...${RS}"; read
    15line
}

# [16] Backup & Restore
16line() {
    banner
    echo -e "${left_pad}${C}⟦ BACKUP & RESTORE ⟧${RS}"
    echo ""
    printf "${left_pad}${C}[${W}1${C}]${G} Backup ZSH Config\n"
    printf "${left_pad}${C}[${W}2${C}]${G} Backup Color Theme\n"
    printf "${left_pad}${C}[${W}3${C}]${Y} Restore ZSH Config\n"
    printf "${left_pad}${C}[${W}4${C}]${Y} Restore Color Theme\n"
    printf "${left_pad}${C}[${W}0${C}]${R} Back\n\n"
    echo -ne "${left_pad}${C}Select: ${RS}"
    read bk_choice
    BACKUP_DIR=~/MSMods_backup
    mkdir -p "$BACKUP_DIR"
    case $bk_choice in
        1) cp ~/.zshrc "$BACKUP_DIR/zshrc.bak" 2>/dev/null && echo -e "${G}✔ Backed up!${RS}" ;;
        2) cp ~/.termux/colors.properties "$BACKUP_DIR/colors.bak" 2>/dev/null && echo -e "${G}✔ Colors backed up!${RS}" ;;
        3) cp "$BACKUP_DIR/zshrc.bak" ~/.zshrc 2>/dev/null && echo -e "${G}✔ Restored!${RS}" ;;
        4) cp "$BACKUP_DIR/colors.bak" ~/.termux/colors.properties 2>/dev/null && termux-reload-settings && echo -e "${G}✔ Colors restored!${RS}" ;;
        0) menu; return ;;
    esac
    echo -e "\n${left_pad}${C}Press ENTER to continue...${RS}"; read
    16line
}

# [17] Update MSMods Pro
17line() {
    echo -e "\n${left_pad}${C}Updating MSMods Pro from GitHub...${RS}"
    rm -rf ~/MSMods
    cd ~
    git clone https://github.com/MSMods-Pro/Termax-Theme-MSMods.git MSMods
    cd ~/MSMods && bash os.sh
}

# ─── MAIN MENU ───────────────────────────────────────────────────
menu() {
    banner
    draw_line "╔" "╗"
    print_center "  MSMods Pro — MAIN MENU  " "$M"
    draw_thin "╠" "╣"
    print_center "" "$W"
    print_center " [01]  Full Setup              [Setup] " "$G"
    print_center " [02]  Zsh Setup               [Shell] " "$G"
    print_center " [03]  Switch to Zsh           [Shell] " "$G"
    print_center " [04]  Switch to Bash          [Shell] " "$G"
    print_center " [05]  Zsh Banner ★ Multi-Design [Theme]" "$Y"
    print_center " [06]  Zsh Prompt Theme        [Theme] " "$Y"
    print_center " [07]  Highlight/AutoSuggest   [Theme] " "$Y"
    print_center " [08]  Auto Color Changer ★ NEW [Color]" "$M"
    print_center " [09]  Disable Auto Color      [Color] " "$C"
    print_center " [10]  Add Cyber Lock          [Sec]   " "$B"
    print_center " [11]  Remove Cyber Lock       [Sec]   " "$R"
    print_center " [12]  System Info Dashboard   [Info]  " "$C"
    print_center " [13]  Package Manager Hub     [Pkg]   " "$M"
    print_center " [14]  Network Tools           [Net]   " "$M"
    print_center " [15]  File Manager            [Files] " "$M"
    print_center " [16]  Backup & Restore        [Bkp]   " "$Y"
    print_center " [17]  Update MSMods Pro       [Upd]   " "$W"
    print_center " [00]  Exit                            " "$R"
    print_center "" "$W"
    draw_line "╚" "╝"
    echo ""
    echo -e "${left_pad}${DIM}${C}  github.com/MSMods-Pro  |  t.me/MSModsPro${RS}"
    echo ""
    echo -ne "${left_pad}${C}  ❯❯ Selection: ${RS}"
    read a
    case $a in
        1|01)  1line ;;
        2|02)  2line ;;
        3|03)  3line ;;
        4|04)  4line ;;
        5|05)  5line ;;
        6|06)  6line ;;
        7|07)  7line ;;
        8|08)  8line ;;
        9|09)  9line ;;
        10)    10line ;;
        11)    11line ;;
        12)    12line ;;
        13)    13line ;;
        14)    14line ;;
        15)    15line ;;
        16)    16line ;;
        17)    17line ;;
        0|00)  echo -e "\n${left_pad}${R} Goodbye from MSMods Pro!${RS}\n"; exit ;;
        *)     menu ;;
    esac
}

menu
