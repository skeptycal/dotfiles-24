" vim: fdm=marker foldlevel=0
set nocompatible

" {{{ Plugins

let g:plugins_file_path = "~/dotfiles/vim/plugins.vim"

if filereadable(expand(g:plugins_file_path))
  exe ":source " . g:plugins_file_path
endif

filetype plugin indent on

" }}}
" {{{ Basics

" no regrets
set nobackup
set noswapfile
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
if exists("+undofile")
  set undofile
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

set history=1000 " more history
set undolevels=1000 " more undolevels

set shell=zsh
set mouse=nvi " enable mouse
set cursorline " highlight current line
set hidden " allow buffers in background
set number " line numbers
set listchars=tab:»·,trail:· " invisible chars
set list " show tabs and trailing whitespace

set wildmode=longest:list,full " tab completion
set laststatus=2 " always show status bar

if exists("+wildignorecase")
  set wildignorecase " ignore case when completing filenames in command mode
end

set ignorecase smartcase " search is case insensitive unless when upper case
set gdefault " global search by default; /g for first-per-row only.

set autoindent " indent to current depth on new lines
set expandtab " spaces for tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2

" set switchbuf=usetab " switch to existing buffer if there is one
set autoread " update files when coming back

set statusline=
set statusline+=\ %<%f    " relative path
set statusline+=%m        " modified flag
set statusline+=%=        " flexible space
" set statusline+=%{fugitive#statusline()} " git
set statusline+=\ %{&ft}\   " filetype

set foldlevel=999 " folds come expanded

set exrc " auto load local .vimrc files
set secure " but lets keep it secure

" }}}
" {{{ Mappings

let mapleader="\<Space>"

" jumping
nnoremap <leader><leader> <c-^>

" so fast save save save
nmap <leader>w :w<cr>

" / to search, <c-/> to clear search
noremap <c-_> :set hlsearch!<cr>

" old leader is the new project wide search
nnoremap \ :grep<SPACE>

" yank to system clipboard
vnoremap <leader>y "*y
" Don't jump to next on *
nnoremap * *<c-o>

" qq to record, Q to replay
nmap Q @q
vmap Q :normal Q<cr>

" %% expands to dir of current file in cmd mode
cmap %% <C-R>=expand('%:h').'/'<cr>
" edit file in the same directory as the current file
nmap <leader>e :edit %%

" visual moving
noremap k gk
noremap j gj

" Easy split navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Y behaves like other capital letters
" (yanks from here to end of line)
nnoremap Y y$

" always jump to char (and not just line)
noremap ' `

" Indenting visual selection keeps selection
vnoremap < <gv
vnoremap > >gv

" Open cwd in Finder.app
nnoremap <leader>O :call system('open .')<cr>

" Just, you know, close the bottom window
nnoremap <silent> <c-w>z :wincmd z<bar>cclose<bar>lclose<cr>

" close all folds to current depth
noremap ˙ :set foldlevel=<c-r>=foldlevel(line('.'))-1<cr><cr>
" open all folds
noremap ¬ :set foldlevel=9999<cr>
" poor mans meta key is to map unicode-chars

" git status and diff
nnoremap <f5> :Gst<cr>
" remove fluff
nnoremap <f10> :Goyo<cr>

" c-c in visual mode acts like <esc>
" eg. doesn't abort <c-v>I
xnoremap <c-c> <esc>
inoremap <c-c> <esc>

" Readline-style <c-a> in command-line mode
cnoremap <c-a> <Home>

" Shortcuts to configs
nmap <leader>vv :e $MYVIMRC<cr>
nmap <leader>pp :e <c-r>=g:plugins_file_path<cr><cr>

" set <cr> to reload browsers
" for the scripts, see https://github.com/mikker/dotfiles/tree/master/bin
noremap <leader>mc :silent Rerun call system('reload-chrome')<cr>
noremap <leader>ms :silent Rerun call system('reload-safari')<cr>

" what time is it?
iab <expr> ddate strftime("%Y-%m-%d")
iab <expr> ttime strftime("%H:%M")

cnoreabbrev E e
cnoreabbrev G Git

" }}}
" {{{ Functions and commands

function! s:super_duper_tab(k, o)
  if pumvisible()
    return a:k
  endif

  let line = getline('.')
  let col = col('.') - 2
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
    return a:o
  endif

  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if prefix =~ '^[~/.]'
    return "\<c-x>\<c-f>"
  endif
  if !empty(&completefunc) && call(&completefunc, [1, prefix]) >= 0
    return "\<c-x>\<c-u>"
  endif
  return a:k
