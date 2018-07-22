" user settings
filetype plugin indent on
" show existing tab with 4 spaces width set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Enable mouse interactions. Doesn't hurt anything
set mouse=a

" Navigate tabs with C-1,2,3,4...
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

" New tab
nnoremap <leader>n :tabnew<CR>

" True color support
set termguicolors

let g:netrw_liststyle=3

let mapleader="\<SPACE>"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
" Note, this installs fzf to system
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'w0rp/ale'
Plug 'Rykka/riv.vim'
Plug 'vimwiki/vimwiki'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()

" gutentags
let g:gutentags_ctags_extra_args = ['--exclude=build*']

" solarized
syntax enable
set background=dark
colorscheme NeoSolarized

" nerd commenter
let NERDSpaceDelims=1

" vim fugitive
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
" command! -bang -nargs=* GGrep
  " \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%'))

" syntastic
" none

" fzf
nnoremap <Leader>a :GGrep<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>o :Files<CR>
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

set splitbelow
set splitright

set clipboard=unnamed

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Launch files are xml
au BufReadPost *.launch set syntax=xml
