
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!go build %<"
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	endif
endfunc

map <leader>w <C-W>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree
map <leader>nt :NERDTreeToggle<cr>

" tagbag
map <leader>tt :TagbarToggle<cr>

" fzf , better and stronger than ctrlp and ctrlp-funky and ack
map <leader>ff :execute 'Files ' . expand('%:p:h')<cr>
map <leader>fp :Files<cr>
map <leader>pf :Files<cr>
map <leader>fr :History<cr>
map <leader>fb :Buffers<cr>
map <leader>ji :BTags<cr>
map <leader>jw :BTags <c-r><c-w><cr>
if executable('rg')
	map <leader>sw :Rg -w <c-r><c-w><cr>
	map <leader>sp :Rg<space>
	map */ :Rg -w <c-r><c-w><cr>
	map <leader>/ :Rg<space>
elseif executable('ag')
	map <leader>sw :Ag -w <c-r><c-w><cr>
	map <leader>sp :Ag<space>
	map */ :Ag -w <c-r><c-w><cr>
	map <leader>/ :Ag<space>
endif

" ctrlp
" map <leader>ff :CtrlPCurFile<cr>
" map <leader>fr :CtrlPMRU<cr>
" map <leader>fp :CtrlPCurWD<cr>
" map <leader>fa :CtrlPMixed<cr>

" ctrlp-funky
" nnoremap <Leader>ji :CtrlPFunky<cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>jw :execute 'CtrlPFunky ' . expand('<cword>')<cr>

" ack
cnoreabbrev Ack Ack!
" map <leader>sw :Ack -w <c-r><c-w><cr>
" map <leader>sp :Ack<space>

