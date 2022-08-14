"""""""""""
"" 基本配置
"""""""""""

" 显示行号
set number

" 相对行号
set relativenumber

" 高亮显示当前行
set cursorline
highlight CursorLine cterm=NONE
highlight CursorLineNr ctermfg=Red cterm=bold

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

highlight User1 ctermfg=White ctermbg=DarkBlue cterm=bold
highlight User2 ctermfg=Black ctermbg=Blue cterm=bold
highlight User3 ctermfg=DarkBlue ctermbg=LightBlue cterm=bold

" 显示光标的当前位置
set ruler

" 配色方案
" colorscheme ron

" 设置背景色
set background=dark

" 使用256色
set t_Co=256

" 插入括号时，短暂地跳转到与之匹配的括号
set showmatch
set matchtime=2	" 跳转时间

" 搜索时，高亮显示所有匹配结果
set hlsearch	" 使用命令:nohlsearch 暂时取消高亮显示
				" 注意：该命令并不等同于:set nohlsearch

" 增量式搜索
set incsearch

" 搜索时忽略大小写，但当搜索模式中存在大写字母时，则大小写敏感
set ignorecase smartcase

" 搜索时显示搜索计数，如“[1/5]”
set shortmess-=S	" 注：需要 vim >= 8.1.1270

" 命令行补全
set wildmenu	" 增强模式

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

" 是否显示标签栏（0表示不显示，1表示只在多标签时显示，2表示总是显示）
set showtabline=2

" 标签栏高亮
highlight TabLineSel ctermfg=White ctermbg=DarkCyan cterm=bold
highlight TabLine ctermfg=White ctermbg=DarkGrey cterm=NONE
highlight TabLineFill ctermfg=Grey

" 折叠
set foldenable			" zn/zN 可快速地禁用/启用该选项 (等价于执行:set nofoldenable/:set foldenable)，
						" zi 可在两者之间快速切换
set foldmethod=syntax	" 依语法折叠
set foldcolumn=2		" 折叠栏
highlight FoldColumn ctermfg=Black ctermbg=Grey cterm=bold
highlight Folded ctermfg=LightBlue ctermbg=DarkGrey

" 标签
set tags=./.tags;,.tags



"""""""
"" 插件
"""""""

"" Vim Plugin Manager: vim-plug
call plug#begin('~/.vim/plugged')

" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" rainbow
Plug 'luochen1990/rainbow'

" surround.vim
Plug 'tpope/vim-surround'

" vim-gutentags
Plug 'ludovicchabant/vim-gutentags'

" vim-cpp-enhanced-highlight
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()



"""""""""""
"" 插件配置
"""""""""""

"" 标准插件 netrw
let g:netrw_liststyle=3		" 设置默认的列表样式：树形，按i键可切换
let g:netrw_browse_split=4	" :help g:netrw_browse_split
let g:netrw_preview=1		" 预览窗口显示在垂直分割窗口中

"" rainbow
let g:rainbow_active=1
let g:rainbow_conf={
\	'ctermfgs': ['Blue', 'Yellow', 'Cyan', 'Magenta'],
\	'operators': '_,_'
\}

"" vim-gutentags
" 从被编辑文件所在目录开始，向上递归的搜索下面列出的文件/目录(工程目录的标志)，
" 如果找到了，就生成相应的标签文件，否则就不生成
let g:gutentags_project_root=['.root', '.git', '.svn', '.hg', '.project']

" 生成的标签文件的名称
let g:gutentags_ctags_tagfile='.tags'

" 将自动生成的标签文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_cache_dir=s:vim_tags

" 检测 ~/.cache/tags 是否存在，如果不存在就新建
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']

"" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight=1		" Highlighting of class scope
let g:cpp_member_variable_highlight=1	" Highlighting of member variables
let g:cpp_class_decl_highlight=1		" Highlighting of class names in declarations
let g:cpp_posix_standard=1				" Highlighting of POSIX functions
let g:cpp_concepts_highlight=1			" Highlighting of library concepts

" Highlighting of template functions
let g:cpp_experimental_simple_template_highlight=1
" or
" let g:cpp_experimental_template_highlight=1

" Highlighting of user defined functions
" let g:cpp_no_function_highlight=1
