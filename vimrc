execute pathogen#infect()

filetype plugin indent on
syntax on

set nocompatible
set encoding=utf-8
set fileencodings=utf8,cp1251
set backspace=indent,eol,start
set t_Co=256
set hlsearch
set incsearch
set ignorecase
set nowrap
set linebreak
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set copyindent
set smarttab
set autoindent
set nofoldenable
set history=1000
set cursorline
set guifont=Fira\ Code:h13
set linespace=3
set relativenumber
set guioptions-=L
set guioptions-=r
set splitright
set splitbelow
set scrolloff=3
set ttimeoutlen=50
set laststatus=2
set mouse+=a
set pastetoggle=<F2>
set ttyfast
set ttyscroll=3
set lazyredraw

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'ctrlp']
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let mapleader = ","
let mapleader = "\<Space>"

nmap Q <nop>
nmap <Space> <nop>
imap <C-J> <nop>

nmap <C-c> :NERDTreeToggle<CR>
nmap <Space><CR> o<Esc>k
nmap <Space><S-Enter> O<Esc>j
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <silent> <F1> :%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g<cr>:nohl<cr> 
nnoremap <silent> <F12> :%s/^\s*/&&<cr>:nohl<cr>
nnoremap <F3> :set hlsearch!<CR>

imap jj <Esc>
imap <C-j> <C-o>$<CR>

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:loaded_matchparen=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|public'
let g:ctrlp_extensions = ['line']
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_next_key = '<C-l>'
let g:user_emmet_prev_key = '<C-h>'
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

if has('gui_running')
  colorscheme basic-dark
else
  colorscheme neodark
endif

hi NonText guifg=bg
hi CursorLineNr guifg=#0088cc
highlight LineNr guifg=#3d5c5c
hi Normal ctermbg=none
hi CursorLine ctermbg=none

if bufwinnr(1)
  map <S-Right> <C-W>>
  map <S-Left> <C-W><
  map <S-Up> <C-W>+
  map <S-Down> <C-W>-
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
