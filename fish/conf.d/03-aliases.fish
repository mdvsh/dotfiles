if type -q exa
  alias ls='exa --git'
  alias ll='exa -l --git'
  alias la='exa -la --git'
  alias tree='exa --tree '
end

if type -q bat
  alias cat='bat'
end

if type -q fd
  alias find='fd'
end

if type -q rg
  alias grep='rg'
end

# Git shortcuts
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

alias dev='cd $PROJECTS_DIR'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'