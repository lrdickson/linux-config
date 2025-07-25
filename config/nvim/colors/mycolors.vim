" Name:         mycolors
" 
" This colorscheme is originally based off zaibatsu
" Author:       Romain Lafourcade <romainlafourcade@gmail.com>
" Maintainer:   Romain Lafourcade <romainlafourcade@gmail.com>
" Website:      https://github.com/vim/colorschemes
" License:      Same as Vim
" Last Change:  2025 Feb 21

" Generated by Colortemplate v2.2.3

set background=dark

hi clear
let g:colors_name = 'mycolors'

let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)

if (has('termguicolors') && &termguicolors) || has('gui_running')
" let g:terminal_ansi_colors = ['#0e0024', '#d7005f', '#00af5f', '#ffaf00', '#5f5fff', '#d700ff', '#00afff', '#d7d5db', '#878092', '#ff5faf', '#00d700', '#ffd700', '#8787ff', '#ff87ff', '#00ffff', '#ffffff']
let g:terminal_ansi_colors = ['#100020', '#d7005f', '#00af5f', '#ffaf00', '#5f5fff', '#d700ff', '#00afff', '#d7d5db', '#878092', '#ff5faf', '#00d700', '#ffd700', '#8787ff', '#ff87ff', '#00ffff', '#ffffff']
endif
" hi Normal guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE
hi Normal guifg=#ffffff guibg=#100020 gui=NONE cterm=NONE
" hi EndOfBuffer guifg=#afafff guibg=#0e0024 gui=NONE cterm=NONE
hi EndOfBuffer guifg=#afafff guibg=#100020 gui=NONE cterm=NONE
" hi NonText guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE
hi NonText guifg=#878092 guibg=#100020 gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE guisp=#ff5faf gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellCap guifg=NONE guibg=NONE guisp=#87ff00 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellLocal guifg=NONE guibg=NONE guisp=#ffffff gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellRare guifg=NONE guibg=NONE guisp=#ffafff gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi StatusLine guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
hi StatusLine guifg=#afaab6 guibg=#300060 gui=NONE cterm=NONE
" hi StatusLineNC guifg=#0e0024 guibg=#afaab6 gui=NONE cterm=NONE
hi StatusLineNC guifg=#100020 guibg=#afaab6 gui=NONE cterm=NONE
" hi Pmenu guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#100020 gui=NONE cterm=NONE
hi PmenuSbar guifg=#d7d5db guibg=#d7d5db gui=NONE cterm=NONE
" hi PmenuSel guifg=#0e0024 guibg=#afafff gui=NONE cterm=NONE
hi PmenuSel guifg=#100020 guibg=#afafff gui=NONE cterm=NONE
hi PmenuThumb guifg=#878092 guibg=#878092 gui=NONE cterm=NONE
" hi PmenuExtra guifg=#878092 guibg=#ffffff gui=NONE cterm=NONE
hi PmenuExtra guifg=#ffffff guibg=#878092 gui=NONE cterm=NONE
hi! link PmenuExtraSel PmenuSel
" hi PmenuKind guifg=#878092 guibg=#ffffff gui=NONE cterm=NONE
hi PmenuKind guifg=#ffffff guibg=#878092 gui=NONE cterm=NONE
hi! link PmenuKindSel PmenuSel
" hi PmenuMatch guifg=#d700ff guibg=#ffffff gui=NONE cterm=NONE
hi PmenuMatch guifg=#ffffff guibg=#d700ff gui=NONE cterm=NONE
" hi PmenuMatchSel guifg=#d700ff guibg=#afafff gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#afafff guibg=#d700ff gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#510039 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#362b49 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#362b49 gui=NONE cterm=NONE
" hi WildMenu guifg=#0e0024 guibg=#afafff gui=NONE cterm=NONE
hi WildMenu guifg=#100020 guibg=#afafff gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" hi Cursor guifg=#0e0024 guibg=#ffff5f gui=NONE cterm=NONE
hi Cursor guifg=#100020 guibg=#ffff5f gui=NONE cterm=NONE
" hi CursorIM guifg=#0e0024 guibg=#ffff5f gui=NONE cterm=NONE
hi CursorIM guifg=#100020 guibg=#ffff5f gui=NONE cterm=NONE
hi Error guifg=#d70000 guibg=#ffffff gui=reverse cterm=reverse
hi ErrorMsg guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
hi FoldColumn guifg=#00afff guibg=NONE gui=NONE cterm=NONE
" hi Folded guifg=#ffaf00 guibg=#0e0024 gui=reverse cterm=reverse
hi Folded guifg=#ffaf00 guibg=#100020 gui=reverse cterm=reverse
" hi IncSearch guifg=#ffaf00 guibg=#0e0024 gui=reverse cterm=reverse
hi IncSearch guifg=#ffaf00 guibg=#100020 gui=reverse cterm=reverse
hi LineNr guifg=#afafff guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
" hi ModeMsg guifg=#0e0024 guibg=#87ff00 gui=NONE cterm=NONE
hi ModeMsg guifg=#100020 guibg=#87ff00 gui=NONE cterm=NONE
hi MoreMsg guifg=#87ffff guibg=NONE gui=NONE cterm=NONE
hi Question guifg=#87ff00 guibg=NONE gui=NONE cterm=NONE
" hi QuickFixLine guifg=#ffafff guibg=#0e0024 gui=reverse cterm=reverse
hi QuickFixLine guifg=#ffafff guibg=#100020 gui=reverse cterm=reverse
" hi Search guifg=#87ffff guibg=#0e0024 gui=reverse cterm=reverse
hi Search guifg=#87ffff guibg=#100020 gui=reverse cterm=reverse
hi SignColumn guifg=#00afff guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#878092 guibg=NONE gui=NONE cterm=NONE
hi ToolbarButton guifg=#ffffff guibg=#5e556d gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit guifg=#afafff guibg=NONE gui=NONE cterm=NONE
" hi Visual guifg=#0e0024 guibg=#5fd7ff gui=NONE cterm=NONE
hi Visual guifg=#100020 guibg=#5fd7ff gui=NONE cterm=NONE
" hi VisualNOS guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
hi VisualNOS guifg=#100020 guibg=#ffffff gui=NONE cterm=NONE
hi WarningMsg guifg=#ffafff guibg=NONE gui=NONE cterm=NONE
hi debugBreakpoint guifg=#87ff00 guibg=#5f00d7 gui=reverse cterm=reverse
hi debugPC guifg=#87ffff guibg=#5f00d7 gui=reverse cterm=reverse
hi Directory guifg=#87ffff guibg=NONE gui=NONE cterm=NONE
hi Title guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Comment guifg=#afafff guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#ffff5f guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#87ffff guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#878092 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#00afff guibg=NONE gui=NONE cterm=NONE
" hi Special guifg=#87ff00 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#ff00ff guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#ffafff guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi Type guifg=#ff5faf guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi! link CurSearch IncSearch
hi! link CursorLineFold CursorLine
hi! link CursorLineNr CursorLine
hi! link CursorLineSign CursorLine
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link Terminal Normal
hi! link lCursor Cursor
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link Terminal Normal
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
" hi DiffAdd guifg=#87ff00 guibg=#362b49 gui=reverse cterm=reverse
" hi DiffChange guifg=#afafff guibg=#362b49 gui=reverse cterm=reverse
" hi DiffText guifg=#d7d5db guibg=#362b49 gui=reverse cterm=reverse
" hi DiffDelete guifg=#ff5faf guibg=#362b49 gui=reverse cterm=reverse
hi DiffAdd guifg=#362b49 guibg=#87ff00 gui=reverse cterm=reverse
hi DiffChange guifg=#362b49 guibg=#afafff gui=reverse cterm=reverse
hi DiffText guifg=#362b49 guibg=#d7d5db gui=reverse cterm=reverse
hi DiffDelete guifg=#362b49 guibg=#ff5faf gui=reverse cterm=reverse

