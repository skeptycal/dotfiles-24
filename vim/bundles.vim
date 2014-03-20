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
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-repeat'

" things
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'mikker/sparkup', {'rtp': 'vim/'}
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'moll/vim-bbye'
Bundle 'reedes/vim-pencil'
Bundle 'mikker/vim-osx-colorpicker'
Bundle 'junegunn/vim-easy-align'
Bundle 'junegunn/goyo.vim'
Bundle 'sjl/vitality.vim'

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
Bundle 'zeis/vim-kolor'
Bundle 'reedes/vim-colors-pencil'

Bundle 'vim-scripts/renamer.vim'

filetype on