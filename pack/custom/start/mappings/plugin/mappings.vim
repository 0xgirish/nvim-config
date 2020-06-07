" Author: zkmrgirish
" Modified: 12 Apr, Sunday

let g:current_buffer = ''
let g:previous_buffer = ''

" go related mappings for gopls
" TODO: use neovim builtin lsp support, and define submodes to easier mappings
autocmd FileType go   nnoremap <buffer> <Leader>t :GoTest ./...<cr> 
autocmd FileType go   nnoremap <buffer> <Leader>tf :GoTestFunc<cr> 

" python related mappings to make life less painfull
autocmd FileType python :iab <buffer> true True
autocmd FileType python :iab <buffer> false False


" kakoune like navigation mappings
function s:change_previous_buffer()
    let g:previous_buffer = buffer_number()
endfunction

function s:change_current_buffer()
    let g:current_buffer = buffer_number()
endfunction

function s:init_precurr_buffer()
    let g:current_buffer = buffer_number()
    let g:previous_buffer = buffer_number()
endfunction

augroup kakga
autocmd kakga VimEnter * call s:init_precurr_buffer()
autocmd kakga BufEnter,BufNew * call s:change_current_buffer()
autocmd kakga BufHidden,BufLeave * call s:change_previous_buffer()

nnoremap ga :execute('b '. g:previous_buffer)<cr>

noremap gk gg
noremap gj G
noremap gh 0
noremap gl $



" get env variable
command! -nargs=+ Env echo getenv(<f-args>)

" rename file
command! -nargs=+ -complete=file Rename call rename(<f-args>)

command Mks mks! session.vim
command Ctags call system('ctags -R')
