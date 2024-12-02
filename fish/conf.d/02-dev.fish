# Dev Environment

# Python - pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# Node - fnm (Fast Node Manager)
fnm env | source

# OCaml
if test -f $HOME/.opam/opam-init/init.fish
    source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null
end