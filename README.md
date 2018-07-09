# vim_configuracion

F8 para tagbar (requiere instalar exuberant-ctags)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/franzelunico/vim_configuracion.git ~/Documentos/configuraciones_sistema/vim_configuracion
touch .vimrc
```

Detro de .vimrc agregar
```
source ~/Documentos/configuraciones_sistema/vim_configuracion/basic.vim
source ~/Documentos/configuraciones_sistema/vim_configuracion/vimrc_plugins.vim
source ~/Documentos/configuraciones_sistema/vim_configuracion/customize.vim
vim +PluginInstall +qall
```
