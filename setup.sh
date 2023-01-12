#!/usr/bin/env bash

set -e

copy_files(){
  mkdir -p "$DEST_DIR"
  cp -nv "$SOURCE_FILE" "$DEST_DIR"
}

SCRIPT_DIR=$(dirname $(readlink -f "$0"))

if command -v psql > /dev/null 2>&1; then
  echo "Postgres is already installed, skipping"
  install_postgres=false
else
  echo "Download and install Postgres? (Yes/No)"
  read -r install_postgres
  if [ "$install_postgres" != "Yes" ]; then
    install_postgres=false
  fi
fi

if command -v fish > /dev/null 2>&1; then
  echo "Fish is already installed, skipping"
  install_fish=false
else
  echo "Install and use Fish shell? (Yes/No)"
  read -r install_fish
  if [ "$install_fish" != "Yes" ]; then
    install_fish=false
  fi
fi

echo "Configure Git? (Yes/No)"
read -r config_git
if [ "$config_git" != "Yes" ]; then
  config_git=false
fi

echo "Update and upgrade apt? (Yes/No)"
read -r update_apt
if [ "$update_apt" = "Yes" ]; then
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
fi

if command -v curl > /dev/null 2>&1; then
  echo "curl is already installed, skipping"
else
  sudo apt update
  sudo apt install -y curl
fi

if command -v git > /dev/null 2>&1; then
  echo "Git is already installed, skipping"
else
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo apt update
  sudo apt install -y git
fi

if [ "$install_fish" = "Yes" ]; then
  sudo apt install -y fish
  FNM_DIR=~/.fnm
  FISH_CONFIG_DIR=~/.config/fish/conf.d/

  if [ -d "$FNM_DIR" ]; then
    echo "fnm already exists at $FNM_DIR, skipping"
  else
    echo "Installing fnm"
    sudo apt install -y unzip
    curl -fsSL "https://fnm.vercel.app/install" | bash
    export PATH="~/.local/share/fnm:$PATH"
    eval "`fnm env`"
    fnm install v18
    fnm use v18
    fnm default v18
    npm i -g npm
    npm i -g @feltcoop/gro
    mkdir -p "$FISH_CONFIG_DIR"
    SOURCE_FILE="$SCRIPT_DIR/fish/settings.fish"
    DEST_DIR="$FISH_CONFIG_DIR"
    copy_files
  fi
fi

DEV_DIR=~/dev
if [ -d "$DEV_DIR" ]; then
  echo "$DEV_DIR already exists, skipping"
else
  echo "Creating $DEV_DIR"
  mkdir "$DEV_DIR"
fi

if [ "$config_git" = "true" ]; then
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  git config --global core.editor vim
fi

if [ "$install_postgres" = "true" ]; then
  #TODO: add command here
  echo "Postgres installation command here"
fi

if [ "$install_fish" = "true" ]; then
  chsh -s $(command -v fish)
fi

echo "Setup complete."