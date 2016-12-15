" Vim-plug: A minimalistic Vim plugin manager
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Fuzzy file searcher, fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Random colorscheme
Plug 'iCyMind/NeoSolarized'
"Plug 'altercation/vim-colors-solarized'

" Awesome autocompletion
" Plug 'Valloric/YouCompleteMe'

" Nerdtree File Browser
Plug 'scrooloose/nerdtree'

" Tags!
Plug 'xolox/vim-easytags'

" More tags!
Plug 'majutsushi/tagbar'

" Generate YouCompleteMe files (:YcmGenerateConfig)
" Plug 'rdnetto/YCM-Generator'

" Put the other curly brace in for me!
Plug 'jiangmiao/auto-pairs'

" File Tree
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'

" Syntax checking
" Plug 'vim-syntastic/syntastic'

" CTags (run ctags -R .)
Plug 'craigemery/vim-autotag'

" Start screen for vim!
Plug 'mhinz/vim-startify'

" Take notes in vim
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Comments are nice
Plug 'tpope/vim-commentary'

call plug#end()

" Show color limit
set colorcolumn=80

" Disabled annoying YCM error checking that was wrong
let g:ycm_show_diagnostics_ui = 0

" Set theme to solarized
set background=dark
colorscheme NeoSolarized
let g:neosolarized_contrast = "normal"

" Inspired by spacemacs
let mapleader = "\<Space>"

" Nerd tree toggle
map <leader>f :NERDTreeToggle<CR>

" Tag bar bindings
map <leader>t :TagbarToggle<CR>

" FZF bindings to be a little like spacemacs again
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Ag<CR>

" Navigate splits by <leader>w{hjkl}
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>

" Tabs to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
