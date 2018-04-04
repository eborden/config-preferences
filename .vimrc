execute pathogen#infect()
silent! helptags ALL

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Disable Ex mode
noremap Q <Nop>

let mapleader = "\<Space>"

syntax on
filetype on
filetype plugin indent on
set autoread
set hid
set lazyredraw

set showmatch
set mat=2
set mouse=a
set clipboard+=unnamedplus

" Encoding
set encoding=utf8
set ffs=unix,mac,dos

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Colors
set t_Co=256
set background=dark
colorscheme solarized

" Tabs
set tabstop=2                   "A tab is 2 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 2 spaces when tab is pressed
set shiftwidth=2                "An indent is 2 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs

set number relativenumber
set backspace=indent,eol,start
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+p i

" Intentation
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Diff
set diffopt+=vertical

" Explorer
let g:netrw_liststyle=3
map <leader>k :Explore<cr>

" Ctrl P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                            \ --ignore .git
                            \ --ignore .svn
                            \ --ignore .hg
                            \ --ignore dist
                            \ --ignore build
                            \ --ignore .hi
                            \ --ignore .ho
                            \ --ignore .o
                            \ --ignore .so
                            \ --ignore .dll
                            \ --ignore .db
                            \ --ignore .exe
                            \ -g ""'

" Status
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
let g:tmuxline_powerline_separators = 0
set laststatus=2
set cmdheight=1
set noshowmode

" Git Gutter
let g:gitgutter_sign_column_always = 1
highlight SignColumn ctermbg=0

" Git Commit Length
autocmd Filetype gitcommit setlocal spell textwidth=72

" Set K and <leader>K to search local hoogle
au BufReadPost *.hs nmap <leader>K :exe "!stack hoogle --no-setup ".expand("'<cword>'")<CR>
au BufReadPost *.hs vmap <leader>K y :exe "!stack hoogle --no-setup '".substitute(escape(@",'\'), '\n\+$', '', '')."'"<CR>
au BufReadPost *.hs nmap K :exe "!google-chrome http://localhost:8080?hoogle=".expand("'<cword>'")." && wmctrl -o 0,0"<CR>
au BufReadPost *.hs vmap K y :exe "!google-chrome http://localhost:8080?hoogle='".substitute(escape(@",'\'), '\n\+$', '', '')."' && wmctrl -o 0,0"<CR>

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntax Highlighting
" vcl syntax
au BufRead,BufNewFile *.vcl :set ft=vcl
au! Syntax vcl source ~/.vim/syntax/vim-syntax-vcl/vcl.vim
" Hamlet files
au BufReadPost *.ezt set syntax=html
" Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'haskell']
" Interpret LHS files as markdown by default
autocmd BufNewFile,BufReadPost *.lhs set filetype=markdown
" Haskell Vim
let g:haskell_enable_quantification = 1 "to enable highlighting of forall
let g:haskell_enable_recursivedo = 1 "to enable highlighting of mdo and rec
let g:haskell_enable_arrowsyntax = 1 "to enable highlighting of proc
let g:haskell_enable_pattern_synonyms = 1 "to enable highlighting of pattern
let g:haskell_enable_typeroles = 1 "to enable highlighting of type roles
