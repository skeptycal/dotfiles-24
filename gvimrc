" No audible bell
set vb

" Looks
set guioptions-=T " No toolbar
set guioptions-=r " No right hand scroll bar
set guioptions-=L " No left hand scroll bar

" Font
if has('mac')
  set guifont=Liberation\ Mono:h18
elseif has('unix')
  set guifont=Droid\ Sans\ Mono\ 10
endif

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
endif

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
