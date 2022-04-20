" Don't edit in this file
" if you want to custimize your vimrc
" please, add your own configuration in ~/.vim_config/configurations/customize.vim
set runtimepath+=~/.vim_config

source ~/.vim_config/configurations/basic_setting.vim
source ~/.vim_config/configurations/filetypes.vim
source ~/.vim_config/configurations/plugin_config.vim
source ~/.vim_config/configurations/extended.vim

try
    source ~/.vim_config/configurations/customize.vim
catch
endtry