endfunction

inoremap <expr> <tab>   <SID>super_duper_tab("\<c-n>", "\<tab>")
inoremap <expr> <s-tab> <SID>super_duper_tab("\<c-p>", "\<s-tab>")

" Open current file in Marked.app
fun! s:openMarked()
  call system('open -a Marked\ 2 "' . expand("%") . '"')
endfun
command! Marked call s:openMarked()

" Quicker filetype setting:
"   :F html
command! -nargs=1 F set filetype=<args>

" find and delete all trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
noremap <leader>S :call <SID>StripTrailingWhitespaces()<cr>

" Add quickfix-files to args
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
" populate the argument list with each of the files named in the quickfix list
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" git shortcuts
command! -nargs=* GP Git push <args>
command! -nargs=* GU Git pull <args>
command! -nargs=* GB Gbrowse <args>

" Rotate user-installed schemes with <f8>
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
    \ sort(map(
    \   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
    \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

" What is this syntax colored as?
function! s:hl()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()

" }}}
" {{{ Autocommands
augroup vimrcEx
  autocmd!

  " Auto-open quickfix window after grep cmds
  autocmd QuickFixCmdPost *grep* cwindow

  " YAML front-matter
  au BufNewFile,BufRead *.{md,markdown,html,xml,erb} sy match Comment /\%^---\_.\{-}---$/

  " magic markers: enable using `H/S/J/C to jump back to
  " last HTML, stylesheet, JS or Ruby code buffer
  au BufLeave *.{erb,html,haml,slim}  exe "normal! mH"
  au BufLeave *.{css,scss,sass}       exe "normal! mS"
  au BufLeave *.{js,coffee}           exe "normal! mJ"
  au BufLeave *.{rb}                  exe "normal! mC"

  if has('nvim')
    " Close term buffers with <cr> after scrolling
    au TermOpen * map <buffer> <cr> :bd!<cr>
  end
augroup END

" }}}
" Plugin config and maps {{{

" FZF
noremap <leader>f :FZF<cr>
nnoremap <silent> <Leader>b :Buffers<cr>
nnoremap <silent> <leader>t :Tags<cr>

" ag for ack
" brew install the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

let g:task_paper_follow_move = 0

xmap <cr> :EasyAlign<cr>

let g:UltiSnipsExpandTrigger       = "<c-l>"
let g:UltiSnipsListSnippets        = "<c-q>"
let g:UltiSnipsJumpForwardTrigger  = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

if has('nvim')
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_ruby_enabled_makers = ['mri']
  let g:neomake_elixir_enabled_makers = ['credo']

  autocmd! BufWritePost *.js Neomake
  autocmd! BufWritePost {*.rb,*.rake,Gemfile,Rakefile} Neomake
  autocmd! BufWritePost *.{ex,exs,eex} Neomake
else
  let g:syntastic_html_checkers=['']
  let g:syntastic_javascript_checkers = ['standard']
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_check_on_wq = 0
endif

" minimal airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_z = ''
let g:airline_section_y = ''
let g:airline_theme='hybrid'

let g:ragtag_global_maps = 1

let g:polyglot_disabled = ['javascript', 'elm', 'ruby']

" }}}

set background=light
colorscheme github

" Search notes. nvAlt is still better
fun! s:searchNotes()
  :FZF! ~/Dropbox/Notes
endfun
command! Notes call s:searchNotes()
nmap <leader>N :Notes<cr>

" poor man's autoreload
fun! s:setupAutoReloadChromeOrWhatever()
  au BufWritePost *.{html,erb,haml,slim,css,scss,js} call system('reload-chrome')
endfun
command! AutoReloadChromeOrWhatever call s:setupAutoReloadChromeOrWhatever()

fun! s:setupAutoReloadSafariOrWhatever()
  au BufWritePost *.{html,erb,haml,slim,css,scss,js} call system('reload-safari')
endfun
command! AutoReloadSafariOrWhatever call s:setupAutoReloadSafariOrWhatever()


let g:elm_detailed_complete = 1
" let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

if has('nvim')
  tnoremap <esc> <c-\><c-n>
endif

noremap ]t :tabn<cr>
noremap [t :tabp<cr>

noremap gk k
noremap gj j
set modelines=5
noremap <c-n> :bnext<CR>
noremap <c-p> :bprev<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
map <leader>sv :source $MYVIMRC<cr>

