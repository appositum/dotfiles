" Vim syntax file
" Language:    CLPZinc
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2015 January 22

" include standard prolog syntax file
runtime syntax/prolog.vim

" SwiProlog specific
syn keyword plzKeyword     of forall exists false
syn keyword plzKeyword     min max card dom_nth store retrieve
syn keyword plzKeyword     first_fail input_order most_constrained
syn keyword plzKeyword     minimize maximize satisfy

syn keyword plzDirective   int constraint array var include output solve
syn keyword plzDirective   int_search

syn match   plzOperator    "\.\.\|:\|++\||\|#\\\?/\\\|#\\\?==>\|#\\\?<==>\|#=\?<#\?\|#\\\?=#\?\|##\|#>=\?#\?\|#\\\?\\/\?"

syn match   plzClauseHead  "^\(\l\w*\|'.*'\)\s*\((.*)\)\?\s*\(:-\|\.\)"

syn match   plzPlDoc       contained "\s@\w*"
syn keyword plzTodo        contained TODO FIXME XXX
syn match   plzComment     "%.*" contains=plzTodo,plzPlDoc
syn region  plzComment     start="/\*" end="\*/" contains=plzTodo,plzPlDoc

hi def link plzComment     Comment
hi def link plzTodo        Todo
hi def link plzKeyword     Special
hi def link plzDirective   Type
hi def link plzPlDoc       Type
hi def link plzOperator    SpecialChar
syn clear prologClauseHead
hi! def link prologClauseHead    Normal
hi def link plzClauseHead  Function

let b:current_syntax = "clpzinc"
