if command -q xset
  xset r rate 180 90
end

tabs -4

alias cod="code"
alias co="code"
alias c="code"
alias gb="git branch"
alias gp="git push"
alias gpu="git push -u origin"
alias gl="git pull"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gc="git commit $1 && gp"
alias gcw="git commit -am wip && gp"
alias grs="git reset --soft HEAD^"
alias gsh="git stash"
alias gsa="git stash apply"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias gg="gro dev"
alias gtc="gro typecheck"
alias pg="sudo -u postgres"

export GIT_MERGE_AUTOEDIT=no
export VISUAL=code
export EDITOR="$VISUAL"