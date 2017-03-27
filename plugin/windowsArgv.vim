function! g:WinQuote(cmd)
  let cmd = substitute(a:cmd, '\(\\\{3,}\)\ze"', '\=repeat("\\",strlen(submatch(1))/2)','g')
  let res = []
  let total = split(cmd,'\%(\\\@<!\\\%(\\\\\)*\)\@<!"')
  if len(total) > 1
    let i = 0
    while i < len(total)
      if i%2
        let tail = matchstr(total[i-1],'\S\@<!\S\+$')
        if strlen(tail)
          let res[i-1] = matchstr(res[i-1],'.*\s')
          if res[i-1] is ''
            unlet res[i-1]
          endif
        endif
        call add(res,tail.total[i])
      else
        let res = res + split(total[i])
      endif
      let i += 1
    endwhile
    return res
  else
    return split(cmd)
  endif
endfunction
