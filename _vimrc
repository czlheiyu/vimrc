"==========================================
"vundle区,注意配置环境变量$VIM
"==========================================
set nocompatible
filetype off

"载入Vundle包的路径,也就是说bundle有这个就够了
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"安装包的位置
call vundle#begin('$VIM/vimfiles/Vundle')

"Vundle主版
Plugin 'gmarik/Vundle.vim'
"一个主题
Plugin 'molokai'
"" "自动补完工具
" Plugin 'Valloric/YouCompleteMe'
"语法核对工具
Plugin 'scrooloose/syntastic'
"PEP8规范核对工具
Plugin 'nvie/vim-flake8'
"tag查询工具
Plugin 'kien/ctrlp.vim'
"目录工具
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"git工具
Plugin 'tpope/vim-fugitive'
"查看文件tag工具
Plugin 'taglist.vim'
"python折叠工具
Plugin 'tmhedberg/SimpylFold'
"状态栏工具
Plugin 'czlheiyu/powerline', {'rtp': 'powerline/bindings/vim/'}
"个人主配置
Plugin 'czlheiyu/vimrc'
call vundle#end()
filetype plugin indent on

"==========================================
"基本配置
"==========================================
"菜单编码
set langmenu=zh_CN.utf-8
" history存储长度
set history=1000
"检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 感谢援助索马里儿童的基金会

" 取消备份。取消交换文件
set nobackup
set nowb
set noswapfile

"粘贴时保持格式
set paste

set mouse=a           " 在所有的模式下面打开鼠标。
set selection=exclusive
set selectmode=key

" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set helplang=cn

" "==========================================
" " YouCompleteMe 自动补全配置
" "==========================================
" "拒绝分割窗口预览
" set completeopt-=preview
" "配置自动补全窗口自动关闭特性
" let g:ycm_autoclose_preview_window_after_completion=1
" "映射转到定义按钮
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" "支持python virtualenv环境
" python3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_error_symbol = '>>'
" let g:ycm_warning_symbol = '>*'
" " for ycm
" let g:ycm_error_symbol = '>>'
" let g:ycm_warning_symbol = '>*'
" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nmap <F7> :YcmDiags<CR>
" 
" 
" 
"==========================================
" SimpylFold 自动补全配置
"==========================================
"折叠代码的文档预览
let g:SimpylFold_docstring_preview=1
"==========================================
" 语法高亮/配色/GUI类配置
"==========================================
"""""高亮
let python_highlight_all=1
" "开启语法高亮
syntax on
" 突出显示当前行
set cursorline
" 高亮search命中的文本。
set hlsearch
" 随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
"有大写字母时自动识别为敏感
set smartcase

"""""配色
"同sublime text2 colorscheme 配色（更多的配色见colors目录和http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/index-c.html）
"开启molokai风格
colorscheme molokai

"""""GUI
"GUI特征配置
if has("gui_running")
    "set guifont=YaHei_Mono:h18
    set guifont=等距更纱黑体_SC:h22
    set guioptions=creRLb
    set t_Co=256
endif
set lines=35 columns=208

"显示行号：
set number
set nowrap                    " 取消换行。
"用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"显示括号配对
set showmatch


"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"总是显示状态栏
set laststatus=2
" j/k 上下滚动,前后预留行数
set so=3
"==========================================
" 单独热键配置
"==========================================
"选择模式下的复制粘贴
vnoremap <C-X> "+x
vnoremap <C-C> "+y
" Shift + Insert 插入系统剪切板中的内容
noremap <S-Insert> "+p
vnoremap <S-Insert> d"+P
inoremap <S-Insert> <esc>"+pa
inoremap <C-S-Insert> <esc>pa
"buffer跳转的快捷按键
map <M-right> <ESC>:bn<RETURN>
map <M-left> <ESC>:bp<RETURN>
map <M-down> <ESC>:cn<RETURN>
map <M-up> <ESC>:cp<RETURN>
"选区搜索的快捷键
let mapleader = ","
vmap <silent> <leader>/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vmap <silent> <leader>? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"分隔窗口的转移按键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"==========================================
" 代码折叠
"==========================================
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"set foldmethod=syntax
set foldmethod=syntax
set foldlevel=99
au BufWinLeave * silent mkview  " 保存文件的折叠状态
au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
" 在左侧显示折叠的层次
set foldcolumn=4
"==========================================
" 文件处理准则
"==========================================
" 设置新文件的编码为 UTF-8
set fileencoding=utf-8
" gb18030 最好在 UTF-8 前面，否则其它编码的文件极可能被误识为 UTF-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,GB18030,utf-8,default,latin1
"文件处理类型
set fileformats=unix,dos,mac
" 如遇Unicode值大于255的文本，不必等到空格再折行。
" 合并两行中文时，不在中间加空格
set formatoptions+=mB
"支持退格键的高级删除
set backspace=eol,start,indent
"正则表达式模式的一种
set magic

" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4                
set shiftwidth=4
" 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab                
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
"自动复制缩进和智能控制缩进
set autoindent
set smartindent

" Python 文件设置
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent smartindent fileformat=unix
autocmd FileType python map <F5> :!python3 %<CR>
autocmd FileType python map <F6> :!python3 -i %<CR>
" 高亮行尾空格
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"网页文件设置
" au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2
"==========================================
" NERDTree 自动补全配置
"==========================================
"忽略文件类型
let NERDTreeIgnore=['\.pyc$', '\~$'] 
"初始化时不要打开
let loaded_nerd_tree=1
"快捷键
"map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"==========================================
"taglist配置
"=========================================
"让taglist窗口出现在Vim的右边
let Tlist_Use_Right_Window = 1 
"当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close = 1 
"只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File = 1 
"Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type ='name:' 
"Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen = 1 
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1 
"设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth = 32 
let Tlist_Ctags_Cmd ='ctags.exe'
set tags=tags;
set autochdir
map <F4> :TlistToggle<CR>
"==========================================
" Powerline
"==========================================
""My preferences

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

"==========================================
" 特殊特性
"==========================================
" vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost _vimrc source % 
" vimrc文件修改之后自动加载。 linux。
autocmd! bufwritepost .vimrc source % 










" autocmd FileType python set omnifunc=pythoncomplete#Complete
" 
" 
" 
" " Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
" 
" 
" 
" set whichwrap+=<,>,h,l
" 
" "pydiction 1.2 python auto complete
" let g:pydiction_location = '%VIM%/vimfiles/tools/pydiction/complete-dict'
" "defalut g:pydiction_menu_height == 15
" let g:pydiction_menu_height = 20
