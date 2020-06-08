" Author : Girish Kumar, (zkmrgirish)
" Sensible.vim for zkmrgirish

set encoding=UTF-8
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set tabstop=4
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set noshowmode             " Do not show mode because it is already included in lightline
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set nohlsearch             " Toogle hlsearch using <Leader>H
set inccommand=nosplit     " Shows the effects of a command incrementally, as you type.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set nowrap                 " do not break line
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set scrolloff=10

set foldmethod=syntax      " syntax folding
set foldlevelstart=2

set confirm                " confirm before quiting
set modeline

" set path to search files in subfolders and autocomplete on tab completion
set path=**
set wildmenu
set wildignore+=*.pyc,*.pyo,*/__pycache__/*,.git/*
set wildignore+=*.swp,~*,#*/**

" relativenumber is just a showoff, nobody uses them
" set number        " :set number when required
set guicursor=
set autoread
set autowrite
set history=100

set t_Co=256
" set statusline=%f\ \%{strftime('%I:%M\ %p,\ %A')}\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" some autocmd
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

" Spell-check Git messages
autocmd FileType gitcommit setlocal spell

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

hi Visual guifg=#7bcc7b guibg=#4f4f4f cterm=NONE gui=NONE
hi Normal guibg=#404040 ctermbg=NONE guibg=NONE
" hi Normal     ctermbg=NONE guibg=NONE
" hi EndOfBuffer guifg=#404040
hi StatusLineNC guibg=#4d4d4d guifg=#abcdef
" hi StatusLine guibg=#4d4d4d guifg=#52f752
hi LineNr     ctermbg=NONE guibg=#404040 guifg=#abcdef
" hi TabLine    guifg=white  guibg=#4f4f4f
" hi TabLineFill guifg=#4f4f4f
" hi TabLineSel guifg=#abcdef
hi CursorLine guibg=NONE
" hi CursorLineNr guifg=#52ff52
hi VertSplit  guibg=#404040 guifg=#4f4f4f
hi SignColumn ctermbg=NONE guibg=NONE
hi Pmenu    guifg=#abcdef guibg=#4f4f4f
hi Search guifg=#52ff52 guibg=#4d4d4d
hi Folded guifg=#f97f71 guibg=#4f4f4f
" hi Comment gui=italic
" hi ErrorMsg guifg=#52f752
