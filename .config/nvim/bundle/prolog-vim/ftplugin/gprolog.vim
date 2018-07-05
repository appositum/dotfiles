" Vim ftplugin file
" Language:    GNU-Prolog
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2008 October 31

" setlocal mp=tclp\ --prolog\ gprolog\ %
" setlocal mp=gplc\ %
setlocal efm=%*[^\ ]\ including\ %f:%l%m,%f:%l%m(char:%c),%f:%l:%m,%f:%l-%*\\d:%m,!\ Error\ in\ \"%f\"\\,\ line\ %l\ :\ %m
" make
nnoremap <buffer> <LocalLeader>m :make\|cw 5\|cc<CR><CR>
" execute
nnoremap <buffer> <LocalLeader>e :! %<<CR><CR>
" run interactively
nnoremap <buffer> <LocalLeader>r :! gprolog --query-goal "consult('%')"<CR><CR>
" compile
nnoremap <buffer> <LocalLeader>c :call Gprolog_Compile()<CR>

function! Gprolog_Compile()
   let b:old_mp = &mp
   setlocal mp=gplc\ %
   exe "make\|cw 5\|cc"
   exe "setlocal mp=" . escape(b:old_mp,' ')
endfunction

function! Gprolog_Fixline(lnum)
   " turns tabs to spaces
   exe a:lnum . ',' . a:lnum . 's/\t/   /ge'
   " removes end line spaces
   exe a:lnum . ',' . a:lnum . 's/\s\+$//e'
   " avoid code mixed with comments on the same line
   exe a:lnum . ',' . a:lnum . 's/^\(^[^%]*[^ %][^%]*\)%/\1%/e'

   let line = getline(a:lnum)
   if line !~ '%'
      " adds one space after commas and operators
      let line = substitute(line, '\(:-\|=\.\.\|==\|[,*|]\|[^\\]+\)\([^ ]\)', '\1 \2', 'g')
      let line = substitute(line, '\(-\|=\|<\|>\)\(\w\|[([]\)', '\1 \2', 'g')

      " adds one space before operators
      let line = substitute(line, '\([^ %\\\/]\)\(:-\|=\.\.\|==\|[+*|@]\)', '\1 \2', 'g')
      let line = substitute(line, '\(\w\|[)]]\)\(-\|=\|<\|>\|@\|#\)', '\1 \2', 'g')

      call setline(a:lnum, line)

      " force let line skip
      exe a:lnum . ',' . a:lnum . 's/\([^ ]\+\)\s*\(->\|;\|!\)/\1   \2/ge'
      exe a:lnum . ',' . a:lnum . 's/\(.:-\|->\|;\)\(.\)/\1   \2/ge'
      exe a:lnum . ',' . a:lnum . 's/!\([,\.]\)\([^,\.]\)/!\1   \2/ge'
   endif
endfunction

function! Gprolog_Prettify()
   " treat all non-comment lines
   let lnum = 1
   while lnum <= line("$")
      call Gprolog_Fixline(lnum)
      let lnum = lnum + 1
   endwhile

   " reindent everything
   let old_line=line('.')
   normal(gg=G)
   exe ':' . old_line
endfunction

