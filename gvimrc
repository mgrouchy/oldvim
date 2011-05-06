set nowrap
set colorcolumn=81 "to help us keep our lines under 80 chars

set go-=T
set columns=185
set cursorline
colorscheme Succulent
set anti
" Save when losing focus "
au FocusLost * :wa
set guifont=Monaco:h11

"vim gist config(specifically for OSX)
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

