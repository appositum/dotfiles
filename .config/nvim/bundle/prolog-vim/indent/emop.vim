" Vim indent file
" Language:    EMoP
" Maintainer:  Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2011 March 10

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif

let b:did_indent = 1

setlocal indentexpr=GetEMoPIndent()
setlocal indentkeys-=:,0#
setlocal indentkeys+=0%,0;,>,0),0|

function! GetEMoPIndent()
   " Find a non-blank line above the current line.
   let prevnum = prevnonblank(v:lnum - 1)
   " At the start of the file, use no indent.
   if prevnum == 0
      return 0
   endif
   let cline = getline(v:lnum)
   let pline = getline(prevnum)

   let pind = indent(prevnum)
   " Previous line was comment -> use previous line's indent
   if pline =~ '^\s*%'
      return pind
   endif
   let ind = pind
   " if previous line ends in :-  = | { ( or :
   " or is a ; alone
   " then indent more
   if pline =~ '\(:-\|[={(:]\)\s*\(%\|$\)' || pline =~ '^\s*;\s*\(%\|$\)'
      let ind = ind + &sw
   " if end of clause on previous line, and previous to previous is not blank,
   " indent less
   elseif pline =~ '\.\s*\(%\|$\)' && getline(prevnum-1) !~ '^\s*\(%\|$\)'
      let ind = ind - &sw
   endif
   " Check current line for closing an unclosed paren, or middle ; or ->
   if cline =~ '^\s*\([});]\|->\)'
      let ind = ind - &sw
   endif
   return ind
endfunction
