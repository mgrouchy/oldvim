
if exists('python_setup')
  finish
endif
let python_setup = 'ok'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Number of spaces to use for each step of (auto)indent.
setlocal shiftwidth=4
"Number of spaces that a <Tab> in the file counts for.
setlocal tabstop=4
"Use the appropriate number of spaces to insert a <Tab>
setlocal expandtab
"Print the line number in front of each line
setlocal number
"color the line number in a different color
highlight LineNr guibg=lightblue ctermbg=lightgray

"When a bracket is inserted, briefly jump to the matching one
setlocal showmatch

"Don't copy indent from current line when starting a new line
setlocal cindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Code completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Trim trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight columns over 80
"from http://vim.wikia.com/wiki/Highlight_long_lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"old Default, all folds closed(0)
set foldlevel=1

"uses space to toggle folding
nnoremap <space> za
vnoremap <space> zf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> w<F5> :QFix<CR>
"code complete
inoremap <Nul> <C-x><C-o>

