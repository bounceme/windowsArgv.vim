function! g:WinQuote(cmd)
  let res = []
  let total = split(a:cmd,'\%(\\\@<!\\\%(\\\\\)*\)\@<!"',1)
  if len(total) > 1
    let i = 0
    while i < len(total)
      if i%2
        let tail = matchstr(total[i-1],'\S\@<!\S\+$')
        if strlen(tail)
          let res[-1] = matchstr(res[-1],'.*\s')
          if res[-1] is ''
            unlet res[-1]
          endif
        endif
        call add(res,substitute(tail,'\\\{2,}$','\=repeat("\\",strlen(submatch(0))/2)','').total[i])
      else
        let space = split(total[i])
        if i && total[i][0] =~ '\S'
          let res[-1] = res[-1] . remove(space,0)
        endif
        let res = res + space
      endif
      let i += 1
    endwhile
    return res
  else
    return split(a:cmd)
  endif
endfunction
