
let mapleader = "\<Space>"

set hlsearch " 搜索高亮
set vb t_vb=   " 关掉出错声音
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set pastetoggle=<F9>

" 取消 set nowildmenu，将不能出现tab选择
set wildmenu
" 配置规则
" set wildmode=longest,list,full

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" VIM Tab键宽度
set tabstop=4

" 统一设置为缩进为4
set shiftwidth=4	" 表示每一级缩进的长度
set softtabstop=4	" 表示在编辑模式的时候按退格键的时候退回缩进的长度

" 不要用空格键代替空格
" set noexpandtab

" 设置当文件被改动时自动载入  
set autoread

"从不备份    
set nobackup

set guioptions-=T           " 隐藏工具栏

" colorscheme
if (has("termguicolors"))
    " enable true color
    set termguicolors
endif
set background=dark
try
    colorscheme spacemacs-theme
    " colorscheme molokai
catch
endtry

if has('gui_running')
	set guifont=Source_Code_Pro_for_Powerline:h12
else
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
endif

function! DeleteAllBuffersInWindow()
	let s:curWinNr = winnr()
	if winbufnr(s:curWinNr) == 1
		ret
	endif
	let s:curBufNr = bufnr("%")
	exe "bn"
	let s:nextBufNr = bufnr("%")
	while s:nextBufNr != s:curBufNr
		exe "bn"
		exe "bdel ".s:nextBufNr
		let s:nextBufNr = bufnr("%")
	endwhile
endfun
command! -bang -nargs=* Bda
  \ call DeleteAllBuffersInWindow()

" txt is lua
au BufNewFile,BufRead *.txt set filetype=lua
