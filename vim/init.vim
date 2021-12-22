
" Specify a directory for plugins
call plug#begin('~/.config/vim-plug')

Plug 'dense-analysis/ale'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'mcchrish/nnn.vim'
Plug 'preservim/tagbar'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()

" Set the colorscheme
colorscheme solarized8_high

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
syntax on
syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Set Tab Width Command
fu! SetTabWidth(w)
	let &l:shiftwidth = a:w
	let &l:tabstop = a:w
	let &l:softtabstop = a:w
endf
command! -nargs=* SetTabWidth call SetTabWidth(<f-args>)

" ===================== ALE - linting engine ==========================
let g:ale_linters = {
			\	'cs': ['OmniSharp'],
			\	'rust': ['analyzer'],
			\}
nnoremap <silent> <Leader>ad :ALEDetail<CR>

" ======================= Autoformat ======================================
nnoremap <silent> <C-k> :Autoformat<CR>

"====================== coc.vim =================================================
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" =============================== FZF ===========================
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

"=================================== Git Gutter =====================
set updatetime=250
"let g:gitgutter_max_signs = 500
" No mapping
let g:gitgutter_map_keys = 0
" Colors
" I'm not sure this section accomplishes anything when a colorscheme is set
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
nmap <silent> <Leader>gnh :GitGutterNextHunk<CR>
nmap <silent> <Leader>gph :GitGutterPrevHunk<CR>
nmap <silent> <Leader>gpv :GitGutterPreviewHunk<CR>
nmap <silent> <Leader>gsh :GitGutterStageHunk<CR>
nmap <silent> <Leader>guh :GitGutterUndoHunk<CR>


" ================================ Lightline config ==========================
" Display git branch
let g:lightline = {
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }
" Fix lightline colors when running sudo
if !has('gui_running')
  set t_Co=256
endif

" ==================================== Omnisharp ============================

" Set OmniSharp-vim log dir
let g:OmniSharp_log_dir = $HOME . '/.omnisharp_vim_log'
let g:Omnisharp_selector_iu = 'fzf'

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  "autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu :OmniSharpFindUsages<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd :OmniSharpPreviewDefinition<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi :OmniSharpPreviewImplementations<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost :OmniSharpTypeLookup<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd :OmniSharpDocumentation<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx :OmniSharpFixUsings<CR>
  autocmd FileType cs nmap <silent> <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  autocmd FileType cs imap <silent> <buffer> <C-\> :OmniSharpSignatureHelp<CR>

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ :OmniSharpNavigateUp<CR>
  autocmd FileType cs nmap <silent> <buffer> ]] :OmniSharpNavigateDown<CR>
  " Find all code errors/warnings for the current solution and populate the quickfix window<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc :OmniSharpGlobalCodeCheck<CR>
  " Contextual code actions uses fzf, vim-clap, CtrlP or unite.vim selector when available<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca :OmniSharpCodeActions<CR>
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca :OmniSharpCodeActions<CR>
  " Repeat the last code action performed does not use a selector<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. :OmniSharpCodeActionRepeat<CR>
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. :OmniSharpCodeActionRepeat<CR>

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= :OmniSharpCodeFormat<CR>

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm :OmniSharpRename<CR>

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre :OmniSharpRestartServer<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst :OmniSharpStartServer<CR>
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp :OmniSharpStopServer<CR>
augroup END

" Enable snippet completion, using the ultisnips plugin
let g:OmniSharp_want_snippet=1

" ==================================== Tagbar ==============================
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
