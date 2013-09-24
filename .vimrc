set nocompatible "Default to act like vim, not vi
set nowrap "don't wrap lines
set background=dark "colorscheme
colorscheme tomorrow_night
set number "Turn on line numbers
set numberwidth=4
set backspace=indent,eol,start  "Allow backspace in insert mode
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set hidden                      "Allow current buffer to be put in background
                                "without being written to disk
set autoread                    "reload files changed outside of vim
set encoding=utf8 "utf8 incoding
set smartindent "smart indentation overriden by individual filetype settings
set showmatch "show matching braces, brackets and such
" command timeout settings
set ttimeout
set ttimeoutlen=50
set vb t_vb= "Turn off beeping and visual bells
set incsearch "incremental search
set ls=2 "show status line even when only one window is shown.
set ruler "show the current position (line+col) and percentage in buffer
set ignorecase "don't distinguish between caps in search

set title "set window title

set ttyfast "fast terminal connection
set list "turn on list characters
set history=1000 "keep an extra long history

"set up tabs and indentation, default to 4 space tabs. We don't actually use
"tabs here. This is overwritten in individual syntax files
set shiftwidth=4
set tabstop=4
syntax on "syntax highlighting
"store temp files in non-annoying place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backup                        " enable backups

"filebased undo across sesions
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set colorcolumn=81 "to help us keep our lines under 80 chars
set cursorline


setlocal incsearch "While typing a search command, show where the pattern matches
setlocal hlsearch "When there is a previous search pattern, highlight all its matches
"turn on pathogen
call pathogen#incubate()
call pathogen#helptags()

" Enable file type detection
filetype plugin indent on
" Syntax of these languages are fussy over tabs Vs spaces
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"Customisations based on personal preferences
au FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
" Treat .rss files as XML
au BufNewFile,BufRead *.rss setfiletype xml
"delete all trailing whitespace on save
au BufWritePre * :%s/\s\+$//e

"Autocomplete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif " automatically close autocompletition window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif"

let g:acp_behaviorHtmlOmniLength = -1 " no html autocompletition
let g:acp_behaviorXmlOmniLength = -1 " no xml autocompletition

"python autocomplete
au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
"enable django template syntax highlighting automatically
au BufRead,BufNewFile *.html setlocal filetype=htmldjango
au FileType htmldjango setlocal ts=2 sts=2 sw=2 noexpandtab
au BufNewFile,BufRead *.j2 setlocal filetype=htmljinja


"everytime I save, source the vimrc
"au bufwritepost .vimrc source $MYVIMRC


" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=25
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif

" Python.vim config
let python_highlight_all = 1
let python_slow_sync = 1

"status line
set laststatus=2
set statusline=%{fugitive#statusline()}\ %F%m%r%h%w\ [fmt=%{&ff}]\ [type=%Y]\ [pos=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}


" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Turn off file characters on statusline
let g:Powerline_symbols = 'fancy'

let g:html_indent_tags = 'li\|p'

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


"CtrlP Settings
" Set the max files
let g:ctrlp_max_files = 10000
" Find nearest ancestor that contains source control files.
let g:ctrlp_working_path_mode = 2
let g:ctrlp_root_markers = ['.git/']
" Optimize file searching
if has("unix")
    let g:ctrlp_user_command = {
                \   'types': {
                \       1: ['.git/', 'cd %s && git ls-files']
                \   },
                \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,.hg/,.svn/

let g:gitgutter_enabled = 0

" virtualenv settings
"Add the virtualenv's site-packages to vim path(if you are in a virtualenv)
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Fix Cursor in TMUX
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

"mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>
let mapleader = ","
"control up down to change between buffers
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
"changes the buffer in the current window to the next or the previous one
noremap <C-right> <ESC>:bn<CR>
noremap <C-left> <ESC>:bp<CR>
"oops? forgot to sudo? w!!
cmap w!! w !sudo tee %
"<Esc> to jj
imap jj <Esc>
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nmap <leader>l :set list!<CR>
nmap <leader>a <Esc>:Ack!
nmap <leader>cb :CtrlPBuffer<CR>
nmap <leader>nd :NERDTreeToggle<CR>
nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>pd :setlocal ft=python.django<CR>
nmap <leader>hd :setlocal ft=htmldjango<CR>
