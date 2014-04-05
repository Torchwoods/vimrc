"==================================
"    Vim基本配置
"===================================
 "高亮光标所在行
"set cul
"set cuc

" 启动的时候不显示那个援助乌干达儿童的提示  
set shortmess=atI   
 " 不要图形按钮 
set go=   
   
" 设置背景主题      
"color desert       
color ron    
"color torte 
   
" 设置字体 
"set guifont=Courier_New:h10:cANSI   

" 用浅色高亮当前行
"autocmd InsertLeave * se nocul   

" 用浅色高亮当前行  
autocmd InsertEnter * se cul    

" 允许backspace和光标键跨越行边界(不建议)     
"set whichwrap+=<,>,h,l   

" 光标移动到buffer的顶部和底部时保持3行距离  
set scrolloff=3     
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

" 启动显示状态行(1),总是显示状态行(2)  
set laststatus=2 
" 允许折叠    
"set foldenable   
" 手动折叠      
"set foldmethod=manual  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
"set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"自动保存
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm


set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on


"==================================
"    Vim管理器bundle配置
"===================================

if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github

" -> TO DO <-
"NeoBundle 'othree/html5.vim'
NeoBundle 'BBCode--Dahn'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'taglist.vim'
NeoBundle 'BeyondIM/vim-script-bundle'
NeoBundle 'amix/vimrc'
NeoBundle 'easwy/share'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-scripts/autotags'
NeoBundle 'bling/vim-airline'
NeoBundle 'chazy/cscope_maps'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'winmanager'
NeoBundle 'sukima/xmledit'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'klen/python-mode'
NeoBundle 'Valloric/ListToggle'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'scrooloose/syntastic'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'YankRing.vim'
NeoBundle 'vcscommand.vim'
NeoBundle 'ShowPairs'
NeoBundle 'SudoEdit.vim'
NeoBundle 'EasyGrep'
NeoBundle 'VOoM'
NeoBundle 'VimIM'
NeoBundle 'ma6174/vim'
NeoBundle 'amix/vimrc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
"ndle 'tpope/vim-rails.git'
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" non github repos
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'Auto-Pairs'
NeoBundle 'python-imports.vim'
NeoBundle 'CaptureClipboard'
NeoBundle 'ctrlp-modified.vim'
NeoBundle 'last_edit_marker.vim'
NeoBundle 'synmark.vim'
"NeoBundle 'Python-mode-klen'
NeoBundle 'SQLComplete.vim'
NeoBundle 'Javascript-OmniCompletion-with-YUI-and-j'
"NeoBundle 'JavaScript-Indent'
"NeoBundle 'Better-Javascript-Indentation'
NeoBundle 'jslint.vim'
NeoBundle "pangloss/vim-javascript"
NeoBundle 'Vim-Script-Updater'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'jsbeautify'
NeoBundle 'The-NERD-Commenter'
"django
NeoBundle 'django_templates.vim'
NeoBundle 'Django-Projects'
NeoBundle 'wesleyche/Trinity'
"NeoBundle 'FredKSchott/CoVim'
"NeoBundle 'djangojump'
NeoBundle 'fholgado/minibufexpl.vim'

filetype plugin indent on     " Required!

"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"			Tlist set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Auto_Open=1 
let Tlist_Show_Menu=1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
nmap tl :Tlist<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 				CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序  
let Tlist_Sort_Type = "name"   
" 在右侧显示窗口  
let Tlist_Use_Right_Window = 1  
" 压缩方式 
let Tlist_Compart_Format = 1     
" 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_Exist_OnlyWindow = 1 
" 不要关闭其他文件的tags  
""let Tlist_File_Fold_Auto_Close = 0 
" 不要显示折叠树  
""let Tlist_Enable_Fold_Column = 0   
"不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File=1            

"设置tags  
"set tags=tags  
"set autochdir 
map <C-F12> :!ctags -R --c++kinds=+p --fields=+iaS --extra=+q .<cr>
nmap <F9> <Esc> :!ctags -R * <cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"			WinManager 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * if !argc() | NERDTree | endif
"let g:winManagerWindowLayout = 'NERDTree|TagList'
"let g:winManagerWidth = 30
"let g:miniBufExplorerMoreThanOne=0

let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  
let g:AutoOpenWinManager = 0

 
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"
function! NERDTree_Start()  
        exec 'NERDTree'  
endfunction  
      
function! NERDTree_IsValid()  
    return 1  
endfunction
nmap wm :WMToggle<cr>
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber ]

