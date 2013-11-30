setlocal keywordprg=pman

" Configure PDV
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

let g:syntastic_phpcs_conf=" --standard=PSR2 "
let  g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"
" let  g:syntastic_php_phpcs_args = "--report=csv --standard=ezcs"

let g:php_source_prefixes = ['src/main/php/', 'src/main/', 'src/', 'lib/', 'test/phpunit/', 'test/']

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

nnoremap <buffer> <leader>a :! grep 'public function' % \| sort -d<CR>

" Completion for PHP keywords
set dictionary+=~/.vim/ftplugin/php/keywords.txt

" Completion types to use (current buffer, other window buffers, invisible
" buffers, included files and keywords)
setlocal complete=.,w,b,i,k
