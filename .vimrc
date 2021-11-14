""""""""""""""""""""
"" 基本配置
""""""""""""""""""""

" 显示行号
: set number

" 不与Vi兼容
: set nocompatible

" 语法高亮
: syntax on

" 显示当前模式
: set showmode

" 显示当前正在输入的命令
: set showcmd

" 支持使用鼠标
: set mouse=a

" 文件类型检查
: filetype on
: filetype plugin on
: filetype indent on

" 缩进
: set autoindent
: set tabstop=4
: set softtabstop=4
: set shiftwidth=4

" 自动折行
: set wrap

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
: set scrolloff=5

" 是否显示状态栏（0表示不显示，1表示只在多窗口时显示，2表示显示）
: set laststatus=2

" 显示光标的当前位置
: set ruler

" 高亮显示括号匹配
: set showmatch

" 搜索时，高亮显示匹配结果
: set hlsearch

" 增量式搜索
: set incsearch

" Tab补全时显示匹配菜单
: set wildmenu



""""""""""""""""""""
"" 插件
""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree'

call plug#end()
