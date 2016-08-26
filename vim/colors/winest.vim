" Vim color file
"   This file was generated by Palette
"   http://rubygems.org/gems/palette
"
" Author: Mikkel Malmberg

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="winest"

if has("gui_running")
    set background=dark
endif

hi Normal       guifg=#BBBBBB ctermfg=250  guibg=#14171A ctermbg=233  gui=NONE cterm=NONE
hi FoldColumn   guifg=#6C6C6C ctermfg=242  guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi Folded       guifg=#6C6C6C ctermfg=242  guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi LineNr       guifg=#585858 ctermfg=240  guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi MatchParen   guifg=#FFFFAF ctermfg=229  guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi SignColumn   guifg=#BBBBBB ctermfg=250  guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi Comment      guifg=#585858 ctermfg=240  gui=NONE cterm=NONE
hi Conceal      guifg=#6C6C6C ctermfg=242  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Constant     guifg=#49878F ctermfg=66   gui=NONE cterm=NONE
hi Error        guifg=#AF5F5F ctermfg=131  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Identifier   guifg=#9BC1C8 ctermfg=250  gui=NONE cterm=NONE
hi Ignore       guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi PreProc      guifg=#49878F ctermfg=66   gui=NONE cterm=NONE
hi Special      guifg=#69946A ctermfg=65   gui=NONE cterm=NONE
hi Statement    guifg=#49878F ctermfg=66   gui=NONE cterm=NONE
hi String       guifg=#69946A ctermfg=65   gui=NONE cterm=NONE
hi Todo         guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=REVERSE cterm=REVERSE
hi Type         guifg=#7E698A ctermfg=96   gui=NONE cterm=NONE
hi Underlined   guifg=#49878F ctermfg=66   guibg=NONE    ctermbg=NONE gui=UNDERLINE cterm=UNDERLINE
hi NonText      guifg=#222E30 ctermfg=236  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu        guifg=NONE    ctermfg=NONE guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi PmenuSel     guifg=#111111 ctermfg=233  guibg=#71BAC7 ctermbg=74   gui=NONE cterm=NONE
hi PmenuSbar    guifg=NONE    ctermfg=NONE guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi PmenuThumb   guifg=#49878F ctermfg=66   guibg=#71BAC7 ctermbg=74   gui=NONE cterm=NONE
hi ErrorMsg     guifg=#14171A ctermfg=233  guibg=#AF5F5F ctermbg=131  gui=NONE cterm=NONE
hi ModeMsg      guifg=#14171A ctermfg=233  guibg=#69946A ctermbg=65   gui=NONE cterm=NONE
hi MoreMsg      guifg=#49878F ctermfg=66   guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Question     guifg=#69946A ctermfg=65   guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg   guifg=#AF5F5F ctermfg=131  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi TabLine      guifg=#BBBBBB ctermfg=250  guibg=#14171A ctermbg=233  gui=NONE cterm=NONE
hi TabLineFill  guifg=#585858 ctermfg=240  guibg=#14171A ctermbg=233  gui=NONE cterm=NONE
hi TabLineSel   guifg=#49878F ctermfg=66   guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi Cursor       guifg=#111111 ctermfg=233  guibg=#71BAC7 ctermbg=74   gui=NONE cterm=NONE
hi CursorColumn guifg=NONE    ctermfg=NONE guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi CursorLine   guifg=NONE    ctermfg=NONE guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi CursorLineNr guifg=#585858 ctermfg=240  guibg=#222E30 ctermbg=236  gui=NONE cterm=NONE
hi StatusLine   guifg=#F1F1F1 ctermfg=255  guibg=#585858 ctermbg=240  gui=NONE cterm=NONE
hi StatusLineNC guifg=#F1F1F1 ctermfg=255  guibg=#585858 ctermbg=240  gui=NONE cterm=NONE
hi Visual       guifg=#111111 ctermfg=233  guibg=#71BAC7 ctermbg=74   gui=NONE cterm=NONE
hi VisualNOS    guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit    guifg=#222E30 ctermfg=236  guibg=#14171A ctermbg=233  gui=NONE cterm=NONE
hi WildMenu     guifg=#262626 ctermfg=235  guibg=#71BAC7 ctermbg=74   gui=NONE cterm=NONE
hi Function     guifg=#FFFFAF ctermfg=229  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey   guifg=#71BAC7 ctermfg=74   guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Title        guifg=#F1F1F1 ctermfg=255  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd      guifg=#69946A ctermfg=65   guibg=#262626 ctermbg=235  gui=REVERSE cterm=REVERSE
hi DiffChange   guifg=#FFFFAF ctermfg=229  guibg=#262626 ctermbg=235  gui=REVERSE cterm=REVERSE
hi DiffDelete   guifg=#AF5F5F ctermfg=131  guibg=#262626 ctermbg=235  gui=REVERSE cterm=REVERSE
hi DiffText     guifg=#7E698A ctermfg=96   guibg=#262626 ctermbg=235  gui=REVERSE cterm=REVERSE
hi IncSearch    guifg=#111111 ctermfg=233  guibg=#AF5F5F ctermbg=131  gui=NONE cterm=NONE
hi Search       guifg=#111111 ctermfg=233  guibg=#FFFFAF ctermbg=229  gui=NONE cterm=NONE
hi Directory    guifg=#49878F ctermfg=66   guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad     guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=UNDERCURL cterm=UNDERCURL
hi SpellCap     guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=UNDERCURL cterm=UNDERCURL
hi SpellLocal   guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=UNDERCURL cterm=UNDERCURL
hi SpellRare    guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=UNDERCURL cterm=UNDERCURL
hi ColorColumn  guifg=NONE    ctermfg=NONE guibg=#AF5F5F ctermbg=131  gui=NONE cterm=NONE

hi link Boolean            Constant
hi link Character          Constant
hi link Number             Constant
hi link Conditional        Statement
hi link Exception          Statement
hi link HelpCommand        Statement
hi link HelpExample        Statement
hi link Keyword            Statement
hi link Label              Statement
hi link Operator           Statement
hi link Repeat             Statement
hi link Debug              Special
hi link Delimiter          Special
hi link SpecialChar        Special
hi link SpecialComment     Special
hi link Tag                Special
hi link Define             PreProc
hi link Include            PreProc
hi link Macro              PreProc
hi link PreCondit          PreProc
hi link Float              Number
hi link StorageClass       Type
hi link Structure          Type
hi link Typedef            Type
hi link htmlEndTag         htmlTagName
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName
hi link htmlLink           Function
hi link htmlBold           Normal
hi link htmlItalic         Normal
hi link xmlTag             Statement
hi link xmlTagName         Statement
hi link xmlEndTag          Statement
