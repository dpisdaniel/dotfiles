call plug#begin('~/.config/nvim/plugged')

Plug 'tmux-plugins/vim-tmux'
call plug#end()

" Enable hybrid line numbers
set relativenumber number

" A small set of autocmds that make sure that relativenumber is only set when
" in normal mode. In insert mode and when losing focus from vim (for example
" Alt-Tabbing somewhere), The regular set number setting is the only one that
" is left, for improved readability
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Make sure set number works in vim help files since the set number in
" init.vim doesn't work 
autocmd FileType help setlocal number

" Make sure that in C files we don't go above 80 chars per line
autocmd FileType c setlocal colorcolumn=80

" Enable syntax processing
syntax enable

" Unify the tabbing creation to 4 spaces no matter what
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Show the commands being inputted in a sequence
set showcmd

" Emphasizes the current line
set cursorline

" For now, make it so K searches in :help and not man
" set keywordprg=

" Cycle through matches when tab-completing commands
set wildmenu

" enable filetype-specific indentation
filetype indent on

let mapleader="\<Space>"

" Map the pesky Escape key to a better alternative
inoremap jj <Esc>
inoremap kk <Esc>

" Create a vertical split using vv
nnoremap vv <C-w>v
