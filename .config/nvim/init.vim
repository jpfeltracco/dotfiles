" user settings
filetype plugin indent on
" show existing tab with 4 spaces width set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set smartindent
set cindent

" Enable mouse interactions. Doesn't hurt anything
set mouse=a

let mapleader="\<SPACE>"

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

set number

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
" Note, this installs fzf to system
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mileszs/ack.vim'
" Plug 'w0rp/ale'
Plug 'Rykka/riv.vim'
Plug 'vimwiki/vimwiki'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
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

" j - cd to recent / frequent directories
command! -nargs=* Jump :call Jump(<f-args>)
function! Jump(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd' fnameescape(path)
  endif
endfunction

nnoremap <Leader>j :Jump<space>

" fzf
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--no-hscroll'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--no-hscroll'},'right:50%'),
  \   <bang>0)

nnoremap <Leader>/ :GGrep<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>a/ :Ag<CR>
nnoremap <Leader>ap :Files<CR>

" nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>

" Vim fugitive
nnoremap <Leader>gd :Git! diff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>

" Buffers easier
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bw :bw<CR>
nnoremap <Leader>bn :new<CR>
nnoremap <Leader>bu :bu<CR>

" Build!
nnoremap <Leader>m :make -C build<CR>

" Tags!
nnoremap <Leader>t :TagbarToggle<CR>

" Natural splits
set splitbelow
set splitright

" Share clipboard across neovim sessions
set clipboard=unnamed

" Terminal settings
" Breaks fzf term windows, also allows you to get trapped in child neovim
" sessions if not careful
" tnoremap <ESC> <C-\><C-n>
tnoremap <C-\><C-\> <C-\><C-n>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Launch files are xml
au BufReadPost *.launch set syntax=xml
