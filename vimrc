" Vim, not Vi
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Hidden
set hidden

" Open new vsplit to the right
set splitright

" Line numbers
set number
set relativenumber

set nowrap
syntax on

" Whitespaces
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴

" Autosave
set autowrite

" Esc
inoremap jj <Esc>

" Leader
let mapleader=','

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

" Easy buffer navigation
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

filetype plugin indent on

" Tabs
nnoremap <leader><Left> :tabPrevious<CR>
nnoremap <leader><Right> :tabNext<CR>
nnoremap <leader>0 :tabfirst<CR>
nnoremap <leader>$ :tablast<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

inoremap <leader><Left> <Esc>:tabprevious<CR>i
inoremap <leader><Right> <Esc>:tabNext<CR>i
inoremap <leader>0 <Esc>:tabfirst<CR>i
inoremap <leader>$ <Esc>:tablast<CR>i
inoremap <leader>1 <C-O>1gt
inoremap <leader>2 <C-O>2gt
inoremap <leader>3 <C-O>3gt
inoremap <leader>4 <C-O>4gt
inoremap <leader>5 <C-O>5gt
inoremap <leader>6 <C-O>6gt
inoremap <leader>7 <C-O>7gt
inoremap <leader>8 <C-O>8gt
inoremap <leader>9 <C-O>9gt

" Clipboards
noremap <Leader>yy "*y
noremap <leader>yp "*p
noremap <Leader>yY "+y
noremap <Leader>yP "+p

" Duplicate line
noremap <Leader>y yyp
inoremap <Leader>y <Esc>yypi

" Delete line
noremap <Leader>d dd
inoremap <Leader>d <C-O>dd

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
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Installed with pacman
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
call plug#end()

" For OSX
" set rtp+=/usr/local/opt/fzf/bin
set rtp+=/usr/local/opt/fzf

" vimgutter relies on this value to refresh signs
set updatetime=100

" Leader-N toggle NerdTree
map <leader>N :NERDTreeToggle<CR>

" If no files were specified fire NerdTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1

" reload a file if changed
set autoread
" use F2 to toggle paste
set pastetoggle=<F2>

" For statusbar
set laststatus=2

" Show powerline fonts
let g:airline_powerline_fonts = 1

" Useful custom commands
command! Reload execute "source ~/.vimrc"
command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"

" Abbreviations
iabbr _AC Alessandro Cunsolo
iabbr __AC alessandro.cunsolo@gmail.com

iabbr ERR
\if err != nil {
\<CR>
\<CR>}
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" add yaml stuffs
augroup FileType_yaml
    " use 2 spaces tab instead of 4
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Go stuff
augroup FileType_go
    autocmd!
    " Autocomplete
    autocmd FileType go inoremap <C-@> <C-x><C-o>
    " Common shortcuts
    autocmd FileType go nmap <leader>b  <Plug>(go-build)
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>i  <Plug>(go-info)
augroup END

" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1
" Always use quickfix, instead of location lists
let g:go_list_type = "quickfix"

let g:go_autotype_info = 1

" Navigate quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile setlocal filetype=ruby ts=2 sts=2 expandtab
augroup END
