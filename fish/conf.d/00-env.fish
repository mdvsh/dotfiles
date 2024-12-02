# Environment Setup

# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share

# Basic environment
set -gx EDITOR vim
set -gx VISUAL $EDITOR
set -gx TERM xterm-256color

# Development directories
set -gx PROJECTS_DIR $HOME/dev/projects
set -gx GOPATH $HOME/go

