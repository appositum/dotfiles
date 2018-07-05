" Vim ftplugin file
" Language:    EMoP
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2011 February 25

" Make program
setlocal mp=emop\ %
setlocal efm=%+PFile\ \"%f\",%m\ appears\ at\ line\ %l\\,\ from\ character\ %c%.%#
setlocal efm+=%EFile\ \"%f\"\\,\ %[from\ ]%#line\ %l\\,%#\ %[from\ ]%#character\ %c%.%#,%Z[%t%.%#]\ %m

" make
nnoremap <buffer> <LocalLeader>m :make\|cw 5\|cc<CR><CR>
