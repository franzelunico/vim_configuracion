" Agregando Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

source ~/vim_configuracion/.vimrc_plugins

" Permite mover con el mouse las lineas de division (ejm:split)
set nocompatible "Disable vi-compatibility    vim-powerline
if has("mouse")
    set mouse=a
endif


" CONFIGURACION GLOBAL
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on
set number
set autoindent
set nowrap                  " don't wrap text Define una linea estatica (no responsivo)

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

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
" colorscheme gruvbox                     "solarized, gruvbox, distinguished


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
