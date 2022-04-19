" Don't edit in this file
" if you want to custimize your vimrc
" please, add your own customizations in ~/.vim_config/customizations/customize.vim
set runtimepath+=~/.vim_config

source ~/.vim_config/customizations/basic_setting.vim
source ~/.vim_config/customizations/filetypes.vim
source ~/.vim_config/customizations/plugin_config.vim
source ~/.vim_config/customizations/extended.vim

try
    source ~/.vim_config/customizations/customize.vim
catch
endtry



