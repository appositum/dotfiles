augroup filetypedetect
   " forget about perl and IDL
   au! BufNewFile,BufRead *.pl,*.pro
   " on new .pl files choose prolog
   au BufNewFile *.pl,*.pro,*.plt setf swiprolog
   " on others, try to check
   au BufRead *.pl call s:FTprolog('perl')
   au BufRead *.pro call s:FTprolog('idlang')
   au BufRead *.plt setf swiprolog
augroup END

function! s:FTprolog(alt)
   " recognize Prolog by specific text in the first non-empty line
   " require a blank after the '%' because Perl uses "%list" and "%translate"
   let l = getline(nextnonblank(1))
   if l == '' || l =~ '\<prolog\>' || l =~ '^\s*\(%\+\(\s\|$\)\|/\*\)' || l =~ ':-' || l =~ ')\.$'
      setf swiprolog
   else
      setf a:alt
   endif
endfunction
