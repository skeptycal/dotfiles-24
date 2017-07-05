set nocompatible

call plug#begin('~/.vim/bundle')

function! s:maybeLocalPlug(args)
  let l:localPath = $HOME . "/dev/" . expand(a:args)

  if isdirectory(l:localPath)
    Plug l:localPath
  else
    Plug 'mikker/' . expand(a:args)
  endif
endfunction

call s:maybeLocalPlug('lightline-theme-pencil')
call s:maybeLocalPlug('vim-rerunner')
call s:maybeLocalPlug('vim-dimcil')
call s:maybeLocalPlug('vim-colors-paramount')

" tpope's the shit
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" things
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'gerw/vim-HiLinkTrace'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'rakr/vim-togglebg'
Plug 'reedes/vim-pencil'
Plug 'wincent/ferret'
Plug 'mattn/emmet-vim'

Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim'

" filetypes and syntax
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'
Plug 'junegunn/vim-journal'

" colorschemes
Plug 'pbrisbin/vim-colors-off'
Plug 'romainl/Apprentice'

if has("nvim")
  Plug 'sbdchd/neoformat'
  Plug 'benekastah/neomake'
else
  Plug 'tpope/vim-sensible'
endif

Plug 'kassio/neoterm'
Plug 'roxma/nvim-completion-manager'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/ncm-rct-complete'

call plug#end()

