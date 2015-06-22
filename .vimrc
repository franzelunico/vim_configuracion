" Agregando pathogen.
execute pathogen#infect()
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
"muestra las pestañas del buffer (Smarter tab line)
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '

"tag bar
"depedencia apt-get install exuberant-ctags
nmap <F8> :TagbarToggle<CR>

"Requisitos para powerline (Helptags, help powerline)
"vim-powerline/fontpatcher
"$ ./fontpatcher PowerlineSymbols.sfd
"$ cp PowerlineSymbols-Powerline.otf ~/.fonts/
"# fc-cache -vf

"let g:airline_powerline_fonts = 1
"let g:airline_symbols
set nocompatible   
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols = 'fancy' "Muestra los simbolos

"vim-powerline/autoload/Powerline/Colorschemes
"let g:Powerline_theme = 'molokai'
let g:Powerline_colorscheme = 'default'
"let g:Powerline_stl_path_style = 'full'

" Agregando ultisnips
" mkdir -p ~/.vim/ftdetect/
" ln -s ~/.vim/ultisnips_rep/ftdetect/* ~/.vim/ftdetect/
set runtimepath+=/home/killer/Documentos/proyectos/vim_configuracion/.vim/bundle/ultisnips

"Habilita nocompatible
let g:neocomplete#enable_at_startup = 1
