call plug#begin('~/.local/share/nvim/plugged')
Plug 'brunovcosta/crossover'
Plug 'google/vim-searchindex'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'
Plug 'briancollins/vim-jst'
Plug 'rhysd/nyaovim-popup-tooltip'
Plug 'FredKSchott/CoVim'
Plug 'adimit/prolog.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-surround'
Plug 'exu/pgsql.vim'
Plug 'raimondi/delimitmate'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
call plug#end()

"Ctrl+P
"if exists("g:ctrl_user_command")
"  unlet g:ctrlp_user_command
"endif
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

"FZF
map <C-p> :FZF<Enter>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

"YouCompleteMe
let g:ycm_confirm_extra_conf    = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"UtilSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

map <f9> :NERDTreeToggle<CR>

" Crossover
let g:crossover_insert_color=253
let g:crossover_normal_color=255


"MODIFICAÇÕES PESSOAIS
"au BufNewFile,BufRead *.html.ejs set filetype=html
set t_Co=256
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
set mouse=nv

"if exists('+autochdir')
"	set autochdir
"else
"	autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"endif

" Navegação entre panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <BS> X

"set background=dark

" Vim render error with tmux
set tenc=utf8

" Default register unnamedplus
set clipboard=unnamedplus

" Statusline
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
syntax on
