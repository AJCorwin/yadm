if [ -f "$HOME/.local/bin/lvim" ] ; then
  alias vim="$HOME/.local/bin/lvim"
fi

if [ -f "/usr/bin/vim" ] ; then
	export EDITOR="vim"
fi

if [ -f "/usr/bin/nvim" ]; then
	alias vim"usr/bin/nvim"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    export PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/doom/" ] ; then
    export DOOMDIR="$HOME/.config/doom/"
fi

if [ -f "/usr/bin/exa" ] ; then
    alias ls="exa --grid --icons --color=always"
    alias ll="exa alh --long --color=always --icons"
    alias tree="exa --tree --long --color=always --icons"
    alias lS="exa -1 --icons --color=always"
    alias lt="exa --tree --level=2 --color=always --icons"
fi

if [ -f "$HOME/.cargo/bin/bat" ] ; then
    alias cat="bat"
fi

export PATH=~/.npm-global/bin:$PATH

alias notebook="~/.local/bin/jupyter-notebook --no-browser"
alias DOOM="tmux new -d '$HOME/.emacs.d/bin/doom run'"

alias gcode="cd $HOME/Code"
alias ghr="cd $HOME/Github-Repos"
alias zconf="vim ~/.zshrc"
alias proconf="vim ~/.profile"
export DOOMDIR="$HOME/.config/doom"
#. "$HOME/.cargo/env"
