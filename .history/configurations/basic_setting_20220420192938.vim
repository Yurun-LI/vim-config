"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Yurun LI
" GitHub: https://github.com/Yurun-LI/vim-config/tree/vim
" E-mail: li1042278644@icloud.com
" If you have some problems, you can contact me by this
" e-mail
" In this vim file, you can config basic modules of Vim and
" key mapping and set what the color or theme you what
" However, if you want to add some plugins or funcitionality,
" please add them to ~/.vim_config/customizations/customize.vim
" file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not compatible with Vi
set nocompatible

" Enable syntax highlighting
syntax on
syntax enable

" Enable filetype plugins and indents
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" " 
nnoremap <Space> <Nop>

" set timedelay of <leader>
set timeoutlen=500

" copy the yunk content to system clipboard
set clipboard=unnamed

" Show number of lines
set number
" If you want to show relative number
" you can add 'set relativenumber'

" Enable command line completion in enhanced mode
set wildmenu

" Ignore complied files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" support mouse operation
set mouse=a

" auto read when a file is changed 
set autoread
au FocusGained, BufEnter * checktime

" Show the position of the current cursor
set ruler

" Add margin on left border
set foldcolumn=1

" Height of command bar
set cmdheight=1

" Disable error sounds on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" For regular expressions turn magic on
set magic

" buffer becomes hidden when it is abandoned
set hid

" No error bells
set noerrorbells
set novisualbell
" Cancel warning on command
set vb t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color and font settings for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" default color scheme
try
    colorscheme desert
catch
endtry

" background color
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files setting for Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default encoding
set encoding=utf-8

" Set file type by unix
set ffs=unix,dos,mac

" Turn nobackup off, and recommand using git to do it
set nobackup
set nowb
" Do not create swap files
set noswapfile 
" When the file is closed, the undo history is retained
try
    set undofile
    set undodir=~/.vim_config/.temp_dirs/undodir
catch
endtry

" Save history of lines for Vim to remember
set history=400

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor setting for Vim (mainly normal and insert mode)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" backspace action configure
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Do not redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets
set showmatch

" Blinking times on brackets matching
set mat=2

" Chinese or Japanese compatible
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Set lines to the cursor
set so=7

set ai "Auto indent
set si "Smart indent
set wrap "Auto line wrapping

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"" INSERT mode
let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;green\x7"
" REPLACE mode
let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
" NORMAL mode
let &t_EI = "\<Esc>[1 q" . "\<Esc>]12;green\x7"
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode setting for Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line setting for Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status lines to show
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Other setting can be done by plugin of airline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Convenient operation for Vim (mainly key mapping)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <ESC> as j+k
inoremap jk <ESC>

" set Ctrl+e and Ctrl to move pointer to start or end of the line

inoremap <C-e> <ESC>$a
inoremap <C-a> <ESC>^i

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
                
inoremap <C-b> <S-Left>
inoremap <C-f> <S-Right>

nnoremap <C-e> $
nnoremap <C-a> ^h 

" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Fast saving
nmap <leader>w :w!<cr>
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set tab and shift+tab to move indent on normal mode
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

" use 'u' to resume last operation and 'U' to undo
nnoremap U <C-r>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Operations for managing Tab (not tab key)
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

if has("mac") || has("macunix") 
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Do not close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