if s:t_Co >= 256
hi Normal ctermfg=231 ctermbg=16 cterm=NONE
hi EndOfBuffer ctermfg=147 ctermbg=16 cterm=NONE
hi NonText ctermfg=103 ctermbg=16 cterm=NONE
hi SpellBad ctermfg=205 ctermbg=NONE cterm=underline
hi SpellCap ctermfg=118 ctermbg=NONE cterm=underline
hi SpellLocal ctermfg=231 ctermbg=NONE cterm=underline
hi SpellRare ctermfg=219 ctermbg=NONE cterm=underline
hi StatusLine ctermfg=16 ctermbg=231 cterm=NONE
hi StatusLineNC ctermfg=16 ctermbg=146 cterm=NONE
hi Pmenu ctermfg=16 ctermbg=231 cterm=NONE
hi PmenuSbar ctermfg=189 ctermbg=189 cterm=NONE
hi PmenuSel ctermfg=16 ctermbg=147 cterm=NONE
hi PmenuThumb ctermfg=103 ctermbg=103 cterm=NONE
hi PmenuExtra ctermfg=103 ctermbg=231 cterm=NONE
hi! link PmenuExtraSel PmenuSel
hi PmenuKind ctermfg=103 ctermbg=231 cterm=NONE
hi! link PmenuKindSel PmenuSel
hi PmenuMatch ctermfg=165 ctermbg=231 cterm=NONE
hi PmenuMatchSel ctermfg=165 ctermbg=147 cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=52 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi WildMenu ctermfg=16 ctermbg=147 cterm=NONE
hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
hi Cursor ctermfg=16 ctermbg=227 cterm=NONE
  hi CursorIM ctermfg=16 ctermbg=227 cterm=NONE
  hi Error ctermfg=160 ctermbg=231 cterm=reverse
  hi ErrorMsg ctermfg=231 ctermbg=160 cterm=NONE
  hi FoldColumn ctermfg=39 ctermbg=NONE cterm=NONE
  hi Folded ctermfg=214 ctermbg=16 cterm=reverse
  hi IncSearch ctermfg=214 ctermbg=16 cterm=reverse
  hi LineNr ctermfg=147 ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=16 ctermbg=118 cterm=NONE
  hi MoreMsg ctermfg=123 ctermbg=NONE cterm=NONE
  hi Question ctermfg=118 ctermbg=NONE cterm=NONE
  hi QuickFixLine ctermfg=219 ctermbg=16 cterm=reverse
  hi Search ctermfg=123 ctermbg=16 cterm=reverse
  hi SignColumn ctermfg=39 ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=103 ctermbg=NONE cterm=NONE
  hi ToolbarButton ctermfg=231 ctermbg=60 cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=147 ctermbg=NONE cterm=NONE
  hi Visual ctermfg=16 ctermbg=81 cterm=NONE
  hi VisualNOS ctermfg=16 ctermbg=231 cterm=NONE
  hi WarningMsg ctermfg=219 ctermbg=NONE cterm=NONE
  hi debugBreakpoint ctermfg=118 ctermbg=56 cterm=reverse
  hi debugPC ctermfg=123 ctermbg=56 cterm=reverse
  hi Directory ctermfg=123 ctermbg=NONE cterm=NONE
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment ctermfg=147 ctermbg=NONE cterm=NONE
  hi Constant ctermfg=227 ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=123 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=103 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=39 ctermbg=NONE cterm=NONE
  hi Special ctermfg=118 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=219 ctermbg=NONE cterm=NONE
  hi Todo ctermfg=NONE ctermbg=NONE cterm=reverse
  hi Type ctermfg=205 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi! link CurSearch IncSearch
  hi! link CursorLineFold CursorLine
  hi! link CursorLineNr CursorLine
  hi! link CursorLineSign CursorLine
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link Terminal Normal
  hi! link lCursor Cursor
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Conditional Statement
  hi! link Define PreProc
  hi! link Delimiter Special
  hi! link Exception Statement
  hi! link Float Constant
  hi! link Function Identifier
  hi! link Include PreProc
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Macro PreProc
  hi! link Number Constant
  hi! link Operator Statement
  hi! link PreCondit PreProc
  hi! link Repeat Statement
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link StorageClass Type
  hi! link String Constant
  hi! link Structure Type
  hi! link Tag Special
  hi! link Typedef Type
  hi! link Terminal Normal
  hi! link MessageWindow Pmenu
  hi! link PopupNotification Todo
  hi DiffAdd ctermfg=118 ctermbg=237 cterm=reverse
  hi DiffChange ctermfg=147 ctermbg=237 cterm=reverse
  hi DiffText ctermfg=189 ctermbg=237 cterm=reverse
  hi DiffDelete ctermfg=205 ctermbg=237 cterm=reverse
  unlet s:t_Co
  finish
