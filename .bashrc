export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
if [ -f "$XDG_CONFIG_HOME/bash/bashrc" ]; then
	source "$XDG_CONFIG_HOME/bash/bashrc"
fi

