
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Agregando plugins a Vundle
call vundle#begin()

Plugin 'qstrahl/vim-matchmaker' "realiza match sobre el curso(palabra)
Plugin 'ctrlpvim/ctrlp.vim' " realizar busquda de archivo (diferente a find)


Plugin 'tpope/vim-fugitive' " Nos permite acciones git en vim, Gpush,etc
Plugin 'airblade/vim-gitgutter' " Muestra cambios sobre un archivo +,~,etc

Plugin 'scrooloose/nerdtree'  " Para navegar sobre direcctorios
Plugin 'tomtom/tcomment_vim' " para comentar codigo

Plugin 'MarcWeber/vim-addon-mw-utils' " uso de sniptes para diferentes lenguajes
Plugin 'tomtom/tlib_vim'           " uso de sniptes para diferentes lenguajes
Plugin 'garbas/vim-snipmate'       " uso de sniptes para diferentes lenguajes
Plugin 'honza/vim-snippets'        " opcional

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox' " colorschema
Plugin 'scrooloose/syntastic' " Muestra errores de sintaxis

Plugin 'altercation/vim-colors-solarized' " colorscheme gvim (funciona en xface terminal)
":e $VIMRUNTIME/macros/matchit.vim
":saveas ~/.vim/plugin/matchit.vim
":e $VIMRUNTIME/macros/matchit.txt
":saveas ~/.vim/doc/matchit.txt
Plugin 'Valloric/MatchTagAlways' "colorea los los tags 

" Terminal Vim with 256 colors colorscheme
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'Distinguished'
" Autoclose
Plugin 'Townk/vim-autoclose'
call vundle#end()
" Config Plugins


""""""""""""""""""""""""""""""""
" => Matchmaker plugin
" """"""""""""""""""""""""""""""
":Matchmaker! "Disable
let g:matchmaker_enable_startup = 1 
" ctermbg 4,7,10,11,16
" hi default Matchmaker term=underline    ctermbg=43     guibg=#ffffff 


""""""""""""""""""""""""""""""""
" => bufExplorer plugin
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => CTRL-P
" """"""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
" """"""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
let NERDTreeIgnore=['\.pyc$', '\.pdf$', '\.log$', '\.lot$', '\.lof$', '\.out$','\.aux$','\.toc$']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"muestra las pestañas del buffer (Smarter tab line)

let g:airline#extensions#tabline#enabled = 1
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
"let g:airline#extensions#tabline#left_sep = ' '
"Requisitos para powerline (Helptags, help powerline)
"http://powerline.readthedocs.org/en/master/installation/linux.html
"vim-powerline/fontpatcher
"$ ./fontpatcher PowerlineSymbols.sfd
"$ cp PowerlineSymbols-Powerline.otf ~/.fonts/
"# fc-cache -vf
let g:airline_powerline_fonts = 1
"let g:airline_symbols

" Plugin 'vim-airline/vim-airline-themes'
":AirlineTheme bubblegum   (laederon, papercolor, distinguished)
let g:airline_theme="dark"
" Plugin 'morhetz/gruvbox' " colorschema
" Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['pylama'] " pip install pylama
let g:syntastic_javascript_checkers = ['jslint'] "npm install -g jslint

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" instalar tidy apt-get install tidy
" tidy ignorar atributos ng-
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" lopen 5
let g:syntastic_loc_list_height=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>