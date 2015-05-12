"
"vimrc for blue0125@gmail.com
"

"vi
set nocompatible

"kill bell(noeb vb)
set vb t_vb=

set encoding=utf-8 
set fileencodings=utf-8,gbk,gb2312,latin-1,gb18030

set nobackup

set autoindent
set cindent
set smarttab
set smartindent

set showcmd
set number
set helplang=cn

set mouse=a
set completeopt=longest,menu 
set laststatus=2

set tabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start

set history=2000
set showmatch
set incsearch
set ruler
set hlsearch

set cursorline

set shortmess=atI

"set mapleader
let mapleader=","
let g:mapleader=","

"gui
if has("gui_running")
    set guifont=Consolas:h12
    au GUIEnter * simalt ~x  

    map <silent> <leader>ss :source ~\_vimrc<cr>
    map <silent> <leader>ee :tabnew ~\_vimrc<cr>
    autocmd! bufwritepost _vimrc source ~\_vimrc

    set runtimepath+=~\.vim
    set rtp+=~\.vim\bundle\vundle\

    source $VIMRUNTIME\delmenu.vim
    source $VIMRUNTIME\menu.vim
    language messages zh_CN.utf-8

else

    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of the .vimrc
    map <silent> <leader>ee :tabnew ~/.vimrc<cr>
    "Where .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc

    set rtp+=~/.vim/bundle/vundle/
endif



filetype off

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mattn/emmet-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
"Bundle 'ervandew/supertab'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'csexton/snipmate.vim'
"Bundle 'kien/ctrlp.vim'
Bundle 'itchyny/calendar.vim'


set t_Co=256
set background=dark
colorscheme solarized 
"colorscheme molokai

if has("syntax")
    syntax enable
endif

filetype plugin indent on

"tabs
map th <Esc>:tabfirst<CR>
map tj <Esc>:tabnext<CR>
map tk <Esc>:tabprev<CR>
map tl <Esc>:tablast<CR>
map tn <Esc>:tabnew<Space>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

"cc
hi ColorColumn ctermbg=8 
"guibg=232
map ,cc :call SetColorColumn()<CR>
function! SetColorColumn()
	let col_num = virtcol(".")
	let cc_list = split(&cc, ',')
	if count(cc_list, string(col_num)) <= 0
		execute "set cc+=".col_num
	else
		execute "set cc-=".col_num
	endif
endfunction

"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

"emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"neRDTree
nmap <F2> :NERDTreeToggle<CR>

"taglist
set tags=tags;
set autochdir
"let Tlist_Ctags_Cmd='/usr/bin/ctags'   " 若在windows中应写成: 
let Tlist_Ctags_Cmd='C:\ctags58\ctags.exe'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu = 1
let Tlist_OnlyWindow = 1
let Tlist_Sort_Type='name'
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Close_On_Select=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_Auto_close = 1
let Tlist_WinHeight=10
let Tlist_WinWidth=30
let Tlist_Use_Horiz_Window=0
nmap <F3> :Tlist<CR><C-w><C-w>
nmap <silent> <leader>tl :Tlist<CR><C-w>

"Calendar
let g:calendar_google_calendar = 0
let g:calendar_google_task = 0
let g:calendar_first_day = "sunday"

"syntax
""php
""let php_sql_query=1
"let php_baselib = 1
"let php_htmlInStrings = 1
""let php_oldStyle = 0
"let php_asp_tags = 1
"let php_noShortTags = 1
"let php_parent_error_close = 1
"let php_parent_error_open = 1
"let php_folding = 0
"let php_sync_method = -1
"
"php funclist
"au FileType php call AddPHPFuncList()
"function! AddPHPFuncList()
"	set dictionary-=~/.vim/funclist/php-funclist.txt dictionary+=~/.vim/funclist/php-funclist.txt
"	set complete-=k complete+=k
"endfunction
"
"""html
"let g:do_xhtml_mappings = 'yes'
"let g:html_map_entity_leader = '`' 
"let g:no_html_map_override = 'yes'
"let g:html_charset= 'zh_CN.UTF-8'
"let g:no_html_tab_mapping = 'yes'
"let g:html_tag_case = 'lowercase'

