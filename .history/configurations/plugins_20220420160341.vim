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
" lightline
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'

" Auto complete parentheses
Plug 'jiangmiao/auto-pairs'
" Quickly and easily switch between buffers
Plug 'jlanzarotta/bufexplorer'
" Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'ctrlpvim/ctrlp.vim'
" Most Recently Used files (MRU)
Plug 'yegappan/mru'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
" limelight.vim and goyo
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" NERDTree - folder manager
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Rust
Plug 'rust-lang/rust.vim'
" Tabular
Plug 'godlygeek/tabular'
" SSLsecure
Plug 'chr4/sslsecure.vim'
" Flake8
Plug 'nvie/vim-flake8'
Plug 'nvie/vim-pep8'
" Gitgutter
Plug 'airblade/vim-gitgutter'
" indent-guides
Plug 'nathanaelkane/vim-indent-guides'
" Javascript
Plug 'pangloss/vim-javascript'
" Lastplace
Plug 'farmergreg/vim-lastplace'
" LESS-adds syntax highlighting, indenting and autocompletion for the dynamic stylesheet language LESS
Plug 'groenewege/vim-less'
" multi-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Ruby
Plug 'vim-ruby/vim-ruby'
" Ultisnips & snipmate
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" Yankstack
Plug 'maxbrunsfeld/vim-yankstack'
" Markdown
Plug 'preservim/vim-markdown'
" Indent object
Plug 'michaeljsmith/vim-indent-object'
" typescript
Plug 'leafgarland/typescript-vim'
" ack
Plug 'mileszs/ack.vim'
" 
" others
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tcomment_vim'
plug 'digitaltoad/vim-pug'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'therubymug/vim-pyte'
Plug 'chr4/nginx.vim'








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

" >>>>>>>>> MRU >>>>>>>>>
let MRU_Max_Entries = 400
map <leader>ff :MRU<cr>

" >>>>>>>>> Limelight & goyo &zenroom2 >>>>>>>>>
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

nnoremap <silent> <leader>z :Goyo<cr>
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


