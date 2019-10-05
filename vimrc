" Compatibility w/ vi
set nocompatible

" Vundle plugin manager
set shell=/bin/bash
filetype off
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc('~/.vim/bundle/vundle/')
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'Conque-Shell'
Plugin 'HTML-AutoCloseTag'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Pydiction'
Plugin 'taglist.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'JavaDecompiler.vim'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'mips.vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/csv.vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-characterize.git'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'lepture/vim-jinja'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
syntax on

colorscheme desert

" Manage multiple buffers
set hidden

set noswapfile

" Show current line and column
augroup cursorline
    au!
    au BufEnter,FocusGained,InsertLeave * setlocal cursorline
    au BufLeave,FocusLost,InsertEnter * setlocal nocursorline
    "au BufEnter,FocusGained,InsertLeave * setlocal cursorcolumn
    "au BufLeave,FocusLost,InsertEnter * setlocal nocursorcolumn
augroup END

" Use mouse
set mouse=a

" Line number
set nu rnu
augroup rnu
    au!
    au BufEnter,FocusGained,InsertLeave * setlocal rnu
    au BufLeave,FocusLost,InsertEnter * setlocal nornu
augroup END

" Highlight search
set nohlsearch
" Ignore case unless case-sensitive
set ignorecase
set smartcase
" Search while entering
set incsearch

" Autoindent
filetype indent on
set ai
set cindent
set ts=4
set sw=4
set softtabstop=4
set smarttab
" Convert tab to space
set et
set sm
augroup indentation
    au!
    au FileType html,tex set ts=2
    au FileType html,tex set shiftwidth=2
    au FileType html,tex set softtabstop=2
augroup END

set encoding=utf-8

" Tell vi that the terminal supports 256 color
set t_Co=256

"Smart way to move between windows
map <C-space> <Plug>IMAP_JumpForward
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" For Makefiles
autocmd FileType make setlocal noexpandtab

augroup spaces
    au!
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap = <space>=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap == <space>==<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap != <space>!=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap += <space>+=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap -= <space>-=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap *= <space>*=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap /= <space>/=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap &= <space>&=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap <= <space><=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap >= <space>>=<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap << <space><<<space>
    autocmd FileType perl,python,c,cpp,java,ocaml,cuda inoremap >> <space>>><space>
    autocmd FileType make inoremap = =
    autocmd FileType perl inoremap => <space>=><space>
    autocmd FileType perl inoremap =~ <space>=~<space>
    autocmd FileType python inoremap ** <space>**<space>
augroup END

" For LaTeX
augroup latex
    au!
    au FileType tex set spell
    au FileType tex setlocal spell spelllang=en_us
augroup END

" 80 column layout:
if exists('+colorcolumn')
    autocmd FileType perl,python,c,cpp,java,javascript,ocaml,cuda let &colorcolumn=join(range(121,999),",")
    autocmd FileType perl,python,c,cpp,java,javascript,ocaml,cuda highlight ColorColumn ctermbg=235
else
    autocmd FileType perl,python,c,cpp,java,javascript,ocaml,cuda highlight OverLength ctermbg=235 ctermfg=white
    autocmd FileType perl,python,c,cpp,java,javascript,ocaml,cuda match OverLength /\%121v.\+/
endif

" Learn Vimscript the hard way
nnoremap - ddp
nnoremap _ ddkP
inoremap <c-u> <esc>gUwi

" Check function prototype
se tags=/usr/include/tags

filetype plugin on
set ofu=syntaxcomplete#Complete
augroup complete
    au!
    au FileType html set omnifunc=htmlcomplete#CompleteTags
    au FileType java set omnifunc=javacomplete#Complete
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType javascript set omnifunc=javascriptcomplete#Complete
    au FileType c,cpp,perl,cuda set omnifunc=syntaxcomplete#Complete
augroup END

set foldmethod=indent
set nofoldenable

let g:pydiction_location='~/.vim/ftplugin/complete-dict'

let mapleader=","

" Undo history
set undofile
set undodir=/home/luke/.vimundo/

" Save and make
inoremap <F4> <Esc>:w<CR>:make<CR>
nnoremap <F4> :w<CR>:make %<CR>

" Save and execute python script:
inoremap <F6> <Esc>:w<CR>:!time ./%<CR>
nnoremap <F6> :w<CR>:!time ./%<CR>

" toggle set paste
set pastetoggle=<F3>

" For NERDTree
"autocmd VimEnter * NERDTree
let NERDTreeChristmasTree=1
let NERDTreeShowHidden=1

" For TagList
let Tlist_Exit_OnlyWindow=1
"let Tlst_Auto_Open=1
let Tlist_Show_One_File=0
let Tlist_Display_Prototype=1
let Tlist_Use_Split_Window=1
com TT NERDTree | TlistToggle

" For rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
augroup rainbow
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

" For vim-LaTeX
let g:tex_flavor='latex'

" For vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" For vim-signify
let g:signify_vcs_list = ['git', 'svn']

" For auto-pairs
let g:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'"}
augroup autopairs
    au!
    au FileType c,cpp,perl let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'"}
    au FileType ocaml let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'", '(*':'*)'}
    au FileType cuda let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'", '<<<':'>>>'}
    au FileType tex let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'", '\[':'\]', '\(':'\)'}
    au FileType python let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'", '"""':'"""', "'''":"'''"}
    au FileType jinja.html let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "'":"'", '{{':'}}', '{%':'%}'}
augroup END

" For vim-indent-guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=4

" ConqueTerm options
let g:ConqueTerm_TERM='xterm'

" LaTeX-Suite options
"let g:Tex_HotKeyMappings='align*,proof,bmatrix'
let g:Imap_UsePlaceHolders=0
let g:Tex_PromptedEnvironments='enumerate,itemize,center,proof,align*,split,tabular,figure,bmatrix,pmatrix,vmatrix,array'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex $*'
let g:Tex_GotoError=0

" YouCompleteMe
set completeopt-=preview
let g:ycm_server_python_interpreter = '/usr/bin/python2'
