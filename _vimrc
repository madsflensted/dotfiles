"info
set nocompatible

silent execute '!mkdir -p ~/tmp/vim-backup'
set directory=~/tmp/vim-backup/
set backupdir=~/tmp/vim-backup/

" Vundle setup
let bundle_path = '~/.vim/bundle'
silent execute '!mkdir -p ~/.vim/bundle'

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin(bundle_path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'vim-scripts/bufkill.vim'
Plugin 'talek/obvious-resize'
Plugin 'vim-scripts/scratch.vim'
Plugin 'Lokaltog/vim-powerline'

" Color
Plugin 'madsflensted/molokai'
Plugin 'michalbachowski/vim-wombat256mod'

" Substituate and preserve casing
Plugin 'tpope/vim-abolish'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Code
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'garbas/vim-snipmate'

" Git
Plugin 'tpope/vim-fugitive'

" Python
Plugin 'klen/python-mode'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'zweifisch/pipe2eval'

" Elm
" Plugin 'lambdatoast/elm.vim'
Plugin 'ajhager/elm-vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'

" Tasks
Plugin 'samsonw/vim-task'
Plugin 'MarcWeber/vim-addon-mw-utils'

" PlantUml, ascii -> diagram converter
Plugin 'aklt/plantuml-syntax'

" Discarded bundles, keep for reference
" jedi-vim: slowed vim response
"Bundle 'davidhalter/jedi-vim'
"Bundle 'Shougo/vimproc.vim'
"Bundle 'Shougo/vimshell.vim'

" Other examples:
" NOTE: comments after Bundle commands are not allowed.

call vundle#end()
filetype plugin indent on

syntax on

"set ignorecase
set hlsearch " highlight search terms
set incsearch " find as you type search
set linebreak

set wildmenu wildmode=full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set completeopt=menuone,longest,preview

"Avoid "Press ENTER..." prompt when opening new file. See hit-enter for more
set cmdheight=2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab
set smarttab
set autoindent
set showmatch

set number
set backspace=indent,eol,start

set mouse=a

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" Turn automatic comments off
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"set autowrite
set autoread

"colorscheme wombat256mod
colorscheme molokai
let g:rehash256 = 1
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors

if has('gui_running')
  set lines=41
  set columns=999
  set guioptions-=T " remove the toolbar
  set guioptions-=t " remove the tear off toolbar
  set guioptions-=l " remove the left scrollbar
  set guioptions-=L " remove the left scrollbar on split
  set guioptions-=r " remove the right scrollbar
  set guioptions-=R " remove the right scrollbar on split
  set guioptions-=b " remove the bottom scrollbar
  set guioptions-=m " remove the menu
endif

" Remap esc to the 'smash' (jam k and j down to escape)
inoremap jk <esc>
inoremap kj <esc>
" NO good  - triggers too often, inoremap fd <esc>

" Windows movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" WIndows resize
noremap <silent> <C-Up> :ObviousResizeUp<CR>
noremap <silent> <C-Down> :ObviousResizeDown<CR>
noremap <silent> <C-Left> :ObviousResizeLeft<CR>
noremap <silent> <C-Right> :ObviousResizeRight<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Python comment and smartindent, avoid moving '#' to beginnin of line
" Answer found here: http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
inoremap # X#

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['python'] }

" Pymode
let g:pymode_folding = 0
"let g:pymode_lint_checkers ['pyflakes', 'pep8', 'mccabe']
"let g:pymode_lint_config = "$HOME/.pylintrc"
" PEP8 "E501" is equal to pylint "C0301"
let g:pymode_lint_ignore = "E501,C0301"
let g:pymode_lint_cwindow = 0
"let g:pymode_lint_message = 0
let g:pymode_lint_write = 0
let g:pymode_lint_onfly = 1
" This command is to avoid bug in pylint-mode 0.5.6
"let g:pymode_lint_message = 0
let g:pymode_virtualenv = 1
" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1
" Enable pymode indentation
let g:pymode_indent = 1
let g:pymode_rope = 1
let g:pymode_rope_guess_project = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_max_line_length = 250

"autocmd BufReadCmd *_test.py let g:pymode_lint_ignore="E211"

" Rope
noremap <silent> <F3> :call pymode#rope#goto_definition()<CR>

let g:SuperTabDefaultCompletionType = "context"

autocmd BufReadCmd *.jar,*.xpi,*.exp,*.ear,*.war call zip#Browse(expand("<amatch>"))

" CtrlP settings
set wildignore+=*.sw*,*.pyc,*.class
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_dotfiles = 1

autocmd BufNewFile,BufRead *.elm set filetype=elm
"autocmd BufNewFile,BufRead *.json set ft=javascript

let NERDTreeIgnore = ['\.pyc$', '\.class$', '__pycache__']
map <F2> :NERDTreeToggle<CR>
"map <C-F2> :NERDTreeFind<CR>

" PlantUml
let g:plantuml_executable_script='java -jar $HOME/local/plantuml.jar'

" XML
function! XmlEscape()
  silent s/&/&amp;/eg
  silent s/</&lt;/eg
  silent s/>/&gt;/eg
  silent s/'/&apos;/eg
  silent s/"/&quot;/eg
endfunction
