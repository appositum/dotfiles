"Description: Syntax checking plugin for syntastic.vim
"Language:    SWI-Prolog
"Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
"Last Change: 2015 July 20

if exists("g:loaded_syntastic_swiprolog_swipl_checker")
    finish
endif
let g:loaded_syntastic_swiprolog_swipl_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_swiprolog_swipl_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ 'args_after': '-q -t halt',
                \ 'fname_before': '-s',
                \ })

    let errorformat = '%t%*[^:]:\ %f:%l:%c:\ %m'

    return SyntasticMake({
                \ 'makeprg': makeprg,
                \ 'errorformat': errorformat,
                \ })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'swiprolog',
            \ 'name': 'swipl',
            \ })

if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'swiprolog')
else
    let g:syntastic_extra_filetypes = ['swiprolog']
endif

let &cpo = s:save_cpo
unlet s:save_cpo
