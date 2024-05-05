" indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent

" Set the global flag by default for the s command
set gdefault

set complete-=t

set nomodeline
set wildmenu

" Set unnamed clipboard to system clipboard
set clipboard=unnamed,unnamedplus

set hlsearch incsearch

" Better diffs
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
set diffopt+=linematch:50

" Case insensible completion
set infercase

set ignorecase smartcase
set hidden
set splitright splitbelow

" Enable automatic comment insertion
" set formatoptions+=cro

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" This is pretty low and might be problematic
set updatetime=300
