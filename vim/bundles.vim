set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" tpope's the shit
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-projectile'
Bundle 'tpope/vim-abolish'

" things
Bundle 'kien/ctrlp.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'moll/vim-bbye'
Bundle 'vim-scripts/renamer.vim'

Bundle 'reedes/vim-pencil'
Bundle 'mikker/vim-osx-colorpicker'
Bundle 'junegunn/vim-easy-align'
Bundle 'junegunn/goyo.vim'

" Bundle 'vim-scripts/BufOnly.vim'
" Bundle 'nelstrom/vim-visual-star-search'
" Bundle 'sjl/vitality.vim'
" Bundle 'wellle/targets.vim'

" filetypes and syntax
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'slim-template/vim-slim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'JulesWang/css.vim'
Bundle 'msanders/cocoa.vim'

" stupid themes
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'junegunn/seoul256.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'reedes/vim-colors-pencil'
" Bundle 'mikker/Spacedust-theme.vim'

filetype on
