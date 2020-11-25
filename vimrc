call plug#begin('~/.vim/plugged')
" Sensible defaults
Plug 'https://github.com/tpope/vim-sensible'
" Guess indentation settings
Plug 'https://github.com/tpope/vim-sleuth'
" <leader>ww to wiki
Plug 'https://github.com/vimwiki/vimwiki'
" Figure out comments
Plug 'https://github.com/tpope/vim-commentary'
" Fuzzy searching in style
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/seoul256.vim'
" :Move, :Delete commands
Plug 'https://github.com/tpope/vim-eunuch'
" Change directory based on .git/ folder
Plug 'https://github.com/airblade/vim-rooter'
" Hit gx on links to open them in browser
Plug 'https://github.com/tyru/open-browser.vim'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/qpkorr/vim-bufkill'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" General Config
nnoremap <SPACE> <Nop>
let mapleader=" "
set splitbelow
set splitright

" set termguicolors

set tabstop=4
set shiftwidth=4
set expandtab

set guifont=Menlo\ Regular:h12
command NormalZoom :set guifont=Menlo\ Regular:h12<CR>
command PresentZoom :set guifont=Menlo\ Regular:h18<CR>

nnoremap <leader>- :NormalZoom<CR>
nnoremap <leader>= :PresentZoom<CR>

" Remappings
nnoremap <leader>j :%!jq '.'<CR>

nnoremap <leader>f :GFiles<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>gf :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>w/ :Wiki<CR>
nnoremap <leader>d :BD!<CR>
tnoremap <C-W><BS> <C-W>:BD!<CR>

nnoremap <leader>ce :e $MYVIMRC<CR>
nnoremap <leader>cr :source $MYVIMRC<CR>
" nnoremap <leader>tt :tab term<CR>
nnoremap <leader>tt :silent !kitty @ launch --type=tab --cwd=current &<CR>
nnoremap <leader>tc :term++curwin<CR>
nnoremap <leader>tv :vert term<CR>

nnoremap <leader>sh :Help<CR>
nnoremap <leader>sw :Wiki<CR>

nnoremap <leader>ee :read !date '+%Y-%m-%d'<CR>

nnoremap <leader>st :put =strftime('= %Y-%m-%d =')<CR>
inoremap <M-t> <C-R>=strftime('%Y-%m-%d')<C-M>

" tnoremap <Esc> <C-\><C-n>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

set hidden "allow running terminals/unsaved buffers to be hidden

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions+=k  "make zoom better!

amenu TouchBar.🗒️\ Wiki <leader>ww
an TouchBar.-flexspace2-   <Nop>
amenu TouchBar.- :NormalZoom<CR>
amenu TouchBar.+ :PresentZoom<CR>

" Full screen by default
" set lines=1000
" set columns=1000

if has("gui_macvim")
  " Get meta bindings working in MacVim
  set macmeta
  " Only runs in macvim, binds command-num to go to specific tab, if in
  " terminal, escapes the gt command.
  for i in range(1, 9)
    execute "nnoremap \<D-" . i . "> " . i . "gt"
    execute "tnoremap \<D-" . i . "> \<C-W>" . i . "gt"
    execute "inoremap \<D-" . i . "> \<C-O>" . i . "gt"
  endfor
endif

" Send correct escape codes to interpret <M-b> as backwards word
" and <M-f> as forwards word when in a terminal session.
tmap <expr> ∫ SendToTerm("\<Esc>b")
tmap <expr> ƒ SendToTerm("\<Esc>f")
tmap <expr> † SendToTerm("\<Esc>t")
tmap <expr> <S-space> SendToTerm("")
tmap <expr> <C-enter> SendToTerm("")
func SendToTerm(what)
  call term_sendkeys('', a:what)
  return ''
endfunc

" No beep!
" set noeb vb t_vb=.
" set t_ut=""
let &t_ut=''

" Seroul256
" let g:seoul256_background = 245
let g:seoul256_background = 245
colorscheme seoul256

" VimWiki
let g:vimwiki_list = [
        \ {'path': '~/vimwiki',
        \  'auto_diary_index': 1, 'auto_generate_links': 1, 'diary_caption_level': 1,
        \  'auto_generate_tags': 1, 'auto_tags': 1, 'auto_toc': 1,
        \  'list_margin': 0,
        \ }]
" Turn off dumb creating new wikis in random repos
let g:vimwiki_global_ext = 0

command! -bang -nargs=* Wiki
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>).' ~/vimwiki', 1,
  \   fzf#vim#with_preview(), <bang>0)

" VimRooter
let g:rooter_patterns = ['.git']

" Vim Open Browser - gx would just curl, now it opens in browser!
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" let g:terminal_ansi_colors = [
"       \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
"       \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
"       \ '#626262', '#d75f87', '#87af87', '#ffd787',
"       \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4']

" Don't map leader to avoid delay in mappings like <leader>b
let g:BufKillCreateMappings = 0

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

" Coc.Nvim
nmap <silent> gd <Plug>(coc-definition)

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" " function! s:check_back_space() abort
" "   let col = col('.') - 1
" "   return !col || getline('.')[col - 1]  =~# '\s'
" " endfunction

" " Use <c-space> to trigger completion.
" " if has('nvim')
" "   inoremap <silent><expr> <c-space> coc#refresh()
" " else
" "   inoremap <silent><expr> <c-@> coc#refresh()
" " endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" " xmap <leader>f  <Plug>(coc-format-selected)
" " nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" " NeoVim-only mapping for visual mode scroll
" " Useful on signatureHelp after jump placeholder of snippet expansion
" if has('nvim')
"   vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
"   vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
" endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" " nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " " Manage extensions.
" " nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " " Show commands.
" " nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " " Find symbol of current document.
" " nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " " Search workspace symbols.
" " nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " " Do default action for next item.
" " nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " " Do default action for previous item.
" " nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " " Resume latest coc list.
" " nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
