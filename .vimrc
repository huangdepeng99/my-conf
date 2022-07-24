"""""""""""
"" 基本配置
"""""""""""

" 显示行号
set number

" 不与Vi兼容
set nocompatible

" 语法高亮
syntax on

" 显示当前模式
set showmode

" 显示当前正在输入的命令
set showcmd

" 支持使用鼠标
set mouse=a

" 文件类型检查
filetype plugin indent on

" 缩进
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" 自动折行
set wrap

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=5

" 是否显示状态栏（0表示不显示，1表示只在多窗口时显示，2表示总是显示）
set laststatus=2

" 状态栏显示的信息
set statusline=%1*\ %<%F%*
set statusline+=%2*\ [%n%M%R%H%W]%*
set statusline+=%3*%=\ %y%*
set statusline+=%4*\ [%{&fileformat}]%*
set statusline+=%5*\ [%{&fileencoding}]%*
set statusline+=%6*\ \ \ Lines:%L\ Ln:%l,Col:%c%*
set statusline+=%7*\ \ \ %P\ %*
hi User1 ctermfg=White ctermbg=DarkGrey
hi User2 ctermfg=White ctermbg=DarkGrey
hi User3 ctermfg=White ctermbg=DarkGrey
hi User4 ctermfg=White ctermbg=DarkGrey
hi User5 ctermfg=White ctermbg=DarkGrey
hi User6 ctermfg=White ctermbg=DarkGrey
hi User7 ctermfg=White ctermbg=DarkGrey

" 显示光标的当前位置
set ruler

" 插入括号时，短暂地跳转到与之匹配的括号
set showmatch
set matchtime=2	" 跳转时间

" 搜索时，高亮显示匹配结果
set hlsearch

" 增量式搜索
set incsearch

" 搜索时忽略大小写，但当搜索模式中存在大写字母时，则大小写敏感
set ignorecase smartcase

" Tab补全时显示匹配菜单
set wildmenu

" 剪切板
if has('clipboard')
  set clipboard+=unnamedplus
endif



"""""""
"" 插件
"""""""

call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree'

" Tagbar
Plug 'majutsushi/tagbar'

call plug#end()
