" syntax highlighting for haskell
"
" Heavily modified version of the haskell syntax
" highlighter to support haskell.
"
" author: raichoo (raichoo@googlemail.com)

if exists("b:current_syntax")
  finish
endif

" Values
syn match haskellIdentifier "\<[_a-z]\(\w\|\'\)*\>"
syn match haskellNumber "0[xX][0-9a-fA-F]\+\|0[oO][0-7]\|[0-9]\+"
syn match haskellFloat "[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\="
syn keyword haskellBoolean true false

" Delimiters
syn match haskellDelimiter "[,;|.()[\]{}]"

" Type
syn match haskellType "\%(\<class\s\+\)\@15<!\<\u\w*\>" contained
  \ containedin=haskellTypeAlias
  \ nextgroup=haskellType,haskellTypeVar skipwhite
syn match haskellTypeVar "\<[_a-z]\(\w\|\'\)*\>" contained
  \ containedin=haskellData,haskellNewtype,haskellTypeAlias,haskellFunctionDecl
syn region haskellTypeExport matchgroup=haskellType start="\<[A-Z]\(\S\&[^,.]\)*\>("rs=e-1 matchgroup=haskellDelimiter end=")" contained extend
  \ contains=haskellConstructor,haskellDelimiter

" Constructor
syn match haskellConstructor "\%(\<class\s\+\)\@15<!\<\u\w*\>"
syn region haskellConstructorDecl matchgroup=haskellConstructor start="\<[A-Z]\w*\>" end="\(|\|$\)"me=e-1,re=e-1 contained
  \ containedin=haskellData,haskellNewtype
  \ contains=haskellType,haskellTypeVar,haskellDelimiter,haskellOperatorType,haskellOperatorTypeSig,@haskellComment


