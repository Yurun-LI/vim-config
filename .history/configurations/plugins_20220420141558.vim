"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file includes plugin and plugin configuration
" all of the plugins are managed by the vim-plug
" and if you want to use other plugin manager, please set it
" in ~/.vim_config/configurations/customize.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader> key has been set to <Space>, if you want to use
" other key, you can use 'let mapleader=<custom_key>'

let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins/{}')



call plug#end()