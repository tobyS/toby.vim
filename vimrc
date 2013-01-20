set nocompatible               " be iMproved
filetype off                   " required!


" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tobyS/vimtip'

" Required after Vundle did its job.
filetype plugin indent on     " required!
