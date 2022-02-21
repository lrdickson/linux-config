
" Specify a directory for plugins
call plug#begin('~/.config/vim-plug')

"Plug 'dense-analysis/ale'
Plug 'rafi/awesome-vim-colorschemes'
if executable("node")
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree'
Plug 'mcchrish/nnn.vim'
Plug 'preservim/tagbar'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
if executable("ctags")
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Set the colorscheme
if has('nvim-0.4')
	colorscheme solarized8_high
else
	colorscheme atom
endif

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
	"let &l:shiftwidth = a:w
	let &l:tabstop = a:w
	let &l:softtabstop = a:w
endf
command! -nargs=* SetTabWidth call SetTabWidth(<f-args>)

" ======================= Autoformat ======================================
nnoremap <silent> <C-k> :Autoformat<CR>

"====================== coc.vim =================================================
if executable("node")
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
endif

" =============================== FZF ===========================
"nnoremap <silent> <C-f> :Files<CR>
"nnoremap <silent> <Leader>f :Rg<CR>

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
nmap <silent> gnh :GitGutterNextHunk<CR>
nmap <silent> gph :GitGutterPrevHunk<CR>
nmap <silent> gpv :GitGutterPreviewHunk<CR>
nmap <silent> gsh :GitGutterStageHunk<CR>
nmap <silent> guh :GitGutterUndoHunk<CR>


" ================================ Lightline config ==========================
" DisplNextay git branch
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


" ================================== nnn ========================
" Use the same NNN session within a vim instance
let g:nnn#session = 'local'

" NNN
echo $EDITOR
fu! NNN(...)
	if has('nvim')
		if (executable('nvr') == 0)
			echo "Need to install neovim-remote if using neovim"
			return 0
		endif
	endif
	terminal export EDITOR='nvr --remote-tab-silent' && nnn
	"let $EDITOR = tmp
endf
command! -nargs=* NNN call NNN(<f-args>)

" ================================== remote neovim ========================

function! RemoteCommand(...)
	if has('nvim')
		if (executable('nvr') == 0)
			echo "Need to install neovim-remote if using neovim"
			return 0
		endif
		let cmdStart = '!nvr --servername '
	endif
	if a:0 == 0
		echo 'no arguments passed'
	endif
	if a:0 == 1
		let cmdStart = cmdStart . ' /tmp/nvimsocket '
		let cmd = cmdStart . a:1
	elseif a:0 > 1
		let cmdStart = cmdStart . a:1 . ' '
		let cmd = cmdStart . a:2
	endif
	execute cmd
	return 1
endfunction

fu! SendFile(...)
	let cmd = '--remote-silent ' . expand('%')
	quit
	if a:0 > 0
		call RemoteCommand(a:1, cmd)
		call RemoteCommand(a:1, '--remote-send E')
	else
		call RemoteCommand(cmd)
		call RemoteCommand('--remote-send E')
	endif
endf
command! -nargs=* -complete=file SendFile call SendFile(<f-args>)

fu! SendFileTab(...)
	let cmd = '--remote-tab-silent ' . expand('%')
	quit
	if a:0 > 0
		call RemoteCommand(a:1, cmd)
		call RemoteCommand(a:1, '--remote-send E')
	else
		call RemoteCommand(cmd)
		call RemoteCommand('--remote-send E')
	endif
endf
command! -nargs=* -complete=file SendFileTab call SendFileTab(<f-args>)

fu! SendFileSplit(...)
	let cmd = '-o ' . expand('%')
	quit
	if a:0 > 0
		call RemoteCommand(a:1, cmd)
		call RemoteCommand(a:1, '--remote-send E')
	else
		call RemoteCommand(cmd)
		call RemoteCommand('--remote-send E')
	endif
endf
command! -nargs=* -complete=file SendFileSplit call SendFileSplit(<f-args>)

fu! SendFileVSplit(...)
	let cmd = '-O ' . expand('%')
	quit
	if a:0 > 0
		call RemoteCommand(a:1, cmd)
		call RemoteCommand(a:1, '--remote-send E')
	else
		call RemoteCommand(cmd)
		call RemoteCommand('--remote-send E')
	endif
endf
command! -nargs=* -complete=file SendFileVSplit call SendFileVSplit(<f-args>)


" =================================== ssh =================================

fu! SshAuthorityIsSet()
	if exists("g:ssh_authority")
		return 1
	endif
	echo "g:ssh_authority not set"
	return 0
endf

function! SshHost()
	" Check if ssh_authority is set
	if (SshAuthorityIsSet() == 0)
		return
	endif

	" Get the host
	let result = split(g:ssh_authority, '@')
	if len(result) < 2
		echo "no user"
	endif
	return split(result[1], ':')[0]
endfunction

" Ssh
fu! Ssh(...)
	if a:0 > 0
		let ssh_authority = a:1
	elseif (SshAuthorityIsSet() == 1)
		let ssh_authority = g:ssh_authority
	else
		return
	endif
	execute 'edit term://ssh ' . ssh_authority
endf
command! -nargs=* Ssh call Ssh(<f-args>)

fu! Ping(...)
	" Get the host
	if a:0 > 0
		let host = a:1
	else
		let host = SshHost()
	endif

	" Execute the ping
	execute '!ping ' . host
endf
command! -nargs=* Ping call Ping(<f-args>)

function! SshClearHostKey()
	if (SshAuthorityIsSet() == 0)
		return
	endif
	let host = SshHost()
	execute '!ssh-keygen -R "' . host . '"'
endfunction
command! -nargs=* SshClearHostKey call SshClearHostKey(<f-args>)

" SCP download command
fu! ScpDownload(source, destination)
	if (SshAuthorityIsSet() == 0)
		return
	endif
	execute '!scp -r ' . g:ssh_authority . ':' . a:source . ' ' . a:destination
endf
command! -nargs=* -complete=file ScpDownload call ScpDownload(<f-args>)

" SCP edit command
fu! ScpEdit(f)
	if (SshAuthorityIsSet() == 0)
		return
	endif
	execute 'edit scp://' . g:ssh_authority . '/' . a:f
endf
command! -nargs=* -complete=file ScpEdit call ScpEdit(<f-args>)

" SCP upload command
fu! ScpUpload(source, destination)
	if (SshAuthorityIsSet() == 0)
		return
	endif
	execute '!scp -r ' . a:source . ' ' . g:ssh_authority . ':' . a:destination
endf
command! -nargs=* -complete=file ScpUpload call ScpUpload(<f-args>)

" ==================================== Tagbar ==============================
nnoremap <silent> tt :TagbarToggle<CR>
nnoremap <silent> tn :TagbarJumpNext<CR>
nnoremap <silent> tp :TagbarJumpPrev<CR>

" =========================== Load .vimlocal if it exists ====================
silent! so .vimlocal
