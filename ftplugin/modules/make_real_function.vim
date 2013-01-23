func! MakeRealFunction()
    if (getline(line(".")) =~ 'public.*;$' || getline(line(".")) =~ 'abstract.*;$')
        g/function.*;$/norm! o{}Othrow new \RuntimeException("Not implemented, yet.");
        g/function.*;$/s/abstract //
        g/function.*;$/s/;$//
    endif
endfunc
