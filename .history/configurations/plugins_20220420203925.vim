
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
Plug 'maximbaz/lightline-ale'

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

" Javascript
Plug 'pangloss/vim-javascript'
" Lastplace - reopen files at your last edit position
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
" typescript
Plug 'leafgarland/typescript-vim'
" ack
Plug 'mileszs/ack.vim'
" Nerdcommenter
Plug 'preservim/nerdcommenter'
" Vim-rainbow
Plug 'frazrepo/vim-rainbow'
" YCM
Plug 'tabnine/YouCompleteMe'
" Make vim transparent
Plug 'tribela/vim-transparent'
" spector - Code Debugger
Plug 'puremourning/vimspector'
" indent line
Plug 'Yggdroot/indentLine'

" others
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
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

" >>>>>>>>> NRED Tree >>>>>>>>>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

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
let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_infos': 'lightline#ale#infos',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \     'linter_checking': 'right',
    \     'linter_infos': 'right',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'right',
    \ }
let g:lightline.active = {
    \ 'left' : [ ['mode', 'paste' ],
    \            ['fugitive', 'readonly', 'filename', 'modified'] ],
    \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \            [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

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
" \<Leader\>be normal open
" \<Leader\>bt toggle open / close
" \<Leader\>bs force horizontal split open
" \<Leader\>bv force vertical split open

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
let g:limelight_default_coefficient = 0.5

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
\   'go': ['go', 'golint', 'errcheck'],
\   'c': ['clang'],
\   'c++': ['clang++']
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

" >>>>>>>>> YCM (integrated with tabnine) >>>>>>>>>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_key_list_stop_completion = ['<C-y>']

inoremap <C-d> <ESC>ld$a
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" >>>>>>>>> Vim-rainbow >>>>>>>>>
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" >>>>>>>>> Vim-snippets >>>>>>>>>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" >>>>>>>>> Indentline >>>>>>>>>
"let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_term = 243
" You can also use one of ¦, ┆, │, ⎸, or ▏ to display more beautiful lines. 
" However, these characters will only work with files whose encoding is UTF-8.
let g:indentLine_char_list = ['¦']

" >>>>>>>>> Tabularize >>>>>>>>>
" you can customize the mappings
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" >>>>>>>>> Ack >>>>>>>>>
" Use the the_silver_searcher 
" if possible (much faster than Ack)
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
endif
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>
" Open Ack and put the cursor in the right position
map <leader>g :Ack 
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" >>>>>>>>> Visual multi cursor >>>>>>>>>
" continue to be configured