endif

if s:t_Co >= 16
  hi Normal ctermfg=white ctermbg=black cterm=NONE
  hi EndOfBuffer ctermfg=blue ctermbg=black cterm=NONE
  hi NonText ctermfg=darkgray ctermbg=black cterm=NONE
  hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=green ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=white ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
  hi StatusLine ctermfg=white ctermbg=black cterm=reverse
  hi StatusLineNC ctermfg=darkgray ctermbg=gray cterm=reverse
  hi Pmenu ctermfg=black ctermbg=white cterm=NONE
  hi PmenuSbar ctermfg=gray ctermbg=gray cterm=NONE
  hi PmenuSel ctermfg=white ctermbg=blue cterm=NONE
  hi PmenuThumb ctermfg=darkgray ctermbg=darkgray cterm=NONE
  hi PmenuExtra ctermfg=darkgray ctermbg=white cterm=NONE
  hi! link PmenuExtraSel PmenuSel
  hi PmenuKind ctermfg=darkgray ctermbg=white cterm=NONE
  hi! link PmenuKindSel PmenuSel
  hi PmenuMatch ctermfg=black ctermbg=white cterm=bold
  hi PmenuMatchSel ctermfg=white ctermbg=blue cterm=bold
  hi ColorColumn ctermfg=white ctermbg=darkred cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorColumn ctermfg=NONE ctermbg=blue cterm=NONE
  hi WildMenu ctermfg=white ctermbg=blue cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=black ctermbg=yellow cterm=NONE
  hi CursorIM ctermfg=black ctermbg=yellow cterm=NONE
  hi Error ctermfg=red ctermbg=white cterm=reverse
  hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
  hi FoldColumn ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi Folded ctermfg=darkyellow ctermbg=black cterm=reverse
  hi IncSearch ctermfg=darkyellow ctermbg=black cterm=reverse
  hi LineNr ctermfg=blue ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=black ctermbg=green cterm=NONE
  hi MoreMsg ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Question ctermfg=green ctermbg=NONE cterm=NONE
  hi QuickFixLine ctermfg=magenta ctermbg=black cterm=reverse
  hi Search ctermfg=cyan ctermbg=black cterm=reverse
  hi SignColumn ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi ToolbarButton ctermfg=white ctermbg=darkgray cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=blue ctermbg=NONE cterm=NONE
  hi Visual ctermfg=black ctermbg=darkcyan cterm=NONE
  hi VisualNOS ctermfg=black ctermbg=white cterm=NONE
  hi WarningMsg ctermfg=magenta ctermbg=NONE cterm=NONE
  hi debugBreakpoint ctermfg=green ctermbg=darkblue cterm=reverse
  hi debugPC ctermfg=cyan ctermbg=darkblue cterm=reverse
  hi Directory ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment ctermfg=blue ctermbg=NONE cterm=NONE
  hi Constant ctermfg=yellow ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi Special ctermfg=green ctermbg=NONE cterm=NONE
  hi Statement ctermfg=magenta ctermbg=NONE cterm=NONE
  hi Todo ctermfg=NONE ctermbg=NONE cterm=reverse
  hi Type ctermfg=red ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi! link CurSearch IncSearch
  hi! link CursorLineFold CursorLine
  hi! link CursorLineNr CursorLine
  hi! link CursorLineSign CursorLine
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link Terminal Normal
  hi! link lCursor Cursor
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Conditional Statement
  hi! link Define PreProc
  hi! link Delimiter Special
  hi! link Exception Statement
  hi! link Float Constant
  hi! link Function Identifier
  hi! link Include PreProc
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Macro PreProc
  hi! link Number Constant
  hi! link Operator Statement
  hi! link PreCondit PreProc
  hi! link Repeat Statement
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link StorageClass Type
  hi! link String Constant
  hi! link Structure Type
  hi! link Tag Special
  hi! link Typedef Type
  hi! link Terminal Normal
  hi! link MessageWindow Pmenu
  hi! link PopupNotification Todo
  hi DiffAdd ctermfg=darkgreen ctermbg=white cterm=reverse
  hi DiffChange ctermfg=darkblue ctermbg=white cterm=reverse
  hi DiffText ctermfg=grey ctermbg=black cterm=reverse
  hi DiffDelete ctermfg=darkmagenta ctermbg=white cterm=reverse
  unlet s:t_Co
  finish
