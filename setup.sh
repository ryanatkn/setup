#!/usr/bin/env bash

set -e

copy() {
  mkdir -p "$2"
  cp -nv "$1" "$2"
}

REPO_DIR=$(dirname "$(readlink -f "$0")")

# Function to prompt user for yes/no questions
prompt_yes_no() {
  local prompt="$1"
  local response
  while true; do
    read -p "$prompt (yes/no): " response
    case "$response" in
      [Yy]* ) echo "Yes"; return 0;;
      [Nn]* ) echo "No"; return 1;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

# Configure Git
if prompt_yes_no "Configure Git?"; then
    should_configure_git="Yes"
else
    should_configure_git="No"
fi

# Update and upgrade apt
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# Install curl if not present
if ! command -v curl > /dev/null 2>&1; then
  sudo apt install -y curl
fi

# git - https://git-scm.com/
if ! command -v git > /dev/null 2>&1; then
  sudo apt install -y git
fi

# Fish Shell -- https://fishshell.com/
FISH_CONFIG_DIR="$HOME/.config/fish/conf.d"
FISH_FUNCTIONS_DIR="$HOME/.config/fish/functions"
if ! command -v fish > /dev/null 2>&1; then
  sudo apt install -y fish
  installed_fish="Yes"
  copy "$REPO_DIR/fish/settings.fish" "$FISH_CONFIG_DIR/"
  copy "$REPO_DIR/fish/fish_prompt.fish" "$FISH_FUNCTIONS_DIR/"
else
  installed_fish="No"
fi

# fnm
if [ -d "$HOME/.fnm" ]; then
  FNM_INSTALL_DIR="$HOME/.fnm"
elif [ -n "$XDG_DATA_HOME" ]; then
  FNM_INSTALL_DIR="$XDG_DATA_HOME/fnm"
else
  FNM_INSTALL_DIR="$HOME/.local/share/fnm"
fi
if [ ! -d "$FNM_INSTALL_DIR" ]; then
  echo "Installing fnm"
  sudo apt install -y unzip
  curl -fsSL https://fnm.vercel.app/install | bash

  # set up fnm in Fish config manually, since it will autodetect Bash
  echo "Appending to $FNM_INSTALL_DIR:"
   {
      echo ''
      echo '# fnm'
      echo 'set FNM_PATH "'"$FNM_INSTALL_DIR"'"'
      echo 'if [ -d "$FNM_PATH" ]'
      echo '  set PATH "$FNM_PATH" $PATH'
      echo '  fnm env --use-on-cd | source'
      echo 'end'
    } | tee -a "$FISH_CONFIG_DIR/fnm.fish"
  
  # install Node.js and global packages
  export PATH="$FNM_INSTALL_DIR:$PATH"
  eval "$(fnm env)"
  fnm install v22
  fnm use v22
  fnm default v22
  npm i -g npm@latest
  npm i -g @ryanatkn/gro @changesets/cli
  echo "Installed fnm, node, npm, and gro"
fi

# create our conventional dev directory
DEV_DIR="$HOME/dev"
mkdir -p "$DEV_DIR"

# configure Git
if [ "$should_configure_git" = "Yes" ]; then
  echo "Configuring Git"
  echo "existing Git user: $(git config --global user.name)"
  read -p "Enter new Git user.name: " git_user_name
  echo "existing Git email: $(git config --global user.email)"
  read -p "Enter new Git user.email: " git_user_email
  git config --global user.name "$git_user_name"
  git config --global user.email "$git_user_email"
  # workflow options
  git config --global pull.rebase true # avoids tangling with merge commits
  git config --global fetch.prune true # deletes nonexistent remote branches on pull
  git config --global push.default simple # avoids polluting remote with local branches
  # some other nice options
  git config --global color.ui auto
  git config --global core.pager 'less -x1,5'
  git config --global init.defaultBranch main
  git config --global merge.conflictstyle diff3
  echo "Successfully configured Git"
fi

# Copy VSCode configs
REPO_VSCODE_DIR="$REPO_DIR/vscode"
VSCODE_USER_DIR="$HOME/.config/Code/User"
copy "$REPO_VSCODE_DIR/settings.json" "$VSCODE_USER_DIR/"
copy "$REPO_VSCODE_DIR/keybindings.json" "$VSCODE_USER_DIR/"
copy "$REPO_VSCODE_DIR/snips.code-snippets" "$VSCODE_USER_DIR/snippets/"

# Install Postgres
if ! command -v psql > /dev/null 2>&1; then
  echo "Installing Postgres"
  sudo apt -y install curl ca-certificates
  sudo install -d /usr/share/postgresql-common/pgdg
  sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
  sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  sudo apt update
  sudo apt -y install postgresql
  # TODO WSL needs something like this, but for correct Postgres version
  #copy "$REPO_DIR/fish/postgres.fish" "$FISH_CONFIG_DIR/"
  echo "Installed Postgres"
fi

# Change shell to Fish
if [ "$installed_fish" = "Yes" ]; then
  if chsh -s "$(which fish)"; then
    echo "Changed shell to Fish. Please log out and log back in for the change to take effect."
  else
    echo "Failed to change shell to Fish. You can do this manually by running: chsh -s $(which fish)"
  fi
fi

echo "Setup complete!"
echo "For more setup info see https://github.com/ryanatkn/setup"
echo "boop"
