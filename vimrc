" Four spaces is enough for a tab
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" <Esc> alternatives for insert mode
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Hide unsaved buffers
set hidden

" init.vim management
command! ConfReload execute "source $MYVIMRC"
command! ConfEdit execute ":edit $MYVIMRC"

" Disable Ex mode
nmap Q <Nop>

" Line numbers
set number
set relativenumber

" No arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Wrap stuff
set nowrap
nnoremap j gj
nnoremap k gk

" Whitespaces
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴

" Split behaviour
set splitright
set splitbelow

" Leader
let mapleader=','

" Split open
nnoremap gv :vertical wincmd f<CR>
nnoremap gs :above wincmd f<CR>

" Search stuff
set ignorecase
set smartcase
set showmatch

" File management
set autowrite
set autoread
nnoremap s :w<CR>

" Window management
nnoremap <leader>c :close<CR>
nnoremap <leader>o :only<CR>

" Quickly hide hightlight
nnoremap <leader><space> :noh<cr>

" Paste toggle
set pastetoggle=<F2>

" Duplicate line
noremap <Leader>y "zY"zp
inoremap <Leader>y <Esc>"zY"zpi

" Delete line
noremap <Leader>d dd
inoremap <Leader>d <C-O>dd

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Interface
Plug 'vim-airline/vim-airline' " Status bar
Plug 'altercation/vim-colors-solarized' " Colour scheme
Plug 'morhetz/gruvbox' " Another colour scheme

" Misc
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator' " Tmux integration
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" VSC
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Coding
Plug 'tpope/vim-commentary' " Comment/uncommend stuff
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }

call plug#end()

" Colour scheme
let g:gruvbox_italic=1
syntax enable
silent! colorscheme gruvbox
set background=dark
set cursorline

" vim-gitgutter use this value to update signs
set updatetime=100

" NERDTree
map <leader>N :NERDTreeToggle<CR>

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Always show statusbar
set laststatus=2

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" YAML
augroup FileType_yaml
    " use 2 spaces tab instead of 4
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" GO
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

" Vagrant
augroup vagrant
    autocmd!
    autocmd BufRead,BufNewFile Vagrantfile setlocal filetype=ruby ts=2 sts=2 sw=2 expandtab
augroup END

" Jenkinsfile
augroup jenkins
    autocmd!
    autocmd BufRead,BufNewFile Jenkinsfile setlocal filetype=groovy ts=4 sts=4 sw=4 expandtab
augroup END

" Remove trailing spaces
" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Clipboard
if has("macunix")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
endif

" Open file in the same directory of the currently open one
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
