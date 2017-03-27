function! g:WinQuote(cmd)
  let cmd = substitute(a:cmd, '\(\\\+\)', '\=repeat("\\",strlen(submatch(1))/2)','')
  let res = []
  let total = split(cmd,'\%(\\\@<!\\\%(\\\\\)*\)\@<!"')
  if len(total) > 1
    let i = 0
    while i < len(total)
      if i%2
        call add(res,total[i])
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
