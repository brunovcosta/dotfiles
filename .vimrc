call plug#begin('~/.vim/plugged')
Plug 'brunovcosta/crossover'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'brunovcosta/vim-pug'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'
Plug 'nikvdp/ejs-syntax'
Plug 'adimit/prolog.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'kchmck/vim-coffee-script'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

let g:ycm_confirm_extra_conf    = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

autocmd FileType java setlocal omnifunc=javacomplete#Complete

"MODIFICAÇÕES PESSOAIS
set t_Co=256
colorscheme hybrid
syntax on
set scrolloff=3
set rnu
set nu
set whichwrap+=<,>,h,l,[,]
set nowrap
set tabstop=4
set ts=4
set sw=4
set autoindent
set hlsearch
set incsearch
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:\│\  
hi Normal ctermbg=233
hi SpecialKey ctermfg=235
set mouse=nv
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
"navegação entre panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <BS> X
set background=dark
