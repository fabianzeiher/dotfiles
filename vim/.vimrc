" Disablt compatibility with vi which can cause unexpected issues.
set nocompatible

" Reduce timeout between insert and normal mode on ESC
set ttimeoutlen=50

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on
syntax on

" Add numbers to each line on the left-hand side.
set relativenumber number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 2 spaces.
set shiftwidth=2

" Set tab width to 2 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=999

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" PLUGINS ----------------------------------------------------------------

" Plugin code goes here.
call plug#begin('~/.vim/plugged')

" not really using that much
Plug 'tpope/vim-surround'
" Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" styling for the information bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" highlights trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" use all the time for commenting code
Plug 'tpope/vim-commentary'
" allows plugins to tap into the power of the . in vim
Plug 'tpope/vim-repeat'
" allows the use of :Git to run git commands from vim
Plug 'tpope/vim-fugitive'
" highlights yank, nice
Plug 'machakann/vim-highlightedyank'
" allows to jump to a specific line in a different file
" Plug 'kopischke/vim-fetch'
" autoclosing for bracket and others
Plug 'townk/vim-autoclose'
" easymotion, easy
Plug 'easymotion/vim-easymotion'
" working with variants of a word, like plurslism and casing
Plug 'tpope/vim-abolish'
" visualizes the undotree history, currently leader+u
Plug 'mbbill/undotree'
" nerdtree is a file system explorer for vim
Plug 'preservim/nerdtree'
" vim-tmux-navigator allows for seamless navigation between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" MAPPINGS ---------------------------------------------------------------

let mapleader = "\<space>"
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <Esc> :nohlsearch<CR>


" VIMSCRIPT --------------------------------------------------------------

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" Enable the gruvbox colorscheme with nice colors
if (has("termguicolors"))
    set termguicolors
endif

" Setting dark mode
set background=dark
" let g:gruvbox_contrast_dark = 'medium'
" ensure colortheme in vscode
autocmd vimenter * ++nested colorscheme catppuccin_mocha
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" Enable gruvbox as the theme for airline
" let g:airline_theme='gruvbox'


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
