" Author: zkmrgirish
" Modified: 12 Apr, Sunday

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

let mapleader = ","

packadd minpac
call minpac#init()

" let minpac update itself
call minpac#add('k-takata/minpac', {'type': 'opt'})

" take notes and todo list using vimwiki
call minpac#add('vimwiki/vimwiki')

" dependency for fzf
call minpac#add('junegunn/fzf', {'do': './install --bin'})
call minpac#add('junegunn/fzf.vim')

" for vim to look cool
call minpac#add('andreypopp/vim-colors-plain')
call minpac#add('zkmrgirish/ayu-vim')
call minpac#add('itchyny/lightline.vim')

" different programming language plugins
call minpac#add('fatih/vim-go')
call minpac#add('rust-lang/rust.vim')

" dependency for vimfiler
call minpac#add('shougo/unite.vim')
call minpac#add('shougo/vimfiler.vim')

" vim git plugin
call minpac#add('tpope/vim-fugitive')
call minpac#add('easymotion/vim-easymotion')


command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

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

" configureation for rust.vim
let g:rustfmt_autosave = 1

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

" move windows
nnoremap <Leader><Leader><Tab> <C-w>L<C-w><C-w>

" For comment and uncomment
noremap <C-n> <S-v>:norm 
vnoremap <C-n> :norm 

inoremap <Leader><Tab> <Esc>/<++><CR>"_c4l

" For FZF Buffer
noremap <Leader>ls :Buffers<CR>
noremap <Leader>lf :Files<CR>
noremap <Leader>L :Lines<CR>

" some important navigation mappings
noremap <Leader>T /TODO:/e<cr>

" some command line utilities
command Power echo system('power')

" some mapping from kakoune
noremap gk gg
noremap gj G
noremap gh 0
noremap gl $

" some mappings for less key press
noremap <Space> :
map Y y$

nnoremap <Leader>s :set invspell<cr>

noremap <Leader>r :VimFilerExplorer -winwidth=25<CR>

set updatetime=100
autocmd InsertEnter * se cul

let ayucolor="dark"
colorscheme ayu

set exrc
