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

if exists("g:neovide")
  set guifont=Cascadia\ Mono:h9
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

" Modify solarized to have a bit less contrast
" TODO make a fork of solarized8 instead
function! CustomizeSolarized()
  if &background ==# 'dark'
    hi WildMenu guifg=#657b83 guibg=#eee8d5 guisp=NONE gui=reverse cterm=reverse
    hi EndOfBuffer guifg=#586e75 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VertSplit guifg=#586e75 guibg=#073642 guisp=NONE gui=NONE cterm=NONE
    hi QuickFixLine guifg=#002b36 guibg=#586e75 guisp=NONE gui=NONE cterm=NONE
    hi Folded guifg=#586e75 guibg=#002b36 guisp=NONE gui=NONE cterm=NONE
    hi LineNr guibg=NONE
    hi StatusLine guifg=#073642 guibg=#93a1a1 guisp=NONE gui=reverse cterm=reverse
    hi StatusLineNC guifg=#073642 guibg=#586e75 guisp=NONE gui=reverse cterm=reverse
    hi TabLineSel guifg=#93a1a1 guibg=#073642 guisp=NONE gui=NONE cterm=NONE
    hi TabLine guifg=#586e75 guibg=#073642 guisp=NONE gui=NONE cterm=NONE
    hi TabLineFill guifg=#586e75 guibg=#073642 guisp=NONE gui=NONE cterm=NONE
    hi myCommentMarks guifg=#586e75 gui=underline cterm=underline
    hi Conceal guifg=#586e75 gui=NONE cterm=NONE
  elseif &background ==# 'light'
    hi WildMenu guifg=#657b83 guibg=#eee8d5 guisp=NONE gui=reverse cterm=reverse
    hi EndOfBuffer guifg=#93a1a1 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VertSplit guifg=#93a1a1 guibg=#eee8d5 guisp=NONE gui=NONE cterm=NONE
    hi QuickFixLine guifg=#fdf6e3 guibg=#93a1a1 guisp=NONE gui=NONE cterm=NONE
    hi Folded guifg=#93a1a1 guibg=#fdf6e3 guisp=NONE gui=NONE cterm=NONE
    hi LineNr guibg=NONE
    hi StatusLine guifg=#eee8d5 guibg=#586e75 guisp=NONE gui=reverse cterm=reverse
    hi StatusLineNC guifg=#eee8d5 guibg=#93a1a1 guisp=NONE gui=reverse cterm=reverse
    hi TabLineSel guifg=#fdf6e3 guibg=#93a1a1 guisp=NONE gui=NONE cterm=NONE
    hi TabLine guifg=#93a1a1 guibg=#eee8d5 guisp=NONE gui=NONE cterm=NONE
    hi TabLineFill guifg=#93a1a1 guibg=#eee8d5 guisp=NONE gui=NONE cterm=NONE
    hi myCommentMarks guifg=#93a1a1 gui=underline cterm=underline
    hi IndentBlanklineChar guifg=#e7e5d6 gui=nocombine
  endif

  hi SignifySignAdd    guifg=#859900 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SignifySignDelete guifg=#dc322f guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SignifySignChange guifg=#b58900 guibg=NONE guisp=NONE gui=NONE cterm=NONE

  " Better sneak colors
  highlight Sneak guibg=#d33682 guifg=#fdf6e3 guisp=NONE gui=NONE cterm=NONE
endfunction

function! CustomizeGithub()
  hi myCommentMarks guifg=#6e7781 gui=underline cterm=underline
  hi Sneak guibg=#d15705 guifg=#ffffff guisp=NONE gui=NONE cterm=NONE
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme solarized* call CustomizeSolarized()
  autocmd ColorScheme github_* call CustomizeGithub()
augroup END

hi Normal guibg=NONE ctermbg=NONE

let s:term_color=luaeval('require("rch.term_color").get_term_color()')

" Load a different colorscheme depending of the term color defined in ~/.term_color.
" The default is github light.
if s:term_color ==# 'nord'
  let &background = 'dark'
  colorscheme nord
elseif s:term_color ==# "github_light"
  let &background = 'light'
  colorscheme github_light
elseif s:term_color ==# "github_dark"
  let &background = 'dark'
  colorscheme github_dark
else
  let &background = s:term_color ==# 'dark' ? 'dark' : 'light'
  colorscheme github_light
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
