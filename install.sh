#!/bin/bash

set -Eeuo pipefail

C_RESET="\e[0m"
C_BLUE="\e[1;36m"
C_GREEN="\e[1;32m"
C_RED="\e[1;31m"
C_GRAY="\e[38;5;245m"

on_error() {
    echo -e "\n${C_RED}✖ Error at line $1${C_RESET}"
    echo -e "${C_GRAY}Installer stopped.${C_RESET}"
    exit 1
}
trap 'on_error $LINENO' ERR

spinner() {
    local pid=$1
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    tput civis 2>/dev/null || true
    while kill -0 "$pid" 2>/dev/null; do
        printf "\r ${C_BLUE}%s${C_RESET} Processing..." "${spin:i++%10:1}"
        sleep 0.1
    done
    tput cnorm 2>/dev/null || true
    printf "\r"
}

run() {
    "$@" >/dev/null 2>&1 &
    spinner $!
}

header() {
    clear
    echo -e "${C_BLUE}"
    figlet -f slant "MeduzaVip"
    echo -e "${C_RESET}"
    echo -e "${C_GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
    echo "  Stripe Checker • Universal Installer"
    echo "  Termux | Linux | Ubuntu"
    echo -e "${C_GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}\n"
}

step() { echo -e "\n${C_BLUE}▶ $1${C_RESET}"; }
ok()   { echo -e "${C_GREEN}✔ $1${C_RESET}"; }
fail() { echo -e "${C_RED}✖ $1${C_RESET}"; exit 1; }

if [ -d "/data/data/com.termux" ]; then
    PLATFORM="termux"
    PY="python"
    SUDO=""
else
    PLATFORM="linux"
    PY="python3"
    SUDO="sudo"
fi

step "Preparing system"

if ! command -v git >/dev/null 2>&1; then
    [ "$PLATFORM" = "termux" ] && pkg install -y git || sudo apt install -y git
fi

if ! command -v figlet >/dev/null 2>&1; then
    [ "$PLATFORM" = "termux" ] && pkg install -y figlet || sudo apt install -y figlet
fi

header
ok "Platform detected: $PLATFORM"

REPO_URL="https://github.com/KianSantang777/stripechk.git"
TARGET_DIR="$HOME/stripechk"

step "Fetching source"
if [ ! -d "$TARGET_DIR" ]; then
    run git clone "$REPO_URL" "$TARGET_DIR"
    ok "Repository cloned"
else
    ok "Repository already exists"
fi

cd "$TARGET_DIR"

step "Updating system"
if [ "$PLATFORM" = "termux" ]; then
    run pkg update -y
    run pkg upgrade -y
else
    run $SUDO apt update -y
    run $SUDO apt upgrade -y
fi
ok "System updated"

if [ "$PLATFORM" = "termux" ]; then
    step "Configuring storage"
    run termux-setup-storage
    ok "Storage ready"
fi

step "Installing runtime packages"
if [ "$PLATFORM" = "termux" ]; then
    run pkg install -y python nano
else
    run $SUDO apt install -y python3 python3-pip nano
fi
ok "Runtime dependencies installed"

step "Checking Python"
command -v "$PY" >/dev/null || fail "Python not available"
ok "$($PY -V 2>&1)"

step "Installing Python libraries"
[ -f requirements.txt ] || fail "requirements.txt missing"
run $PY -m pip install --upgrade pip
run $PY -m pip install -r requirements.txt
ok "Python libraries installed"

step "Setting permissions"
run chmod -R 755 "$TARGET_DIR"
ok "Permissions applied"

APP="$TARGET_DIR/card.py"
[ -f "$APP" ] || fail "card.py not found"

echo -e "\n${C_GREEN}✔ Installation completed successfully${C_RESET}"
echo -e "${C_GRAY}Application will auto-restart on exit${C_RESET}\n"

sleep 1

while true; do
    $PY "$APP"
    echo -e "${C_GRAY}↻ Restarting in 5 seconds...${C_RESET}"
    sleep 5
done
