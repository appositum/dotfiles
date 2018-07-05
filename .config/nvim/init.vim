set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on


syntax on
colorscheme nord
"set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/"
let g:airline_powerline_fonts = 1
set number
set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set laststatus=2
set showtabline=1
set t_Co=256
set cursorline
set hlsearch
set autoindent
set visualbell
set ignorecase

execute pathogen#infect()
call pathogen#helptags()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=20
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }


if &term == 'screen-256color' || &term == 'xterm-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

hi MatchParen guibg=NONE guifg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi Search guibg=NONE guifg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

let mapleader=","
set timeout timeoutlen=1500

"""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
""Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

""Toggle relative numbering, and set to absolute on loss of focus or insert mode
set number relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Haskell stuff
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_let = 0
let g:haskell_indent_where = 6
let g:haskell_indent_case = 4
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 0
let g:haskell_indent_guard = 4