" Function
syn match haskellFunction "\%(\<instance\s\+\|\<class\s\+\)\@18<!\<[_a-z]\(\w\|\'\)*\>" contained
" syn match haskellFunction "\<[_a-z]\(\w\|\'\)*\>" contained
syn match haskellFunction "(\%(\<class\s\+\)\@18<!\(\W\&[^(),\"]\)\+)" contained extend
syn match haskellBacktick "`[_A-Za-z][A-Za-z0-9_\.]*`"

" Class
syn region haskellClassDecl start="^\%(\s*\)class\>"ms=e-5 end="\<where\>\|$"
  \ contains=haskellClass,haskellClassName,haskellOperatorType,haskellOperator,haskellType,haskellWhere
  \ nextgroup=haskellClass
  \ skipnl
syn match haskellClass "\<class\>" containedin=haskellClassDecl contained
  \ nextgroup=haskellClassName
  \ skipnl
syn match haskellClassName "\<[A-Z]\w*\>" containedin=haskellClassDecl contained

" Module
syn match haskellModuleName "\(\u\w\*\.\?\)*" contained excludenl
syn match haskellModuleKeyword "\<module\>"
syn match haskellModule "^module\>\s\+\<\(\w\+\.\?\)*\>"
  \ contains=haskellModuleKeyword,haskellModuleName
  \ nextgroup=haskellModuleParams
  \ skipwhite
  \ skipnl
  \ skipempty
syn region haskellModuleParams start="(" skip="([^)]\{-})" end=")" fold contained keepend
  \ contains=haskellClassDecl,haskellClass,haskellClassName,haskellDelimiter,haskellType,haskellTypeExport,haskellStructure,haskellModuleKeyword,@haskellComment
  \ nextgroup=haskellImportParams skipwhite

" Import
syn match haskellImportKeyword "\<\(foreign\|import\|qualified\)\>"
syn match haskellImport "\<import\>\s\+\(qualified\s\+\)\?\<\(\w\+\.\?\)*"
  \ contains=haskellImportKeyword,haskellModuleName
  \ nextgroup=haskellImportParams,haskellImportAs,haskellImportHiding
  \ skipwhite
syn region haskellImportParams
  \ start="("
  \ skip="([^)]\{-})"
  \ end=")"
  \ contained
  \ contains=haskellClass,haskellClass,haskellStructure,haskellType,haskellIdentifier
  \ nextgroup=haskellImportAs
  \ skipwhite
syn keyword haskellAsKeyword as contained
syn match haskellImportAs "\<as\>\_s\+\u\w*"
  \ contains=haskellAsKeyword,haskellModuleName
  \ nextgroup=haskellModuleName
syn keyword haskellHidingKeyword hiding contained
syn match haskellImportHiding "hiding"
  \ contained
  \ contains=haskellHidingKeyword
  \ nextgroup=haskellImportParams
  \ skipwhite

" Function declaration
syn region haskellFunctionDecl
  \ excludenl start="^\z(\s*\)\(\(foreign\s\+import\)\_s\+\)\?[_a-z]\(\w\|\'\)*\_s\{-}\(::\|∷\)"
  \ end="^\z1\=\S"me=s-1,re=s-1 keepend
  \ contains=haskellFunctionDeclStart,haskellForall,haskellOperatorType,haskellOperatorTypeSig,haskellType,haskellTypeVar,haskellDelimiter,@haskellComment
syn region haskellFunctionDecl
  \ excludenl start="^\z(\s*\)where\z(\s\+\)[_a-z]\(\w\|\'\)*\_s\{-}\(::\|∷\)"
  \ end="^\(\z1\s\{5}\z2\)\=\S"me=s-1,re=s-1 keepend
  \ contains=haskellFunctionDeclStart,haskellForall,haskellOperatorType,haskellOperatorTypeSig,haskellType,haskellTypeVar,haskellDelimiter,@haskellComment
syn region haskellFunctionDecl
  \ excludenl start="^\z(\s*\)let\z(\s\+\)[_a-z]\(\w\|\'\)*\_s\{-}\(::\|∷\)"
  \ end="^\(\z1\s\{3}\z2\)\=\S"me=s-1,re=s-1 keepend
  \ contains=haskellFunctionDeclStart,haskellForall,haskellOperatorType,haskellOperatorTypeSig,haskellType,haskellTypeVar,haskellDelimiter,@haskellComment
syn match haskellFunctionDeclStart "^\s*\(\(foreign\s\+import\|let\|where\)\_s\+\)\?\([_a-z]\(\w\|\'\)*\)\_s\{-}\(::\|∷\)" contained
  \ contains=haskellImportKeyword,haskellWhere,haskellLet,haskellFunction,haskellOperatorType
syn keyword haskellForall forall
syn match haskellForall "∀"

" Keywords
syn keyword haskellConditional if then else
syn keyword haskellStatement do case of in
syn keyword haskellLet let
syn keyword haskellWhere where
syn match haskellStructure "\<\(data\|newtype\|type\|kind\)\>"
  \ nextgroup=haskellType skipwhite
syn keyword haskellStructure derive
syn keyword haskellStructure instance
  \ nextgroup=haskellFunction skipwhite

" Infix
syn match haskellInfixKeyword "\<\(infix\|infixl\|infixr\)\>"
syn match haskellInfix "^\(infix\|infixl\|infixr\)\>\s\+\([0-9]\+\)\s\+\(type\s\+\)\?\(\S\+\)\s\+as\>"
  \ contains=haskellInfixKeyword,haskellNumber,haskellAsKeyword,haskellConstructor,haskellStructure,haskellFunction,haskellBlockComment
  \ nextgroup=haskellFunction,haskellOperator,@haskellComment

" Operators
syn match haskellOperator "\([-!#$%&\*\+/<=>\?@\\^|~:]\|\<_\>\)"
syn match haskellOperatorType "\%(\<instance\>.*\)\@40<!\(::\|∷\)"
  \ nextgroup=haskellForall,haskellType skipwhite skipnl skipempty
syn match haskellOperatorFunction "\(->\|<-\|[\\→←]\)"
syn match haskellOperatorTypeSig "\(->\|<-\|=>\|<=\|::\|[∷∀→←⇒⇐]\)" contained
  \ nextgroup=haskellType skipwhite skipnl skipempty

" Type definition
syn region haskellData start="^data\s\+\([A-Z]\w*\)" end="^\S"me=s-1,re=s-1 transparent
syn match haskellDataStart "^data\s\+\([A-Z]\w*\)" contained
  \ containedin=haskellData
  \ contains=haskellStructure,haskellType,haskellTypeVar
syn match haskellForeignData "\<foreign\s\+import\s\+data\>"
  \ contains=haskellImportKeyword,haskellStructure
  \ nextgroup=haskellType skipwhite

syn region haskellNewtype start="^newtype\s\+\([A-Z]\w*\)" end="^\S"me=s-1,re=s-1 transparent
syn match haskellNewtypeStart "^newtype\s\+\([A-Z]\w*\)" contained
  \ containedin=haskellNewtype
  \ contains=haskellStructure,haskellType,haskellTypeVar

syn region haskellTypeAlias start="^type\s\+\([A-Z]\w*\)" end="^\S"me=s-1,re=s-1 transparent
syn match haskellTypeAliasStart "^type\s\+\([A-Z]\w*\)" contained
  \ containedin=haskellTypeAlias
  \ contains=haskellStructure,haskellType,haskellTypeVar

" String
syn match haskellChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"
syn region haskellString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region haskellMultilineString start=+"""+ end=+"""+ fold contains=@Spell

" Comment
syn match haskellLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$" contains=@Spell
syn region haskellBlockComment start="{-" end="-}" fold
  \ contains=haskellBlockComment,@Spell
syn cluster haskellComment contains=haskellLineComment,haskellBlockComment,@Spell

syn sync minlines=50

" highlight links
highlight def link haskellModule Include
highlight def link haskellImport Include
highlight def link haskellModuleKeyword haskellKeyword
highlight def link haskellImportAs Include
highlight def link haskellModuleName Include
highlight def link haskellModuleParams haskellDelimiter
highlight def link haskellImportKeyword haskellKeyword
highlight def link haskellAsKeyword haskellKeyword
highlight def link haskellHidingKeyword haskellKeyword

highlight def link haskellConditional Conditional
highlight def link haskellWhere haskellKeyword
highlight def link haskellInfixKeyword haskellKeyword

highlight def link haskellBoolean Boolean
highlight def link haskellNumber Number
highlight def link haskellFloat Float

highlight def link haskellDelimiter Delimiter

highlight def link haskellOperatorTypeSig haskellOperatorType
highlight def link haskellOperatorFunction haskellOperatorType
highlight def link haskellOperatorType haskellOperator

highlight def link haskellConstructorDecl haskellConstructor
highlight def link haskellConstructor haskellFunction

highlight def link haskellTypeVar Identifier
highlight def link haskellForall haskellStatement

highlight def link haskellChar String
highlight def link haskellBacktick haskellOperator
highlight def link haskellString String
highlight def link haskellMultilineString String

highlight def link haskellLineComment haskellComment
highlight def link haskellBlockComment haskellComment

" haskell general highlights
highlight def link haskellClass haskellKeyword
highlight def link haskellClassName Type
highlight def link haskellStructure haskellKeyword
highlight def link haskellKeyword Keyword
highlight def link haskellStatement Statement
highlight def link haskellLet Statement
highlight def link haskellOperator Operator
highlight def link haskellFunction Function
highlight def link haskellType Type
highlight def link haskellComment Comment

let b:current_syntax = "haskell"
