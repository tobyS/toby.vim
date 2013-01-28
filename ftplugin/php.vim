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

" Completion types to use (current buffer, other window buffers, invisible
" buffers and included files)
setlocal complete=.,w,b,i
