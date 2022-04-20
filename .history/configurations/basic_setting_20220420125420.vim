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
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not compatible with Vi
set nocompatible

" Enable filetype plugins and indents
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" " 
nnoremap <Space> <Nop>

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
set novisualbells
" Cancel warning on command
set vb t_vb=
set tm=500

