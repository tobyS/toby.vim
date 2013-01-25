setlocal keywordprg=pman

let g:syntastic_phpcs_conf=" --standard=PSR2 "

" Use the dictionary completion
setlocal complete-=k complete+=k

func! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <buffer> <tab> <c-r>=InsertTabWrapper()<cr>
