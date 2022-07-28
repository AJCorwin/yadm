if [ -f "/usr/bin/nvim" ] ; then
   alias vim="/usr/bin/nvim"
fi

if [ -f "$HOME/.local/bin/lvim" ] ; then
  alias vim="$HOME/.local/bin/lvim"
fi

if [ -f "/usr/bin/vim" ] ; then
    export EDITOR="vim"
fi