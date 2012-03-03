" Colorscheme
set background=dark
colorscheme tomorrow_night

set nocompatible
set number
set numberwidth=5
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
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp     " undo files
set backup                        " enable backups

"While typing a search command, show where the pattern matches
setlocal incsearch
"When there is a previous search pattern, highlight all its matches
setlocal hlsearch
"turn on pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enable file type detection
filetype plugin indent on
" Syntax of these languages is fussy over tabs Vs spaces
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"Customisations based on personal preferences
au FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" Treat .rss files as XML
au BufNewFile,BufRead *.rss setfiletype xml
"delete all trailing whitespace on save
au BufWritePre * :%s/\s\+$//e
"Autocomplete

"python autocomplete
au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
"enable django template syntax highlighting automatically
au BufRead,BufNewFile *.html setlocal filetype=htmldjango
au FileType htmldjango setlocal ts=2 sts=2 sw=2 noexpandtab

"django/python settings
augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
	au BufNewFile,BufRead tests.py     setlocal filetype=python.django
augroup END

"everytime I save, source the vimrc
au bufwritepost .vimrc source $MYVIMRC

au BufNewFile,BufRead *.j2 setlocal filetype=htmljinja

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

let g:html_indent_tags = 'li\|p'

"TabBar settings
let g:tagbar_usearrows = 1
nmap <F8> :TagbarToggle<CR>

"python mode settings
"
"mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>
let mapleader = ","
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"clear search matches
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
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
"Ack searching
nmap <leader>a <Esc>:Ack!

nmap <leader>pd :setlocal ft=python.django<CR>
nmap <leader>hd :setlocal ft=htmldjango<CR>

