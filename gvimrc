set nowrap
set colorcolumn=81 "to help us keep our lines under 80 chars

set go-=T
set columns=185
set cursorline
colorscheme Molokai
set anti
" Save when losing focus "
au FocusLost * :wa
set guifont=Monaco:h11

"vim gist config(specifically for OSX)
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1


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

