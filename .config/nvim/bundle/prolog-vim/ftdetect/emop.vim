" Vim ftdetect file
" Language:    EMoP
" Maintainer:  Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2011 March 10

" forget about maple
au! BufNewFile,BufRead *.mpl setf emop
