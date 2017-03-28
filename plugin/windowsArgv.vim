function! g:CommandLineToArgvW(cmd)
  let res = []
  let strrep = '\=repeat("\\",strlen(submatch(0))/2)'
  if a:cmd[0] =~ '\s'
    call add(res,'')
  endif
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
        call add(res,substitute(tail,'\\\{2,}$',strrep,'').total[i])
      else
        let space = split(total[i])
        if i && total[i][0] =~ '\S'
          let res[-1] = res[-1] . remove(space,0)
        endif
        let res = res + map(space,'substitute(v:val,''\\\+\ze"'','''.strrep.''',"g")')
      endif
      let i += 1
    endwhile
  else
    let res = res + map(split(a:cmd),'substitute(v:val,''\\\+\ze"'','''.strrep.''',"g")')
  endif
  return res
endfunction

function! g:ArgvQuote(arr)
  let l:arr = filter(a:arr,'v:val isnot ""')
  if !len(l:arr)
    return
  endif
  call map(l:arr,'escape(v:val,''"'')')
  let exe = remove(l:arr,0) . ' '
  call map(l:arr,'substitute(v:val, ''[()%!<>&|"^]'', "^&", "g")')
  return '^"'. exe . substitute(join(l:arr,'^" ^"'),'.\+','^"&^"','').'^"'
endfunction
