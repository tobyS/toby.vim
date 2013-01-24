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
Bundle 'SirVer/ultisnips'
" Nice title bar
Bundle 'Lokaltog/powerline'
" Syntaxt checks
Bundle 'scrooloose/syntastic'
" Abbreviate and convenient substitute
Bundle 'tpope/vim-abolish'
" Solarized color scheme
Bundle "altercation/vim-colors-solarized"
" :Rename command
Bundle "danro/rename.vim"
" XML editing
Bundle "sukima/xmledit"
" Easy motion using <Leader><w>
Bundle "Lokaltog/vim-easymotion"

" Testing framework for VIM scripts
Bundle "runVimTests"

" Local development
Bundle "/home/dotxp/dev/VIM/pdv.git"
Bundle "/home/dotxp/dev/VIM/vmustache.git"

" Approximate colorschemes
" Seems to be not needed
" Bundle 'godlygeek/csapprox'

""""""""""""
" Trying ...
""""""""""""

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

" Automatically reload .vimrc if it is change
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Set numbers, sort casing, tabstops and such
set number
set smartcase
set ignorecase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nocompatible
set nopaste
set hidden
set nowrap

" Set the mapleader and local map leader to ,
let mapleader = ","
let maplocalleader = ","
set encoding=utf-8

" Automatic indention and such around expressions/brackets
set indentexpr=
set autoindent
set smartindent

" Incremental search
set incsearch
" Do not highlight search results
set nohlsearch

" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Set the autocomplete style for files
set wildmenu
set wildmode=list:longest

" Cursor line in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Deactivate visual bell
set visualbell
set t_vb=
set ttyfast
set ruler
set laststatus=2

" Repair wired terminal/vim settings
set backspace=start,eol,indent
" ???
set ofu=syntaxcomplete#Complete
" Allow file inline modelines to provide settings
set modeline

" Set mapping for CSApprox
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" Set colors
set t_Co=256

syntax enable
" let g:solarized_termcolors=256
colorscheme solarized

filetype plugin on
filetype indent on

" Restore line number and column if reentering a file after having edited it
" at least once. For this to work .viminfo in the home dir has to be writable by the user.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable customized non-visible character display
" http://vimcasts.org/episodes/show-invisibles/
nnoremap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Save file as root using sudo
cnoremap w!! w !sudo tee % >/dev/null

" Set a custom snippets directory. This ensures our own snippets are used
" instead of the ones provided with snipmate
let g:snippets_dir = $HOME . "/.vim/snippets/"

" MovingThroughCamelCaseWords
nnoremap <silent><C-Left>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR> 

" Toggle paste with <ins>
set pastetoggle=<ins>
" Go to insert mode when <ins> pressed in normal mode
nnoremap <silent> <ins> :setlocal paste!<CR>i
" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> se nopaste

" Twig template highlighting
autocmd BufRead *.twig set filetype=twig
autocmd BufRead *.html.twig set filetype=htmltwig
" Handle *.phps as PHP files
au BufRead,BufNewFile *.phps		set filetype=php

" VIMTips
let g:vimtip_tips = []
call add(g:vimtip_tips, "Easy motion with <,><w>")
call add(g:vimtip_tips, "Register <*> is middle mouse clipboard")
call add(g:vimtip_tips, "Jump to matching brace: <%>")
call add(g:vimtip_tips, "Re-indent code: <=>")
call add(g:vimtip_tips, "Indent inner / outer block: >iB / >aB")
call add(g:vimtip_tips, ":r <file> paste the given file at the current position")

autocmd VimEnter * call vimtip#NextTip()
autocmd WinEnter * call vimtip#NextTip()

" Undo history between sessions
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Colored column (to see line size violations)
set colorcolumn=80

" Edit Files relativ to me
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Enhance Omnicompletion
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone

" Window Management
" TODO: Doesn't work?
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-0> <C-W>|
nnoremap <C-=> <C-W>=

" Map <F5> to turn spelling on (VIM 7.0+)
map <F5> :setlocal spell! spelllang=en_us<cr>
" Map <F6> to turn spelling (de) on (VIM 7.0+)
map <F6> :setlocal spell! spelllang=de<cr>

python from powerline.bindings.vim import source_plugin; source_plugin()

" Configure Ultisnips
let g:UltiSnipsJumpForwardTrigger = "<tab>"

" Remap leader for easy motion
let g:EasyMotion_leader_key = '<Leader>'
