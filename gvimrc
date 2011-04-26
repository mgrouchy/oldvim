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
set nowrap
set colorcolumn=81 "to help us keep our lines under 80 chars
"keep an extra long history
set history=1000

"set up tabs and indentation, default to 4 space tabs. We don't actually use
"spaces here. This is overwritten in individual syntax files
set shiftwidth=4
set tabstop=4

syntax on

"store temp files in non-annoying place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"undo settings
set undofile
set undodir=~/.undo

"While typing a search command, show where the pattern matches
setlocal incsearch
"When there is a previous search pattern, highlight all its matches
setlocal hlsearch

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype plugin indent on

	" Syntax of these languages is fussy over tabs Vs spaces
     autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	" Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   " Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	"delete all trailing whitespace on save
	autocmd BufWritePre * :%s/\s\+$//e

	"Autocomplete
	autocmd FileType python set omnifunc=pythoncomplete#Complete
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

if has("gui_running")
	set go-=T
	set columns=185
	set cursorline
	colorscheme Succulent
	set anti
	set background=dark
	" Save when losing focus "
	au FocusLost * :wa


endif

set guifont=Monaco:h11

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=25

" Python.vim config
let python_highlight_all = 1
let python_slow_sync = 1

"vim gist config
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1


"status line
set laststatus=2
set statusline=%{fugitive#statusline()}\ %F%m%r%h%w\ [fmt=%{&ff}]\ [type=%Y]\ [pos=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"

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

"mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"control up down to change between buffers
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
"changes the buffer in the current window to the next or the previous one
noremap <C-right> <ESC>:bn<CR>
noremap <C-left> <ESC>:bp<CR>

cmap w!! w !sudo tee %
