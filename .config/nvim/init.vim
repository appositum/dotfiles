set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'aurieh/discord.nvim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'adimit/prolog.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Nymphium/vim-koka'
Plugin 'spwhitt/vim-nix'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'wlangstroth/vim-racket'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/defx.nvim'
Plugin 'Shougo/deol.nvim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
call vundle#end()

filetype plugin indent on
set encoding=utf-8

syntax on
set t_Co=256
set termguicolors
set number
set clipboard=unnamed
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set laststatus=2
set showtabline=1
set hlsearch
set cursorline
set autoindent
set visualbell
colorscheme palenight
set background=dark

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeWinSize=20
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows = 1
"map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeIndicatorMapCustom = {
"	\ "Modified"  : "✹",
"	\ "Staged"    : "✚",
"	\ "Untracked" : "✭",
"	\ "Renamed"   : "➜",
"	\ "Unmerged"  : "═",
"	\ "Deleted"   : "✖",
"	\ "Dirty"     : "✗",
"	\ "Clean"     : "✔︎",
"	\ 'Ignored'   : '☒',
"	\ "Unknown"   : "?"
"	\ }

" cursor
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

" Haskell stuff
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_let = 0
let g:haskell_indent_where = 2
let g:haskell_indent_case = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 2
let g:haskell_indent_in = 0
let g:haskell_indent_guard = 2
let g:haskell_indent_if = 2

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" nord configs
"let g:nord_italic = 1
"let g:nord_comment_brightness = 20
"let g:nord_underline = 1
"let g:nord_uniform_status_lines = 1
"let g:nord_italic_comments = 1

" palenight
"let g:palenight_terminal_italics=1
"let g:lightline = {
"      \ 'colorscheme': 'palenight',
"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }

let g:palenight_terminal_italics=1
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


" tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap tc  :tabclose<CR>

"ignore fucking agda
"silent! py3 pass

tnoremap <Esc> <C-\><C-n>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 12
let g:netrw_altv = 1

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Vex | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'Vex' argv()[0] | wincmd p | ene | endif

map <silent> <C-n> :call ToggleVExplorer()<CR>

" ocaml merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
