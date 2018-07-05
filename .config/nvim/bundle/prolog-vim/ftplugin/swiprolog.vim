" Vim ftplugin file
" Language:    SWI-Prolog
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2015 July 20

setlocal efm=%t%*[^:]:\ %f:%l:%c:\ %m,%A%t%*[^:]:\ %f:%l:,%Z\\t%m,%-G%%\ autoload%.%#,%-G%%\ %.%#meta%.predicate%.%#,%-G%%\ Restarting\ analysis\ ...
setlocal comments=s1:/*,mb:*,ex:*/,:% commentstring=%\ %s
" run interactively
nnoremap <buffer> <LocalLeader>r :! swipl -s %<CR><CR>
" compile
nnoremap <buffer> <LocalLeader>c :call SWIprolog_Compile()<CR>

function! SWIprolog_Compile()
   let b:old_mp = &mp
   setlocal mp=swipl\ --stand_alone=true\ -c\ %
   exe "make\|cw 5\|cc"
   exe "setlocal mp=" . escape(b:old_mp,' ')
endfunction

let g:neomake_swiprolog_swipl_maker = {
         \ 'errorformat': '%t%*[^:]:\ %f:%l:%c:\ %m',
         \ 'args':  ['-s', '%:p', '-q', '-t', 'halt'],
         \ }
let g:neomake_swiprolog_enabled_makers = ['swipl']
