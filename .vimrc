"MODIFICAÇÕES PESSOAIS
colorscheme desert
set rnu
set nu
set whichwrap+=<,>,h,l,[,]
set nowrap
set tabstop=4
set ts=4
set sw=4
set hlsearch
set incsearch
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:\│\  
set t_Co=256
hi Normal ctermbg=233
hi SpecialKey ctermfg=235
set mouse=nv
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <BS> X
"cruz de vizualização
set timeout
set timeoutlen=0
hi cursorline   cterm=none ctermbg=235 
hi cursorcolumn cterm=none ctermbg=235 
autocmd InsertLeave *  hi cursorline   cterm=none ctermbg=235
autocmd InsertLeave *  hi cursorcolumn   cterm=none ctermbg=235
autocmd InsertEnter *  hi cursorline   cterm=none ctermbg=black
autocmd InsertEnter *  hi cursorcolumn   cterm=none ctermbg=black
augroup BgHighlight
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
	autocmd WinLeave * setlocal nocursorline nocursorcolumn
augroup END
