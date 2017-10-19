if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Syntax and language specific
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'ElmCast/elm-vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'tpope/vim-sleuth'
Plug 'flowtype/vim-flow', { 'for': 'javascript' }
Plug 'tweekmonster/django-plus.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gregsexton/MatchTag'
Plug 'vim-scripts/slimv.vim'
Plug 'elzr/vim-json'
Plug 'venantius/vim-cljfmt'
Plug 'guns/vim-clojure-static'
Plug 'venantius/vim-eastwood'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-liquid'

" Actual Plugs
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/neosnippet.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'janko-m/vim-test'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'embear/vim-localvimrc'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ternjs/tern_for_vim'
Plug 'joshdick/onedark.vim'

call plug#end()

set nocompatible
filetype plugin indent on

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" the Flow plugin is useful but by default it type checks on save
" don't need this to happen because Ale does that for us instead
let g:flow#enable = 0

" turns on Flow syntax highlighting
let g:javascript_plugin_flow = 1

" looks for JSX in just .js files
let g:jsx_ext_required = 0

let g:ale_emit_conflict_warnings = 0

let g:neosnippet#snippets_directory = '~/.config/nvim/UltiSnips'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:tsuquyomi_disable_default_mappings = 1

set number

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shiftround
set noshowcmd
set nofoldenable
map K <Nop>

set background=dark

if !exists('g:not_finish_vimplug')
  let g:onedark_termcolors=256
  colorscheme onedark
endif

runtime macros/matchit.vim

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Ale status line - last empty string = no message when everything is OK
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']

" status bar
set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

set autoread

set breakindent

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
set timeout timeoutlen=500 ttimeoutlen=100

set history=500
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set ignorecase smartcase

set spelllang=en_gb
syntax spell toplevel

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4

set laststatus=2

set linebreak

set incsearch
set hlsearch

set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

set wildmode=full
set wildmenu

let mapleader=","
noremap \ ,

" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

set list listchars=tab:»·,trail:·

command! Q q

set splitbelow
set splitright

set tags=./.tags;


" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

"few nicer JS colours
highlight xmlAttrib ctermfg=121
highlight jsThis ctermfg=224
highlight jsSuper ctermfg=13
highlight jsFuncCall ctermfg=cyan
highlight jsComment ctermfg=245 ctermbg=none
highlight jsClassProperty ctermfg=14 cterm=bold

" ~~~ MAPPINGS BELOW ~~~

"gtfo ex mode
map Q <Nop>

" vim-test
map <Leader>e :TestFile<CR>
map <Leader>n :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>s :TestSuite<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" FZF.vim
nnoremap <leader>t :Files<cr>
nnoremap <leader>b :Buffers<cr>

" let g:fzf_prefer_tmux = 1

" Elm.vim settings
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

" make copy/paste from system clip easier
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}
let g:ale_set_highlights = 0

" stop Elm.vim trying to show compiler erorrs in Vim
let g:elm_format_fail_silently = 1

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

set completeopt-=preview

" so Emmet.vim will work in JSX
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\}

let g:localvimrc_persistent = 2

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '\.git', '\node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 | NERDTree | endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<c-u>split<CR>
noremap <Leader>v :<c-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <c-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <c-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <c-P> <c-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<c-O>"
let g:UltiSnipsExpandTrigger="<c-ENTER>"

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"


" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <c-x> :!pbcopy<CR>
  vmap <c-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" elixir


" haskell
let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:necoghc_enable_detailed_browse = 1
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1
set filetype=javascript
autocmd FileType javascript :setf javascript


" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 14
set guifont=Fira\ Code\ Medium:h13
set nobackup
set nowritebackup
set noswapfile
set nowrap
set nocompatible
filetype indent plugin on
syntax on
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set laststatus=2
set confirm
set mouse=a
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" IndentLine
let g:indentLine_enabled = 0
let g:indentLine_concealcursor = 0
let indentChar = '.'
let g:indentLine_faster = 0