endif

if s:t_Co >= 8
  hi Normal ctermfg=gray ctermbg=black cterm=NONE
  hi EndOfBuffer ctermfg=blue ctermbg=black cterm=NONE
  hi NonText ctermfg=darkgray ctermbg=black cterm=NONE
  hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=green ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=white ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
  hi StatusLine ctermfg=white ctermbg=black cterm=reverse
  hi StatusLineNC ctermfg=darkgray ctermbg=gray cterm=bold,reverse
  hi Pmenu ctermfg=black ctermbg=white cterm=NONE
  hi PmenuSbar ctermfg=white ctermbg=white cterm=NONE
  hi PmenuSel ctermfg=white ctermbg=blue cterm=NONE
  hi PmenuThumb ctermfg=blue ctermbg=blue cterm=NONE
  hi! link PmenuExtra Pmenu
  hi! link PmenuExtraSel PmenuSel
  hi! link PmenuKind Pmenu
  hi! link PmenuKindSel PmenuSel
  hi PmenuMatch ctermfg=black ctermbg=white cterm=bold
  hi PmenuMatchSel ctermfg=white ctermbg=blue cterm=bold
  hi ColorColumn ctermfg=white ctermbg=darkred cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorColumn ctermfg=NONE ctermbg=blue cterm=NONE
  hi WildMenu ctermfg=white ctermbg=blue cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=black ctermbg=yellow cterm=NONE
  hi CursorIM ctermfg=black ctermbg=yellow cterm=NONE
  hi Error ctermfg=red ctermbg=white cterm=reverse
  hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
  hi FoldColumn ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi Folded ctermfg=darkyellow ctermbg=black cterm=reverse
  hi IncSearch ctermfg=darkyellow ctermbg=black cterm=reverse
  hi LineNr ctermfg=blue ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=black ctermbg=green cterm=NONE
  hi MoreMsg ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Question ctermfg=green ctermbg=NONE cterm=NONE
  hi QuickFixLine ctermfg=magenta ctermbg=black cterm=reverse
  hi Search ctermfg=cyan ctermbg=black cterm=reverse
  hi SignColumn ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi ToolbarButton ctermfg=white ctermbg=darkgray cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=blue ctermbg=NONE cterm=NONE
  hi Visual ctermfg=black ctermbg=darkcyan cterm=NONE
  hi VisualNOS ctermfg=black ctermbg=white cterm=NONE
  hi WarningMsg ctermfg=magenta ctermbg=NONE cterm=NONE
  hi debugBreakpoint ctermfg=green ctermbg=darkblue cterm=reverse
  hi debugPC ctermfg=cyan ctermbg=darkblue cterm=reverse
  hi Directory ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment ctermfg=blue ctermbg=NONE cterm=NONE
  hi Constant ctermfg=yellow ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=darkcyan ctermbg=NONE cterm=NONE
  hi Special ctermfg=green ctermbg=NONE cterm=NONE
  hi Statement ctermfg=magenta ctermbg=NONE cterm=NONE
  hi Todo ctermfg=NONE ctermbg=NONE cterm=reverse
  hi Type ctermfg=red ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi! link CurSearch IncSearch
  hi! link CursorLineFold CursorLine
  hi! link CursorLineNr CursorLine
  hi! link CursorLineSign CursorLine
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link Terminal Normal
  hi! link lCursor Cursor
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Conditional Statement
  hi! link Define PreProc
  hi! link Delimiter Special
  hi! link Exception Statement
  hi! link Float Constant
  hi! link Function Identifier
  hi! link Include PreProc
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Macro PreProc
  hi! link Number Constant
  hi! link Operator Statement
  hi! link PreCondit PreProc
  hi! link Repeat Statement
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link StorageClass Type
  hi! link String Constant
  hi! link Structure Type
  hi! link Tag Special
  hi! link Typedef Type
  hi! link Terminal Normal
  hi! link MessageWindow Pmenu
  hi! link PopupNotification Todo
  hi DiffAdd ctermfg=darkgreen ctermbg=white cterm=reverse
  hi DiffChange ctermfg=darkblue ctermbg=white cterm=reverse
  hi DiffText ctermfg=grey ctermbg=black cterm=reverse
  hi DiffDelete ctermfg=darkmagenta ctermbg=white cterm=reverse
  unlet s:t_Co
  finish
