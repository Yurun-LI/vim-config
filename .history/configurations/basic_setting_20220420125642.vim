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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
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

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2



" No error bells
set noerrorbells
set novisualbells
" Cancel warning on command
set vb t_vb=
set tm=500

