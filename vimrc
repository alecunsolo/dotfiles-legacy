" Vim, not Vi
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Line numbers
set number
set relativenumber

set nowrap
syntax on

" Whitespaces
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴

" Search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
nnoremap <leader><space> :noh<cr>

" Cool kids don't use arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Allow cursor movements during insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-d> <end>

filetype plugin indent on

" indendation stuff
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

" reload a file if changed
set autoread
set pastetoggle=<F2>

" For statusbar
set laststatus=2

" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" Installed with pacman
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" vimgutter relies on this value to refresh signs
set updatetime=100

" Ctrl-n toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" If no files were specified fire NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1

" reload a file if changed
set autoread
" use F2 to toggle paste
set pastetoggle=<F2>

" For statusbar
set laststatus=2

" If no files were specified fire NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1

" Useful custom commands
command! Reload execute "source ~/.vimrc"
command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"

" Abbreviations
iabbr _AC Alessandro Cunsolo
iabbr __AC alessandro.cunsolo@gmail.com

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

