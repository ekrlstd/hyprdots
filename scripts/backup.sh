#!/bin/bash
# --- CONFIGURATION ---

REPO_DIR="$HOME/system/configs"
REPO_DIR2="$HOME/system/nvim"
TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

echo "Syncing to GitHub..."

# --- configs + scripts + pkgs ---
#
# 1. Ensure we are in the repo
cd "$REPO_DIR" || exit

# 2. Copy the latest configs into the repo folder
mkdir -p dotfiles scripts pkg_lists
cp -r ~/.config/hypr ./dotfiles/
cp -r ~/.config/waybar ./dotfiles/
cp -r ~/.config/alacritty ./dotfiles/
cp -r ~/.config/tofi ./dotfiles/
cp -r ~/.config/mako ./dotfiles/
cp -r ~/.local/bin/*.sh ./scripts/

# 3. Update Package Lists
pacman -Qqen >./pkg_lists/pacman_list.txt
yay -Qqem >./pkg_lists/yay_list.txt
flatpak list --columns=application >./pkg_lists/flatpak_list.txt

# 4. Git Push
git add .
git commit -m "Backup: $TIMESTAMP"
git push -u origin main

# --- neovim ---
#
# 1. Ensure we are in the repo
cd "$REPO_DIR2" || exit

# 2. Copy the latest configs into the repo folder
cp -r ~/.config/nvim .

# 4. Git Push
git add .
git commit -m "Backup: $TIMESTAMP"
git push -u origin main
echo "All configs pushed"
