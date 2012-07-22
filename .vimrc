syntax on
filetype plugin indent on
colorscheme idlefingers

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>4 :cd Sites/4momsOnline<CR>
map <silent> <LocalLeader>e :call HtmlEscape()<CR>
map <silent> <LocalLeader>c :call Align()<CR>
map <silent># :s/^/#/<CR>

:inoremap zz <Esc>

:set hidden
:set number
:set ts=2
:set sts=2
:set shiftwidth=2
syntax on
filetype plugin indent on
colorscheme idlefingers

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>4 :cd Sites/4momsOnline<CR>
map <silent> <LocalLeader>e :call HtmlEscape()<CR>
map <silent> <LocalLeader>c :call Align()<CR>
:inoremap zz <Esc>

:set hidden
:set number
:set ts=2
:set sts=2
:set guifont=Menlo:h11.00
:au FocusLost * :wa

if has("gui_running")
set guioptions=egmrt
endif

let g:CommandTMaxFiles=40000
:set wildignore+=vendor/**
:set wildignore+=public/images
:set wildignore+=*.png
:set wildignore+=*.jpg
:set wildignore+=*.gif

:set backupdir=~/.backup,.,/tmp
:set backupdir=~/.backup,.,/tmp

set rnu
:match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/
:match Search /\S\zs[\t ]\+\%#\@!$/
call matchadd('Error', '')

" runtime macros/matchit.vim
fun! HighlightWhitespaceErrors()
" trailing whitespace, except for the current cursor position
" tabs anywhere but leading
endf
au BufNewFile,BufRead * call HighlightWhitespaceErrors()

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/\'/\&apos;/eg
  silent s/\’/\&apos;/eg
	silent s/\"/\&quot;/eg
endfunction

function Align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

