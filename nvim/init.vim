" user settings
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let mapleader="\<SPACE>"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
" Note, this installs fzf to system
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()

" solarized
syntax enable
set background=light
colorscheme solarized

" nerd commenter
let NERDSpaceDelims=1

" vim fugitive
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" syntastic
" none

" fzf
nnoremap <Leader>a :GGrep<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>

" ale
let g:ale_linters = {'cpp' : ['clangcheck']}
" let g:ale_linters = {'cpp' : ['clangtidy']}
" let g:ale_linters = {'cpp' : ['g++']}
let g:ale_cpp_clangcheck_executable = 'clang-check-3.9'
let g:ale_cpp_clangtidy_executable = 'clang-tidy-4.0'
let g:ale_cpp_clang_executable = 'clang++-3.9'

" grab the syntastic_cpp_config file in directory vim was started
let g:ale_cpp_gcc_options="-std=c++14 -Wall " . system("cat .syntastic_cpp_config | tr '\n' ' '")
if v:shell_error
    let g:ale_cpp_gcc_options="std=c++14 -Wall"
endif
