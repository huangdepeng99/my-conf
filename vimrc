"""""""""""
"" 基本配置
"""""""""""

" 显示行号
set number

" 不与Vi兼容
set nocompatible

" 语法高亮
syntax enable

" 显示当前模式
set showmode

" 显示当前正在输入的命令
set showcmd

" 支持使用鼠标
set mouse=a

" 缩进
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" 自动折行
set wrap

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=3

" 编码
set encoding=utf-8

" 是否显示状态栏（0表示不显示，1表示只在多窗口时显示，2表示总是显示）
set laststatus=2

" 状态栏显示的信息
set statusline=%<%{\"\"}
set statusline+=%1*\ %F\ %*
set statusline+=%2*\ [%n]\ %(%M%R%H%W\ %)%*
set statusline+=%3*%(\ %y\ %)%*
set statusline+=%3*%=%*
set statusline+=%3*\ [%{!empty(&fenc)?&fenc:&enc}%{&bomb?\",BOM\":\"\"}]\ %*
set statusline+=%3*\ [%{&ff}]\ %*
if exists('*wordcount')
  set statusline+=%2*\ \ Length:%{wordcount().bytes}\ Lines:%L\ \ %*
else
  set statusline+=%2*\ \ Length:%{line2byte(line('$')+1)-1}\ Lines:%L\ \ %*
endif
set statusline+=%1*\ \ Ln:%l,Col:%c\ Pos:%o\ \ %*
set statusline+=%1*\ %P\ %*

hi User1 ctermfg=White ctermbg=DarkBlue cterm=bold
hi User2 ctermfg=Black ctermbg=Blue cterm=bold
hi User3 ctermfg=DarkBlue ctermbg=LightBlue cterm=bold

" 显示光标的当前位置
set ruler

" 配色方案
" colorscheme ron

" 使用256色
set t_Co=256

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
  set clipboard=unnamedplus
endif

" 文件类型检查
filetype indent plugin on

" 备份文件
set backup
set backupdir=~/.vim/.backup//	" 路径必须存在

" 交换文件
set swapfile
set directory=~/.vim/.swap//	" 路径必须存在

" 撤销文件
set undofile
set undodir=~/.vim/.undo//	" 路径必须存在

" 自动切换工作目录
set autochdir

" 历史记录
set history=200



"""""""
"" 插件
"""""""

"" Vim Plugin Manager: vim-plug
call plug#begin('~/.vim/plugged')

" Tagbar
Plug 'majutsushi/tagbar'

" CCTree
Plug 'hari-rangarajan/cctree'

call plug#end()



"""""""""""
"" 插件配置
"""""""""""

"" netrw.vim
" 设置默认的列表样式：树形，按i键可切换
let g:netrw_liststyle=3

" :help g:netrw_browse_split
let g:netrw_browse_split=4

" 预览窗口显示在垂直分割窗口中
let g:netrw_preview=1
