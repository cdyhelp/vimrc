set nocompatible              " 去除VI一致性
filetype off                  " 必须

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-unimpaired'
" ----------------------------------------------
Plug 'w0rp/ale'	" 语法检查
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
" ----------------------------------------------

" highlight
Plug 'vim-scripts/Mark'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
command! -bang -nargs=* Ag
			\ call fzf#vim#grep(
			\   'ag --no-messages --color '.<q-args>, 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --no-messages --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)
Plug 'junegunn/goyo.vim'
Plug 'junegunn/tabular'
let g:tabular_default_format = "l1-1"
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'tacahiroy/ctrlp-funky'

Plug 'easymotion/vim-easymotion'

" if has('nvim')
" 	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
" 	Plug 'Shougo/deoplete.nvim'
" 	Plug 'roxma/nvim-yarp'
" 	Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)


" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ neosnippet#expandable_or_jumpable() ?
" 			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" 			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete-clangx'
let g:deoplete#custom#clangx#clang_binary = '/usr/bin/clang'
" Plug 'zchee/deoplete-clang'
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-6.0/lib/clang'

Plug 'colepeters/spacemacs-theme.vim'

Plug 'vim-scripts/Tagbar'
let g:tagbar_ctags_bin="~/AppData/Local/nvim/bin/ctags"
let g:tagbar_autopreview = 1
let g:tagbar_sort = 0

Plug 'vim-scripts/vcscommand.vim'  " SVN/CVS/SVK/git/hg/bzr

Plug 'tpope/vim-commentary'
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s
autocmd FileType lua set commentstring=--\ %s

Plug 'liuchengxu/vim-which-key'
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
set timeoutlen=1000

"-------------------------------------------------------------
" 代码补全
Plug 'Valloric/YouCompleteMe'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
"在实现和声明之间跳转,并分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <Leader>gh :YcmCompleter GoTo<CR>
let g:ycm_semantic_triggers =  {
  \   'c,cc,cpp': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }
"-------------------------------------------------------------

call plug#end()

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
