""""""""""""""""""""""""""""""
" => CONFIGURACION GLOBAL
""""""""""""""""""""""""""""""
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set ffs=unix,dos,mac " Use Unix as the standard file type
" Permite mover con el mouse las lineas de division (ejm:split)
set nocompatible "Disable vi-compatibility    vim-powerline
if has("mouse")
    set mouse=a
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" Fast saving
nmap <leader>w :w!<cr>
" Fast quit save all files
nmap <leader>q :wqall!<cr>

""" control c para habilibar el copiado de con el mouse ó estado normal
map <c-c> :let &mouse = ( &mouse == ""? "a" : "" )<cr>

command W w !sudo tee % > /dev/null " :W sudo saves the file (useful for handling the permission-denied error)

set wildmenu                  " Turn on the WiLd menu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows (control+w j)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set foldcolumn=0              " Add a bit extra margin to the left
set lazyredraw                " Don't redraw while executing macros (good performance config)
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on

set number
set autoindent
set nowrap                  " don't wrap text Define una linea estatica (no responsivo)

set expandtab               " Use spaces instead of tabs
set shiftwidth=4            " 1 tab == 4 spaces
set softtabstop=4           " 1 tab == 4 spaces
set tabstop=4               " 1 tab == 4 spaces

" Busquedas
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
nmap <F4> :set hls! <cr>
nnoremap / :set hlsearch<cr>/

" Limitar columnas a 80
if exists('+colorcolumn')
     set colorcolumn=80
else
     au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" " match OverLength /\%81v.\+/
" revisar a partir del 27
" ctermbg 4,7,10,11,16
hi default Matchmaker term=underline    ctermbg=43     guibg=#ffffff 
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 "marca con rojo
"match OverLength /\%81v.\+/                                  "lo se pasa


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffer, windows, tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" badd agrega una nueva pestaña al buffer
" Permite moverse con la tecla tab
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
"Control + fecha derecha
nnoremap <C-Right> :bnext<CR>
"Control + fecha derecha
nnoremap <C-Left> :bprevious<CR>
"Control + c cerrar pestaña
nnoremap <C-c> :bdelete<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => List spaces end file 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nmap <F5> :set list! <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Paste and no paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :set paste! <cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Resaltado de palabras (comentar si usara matchmaker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

