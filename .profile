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

export DOOMDIR="$HOME/.config/doom"