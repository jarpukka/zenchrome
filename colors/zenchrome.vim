let g:colors_name='zenchrome'

let s:Black       = 0
let s:LightRed    = 1
let s:LightGreen  = 2
let s:LightYellow = 3
let s:LightBlue   = 4
let s:LightPurple = 5
let s:LightCyan   = 6
let s:LightGrey   = 7
let s:DarkGrey    = 8
let s:DarkRed     = 9
let s:DarkGreen   = 10
let s:DarkYellow  = 11
let s:DarkBlue    = 12
let s:DarkPurple  = 13
let s:DarkCyan    = 14
let s:White       = 15

if &background ==# 'light'
  let s:Foreground       = s:Black
  let s:LightForeground  = s:DarkGrey
  let s:Background       = s:White
  let s:LightBackground  = s:LightGrey
elseif &background ==# 'dark'
  let s:Foreground       = s:LightGrey
  let s:LightForeground  = s:White
  let s:Background       = s:Black
  let s:LightBackground  = s:DarkGrey
endif

unlockvar g:Colorscheme

let g:Colorscheme = {
  \ 'Normal'       : { 'ctermfg': s:Foreground, 'ctermbg': s:Background },
  \ 'Visual'       : { 'ctermfg': s:Background, 'ctermbg': s:LightForeground },
  \
  \ 'CursorLine'   : { 'cterm': 'underline' },
  \
  \ 'Constant'     : { 'ctermfg': s:LightForeground },
  \
  \ 'Boolean'      : { 'links': 'Constant' },
  \ 'Float'        : { 'links': 'Constant' },
  \ 'Number'       : { 'links': 'Constant' },
  \ 'PmenuSel'     : { 'links': 'Constant' },
  \ 'QuickFixLine' : { 'links': 'Constant' },
  \ 'StatusLine'   : { 'links': 'Constant' },
  \ 'String'       : { 'links': 'Constant' },
  \
  \ 'Error'        : { 'ctermfg': s:LightRed },
  \
  \ 'SpellBad'     : { 'links': 'Error' },
  \ 'SpellCap'     : { 'links': 'Error' },
  \ 'Todo'         : { 'links': 'Error' },
  \ 'WarningMsg'   : { 'links': 'Error' },
  \
  \ 'Search'       : { 'cterm': 'underline' },
  \
  \ 'IncSearch'    : { 'links': 'Search' },
  \ }

lockvar g:Colorscheme

call zenchrome#Sync()

augroup Zenchrome
  autocmd!
  autocmd Syntax * call zenchrome#Sync()
  autocmd Colorscheme *
    \ if g:colors_name !=# 'zenchrome'
    \ | autocmd! Zenchrome
    \ | endif
augroup END
