
" to determine what scripts are run on startup, use scriptnames


" Specify a directory for plugins
call plug#begin('~/.config/vim-plug')

Plug 'dense-analysis/ale'
Plug 'rafi/awesome-vim-colorschemes'
if executable("node")
       Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'zah/nim.vim'
Plug 'preservim/tagbar'
Plug 'vim-autoformat/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
if executable("ctags")
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'LnL7/vim-nix'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Set the colorscheme
if has('nvim-0.4')
	colorscheme deus
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

if has('nvim') && !empty($SSH_CONNECTION) && !empty($DISPLAY)
	unlet $DISPLAY
endif

" Set Tab Width Command
fu! SetTabWidth(w)
	"let &l:shiftwidth = a:w
	let &l:tabstop = a:w
	let &l:softtabstop = a:w
endf
command! -nargs=* SetTabWidth call SetTabWidth(<f-args>)

" Add cwindow keyboard shortcuts
nmap <Leader>cw :cwindow<CR>
nmap <Leader>cl :cclose<CR>
nmap <Leader>cf :cnext<CR>
nmap <Leader>cp :cprevious<CR>

" Omni Completion
" https://medium.com/usevim/vim-101-completion-compendium-97b4ebc3a45a
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" IDE like autocompletion
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"set completeopt=longest,menuone

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
"let g:ale_completion_enabled = 1

" Source if exists function
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction


" Initialize coc
if executable("node")
	call SourceIfExists("~/.vim/init_coc.vim")
endif

" ======================= Autoformat ======================================
nnoremap <silent> <C-k> :Autoformat<CR>

" =============================== diff ===========================
nmap <Leader>dg :diffget<CR>
nmap <Leader>dp :diffput<CR>

" =============================== EasyAlign ===========================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" NNN
fu! NNN(...)
	if (executable('nnn') == 0)
		echo "Need to install nnn before using it"
		return 0
	endif
	if has('nvim')
		if (executable('nvr') == 0)
			echo "Need to install neovim-remote if using neovim"
			return 0
		"else
			"let $NNN_OPENER = 'nvr --remote-tab-silent'
		endif
	endif
	"terminal nnn
	terminal
	call jobsend(b:terminal_job_id, "export NNN_OPENER='nvr --remote-tab-silent'\n")
	call jobsend(b:terminal_job_id, "nnn -c\n")
	call feedkeys('i')
endf
command! -nargs=* NNN call NNN(<f-args>)
nmap <leader>n :NNN<CR>

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
fu! ScpDownload(...)
	let destination = '.'
	if a:0 < 1
		echo 'Not enough arguments'
	elseif a:0 > 1
		let destination = a:2
	endif
	let source = a:1

	if (SshAuthorityIsSet() == 0)
		return
	endif
	execute '!scp -r ' . g:ssh_authority . ':' . source . ' ' . destination
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
fu! ScpUpload(...)
	let destination = '.'
	if a:0 < 1
		echo 'Not enough arguments'
	elseif a:0 > 1
		let destination = a:2
	endif
	let source = a:1

	if (SshAuthorityIsSet() == 0)
		return
	endif
	execute '!scp -r ' . source . ' ' . g:ssh_authority . ':' . destination
endf
command! -nargs=* -complete=file ScpUpload call ScpUpload(<f-args>)

" ==================================== tab functions ==============================

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <A-.> :call MoveToNextTab()<CR>
nnoremap <A-,> :call MoveToPrevTab()<CR>

" ==================================== Tagbar ==============================
nnoremap <silent> tt :TagbarToggle<CR>
nnoremap <silent> tn :TagbarJumpNext<CR>
nnoremap <silent> tp :TagbarJumpPrev<CR>

" =========================== Load .vimlocal if it exists ====================
silent! so .vimlocal
