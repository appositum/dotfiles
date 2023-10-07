set shell=/usr/bin/fish

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'adimit/prolog.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'rgrinberg/vim-ocaml'
Plugin 'catppuccin/nvim'
call vundle#end()

filetype plugin indent on
set encoding=utf-8

syntax on
set t_Co=256
set termguicolors
set number
set clipboard=unnamedplus
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set laststatus=2
"set showtabline=2
set hlsearch
set cursorline
set autoindent
set smartindent
set visualbell
set noshowmode
colorscheme catppuccin-mocha
set background=dark

hi MatchParen guibg=NONE guifg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi Search guibg=NONE guifg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

""Toggle relative numbering, and set to absolute on loss of focus or insert mode
set number relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber

hi TabLineFill guifg=LightGreen guibg=DarkGreen
hi TabLine guifg=#ff0000 guibg=#00ff00
hi TabLineSel guifg=Red guibg=Yellow
hi Title guifg=LightBlue guibg=Magenta

hi CursorLine guibg=#313244
hi CursorLineNr guibg=#313244 guifg=#cba6f7
hi Normal guibg=NONE ctermbg=NONE

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

let g:haskell_indent_case = 2
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 4
let g:haskell_indent_in = 0

let g:palenight_terminal_italics=1
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.enable = {
        \ 'statusline': 1,
        \ 'tabline': 2
        \ }
let g:lightline.tabline = {
        \  'left':  [ [ 'tabs' ] ],
        \  'right': [ [ 'buffers'] ]
        \ }
let g:lightline.tab = {
        \ 'active':   [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
        \ }
"let g:lightline.separator = { 'left': '', 'right': '' }
"let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.component_function = {
  \ 'buffers': 'g:lightline.my.buffers',
  \ }

let g:lightline.my = {}
function g:lightline.my.buffers()
  return 'buffers'
endfunction

