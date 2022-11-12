Set 'g:python3_host_prog'
call plug#begin('~/.vim/plugged') 
# Plugin Section
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
set number
set relativenumber
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set mouse=v
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cc=80
filetype plugin indent on

source $HOME/.vimrc

