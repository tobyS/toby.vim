func! MakeRealFunction() range
    let lnum = a:firstline
    let funclines = []
    while lnum <= a:lastline
        if (getline(lnum) =~ 'public.*;$' || getline(lnum) =~ 'abstract.*;$')
            call add(l:funclines, lnum)
        endif
        let lnum = lnum + 1
    endwhile
    call reverse(funclines)
    echo funclines

    for lnum in funclines
        let line = getline(lnum)
        let line = substitute(line, "abstract ", "", "")
        let line = substitute(line, ";$", "", "")
        call setline(lnum, line)

        let funcbody = []
        call add(funcbody, "    {")
        call add(funcbody, "        throw new \RuntimeException('Not implemented, yet');")
        call add(funcbody, "    }")

        call append(lnum, funcbody)
    endfor
endfunc
