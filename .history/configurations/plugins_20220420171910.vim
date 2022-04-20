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
" others
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tcomment_vim'
Plug 'digitaltoad/vim-pug'
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
try
    colorscheme dracula
catch
endtry
" >>>>>>>>> YankStack >>>>>>>>>
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

" >>>>>>>>> auto-pairs >>>>>>>>>

" >>>>>>>>> NRED Tree >>>>>>>>>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" >>>>>>>>> NERDTree-git >>>>>>>>>
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0

" >>>>>>>>> Multi-cursors >>>>>>>>>
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<C-t>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<C-t>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-b>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" >>>>>>>>> surround.vim >>>>>>>>>
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" >>>>>>>>> lightline >>>>>>>>>
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['fugitive', 'readonly', 'filename', 'modified'] ],
    \   'right': [ [ 'lineinfo' ], ['percent'] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
    \ },
    \ 'separator': { 'left': ' ', 'right': ' ' },
    \ 'subseparator': { 'left': ' ', 'right': ' ' }
    \ }

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

" >>>>>>>>> ZenCoding >>>>>>>>>
" Enable all functions in all modes
let g:user_zen_mode='a'

" >>>>>>>>> snipMate >>>>>>>>>
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
let g:snipMate = { 'snippet_version' : 1 }

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

let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
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

" >>>>>>>> Ale (syntax checker and linter) >>>>>>>>>
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}
nmap <silent> <leader>a <Plug>(ale_next_wrap)
" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" >>>>>>>>> Git gutter >>>>>>>>>
let g:gitgutter_enabled=0
nnoremap <silent> <leader>gt :GitGutterToggle<cr>

" >>>>>>>>> EditorConfig >>>>>>>>
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" >>>>>>>>> Fugitive >>>>>>>>>
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>vv :.GBrowse!<CR>
xnoremap <leader>vv :'<'>GBrowse!<CR>



