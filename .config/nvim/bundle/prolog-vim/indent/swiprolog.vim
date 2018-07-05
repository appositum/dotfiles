" Language:     GNU Prolog
" Maintainer:   Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change:	 2008 October 31
" adapted from Gergely Kontra's prolog mode

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif

let b:did_indent = 1

setlocal indentexpr=GetPrologIndent()
setlocal indentkeys-=:,0#
setlocal indentkeys+=0%,-,0;,>,0)

function! GetPrologIndent()
   " Find a non-blank line above the current line.
   let pnum = prevnonblank(v:lnum - 1)
   " Hit the start of the file, use zero indent.
   if pnum == 0
      return 0
   endif
   let line = getline(v:lnum)
   let pline = getline(pnum)

   let ind = indent(pnum)
   " Previous line was comment -> use previous line's indent
   if pline =~ '^\s*%'
      retu ind
   endif
   " Check for clause head/DCG on previous line
   if pline =~ '^[^%]*\(:-\|-->\)\s*\(%.*\)\?$'
      let ind = ind + &sw
   " Check for end of clause on previous line
   elseif pline =~ '^[^%]*\.\s*\(%.*\)\?$'
      let ind = ind - &sw
   endif
   " Check for opening conditional or block on previous line
   if pline =~ '^\s*\(;\|->\|\([^%]*([^)]*\|{[^}]*\|[[][^]]*\)\(%.*\)\?$\)'
      let ind = ind + &sw
   endif
   " Check for closing an unclosed paren, or middle ; or ->
   if line =~ '^\s*\([]);}]\|->\)'
      let ind = ind - &sw
   endif
   return ind
endfunction
