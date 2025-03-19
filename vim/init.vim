
" Color Scheme
colorscheme industry

" Turn on line numbers
set number

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
syntax on
syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Add cwindow keyboard shortcuts
nmap <Leader>cw :cwindow<CR>
nmap <Leader>cl :cclose<CR>
nmap <Leader>cf :cnext<CR>
nmap <Leader>cp :cprevious<CR>

" =============================== diff ===========================
nmap <Leader>dg :diffget<CR>
nmap <Leader>dp :diffput<CR>

