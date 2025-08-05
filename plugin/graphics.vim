" Tabline customisation, adapted from https://stackoverflow.com/questions/5927952/whats-the-implementation-of-vims-default-tabline-function
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let s .= (i == 1 ? '' : ' ')
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let s .= ' ' . i . ': '

      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      " Remove leading directory
      let file = substitute(file, '^.*\/', '', '')
      let file = (file == '' ? '[No Name]' : file)

      let s .= file
      let i = i + 1
    endwhile
    let s .= ' %T%#TabLineFill#%='
    return s
  endfunction
  set tabline=%!MyTabLine()
endif

" Status line config
" Enable soft wrap
set wrap linebreak
" set breakat
set formatoptions+=n
set breakindent

" hide mode indicator
set noshowmode

" Show the number of search matches and index of current match
set shortmess-=S

" Rendre les espaces en fin de ligne visibles
" set list listchars=trail:·

" Window sizes settings
set equalalways
" set winheight=30
" set winwidth=110
" set winminheight=6
" set winminwidth=40

set termguicolors

" Colorscheme adjustments
lua require("rch.comment_marks").load()

function! CustomizeGithub()
  hi myCommentMarks guifg=#6e7781 gui=underline cterm=underline
  hi Sneak guibg=#d15705 guifg=#ffffff guisp=NONE gui=NONE cterm=NONE
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme github_* call CustomizeGithub()
augroup END

if (getenv("KITTY_WINDOW_ID") isnot v:null) || exists('g:neovide') || exists('g:started_by_firenvim')
  set termguicolors
  colorscheme github_light
else
  set notermguicolors
  colorscheme default
endif

" set window title as opened dir stem
set title

if getcwd() ==# getenv("HOME")
  let &titlestring = "vi"
else
  let this_dir = tolower(substitute(getcwd(), ".*/", "", "g"))

  " 'src' usually doesn't much info so instead show the previous directory
  if this_dir ==# "src"
    let &titlestring = tolower(substitute(getcwd(), "/.*/\\([^/]*\\)/[^/]*$", "\\1", "g"))
  else
    let &titlestring = this_dir
  endif
endif
