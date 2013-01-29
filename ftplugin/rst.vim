setlocal textwidth=79

func! RstHeading()
    echom "Running head:"
    let l:curPos = getpos(".")

    let l:row = l:curPos[1]
    let l:col = l:curPos[2]

    if RstIsHeading(l:row)
        let l:headLen = len(getline(l:row))

        if (l:headLen < 1)
            " Avoid deletion of head lines if heading is still empty
            return
        endif

        if RstIsOverlined(l:row)
            let l:headChar = RstGetLineChar(l:row - 1)
        elseif RstIsUnderlined(l:row)
            let l:headChar = RstGetLineChar(l:row + 1)
        endif

        let l:headLine = repeat(l:headChar, l:headLen)

        if RstIsOverlined(l:row)
            call setline(l:row - 1, l:headLine)
        endif
        if RstIsUnderlined(l:row) || RstIsOverlined(l:row)
            call setline(l:row + 1, l:headLine)
        endif
    endif
endfunc

func! RstGetLineChar(row)
    return matchstr(getline(a:row), '^.')
endfunc

func! RstIsHeading(row)
    return RstIsOverlined(a:row) || RstIsUnderlined(a:row)
endfunc

func! RstIsUnderlined(row)
    return RstMatchHeadLine(a:row + 1)
endfunc

func! RstIsOverlined(row)
    return RstMatchHeadLine(a:row - 1)
endfunc

func! RstMatchHeadLine(row)
    return match(getline(a:row), '^\([=#^-]\)\1*$') > -1
endfunc

autocmd CursorMovedI <buffer> call RstHeading() 
