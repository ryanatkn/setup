if command -q xset
  xset r rate 180 90
end

tabs -4

alias cod="code"
alias co="code"
alias c="code"
alias gb="git branch"
alias gp="git push"
alias gl="git pull"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gc="git commit $1 && gp"
alias gcw="git commit -am wip && gp"
alias gct="git commit -am todo && gp"
alias gcl="git commit -am changelog && gp"
alias gcm="git commit -am merge && gp"
alias gcf="git commit -am fix && gp"
alias gcu="git commit -am \"upgrade deps\" && gp"
alias grb="git rebase main"
alias grs="git reset --soft HEAD^"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias gg="gro dev"
alias pg="sudo -u postgres"

export VISUAL=code
export EDITOR="$VISUAL"