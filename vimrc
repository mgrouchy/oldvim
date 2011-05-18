set background=dark
set nocompatible
set number
set encoding=utf8
set smartindent
set showmatch
set vb t_vb=
set incsearch
set ls=2
set ruler
set ignorecase
set title
set ttyfast
set list
"keep an extra long history
set history=1000
"set up tabs and indentation, default to 4 space tabs. We don't actually use
"spaces here. This is overwritten in individual syntax files
set shiftwidth=4
set tabstop=4
syntax on "syntax highlighting
"store temp files in non-annoying place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"While typing a search command, show where the pattern matches
setlocal incsearch
"When there is a previous search pattern, highlight all its matches
setlocal hlsearch
"turn on pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype plugin indent on
	" Syntax of these languages is fussy over tabs Vs spaces
     autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	"Customisations based on personal preferences
    autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   " Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	"delete all trailing whitespace on save
	autocmd BufWritePre * :%s/\s\+$//e
	"Autocomplete

	"python autocomplete with supertab
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	let g:SuperTabDefaultCompletionType = "context"
	set completeopt=menuone,longest,preview

	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	"enable django template syntax highlighting automatically
	autocmd BufRead,BufNewFile *.html setfiletype htmldjango
	autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 noexpandtab
    "everytime I save, source the vimrc
    autocmd bufwritepost .vimrc source $MYVIMRC
else
	set autoindent
endif


" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=25

" Python.vim config
let python_highlight_all = 1
let python_slow_sync = 1

"status line
set laststatus=2
set statusline=%{fugitive#statusline()}\ %F%m%r%h%w\ [fmt=%{&ff}]\ [type=%Y]\ [pos=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces "
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction

set foldtext=MyFoldText()


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


"mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"control up down to change between buffers
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
"changes the buffer in the current window to the next or the previous one
noremap <C-right> <ESC>:bn<CR>
noremap <C-left> <ESC>:bp<CR>

cmap w!! w !sudo tee %