let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#5C6370'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_char = indentChar
let g:indentLine_first_char = indentChar
let g:indentLine_leadingSpaceChar = indentChar
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
let g:indentLine_setConceal = 1

" CtrlP

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Clojure Setup

let g:clj_fmt_autosave = 1
let g:clojure_syntax_keywords = {
      \ 'clojureMacro': ["defproject", "defcustom"],
      \ 'clojureFunc': ["string/join", "string/replace"]
      \ }

let g:clojure_maxlines = 100
let g:clojure_fuzzy_indent_patterns = 'with.*,def.*,let.*'
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

" Trim White Spaces on Save or call :call TrimWhitespace()

highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws / \+$/

highlight ExtraWhitespace ctermbg=red guibg=red

fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Syntastic

function! SyntasticESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let g:syntastic_javascript_eslint_exec = l:eslint
  let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["javascript"],
        \ "passive_filetypes": [] }
endfunction


let g:syntastic_javascript_checkers = ["eslint"]


autocmd FileType javascript :call SyntasticESlintChecker()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = 'E'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = 'W'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Editor config
let g:EditorConfig_exec_path = '~/.editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', 'node_modules', '.git']

" Functions

fun! Replace(from, to)
  exe '%s/' . a:from . '/' . a:to . '/gc'
endfun

fun! ReplaceAll(from, to)
  exe '%s/' . a:from . '/' . a:to . '/g'
endfun

fun! Find(name)
  exe '/' . a:name
endfun

fun! Lower(from)
  exe '%s/' . a:from . '/\L&/gc'
endfun

fun! Upper(from)
  exe '%s/' . a:from . '/\U&/gc'
endfun

fun! Move(line)
  exe 'm' . a:line
endfun

fun! Mv(line)
  exe 'm' . a:line
endfun

fun! Up()
  exe 'm-'
endfun

fun! Down()
  exe 'm+'
endfun

if has("gui_running")
    " Clear highlights and closes Quickfix lists (breaks on non-gui vim)
    nnoremap <silent><ESC> :silent noh<bar>cclose<CR>
endif

" Shift+Insert for Paste from clipboard
map <s-Insert> "+p
map! <s-insert> "+p
set pastetoggle=<F10>
inoremap <c-v> <F10><c-r>+<F10>

" F7 Format file

map <F7> mzgg=G`z
map! <F7> mzgg=G`z

" CTRL-X Cut to System
map <c-X> "+x
map! <c-X> "+x

" CTRL-C Copy
map <c-C> "+y
map! <c-C> "+y

"  Ctrl + a --> Select All

map <c-a> GVgg
map! <c-a> GVgg

" Ctrl + o --> Open File (Opens current folder to browse)

nmap <c-o> :e . <Enter>

" Ctrl + z --> Undo
" Ctrl + r --> Redo

nmap <c-z> u

" Ctrl + t --> Open new tab

nmap <c-t> :tabnew <Enter>

" Ctrl + f --> Find

autocmd VimEnter * nmap <c-f> :/

" Ctrl + d --> Find Next

nmap <c-d> n

" Ctrl + h --> Replace All

nmap <c-h> :%s/

" Ctrl + s --> Save file

map <c-s> <Esc>:w<CR>
map! <c-s> <Esc>:w<CR>

" F4 --> Search in project
map <F4> :Grep -rins<Space>
map! <F4> :Grep -rins<Space>

" F8 --> Open file under cursor Vertical

map <F8> :vertical wincmd f<CR>

" Ctrl + F8 --> Open file under cursor Horizontal

map <c-F8> : wincmd f<CR>

" Ctrl + w + t --> Open File under cursor new tab

map <c-w>t <c-w>gf

" Switch tabs

set switchbuf=usetab
nnoremap <F6> :sbnext<CR>
nnoremap <S-F6> :sbprevious<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" NerdTree

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>
