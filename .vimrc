" Agregando Vundle
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set ffs=unix,dos,mac " Use Unix as the standard file type

source ~/.vimrc_plugins

" CONFIGURACION GLOBAL

" Permite mover con el mouse las lineas de division (ejm:split)
set nocompatible "Disable vi-compatibility    vim-powerline
if has("mouse")
    set mouse=a
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>        " Fast saving
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

"
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

set foldcolumn=1              " Add a bit extra margin to the left
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

"Agregando colorschema Distinguished

set t_Co=256                            " morhetz/gruvbox'
"syntax enable
set background=light                    "light, dark
highlight Comment gui=bold
colorscheme gruvbox                     "solarized, gruvbox, distinguished


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
"vim-airline

"tag bar
"depedencia apt-get install exuberant-ctags

set nocompatible
set laststatus=2   " Always show the statusline
"Acceso rapido
nmap <F8> :TagbarToggle<CR>
set autoread

map <F3> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
"if has('gui_running')
    " syntax enable
    " set background=dark
    " colorscheme solarized
"endif

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

" switch higlight no matter the previous state
nmap <F4> :set hls! <cr>
" hit '/' highlights then enter search mode
nnoremap / :set hlsearch<cr>/
" :mkview " para guardar los cambios del folding
" :loadview "al abrir el archivo como estaba en el folding
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 
" setlocal foldmethod=indent
" set nofoldenable "
highlight Normal ctermbg=White
" limpiar los buffers menos el actual
" :w | %bd | e#"
" hi Search cterm=NONE ctermfg=black ctermbg=45
hi Search cterm=NONE ctermfg=grey ctermbg=45
" List spaces end file 
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nmap <F5> :set list! <cr>

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


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Make VIM remember position in file after reopen
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
