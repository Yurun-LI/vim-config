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

call plug#begin('~/.vim_config/plugins/default')
" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Auto complete parentheses
Plug 'jiangmiao/auto-pairs'
" Quickly and easily switch between buffers
Plug 'jlanzarotta/bufexplorer'
" Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'ctrlpvim/ctrlp.vim'
" Most Recently Used files (MRU)
Plug 'yegappan/mru'


call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>Plugins configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" >>>>>>>>> Dracula theme >>>>>>>>>
colorscheme dracula

" >>>>>>>>> auto-pairs >>>>>>>>>

" >>>>>>>>> ctrlp >>>>>>>>>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" >>>>>>>>> bufexplorer >>>>>>>>>
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>



