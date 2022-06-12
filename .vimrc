set nocompatible
set termguicolors
set backspace=indent,eol,start
set directory^=$HOME/.vim/swapfiles//

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'morhetz/gruvbox'
Plugin 'gmarik/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'nvie/vim-flake8'
Plugin 'mileszs/ack.vim'
Plugin 'elmcast/elm-vim'
Plugin 'elixir-editors/vim-elixir'
call vundle#end()

syntax on
set number

set encoding=utf-8

set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set colorcolumn=120
set incsearch
set hlsearch

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

filetype plugin indent on

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:jsx_ext_required = 0

colorscheme gruvbox

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
