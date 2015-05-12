" Agregando pathogen.
execute pathogen#infect()
" Permite mover con el mouse las lineas de division (ejm:split)
set nocompatible
if has("mouse")
    set mouse=a
endif


" CONFIGURACION GLOBAL
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on
set number
set autoindent
"set nowrap                  " don't wrap text Define una linea estatica (no responsivo)
" Permite vel el final de las lineal eol
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list
set cursorline cursorcolumn " Permite ver linea del cursolo horizontal vertical

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2

" Busquedas
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"Agregando colorschema Distinguished
set t_Co=256
colorscheme distinguished


" Open NerdTree
map <F2> :NERDTreeToggle<CR>
