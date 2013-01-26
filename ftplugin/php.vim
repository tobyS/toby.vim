setlocal keywordprg=pman

let g:syntastic_phpcs_conf=" --standard=PSR2 "

let g:php_source_prefixes = ['src/main/php/', 'src/main/', 'src/', 'lib/']

func! PathToNamespace(path)
    let l:path = a:path
    for l:prefix in g:php_source_prefixes
        if stridx(l:path, l:prefix) == 0
            let l:path = strpart(l:path, strlen(l:prefix))
            break
        endif
    endfor
    return substitute(l:path, '/', '\\', 'g')
endfunc

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
