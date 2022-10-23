if [ -f "/usr/bin/nvim" ] ; then
   alias vim="/usr/bin/nvim"
fi

if [ -f "$HOME/.local/bin/lvim" ] ; then
  alias vim="$HOME/.local/bin/lvim"
fi

if [ -f "/usr/bin/vim" ] ; then
    export EDITOR="vim"
fi

if [ -f "$HOME/.local/bin/lvim" ] ; then
  alias vim="$HOME/.local/bin/lvim"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    export PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.doom.d/" ] ; then
    export DOOMDIR="$HOME/.config/.doom.d"
fi

if [ -f "$HOME/.cargo/bin/exa" ] ; then
    alias ls="exa"
    alias ll="exa -alh"
    alias tree="exa --tree"
fi

if [ -f "/usr/bin/exa" ] ; then
    alias ls="exa"
    alias ll="exa -alh"
    alias tree="exa --tree"
fi

if [ -f "$HOME/.cargo/bin/bat" ] ; then
    alias cat="bat"
fi

alias notebook="~/.local/bin/jupyter-notebook --no-browser"

alias gcode="cd $HOME/Code"
alias ghr="cd $HOME/Github-Repos"
alias tree="exa --tree"
alias zconf="vim ~/.zshrc"
alias proconf="vim ~/.profile"
export DOOMDIR="$HOME/.config/doom"
. "$HOME/.cargo/env"
