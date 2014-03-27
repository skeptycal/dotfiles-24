" vim: fdm=marker foldlevel=0
set nocompatible

if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

filetype plugin indent on

" {{{ Basics

set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
if exists("+undofile")
  set undofile
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

set mouse=nvi " enable mouse

set cursorline " highlight current line

set hidden " allow buffers in background

set tabstop=2
set shiftwidth=2
set expandtab " use spaces for tabs

set wildmode=longest:list,full

set ignorecase " search is case insensitive
set smartcase " ... unless you use upper case
set gdefault " global search by default; /g for first-per-row only.
set hlsearch " highlight results

set statusline=
set statusline+=\[%n\]\   " buffer num and flags
set statusline+=%<%f      " relative path
" set statusline+=%m        " modified flag
" set statusline+=%=        " flexible space
" " set statusline+=%{fugitive#statusline()} " too slow
" set statusline+=%y%*%*    " filetype

set background=dark
colorscheme hybrid

set number
set numberwidth=3

" set winheight=3
" set winminheight=3
" set winheight=999

set foldlevel=99

" }}}
" {{{ Mappings

let mapleader = ","

nnoremap <cr> :nohl<cr>

" jumping
nnoremap <leader><leader> <c-^>
nnoremap <Home> :tabp<cr>
nnoremap <End> :tabn<cr>

" space toggles current fold
nmap <space> za
" yank to system clipboard
map <leader>y "*y
" Don't move on *
nnoremap * *<c-o>
" Danish keyboards are different
map æ [
map ø ]
noremap - /
onoremap _ ^
" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :normal Q<cr>
" re-read current file from disk
nmap <F5> :e %<cr>
" toggle paste mode
set pastetoggle=<F6>

" Open splits at top level
map <c-w>V :botright :vertical :split<cr>
map <c-w>S :topleft :split<cr>

" Map ,e to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" visual moving
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Easy window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Allow . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Y behaves like other capital letters
nnoremap Y y$

" }}}
" {{{ Functions and commands

" I'm too fast for my own good
command! W :w
command! Wq :wq
command! Qa :qa

" Multi-purpose tab-key
" Insert tab if beginning of line or after space, else do completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Quicker filetype setting:
"   :F html
command! -nargs=1 F set filetype=<args>
command! FR set filetype=ruby

" Function to strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
map <leader>S :call <SID>StripTrailingWhitespaces()<cr>

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent call system("rm ' . old_name . '")'
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" }}}
" {{{ Autocommands
augroup vimrcEx
  autocmd!

  " Auto-open quickfix window after grep cmds
  autocmd QuickFixCmdPost *grep* cwindow

  " YAML front-matter
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  " magic markers: enable using `H/S/J/C to jump back to
  " last HTML, stylesheet, JS or Ruby code buffer
  au BufLeave *.{erb,html,haml,slim}  exe "normal! mH"
  au BufLeave *.{css,scss,sass}       exe "normal! mS"
  au BufLeave *.{js,coffee}           exe "normal! mJ"
  au BufLeave *.{rb}                  exe "normal! mC"
augroup END

" }}}
" Plugin config and maps {{{

" NERDCommenter
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
map <leader>c <Plug>NERDCommenterToggle
" CtrlP
noremap <leader>f :CtrlP<cr>
" Map keys to go to specific files
noremap <leader>ga :CtrlP app/assets<cr>
noremap <leader>gc :CtrlP app/controllers<cr>
noremap <leader>gh :CtrlP app/helpers<cr>
noremap <leader>gv :CtrlP app/views<cr>
noremap <leader>gm :CtrlP app/models<cr>
noremap <leader>gp :CtrlP public<cr>
noremap <leader>gt :CtrlP test<cr>
noremap <leader>gs :CtrlP spec<cr>
noremap <leader>gr :topleft :split config/routes.rb<cr>
noremap <leader>gg :topleft :split Gemfile<cr>
noremap <leader>b :CtrlPBuffer<cr>

" ag for ack
" brew install the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ack.vim searches with ag
  let g:ackprg = 'ag'
  let g:ack_wildignore = 0
endif

let g:colorpicker_app = 'iTerm.app'

map <leader>w :Bd<cr>
map <leader>W :BufOnly<cr>

let g:wildfire_fuel_map = "<PageUp>"

" }}}

nmap å <Plug>VinegarUp
nmap <leader>r :Dispatch<cr>
