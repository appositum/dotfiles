" Vim syntax file
" Language:    SiLCC
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2011 March 10

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
   finish
endif

" EMoP is case sensitive.
syn case match

syn region     emopString     start=/"/ skip=/[^\\]\\"/ end=/"/
syn region     emopAtom       start=/'/ skip=/[^\\]\\'/ end=/'/
" syn region     emopPred       start=/`/ skip=/[^\\]\\'/ end=/'/
syn region     emopVar        start=/`/ skip=/[^\\]\\`/ end=/`/
syn region     emopComment    start="/\*" end="\*/" contains=emopTodo
syn match      emopComment    "%.*" contains=emopTodo
syn keyword    emopTodo       contained TODO FIXME XXX

syn keyword    emopKeyword    once fail true forall throw catch for repeat
syn keyword    emopSpecial    main match

syn match      emopVar        "\<[A-Z_][A-Za-z0-9_'\.]*"
syn match      emopModule     "\w\+\([\.:]\w\+\)*:\ze[^-]"
syn match      emopModule     "'\w\+\(\.\w\+\)*':\ze[^-]"
syn match      emopModule     "\w\+\(\.\w\+\)\*\.\ze("

syn match      emopOperator   "+\|-\|*\|/\|\.\.\|mod\|quo\|?\|<\|>\|="
syn match      emopOperator    "\[\|\]\|->\||\|\^\|>>\|!\|\\+"

" syn match   emopClauseHead "^\s*\S.*\([^\\]=\|:-\)\ze[^']*\.\s*$" contains=emopComment
" syn match   emopClauseHead "^\s*\S.*\([^\\]=\|:-\)\s*$" contains=emopComment
syn match   emopClauseHead "^\s*\l.*\([^\\]=\|:-\)\ze[^']*\.\s*$" contains=emopComment
syn match   emopClauseHead "^\s*\l.*\([^\\]=\|:-\)\s*$" contains=emopComment
syn match   emopClauseHead "^\s*\(%.*\)\?\n[^:]\+\.\s*$" contains=emopComment
syn match   emopClauseHead "\(\.\s*\|\n\)\n\s*\(\l\w*\|'.*'\)\s*\((.*)\)\?\."hs=s+2 contains=emopComment
" do is a "special" clause
syn match   emopSpecial    "^\s*do.*\(:-\|=\)\ze\([^']*\.\)\?\s*$"
syn match   emopSpecial "\(constructor\|import\|abstract\|level\)\s*:"he=e-1
syn region  emopSpecial start="^\s*syntax\s*:"he=e-1 end="\." contains=emopString,emopOperator
syn region  emopSpecial start="^\s*notation\s*:"he=e-1 end="\." contains=emopAtom,emopOperator,emopDirective

syn keyword emopDirective module
syn match   emopDirective "\(\[.*\]\)\?\s*{\|}"
syn match   emopDirective "(\(goal\|\s*,\s*\|term\)\+)"

syn match   emopNumber "\<\d\+\(\.\d\+\([eE]-\?\d\+\)\?\)\?\>"
syn match   emopNumber "0'\([^\\]\|\\.\)"

hi def link emopString     String
hi def link emopAtom       Constant
hi def link emopNumber     Constant
hi def link emopKeyword    Special
hi def link emopDirective  Define
hi def link emopSpecial    SpecialChar
hi def link emopOperator   Operator
hi def link emopClauseHead Function
hi def link emopModule     Type
hi def link emopComment    Comment
hi def link emopVar        Normal

let b:current_syntax = "emop"

" vim: ts=28
