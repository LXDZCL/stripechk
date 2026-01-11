#!/usr/bin/env bash
set -Eeuo pipefail

C_RESET="\033[0m"
C_BLUE="\033[1;36m"
C_GREEN="\033[1;32m"
C_RED="\033[1;31m"
C_GRAY="\033[38;5;245m"

safe_sleep() {
    command -v sleep >/dev/null 2>&1 && sleep "$1" || :
}

on_error() {
    echo -e "\n${C_RED}✖ Error at line $1${C_RESET}"
    echo -e "${C_GRAY}Installer aborted.${C_RESET}"
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
        safe_sleep 0.1
    done
    tput cnorm 2>/dev/null || true
    printf "\r"
}

run_bg() {
    "$@" >/dev/null 2>&1 &
    spinner $!
}

header() {
    clear || true
    echo -e "${C_BLUE}"
    figlet -f slant "MeduzaVip" 2>/dev/null || echo "MeduzaVip"
    echo -e "${C_RESET}"
    echo -e "${C_GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
    echo "  Stripe Checker • Universal Installer"
    echo "  Termux | Linux | Ubuntu"
    echo -e "${C_GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}\n"
}

step() { echo -e "\n${C_BLUE}▶ $1${C_RESET}"; }
ok() { echo -e "${C_GREEN}✔ $1${C_RESET}"; }
fail() { echo -e "${C_RED}✖ $1${C_RESET}"; exit 1; }

if [[ -d "/data/data/com.termux" ]]; then
    PLATFORM="termux"
    PY="python"
    SUDO=""
else
    PLATFORM="linux"
    PY="python3"
    SUDO="sudo"
fi

install_pkg() {
    local pkg="$1"
    command -v "$pkg" >/dev/null 2>&1 && return 0
    if [[ "$PLATFORM" == "termux" ]]; then
        pkg install -y "$pkg"
    else
        $SUDO apt install -y "$pkg"
    fi
}

header
ok "Platform detected: $PLATFORM"

step "Preparing system"
install_pkg git
install_pkg figlet
install_pkg nano
ok "Base tools ready"

REPO_URL="https://github.com/KianSantang777/stripechk.git"
TARGET_DIR="$HOME/stripechk"

step "Fetching source code"
if [[ ! -d "$TARGET_DIR/.git" ]]; then
    run_bg git clone "$REPO_URL" "$TARGET_DIR"
    ok "Repository cloned"
else
    cd "$TARGET_DIR"
    run_bg git fetch origin
    run_bg git reset --hard origin/HEAD
    ok "Repository updated from origin"
fi

cd "$TARGET_DIR" || fail "Cannot access project directory"

step "Updating system"
if [[ "$PLATFORM" == "termux" ]]; then
    run_bg pkg update -y
    run_bg pkg upgrade -y
else
    run_bg $SUDO apt update -y
    run_bg $SUDO apt upgrade -y
fi
ok "System updated"

if [[ "$PLATFORM" == "termux" ]]; then
    step "Configuring storage"
    termux-setup-storage >/dev/null 2>&1 || true
    ok "Storage configured"
fi

step "Installing runtime"
if [[ "$PLATFORM" == "termux" ]]; then
    run_bg pkg install -y python
else
    run_bg $SUDO apt install -y python3 python3-pip
fi
ok "Python runtime ready"

command -v "$PY" >/dev/null || fail "Python not available"
ok "$($PY -V 2>&1)"

step "Installing Python libraries"
[[ -f requirements.txt ]] || fail "requirements.txt missing"
run_bg $PY -m pip install --upgrade pip
run_bg $PY -m pip install -r requirements.txt
ok "Python dependencies installed"

step "Applying permissions"
chmod -R 755 "$TARGET_DIR"
ok "Permissions applied"

APP="$TARGET_DIR/card.py"
[[ -f "$APP" ]] || fail "card.py not found"

update_repo() {
    cd "$TARGET_DIR" || return
    git fetch origin >/dev/null 2>&1 || return
    git reset --hard origin/HEAD >/dev/null 2>&1 || return
}

echo -e "\n${C_GREEN}✔ Installation completed successfully${C_RESET}"
echo -e "${C_GRAY}Auto-update & auto-restart enabled${C_RESET}\n"

safe_sleep 1

while true; do
    update_repo
    "$PY" "$APP" || true
    echo -e "${C_GRAY}↻ Restarting in 5 seconds...${C_RESET}"
    safe_sleep 5
done