""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
set t_Co=256		" enable 256 colors, must appear before any syntax and color settings

set mouse=a

set modeline

set shiftwidth=2 	" soft space = 2

set wildchar=9 		" tab as completion character
set virtualedit=block
set clipboard+=unnamed	" Yanks go on clipboard instead.
set showmatch		" Show matching braces.
" Line wrapping on by default
set wrap
set linebreak
set showbreak=>\ \ \
set history=50 		" keep track of last commands
set number ruler 	" show line numbers
set incsearch 		" incremental searching on
set hlsearch 		" highlight all matches
set smartcase
set cursorline
set selectmode=key
set showtabline=2 	" show always for console version
set laststatus=2 	" Always show the statusline
set wildmenu 		" menu on statusbar for command autocomplete
" default to UTF-8 encoding
set encoding=utf8
set fileencoding=utf8
" enable visible whitespace
"set listchars=tab:»·,trail:·,precedes:<,extends:>
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set list

syntax enable 		" turn on syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

"color dracula 		" set by Vundle
"let g:molokai_original = 1
let g:rehash256 = 1
"colorscheme molokai

if exists('$TMUX')
  set term=screen-256color
endif

" vim-pathogen:
execute pathogen#infect()
filetype plugin indent on

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_yaml_checkers = ['yamllint']
