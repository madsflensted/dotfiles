"info
set nocompatible

" Put swp files in common place
silent execute '!mkdir -p ~/tmp/vim-backup'
set directory=~/tmp/vim-backup/
set backupdir=~/tmp/vim-backup/

" Maintain undo history between sessions
silent execute '!mkdir -p ~/tmp/vim-undos'
set undodir=~/tmp/vim-undos/
set undofile

" Vundle setup
let bundle_path = '~/.vim/bundle'
silent execute '!mkdir -p ~/.vim/bundle'

" required, re-enabled later
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin(bundle_path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Basic Vim
Plugin 'vim-scripts/bufkill.vim'
Plugin 'talek/obvious-resize'
Plugin 'vim-scripts/scratch.vim'
Plugin 'enricobacis/paste.vim'

" Substitute while preserving casing
Plugin 'tpope/vim-abolish'

" Diff
Plugin 'AndrewRadev/linediff.vim'

" Color
" Plugin 'madsflensted/molokai'
Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'jeffkreeftmeijer/vim-dim'
Plugin 'gerw/vim-HiLinkTrace'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

" Files
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Search via rg
Plugin 'dyng/ctrlsf.vim'

" Comment switcher
Plugin 'tpope/vim-commentary'

" Change pairs {} () [] etc
Plugin 'tpope/vim-surround'

" Lint Engine
Plugin 'w0rp/ale'

" Code completion
Plugin 'maralla/completor.vim'

" Ctags and Universal Ctags
Plugin 'majutsushi/tagbar'

" Snipmate
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Optional:
" Plugin 'honza/vim-snippets'

" Git
" Plugin 'tpope/vim-fugitive'
" Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'

" Ansible
Plugin 'pearofducks/ansible-vim'

" Dhall
Plugin 'vmchale/dhall-vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'

" Elm
Plugin 'ElmCast/elm-vim'
Plugin 'bitterjug/vim-tagbar-ctags-elm'

" Erlang
" Plugin 'vim-erlang/vim-erlang-runtime'
" Plugin 'vim-erlang/vim-erlang-compiler'
" Plugin 'vim-erlang/vim-erlang-tags'

" Go
Plugin 'fatih/vim-go'

" Python
" Plugin 'klen/python-mode'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'zweifisch/pipe2eval'
" Plugin 'Yggdroot/indentLine'
Plugin 'alfredodeza/pytest.vim'

" REST curl
Plugin 'diepm/vim-rest-console'

" Notes and Todos
" Plugin 'samsonw/vim-task'
Plugin 'vimwiki/vimwiki', { 'branch': 'dev' }

" Diagrams
" PlantUml, ascii -> diagram converter
Plugin 'aklt/plantuml-syntax'
Plugin 'gyim/vim-boxdraw'

" Discarded bundles, keep for reference
" Plugin 'scrooloose/syntastic' " Conflict with ale
" Plugin jedi-vim: slowed vim response
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'

call vundle#end()
filetype plugin indent on

syntax on

" Search
"set ignorecase
set hlsearch " highlight search terms
set incsearch " find as you type search

" Visual and Editor
set linebreak
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

" Completion
set wildmenu wildmode=full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set completeopt=menuone,longest,preview

"Avoid "Press ENTER..." prompt when opening new file. See hit-enter for more
set cmdheight=2

" Turn automatic comments off
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"set autowrite
set autoread

" Color
" Remember - in terminal the cursor color
"   is defined in terminal app not in the colorscheme
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'erlang': {
  \       'highlight_builtins' : 1
  \     },
  \     'go': {
  \       'highlight_builtins' : 1
  \     }
  \   },
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'matchparen_bg' : ['#dadada', '253']
  \       }
  \     }
  \   }
  \ }

let g:rehash256 = 1
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
set background=light
colorscheme PaperColor
" hi Normal ctermbg=White ctermfg=Black

" Leader
let mapleader = ','
let maplocalleader = "\\"

" tmux
let g:tmux_navigator_disable_when_zoomed = 1

" Remap esc to the 'smash' (jam k and j down to escape)
inoremap jk <esc>
inoremap kj <esc>
" NO good  - triggers too often, inoremap fd <esc>

" Remove highlights from recent search
nmap <silent> <Leader>/ :nohlsearch<CR>

" Windows movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Windows resize
" Not working?
noremap <silent> <C-Up> :ObviousResizeUp<CR>
noremap <silent> <C-Down> :ObviousResizeDown<CR>
noremap <silent> <C-Left> :ObviousResizeLeft<CR>
noremap <silent> <C-Right> :ObviousResizeRight<CR>

