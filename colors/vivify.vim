set background=dark "or light
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256

highlight Boolean             guifg=#ae81ff ctermfg=141                           gui=none cterm=none
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#e6db74 ctermfg=228                           gui=none cterm=none
highlight Comment             guifg=#75715e ctermfg=101                           gui=none cterm=none
highlight Conditional         guifg=#f92672 ctermfg=197                           gui=bold cterm=bold
highlight Constant            guifg=#ae81ff ctermfg=141                           gui=bold cterm=bold
highlight Cursor              guifg=#000000 ctermfg=0   guibg=#f8f8f0 ctermbg=230 gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255 guibg=#3e3d32 ctermbg=101 gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255 guibg=#3e3d32 ctermbg=101 gui=none cterm=none
highlight Debug               guifg=#bca3a3 ctermfg=138                           gui=bold cterm=bold
highlight Define              guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#8f8f8f ctermfg=245                           gui=none cterm=none
highlight DiffAdd             guifg=#f8f8f2 ctermfg=230 guibg=#13354a ctermbg=24  gui=none cterm=none
highlight DiffChange          guifg=#89807d ctermfg=95  guibg=#4c4745 ctermbg=95  gui=none cterm=none
highlight DiffDelete          guifg=#960050 ctermfg=125 guibg=#1e0010 ctermbg=125 gui=none cterm=none
highlight DiffText            guifg=#ae81ff ctermfg=141 guibg=#4c4745 ctermbg=95  gui=italic,bold cterm=italic,bold
highlight Directory           guifg=#a6e22e ctermfg=149                           gui=bold cterm=bold
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#960050 ctermfg=125 guibg=#1e0010 ctermbg=125 gui=none cterm=none
highlight ErrorMsg            guifg=#f92672 ctermfg=197 guibg=#232526 ctermbg=74  gui=bold cterm=bold
highlight Exception           guifg=#a6e22e ctermfg=149                           gui=bold cterm=bold
highlight Float               guifg=#ae81ff ctermfg=141                           gui=none cterm=none
highlight FoldColumn          guifg=#465457 ctermfg=66  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Folded              guifg=#465457 ctermfg=66  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Function            guifg=#a6e22e ctermfg=149                           gui=none cterm=none
highlight Identifier          guifg=#fd971f ctermfg=208                           gui=none cterm=none
highlight Ignore              guifg=#808080 ctermfg=8                             gui=none cterm=none
highlight IncSearch           guifg=#c4be89 ctermfg=186 guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Include             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Keyword             guifg=#f92672 ctermfg=197                           gui=bold cterm=bold
highlight Label               guifg=#e6db74 ctermfg=228                           gui=none cterm=none
highlight LineNr              guifg=#bcbcbc ctermfg=250 guibg=#3b3a32 ctermbg=101 gui=none cterm=none
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#c4be89 ctermfg=186                           gui=italic cterm=italic
highlight MatchParen          guifg=#000000 ctermfg=0   guibg=#fd971f ctermbg=208 gui=bold cterm=bold
highlight ModeMsg             guifg=#e6db74 ctermfg=228                           gui=none cterm=none
highlight MoreMsg             guifg=#e6db74 ctermfg=228                           gui=none cterm=none
highlight NonText             guifg=#bcbcbc ctermfg=250 guibg=#3b3a32 ctermbg=101 gui=none cterm=none
highlight Normal              guifg=#f8f8f2 ctermfg=230 guibg=#272822 ctermbg=101 gui=none cterm=none
highlight Number              guifg=#ae81ff ctermfg=141                           gui=none cterm=none
highlight Operator            guifg=#f92672 ctermfg=197                           gui=none cterm=none
highlight PMenu               guifg=#66d9ef ctermfg=81  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight PMenuSbar           guifg=#66d9ef ctermfg=81  guibg=#080808 ctermbg=232 gui=none cterm=none
highlight PMenuSel            guifg=#66d9ef ctermfg=81  guibg=#808080 ctermbg=8   gui=none cterm=none
highlight PMenuThumb          guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight PreCondit           guifg=#a6e22e ctermfg=149                           gui=bold cterm=bold
highlight PreProc             guifg=#a6e22e ctermfg=149                           gui=none cterm=none
highlight Question            guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight Repeat              guifg=#f92672 ctermfg=197                           gui=bold cterm=bold
highlight Search              guifg=#ffffff ctermfg=15  guibg=#455354 ctermbg=66  gui=none cterm=none
highlight SignColumn          guifg=#a6e22e ctermfg=149 guibg=#232526 ctermbg=74  gui=none cterm=none
highlight Special             guifg=#66d9ef ctermfg=81                            gui=italic cterm=italic
highlight SpecialChar         guifg=#f92672 ctermfg=197                           gui=bold cterm=bold
highlight SpecialComment      guifg=#465457 ctermfg=66                            gui=bold cterm=bold
highlight SpecialKey          guifg=#66d9ef ctermfg=81                            gui=italic cterm=italic
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#f92672 ctermfg=197                           gui=bold cterm=bold
highlight StatusLine          guifg=#455354 ctermfg=66                            gui=none cterm=none
highlight StatusLineNC        guifg=#808080 ctermfg=8   guibg=#080808 ctermbg=232 gui=none cterm=none
highlight StorageClass        guifg=#fd971f ctermfg=208                           gui=italic cterm=italic
highlight String              guifg=#e6db74 ctermfg=228                           gui=none cterm=none
highlight Structure           guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#f92672 ctermfg=197                           gui=italic cterm=italic
highlight Title               guifg=#ef5939 ctermfg=209                           gui=none cterm=none
highlight Todo                guifg=#ffffff ctermfg=15                            gui=bold cterm=bold
highlight Type                guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight Typedef             guifg=#66d9ef ctermfg=81                            gui=none cterm=none
highlight Underlined          guifg=#808080 ctermfg=8                             gui=underline cterm=underline
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#808080 ctermfg=8   guibg=#080808 ctermbg=232 gui=bold cterm=bold
highlight Visual              guifg=#eeeeee ctermfg=255 guibg=#403d3d ctermbg=95  gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255 guibg=#403d3d ctermbg=95  gui=none cterm=none
highlight WarningMsg          guifg=#ffffff ctermfg=15  guibg=#333333 ctermbg=236 gui=bold cterm=bold
highlight WildMenu            guifg=#66d9ef ctermfg=81  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight pythonBuiltin       guifg=#f8f8f2 ctermfg=230                           gui=none cterm=none