endif

if s:t_Co >= 0
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=reverse
  hi CursorColumn term=NONE
  hi CursorLine term=underline
  hi CursorLineNr term=bold
  hi DiffAdd term=reverse
  hi DiffChange term=NONE
  hi DiffDelete term=reverse
  hi DiffText term=reverse
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,reverse
  hi FoldColumn term=NONE
  hi Folded term=NONE
  hi IncSearch term=bold,reverse,underline
  hi LineNr term=NONE
  hi MatchParen term=bold,underline
  hi ModeMsg term=bold
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=reverse
  hi PmenuSel term=bold
  hi PmenuThumb term=NONE
  hi Question term=standout
  hi Search term=reverse
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=underline
  hi SpellCap term=underline
  hi SpellLocal term=underline
  hi SpellRare term=underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=bold,underline
  hi TabLine term=bold,underline
  hi TabLineFill term=NONE
  hi Terminal term=NONE
  hi TabLineSel term=bold,reverse
  hi Title term=NONE
  hi VertSplit term=NONE
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  hi CurSearch term=reverse
  hi CursorLineFold term=underline
  hi CursorLineSign term=underline
  hi Comment term=bold
  hi Constant term=NONE
  hi Error term=bold,reverse
  hi Identifier term=NONE
  hi Ignore term=NONE
  hi PreProc term=NONE
  hi Special term=NONE
  hi Statement term=NONE
  hi Todo term=bold,reverse
  hi Type term=NONE
  hi Underlined term=underline
  unlet s:t_Co
  finish
