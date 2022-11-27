unsetopt PROMPT_SP
# to load a random theme run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="firewalltheme"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh/themes/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

#if [ -f ~/.vimrc ]; then
#	. ~/.vimrc
#fi
#
#if [ -f ~/.config/nvim/init.lua ]; then
#	. ~/.config/nvim/init.lua
#fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi
