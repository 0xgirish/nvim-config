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

" For FZF Buffer
noremap <Leader>ls :Buffers<CR>
noremap <Leader>lf :Files<CR>

" some important navigation mappings
noremap <Leader>T /TODO:/e<cr>

" move windows
nnoremap <Leader><Leader><Tab> <C-w>L<C-w><C-w>

" For comment and uncomment
noremap <C-n> <S-v>:norm 
vnoremap <C-n> :norm 

inoremap <Leader><Tab> <Esc>/<++><CR>"_c4l

" some mappings for less key press
noremap <Space> :
map Y y$

nnoremap <Leader>s :set invspell<cr>
noremap <Leader>r :VimFilerExplorer -winwidth=25<CR>

" toogle number, relativenumber, hlsearch
noremap <Leader>N :set invnumber<CR>
nnoremap <Leader>R :set invrelativenumber<CR>
nnoremap <Leader>H :set invhlsearch<CR>

" use arrow keys to navigate windows
map <Left> <C-w>h
map <Down> <C-w>j
map <Up> <C-w>k
map <Right> <C-w>l

" change to different window
nnoremap <Tab> <C-w><C-w>

" auto-pairs like emulation
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" Use <Esc> to change to normal mode in neovim terminal
tnoremap <Esc> <C-\><C-n>
noremap <Leader><Tab> <Esc>/<++><Enter>"_c4l

nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprev<CR>

" find a file and show in vertical split
cnoreabbrev <expr> vfind ((getcmdtype() is# ':' && getcmdline() is# 'vfind')?('vertical sfind'):('vfind'))
iab <expr> cdate strftime('%d %b, %A')


" some use full commands
command! -nargs=+ Env echo getenv(<f-args>)
command! -nargs=+ -complete=file Rename call rename(<f-args>)
command Mks mks! session.vim
command Ctags call system('ctags -R')
