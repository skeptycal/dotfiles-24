" vim: fdm=marker foldlevel=0
scriptencoding utf-8

" {{{ Plugins

let g:plugins_file_path = '~/dotfiles/vim/plugins.vim'

if filereadable(expand(g:plugins_file_path))
  exe ':source ' . g:plugins_file_path
endif

filetype plugin indent on

" }}}
" {{{ Basics

set path+=**

" no regrets
set nobackup
set noswapfile
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
if exists('+undofile')
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

if exists('+wildignorecase')
  set wildignorecase " ignore case when completing filenames in command mode
end

" search is case insensitive unless when upper case
set ignorecase smartcase
set gdefault " global search by default; /g for first-per-row only.

set autoindent " indent to current depth on new lines
set expandtab " spaces for tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoread " update files when coming back

set foldlevel=999 " folds come expanded

set exrc " auto load local .vimrc files
set secure " but lets keep it secure

set modelines=5

" ag for ack
" brew install the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if has('nvim')
  " Use millions of colors
  set termguicolors
  " Change cursor glyph when in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" }}}
" {{{ Mappings

let g:mapleader="\<Space>"

" jumping
nnoremap <leader><leader> <c-^>

" so fast save save save
nmap <leader>j :w<cr>
nmap <leader>s :w<cr>

" / to search, <c-/> to clear search
" term:
noremap <c-_> :set hlsearch!<cr>
" gui:
noremap <c-/> :set hlsearch!<cr>

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
noremap gk k
noremap gj j

