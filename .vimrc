" Agregando Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/killer/Documentos/proyectos/vim_configuracion/.vim/bundle/Vundle.vim
" Agregando plugins a Vundle
call vundle#begin()

Plugin 'qstrahl/vim-matchmaker' "realiza match sobre el curso(palabra)

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'  " Para navegar sobre direcctorios
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'airblade/vim-gitgutter' "muestra cambios sobre un archivo +,~,etc
Plugin 'tpope/vim-fugitive'

Plugin 'morhetz/gruvbox' " colorschema

Plugin 'scrooloose/syntastic' " Muestra errores de sintaxis

Plugin 'altercation/vim-colors-solarized' " colorscheme gvim

call vundle#end()


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
set background=dark
colorscheme distinguished                     " morhetz/gruvbox'

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

"Requisitos para powerline (Helptags, help powerline)
"http://powerline.readthedocs.org/en/master/installation/linux.html
"vim-powerline/fontpatcher
"$ ./fontpatcher PowerlineSymbols.sfd
"$ cp PowerlineSymbols-Powerline.otf ~/.fonts/
"# fc-cache -vf
let g:airline_powerline_fonts = 1

"let g:airline_powerline_fonts = 1
"let g:airline_symbols
set nocompatible
set laststatus=2   " Always show the statusline
"Acceso rapido
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Configuracion de plugins
"============qstrahl/vim-matchmaker============
let g:matchmaker_enable_startup = 1 
"============scrooloose/syntastic============
set statusline+=%#warningmsg# "
set statusline+=%{SyntasticStatuslineFlag()}"
set statusline+=%*"
let g:syntastic_python_checkers=['pylama'] " pip install pylama
let g:syntastic_always_populate_loc_list = 1"
let g:syntastic_auto_loc_list = 1"
let g:syntastic_check_on_open = 1"
let g:syntastic_check_on_wq = 0"

map <F3> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

if has('gui_running')
    syntax enable
    set background=dark
    colorscheme solarized
endif

