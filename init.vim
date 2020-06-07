" Author: zkmrgirish
" Modified: 12 Apr, Sunday

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

let mapleader = ","

" configure gopls? also disable guru in vim-go
let g:go_def_mode='gopls'
let g:go_rename_command = 'gopls'
let g:go_info_mode='gopls'
let g:go_list_type = 'quickfix'
let g:go_list_type_commands = {"GoBuild": "quickfix"}
let g:go_doc_popup_window = 1
let g:go_fmt_command = 'goimports'
let g:go_imports_mode = 'gopls'
let g:go_implements_mode = 'gopls'

let g:srcery_italic = 1

" remove this after getting a good gopls setup?
let g:go_null_module_warning = 0
let g:vimfiler_as_default_explorer = 1
let g:netrw_menu = 0
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]

let g:netrw_liststyle = 3

function SplitTerminal()
    split term://zsh
    :res 7
    startinsert
endfunction

function VSplitTerminal()
    vsplit term://zsh
    :vertical res 50
    startinsert
endfunction

function TimeNow()
    return strftime('%I:%M %p, %A')
endfunction

let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'timenow' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'timenow': 'TimeNow',
      \ },
      \ }


" commands for terminal split
cnoreabbrev <expr> vterm ((getcmdtype() is# ':' && getcmdline() is# 'vterm')?('call VSplitTerminal()'):('vterm'))
cnoreabbrev <expr> sterm ((getcmdtype() is# ':' && getcmdline() is# 'sterm')?('call SplitTerminal()'):('sterm'))

" some command line utilities
command Power echo system('power')

set updatetime=100
autocmd InsertEnter * se cul

let ayucolor="dark"
colorscheme ayu

set exrc
