
" PLUGINS =====================================================================
call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'

call plug#end()

" GENERAL =====================================================================
set ruler
set number
" Natural splits
set splitbelow
set splitright

" KEYBINDINGS =================================================================
let mapleader="\<SPACE>"

nnoremap <Leader>/ :Ag<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>a/ :Ag<CR>
nnoremap <Leader>ap :Files<CR>

noremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>j :Jump<space>

" THEME =======================================================================
set termguicolors " True color support

syntax enable
set background=dark
colorscheme solarized8

" FONT ========================================================================
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" JUMP ========================================================================
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