" Easy split navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" tabs
nnoremap ]w :tabn<cr>
nnoremap [w :tabp<cr>

" Y behaves like other capital letters
" (yanks from cursor to end of line)
nnoremap Y y$

" always jump to mark column (and not just line)
noremap ' `

" Indenting visual selection keeps selection
vnoremap < <gv
vnoremap > >gv

nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>

" Open cwd in Finder.app
nnoremap <leader>O :call system('open .')<cr>

" Just, you know, close the bottom window
nnoremap <silent> <c-w>z :wincmd z<bar>cclose<bar>lclose<cr>

" close all folds to current depth
noremap ˙ :set foldlevel=<c-r>=foldlevel(line('.'))-1<cr><cr>
" open all folds
noremap ¬ :set foldlevel=9999<cr>
" poor mans meta key is to map unicode-chars

" c-c in visual mode acts like <esc>
" eg. doesn't abort <c-v>I
xnoremap <c-c> <esc>
inoremap <c-c> <esc>

" Shortcuts to configs
nmap <leader>vv :e $MYVIMRC<cr>
nmap <leader>pp :e <c-r>=g:plugins_file_path<cr><cr>

" set <cr> to reload browsers
" for the scripts, see https://github.com/mikker/dotfiles/tree/master/bin
noremap <leader>mc :Rerun call system('reload-chrome')<cr>
noremap <leader>ms :Rerun call system('reload-safari')<cr>

" wait what time is it?
iab <expr> ddate strftime("%Y-%m-%d")
iab <expr> ttime strftime("%H:%M")

" stupid hands
cnoreabbrev E e
cnoreabbrev G Git
cnoreabbrev Qa qa

" git shortcuts
cnoreabbrev GP Git push
cnoreabbrev GU Git pull
cnoreabbrev GB Gbrowse

" }}}
" {{{ Functions and commands

" Open current file in Marked.app
command! Marked call system('open -a Marked\ 2 "'.expand('%').'"')

" Quicker filetype setting:
"   :F html
command! -nargs=1 F set filetype=<args>

" find and delete all trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l:l = line('.')
  let l:c = col('.')
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfun
noremap <leader>S :call <SID>StripTrailingWhitespaces()<cr>

" Add quickfix-files to arglist
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
" populate the argument list with each of the files named in the quickfix list
function! QuickfixFilenames()
  let l:buffer_numbers = {}
  for l:quickfix_item in getqflist()
    let l:buffer_numbers[l:quickfix_item['bufnr']] = bufname(l:quickfix_item['bufnr'])
  endfor
  return join(map(values(l:buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Rotate user-installed schemes with <f8>
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
    \ sort(map(
    \   filter(split(globpath(&runtimepath, 'colors/*.vim'), "\n"), 'v:val !~ "^/usr/"'),
    \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let l:name = s:colors_list[s:colors_index]
  execute 'colorscheme' l:name
  redraw
  echo l:name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

fun! s:run_term_in_tab(args)
  execute 'tabe|term ' . expand(a:args)
endfun
command! -nargs=* -complete=shellcmd TT call s:run_term_in_tab(<q-args>)

" }}}
" {{{ Autocommands
augroup vimrcEx
  autocmd!

  " Auto-open quickfix window after grep cmds
  autocmd QuickFixCmdPost *grep* cwindow

  " YAML front-matter
  au BufNewFile,BufRead *.{md,markdown} sy match Comment /\%^---\_.\{-}---$/

  " magic markers: enable using `H/S/J/C to jump back to
  " last HTML, stylesheet, JS or app code buffer
  au BufLeave *.{erb,html,haml,slim,eex} exe "normal! mH"
  au BufLeave *.{css,scss}               exe "normal! mS"
  au BufLeave *.{js}                     exe "normal! mJ"
  au BufLeave *.{rb,ex,exs}              exe "normal! mC"
augroup END

if has('nvim')
  " <esc> goes to normal mode in term buffers
  tnoremap <esc> <c-\><c-n>

  " Close finished term buffers with <cr> in nvim
  augroup nvimrcEx
    autocmd!
    au TermOpen * nmap <buffer> <cr> :bd!<cr>
  augroup END

  set inccommand=nosplit
end

" Search notes. nvAlt is still better
fun! s:searchNotes(args)
  let l:filename = expand(a:args)
  let l:dir = "~/Dropbox/Notes"
  if l:filename != ""
    exe "lcd " . l:dir
    exe "edit " l:dir . "/" . l:filename . ".md"
    redraw!
  else
    call fzf#run(fzf#wrap({
          \ 'dir': l:dir,
          \ 'source': 'ls -t *.md',
          \ 'sink': 'e',
          \ }))
  endif
endfun
command! -nargs=* Notes call s:searchNotes(<q-args>)
nmap <leader>N :Notes<cr>

" poor man's autoreload
" for the scripts, see https://github.com/mikker/dotfiles/tree/master/bin
fun! s:poorMansAutoReload(args)
  let l:cmd = expand(a:args)
  execute "au! BufWritePost *.{html,erb,haml,slim,css,scss,js} call system('" . l:cmd . "')"
endfun
command! AutoReloadChromeOrWhatever
      \ call s:poorMansAutoReload('reload-chrome')
command! AutoReloadSafariOrWhatever
      \ call s:poorMansAutoReload('reload-safari')

" }}}
" Plugin config and maps {{{

" FZF
noremap <leader>f :FZF<cr>
nnoremap <silent> <Leader>b :Buffers<cr>
nnoremap <silent> <leader>t :Tags<cr>

let g:task_paper_follow_move = 0

xmap <cr> :EasyAlign<cr>

let g:UltiSnipsExpandTrigger       = '<c-l>'
let g:UltiSnipsListSnippets        = '<c-q>'
let g:UltiSnipsJumpForwardTrigger  = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'

if has('nvim')
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_jsx_enabled_makers = ['standard']
  let g:neomake_ruby_enabled_makers = ['mri']
  let g:neomake_elixir_enabled_makers = []

  augroup neomakePost
    autocmd! BufWritePost *.js Neomake
    autocmd! BufWritePost {Gemfile,Rakefile} Neomake
    autocmd! BufWritePost *.{rb,rake} Neomake
    autocmd! BufWritePost *.{ex,exs,eex} Neomake
  augroup END
endif

let g:ragtag_global_maps = 1
let g:polyglot_disabled = ['javascript', 'elm', 'ruby', 'elixir', 'css']

" }}}

set background=light
colo paramount

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>

let $FZF_DEFAULT_COMMAND='ag -l -g ""'

let g:lightline = {
      \  'colorscheme': 'pencil',
      \  'separator': { 'left': '', 'right': '' },
      \  'subseparator': { 'left': '', 'right': '' },
      \  'active': {
      \    'left': [['mode', 'paste'], ['fugitive'], ['filename']],
      \    'right': [[], ['filetype'], ['neomake']]
      \  },
      \  'component_function': {
      \    'neomake': 'neomake#statusline#LoclistStatus',
      \    'filename': 'LightLineFilename',
      \    'fugitive': 'fugitive#head'
      \  }
      \}

function! LightLineModified()
  if &filetype ==# 'help'
    return ''
  elseif &modified
    return '[+]'
  else
    return ''
  endif
endfunction

function! LightLineFilename()
  return ('' !=# expand('%f') ? expand('%f') : '[No Name]') .
       \ ('' !=# LightLineModified() ? LightLineModified() : '')
endfunction

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 2
let g:pencil#concealcursor = 'c'

" A kind of GVIMRC for Neovim.app
if has('nvim') && has('gui')
  nmap <c-z> :term<cr>
endif

let g:neomake_elm_elm_lint_maker = { 'exe': 'elm-lint', 'errorformat': '%f:%l:%c [%t] %m' }
let g:neomake_elm_enabled_makers = ['elm_lint']

let g:vimwiki_list = [{
      \ 'path': '~/Dropbox/Wiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.wikimd',
      \ 'path_html': '~/Dropbox/Wiki/public'
      \ }]

map <leader>G :Goyo<cr>
let g:vimwiki_auto_chdir = 0

com! Wiki FZF ~/Dropbox/Wiki/
nnoremap <leader>W :Wiki<cr>

call togglebg#map("<f5>")

map <leader>u <Plug>(wildfire-fuel)
vmap <leader>d <Plug>(wildfire-water)

let g:gutentags_cache_dir = '~/.tags_cache'