" Remove spaces at end of lines for all files
autocmd BufWritePre * %s/\s\+$//e

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.class$', '__pycache__']
map <F2> :NERDTreeToggle<CR>
"map <C-F2> :NERDTreeFind<CR>

" TagBar
noremap <F3> :TagbarToggle<CR>

" Search
nnoremap <F4> :CtrlSF <C-R><C-W><CR>
nnoremap <S-F4> :CtrlSFToggle<CR>

" REST
let g:vrc_set_default_mapping = 0
autocmd BufNewFile,BufRead *.rest set filetype=rest
let g:vrc_allow_get_request_body = 1
let g:vrc_response_default_content_type = 'application/json'
" let g:vrc_auto_format_response_patterns = {
"   \  'json': 'jq "."',
"   \ 'xml': 'xmllint --format -',
" \}
noremap <silent> <F5> :call VrcQuery()<CR>

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set colorcolumn=79
"autocmd FileType htmldjango set colorcolumn=120

" Python comment and smartindent, avoid moving '#' to beginnin of line
" Answer found here: http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
inoremap # X#

" indentLine
" let g:indentLine_enabled = 0

" Read archives
autocmd BufReadCmd *.jar,*.xpi,*.exp,*.ear,*.war call zip#Browse(expand("<amatch>"))

" ALE
let g:ale_yaml_yamllint_options = "-d relaxed"
let g:ale_python_flake8_args = "--ignore=C"
let g:ale_linters = {'python': ['flake8'], 'erlang': ['syntaxerl']}
let g:ale_sign_column_always = 1

" CtrlP settings
set wildignore+=*.sw*,*.pyc,*.class
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_dotfiles = 1

" Elm
autocmd BufNewFile,BufRead *.elm set filetype=elm
"autocmd BufNewFile,BufRead *.json set ft=javascript
let g:elm_make_show_warnings = 0
let g:elm_make_syntastic_show_warnings = 0

" From github.com/antoine-atmire/dotfiles
" let g:elm_setup_keybindings = 0
" let g:elm_format_autosave = 0

" " elm keybindings
" autocmd vimrc FileType elm nnoremap <buffer> <leader>pe :ElmFormat<cr>

" " keymappings primarly for elm
" " pretty cases -> turns your comma separated list in case statements
" autocmd vimrc FileType elm nmap <buffer> <leader>pc ^dt,Op==<<A ->wx<leader>pc

" " experimental insert mode mappings
" autocmd vimrc FileType elm inoremap <buffer> ; -><space>
" autocmd vimrc FileType elm inoremap <buffer> $ <bar>><space>

" " go to the definition of the function under the cursoer
" " Ilist is the ilist variant from romainl/vim-qlist
" autocmd vimrc FileType elm nnoremap <buffer> <leader>] yiw:Ilist ^\s*<c-r>"\s.*=$<cr>


" " I add .elm at the end so Html.elm is not skipped when the directory Html/
" " exists in the same directory...
" " I also remove matches in VirtualDom directories
" function! GetElmFilenameFix(word)
"     let l:word = a:word
"     if match(l:word, 'VirtualDom') >= 0
"         let l:word = ''
"     else
"         " replace module dots with slash
"         let l:word = substitute(l:word,'\.','/','g') .'.elm'
"     endif
"     return l:word
" endfunction
" autocmd vimrc FileType elm setlocal includeexpr=GetElmFilenameFix(v:fname)


" Dhall
" Insert unicode chars for Lambda, Arrow and Union
dig La 955
dig Ar 8594
dig Un 8743

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

" Show syntax highlighting groups for word under cursor
" function! <SID>SynStack()
"     let synID   = synID(v:beval_lnum, v:beval_col, 0)
"     let groupID = synIDtrans(synID)
"     let name    = synIDattr(synID, "name")
"     let group   = synIDattr(groupID, "name")
"     echo name . "\n" . group
" endfunction

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    echo synIDattr(diff_hlID(line('.'), col('.')), "name")
endfunc
nmap <F9> :call <SID>SynStack()<CR>

" Clean up files e.g. from "git diff --color"
function! RemoveEscapeChars() range
  execute a:firstline . "," . a:lastline . "!sed -r 's~\\x01?(\\x1B\\(B)?\\x1B\\[([0-9;]*)?[JKmsu]\\x02?~~g'"
endfunction

" Diff handling
function! DiffFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^\(diff\|---\|+++\|@@\) '
    return 1
  elseif line[0] =~ '[-+ ]'
    return 2
  else
    return 0
  endif
endfunction
autocmd FileType diff,patch setlocal foldmethod=expr foldexpr=DiffFold(v:lnum)

" Statusline
" Inspiration https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set statusline=
set statusline+=\ %t
set statusline+=\/%n
set statusline+=\ %M
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" OCaml
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