endif

" Background: dark
" Color: background    #0e0024           16                black
" Color: darkred       #510039           52                darkred
" Color: darkgreen     #5faf00           70                darkgreen
" Color: darkyellow    #ffaf00           214               darkyellow
" Color: darkblue      #5f00d7           56                darkblue
" Color: darkmagenta   #d700ff           165               darkmagenta
" Color: darkcyan      #00afff           39                darkcyan
" Color: red           #ff5faf           205               red
" Color: green         #87ff00           118               green
" Color: yellow        #ffff5f           227               yellow
" Color: blue          #afafff           147               blue
" Color: magenta       #ffafff           219               magenta
" Color: cyan          #87ffff           123               cyan
" Color: white         #ffffff           231               white
" Color: neutral1      #D7D5DB           189               gray
" Color: neutral2      #AFAAB6           146               gray
" Color: neutral3      #878092           103               darkgray
" Color: neutral4      #5E556D           60                darkgray
" Color: neutral5      #362B49           237               darkgray
" Color: error         #d70000           160               red
" Color: visual        #5FD7FF           81                darkcyan
" Color: Xdarkred      #d7005f           ~
" Color: Xdarkgreen    #00af5f           ~
" Color: Xdarkblue     #5f5fff           ~
" Color: Xdarkwhite    #d7d7d7           ~
" Color: Xgrey         #878787           ~
" Color: Xbrightgreen  #00d700           ~
" Color: Xbrightyellow #ffd700           ~
" Color: Xbrightblue   #8787ff           ~
" Color: Xbrightmagenta #ff87ff          ~
" Color: Xbrightcyan   #00ffff           ~
" Term colors: background
" Term colors: Xdarkred
" Term colors: Xdarkgreen
" Term colors: darkyellow
" Term colors: Xdarkblue
" Term colors: darkmagenta
" Term colors: darkcyan
" Term colors: neutral1
" Term colors: neutral3
" Term colors: red
" Term colors: Xbrightgreen
" Term colors: Xbrightyellow
" Term colors: Xbrightblue
" Term colors: Xbrightmagenta
" Term colors: Xbrightcyan
" Term colors: white
" Color: bgDiffA       #5F875F           65                darkgreen
" Color: bgDiffT       #C6C6C6           251               grey
" Color: fgDiffW       #FFFFFF           231               white
" Color: fgDiffB       #000000           16                black
" Color: bgDiffC8      #5F87AF           67                darkblue
" Color: bgDiffD8      #AF5FAF           133               darkmagenta
" vim: et ts=8 sw=2 sts=2
