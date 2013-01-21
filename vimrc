set nocompatible               " be iMproved
filetype off                   " required!


" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" ... register Vundle bundles
Bundle 'tobyS/vimtip'
" Autocompletion of everything
Bundle 'ervandew/supertab'
" Display trailing whitespaces
Bundle 'jakobwesthoff/whitespacetrail'
" Fancy snippet machine
Bundle 'msanders/snipmate.vim'
" Nice title bar
Bundle 'Lokaltog/powerline'
" Syntaxt checks
Bundle 'scrooloose/syntastic'
" Abbreviate and convenient substitute
Bundle 'tpope/vim-abolish'
" Solarized color scheme
Bundle "altercation/vim-colors-solarized"

" Approximate colorschemes
" Seems to be not needed
" Bundle 'godlygeek/csapprox'

""""""""""""
" Trying ...
""""""""""""

" Fuzzy search through various items (files, etc.)
Bundle 'kien/ctrlp.vim'
" Git integration
Bundle 'tpope/vim-fugitive'
" Rewrap argument lists
Bundle 'jakobwesthoff/argumentrewrap'
" Re-indents pasted code
Bundle 'sickill/vim-pasta'
" Easy motion using <leader><leader><motion>
Bundle 'Lokaltog/vim-easymotion'
" Make ',' an object
Bundle 'austintaylor/vim-commaobject'

" Required after Vundle did its job.
filetype plugin indent on     " required!
