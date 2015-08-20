func! SkipCallsTo()
    let l:lineno = line(".")
    let l:linecontent = getline(l:lineno)

    let l:matches = matchlist(linecontent, '^\s\+\S\+\s\+\S\+\(\s\+\)\S')

    let l:indentlen = strlen(matches[1]) + 1

    execute "normal! /^\\s\\+\\S\\+\\s\\+\\S\\+\\s\\{1," . indentlen . "}\\S\\+\<CR>"
    execute "normal! / ->\\|=>\<CR>"

endfunc
