"""""""""""""""""""""""""""""""""""""""""""""""
"  __   __ __   __    __   ______   ______    "
" /\ \ / //\ \ /\  -./  \ /\  == \ /\  ___\   "
" \ \ \'/ \ \ \\ \ \-./\ \\ \  __< \ \ \____  "
"  \ \__|  \ \_\\ \_\ \ \_\\ \_\ \_\\ \_____\ "
"   \/_/    \/_/ \/_/  \/_/ \/_/ /_/ \/_____/ "
"                                             "
"             Benjamin Cabanes                "
"               @bencabanes                   "
"                                             "
"""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                " be iMproved, required
filetype off                    " required
scriptencoding utf-8            " Character encoding
set encoding=utf8
set mouse=                      " Disabling mouse support
set modelines=0
set backspace=indent,eol,start  " Backspace for dummies?
set autoread                    " Autoread a file when it's changed from outside

set complete+=kspell

set history=1000                " Remember ALL THE commands!
set undolevels=1000             " Do ALL THE undo's!
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload

set ttyfast                     " Smoother terminal connection
set nospell                     " Disable spell checking basically
set hidden                      " Change buffer without saving
set magic                       " Better searching

set noswapfile                  " Don't pollute my hard drive, even temporary
set lazyredraw
set whichwrap=b,s

set cryptmethod=blowfish        " Use strong blowfish algorithm when encrypting files

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " Let Vundle manage Vundle, required
Plugin 'scrooloose/syntastic'
Plugin 'mhumeSF/one-dark.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on       " required

set guioptions=TlrLR
set t_Co=256
set shell=zsh

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"set background=dark
colorscheme onedark
syntax on

set list
set listchars-=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail
set relativenumber

set scrolljump=5
set scrolloff=3

set wildmenu                                      " Enable wild menu
set wildmode=list:longest,full
set wildignore+=.git,.svn                         " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.zip                             " zip

set showmatch                                     " Show matching brackets (Damn this is so cool!)
set matchtime=3

set incsearch
set hlsearch
set ignorecase                                    " Case insensitive search
set smartcase                                     " Case sensitive when uc present

set showcmd
set showmode                                      " Show current mode on commandline
set cmdheight=2                                   " The commandline height
set shortmess+=filmnrxoOtT                        " Short messaging in commandline
set laststatus=2                                  " Windows always will have a status line

set cursorline                                    " Highlight cursorline!
set ruler                                         " Always show current position

highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

set virtualedit=onemore                           " Allow for cursor beyond last character

set foldlevelstart=0
set foldenable

set wrap
set autoindent
set smartindent

set shiftround
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set smarttab

set tw=500                                        " Set text width
set formatoptions=qrn1

set splitbelow                                    " Split current window below
set splitright                                    " Split current window right
set title

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = []
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1

" Airline
let g:airline#extensions#tabline#enabled = 1

" Ctrl p
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {'dir': 'dist'}

" Open up .vimrc quickly in a new buffer
nnoremap  <leader>ev :vsp $MYVIMRC<cr>
" Source .vimrc explitly
nnoremap  <leader>sv :source $MYVIMRC<cr>
" Ex-mode is shitty
nnoremap  Q <nop>
" Fast saving
nnoremap <leader>w :w!<cr>
" e2e matching
nnoremap <tab> %
vnoremap <tab> %
" Folding
nnoremap <Space> za
vnoremap <Space> za
" Remove trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" easy expansion
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'
" Disabling arrow keys in normal and insert mode
nnoremap  <up> <nop>
nnoremap  <down> <nop>
nnoremap  <left> <nop>
nnoremap  <right> <nop>
inoremap  <up> <nop>
inoremap  <down> <nop>
inoremap  <left> <nop>
inoremap  <right> <nop>
" insert equals sign for faster assignments
inoremap <c-l> <space>=<space>

nnoremap j gj
nnoremap k gk
" nnoremap ; :
" nnoremap : ;

" faster movement
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Disabling escape key. It's too far away!
inoremap  <esc> <nop>
" `jk` is much better :)
inoremap  jk <esc>
" Search for non breaking spaces (ascii 160)
nnoremap <leader>hw :/\%xa0<cr>

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Use just CTRL instead of CTRL-W to switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader><space> :Goyo<cr>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.2)<cr>

cnoreabbrev q qall!
cnoreabbrev Q qall!
cnoreabbrev qalL qall!
cnoreabbrev Qall qall!

inoreabbrev zipyy zippy

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
 
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
 
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
 
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif
 
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

augroup spell_check
  au!
  au BufRead,BufNewFile *.md setlocal spell
  au FileType gitcommit setlocal spell
augroup END

augroup autoload_vimrc
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

augroup highlight_nbsp
  au!
  au BufEnter * highlight NonBreakingSpace guibg=red
  au BufEnter * :match NonBreakingSpace /\%xa0/
augroup END

augroup file_type
  au!
  au BufRead,BufNewFile *.es6 setfiletype javascript
augroup END
