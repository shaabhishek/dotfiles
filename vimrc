"To disable a plugin, add it's bundle name to the following list
"let g:pathogen_disabled = []
 "adjust configuration for such hostile environment as Windows {{{
"if has("win32") || has("win32unix")
    "call add(g:pathogen_disabled, 'vim-powerline')
"else
    "call add(g:pathogen_disabled, 'vim-airline')
"endif
 "}}}
call pathogen#infect()
"call pathogen#runtime_prepend_subdirectories(expand('~/Dropbox/abhishek-common/dotfiles/vim/bundle'))
"call pathogen#runtime_prepend_subdirectories(expand(getcwd().'/vim/bundle'))
set nocompatible   " Disable vi-compatibility

"Colorscheme stuff
set background=dark
colorscheme solarized
if has('gui_running')
    colorscheme base16-solarized
    if has("win32") || has("win32unix")
        set guifont=Sauce_Code_Powerline:h10:cANSI
    else
        set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
    endif
set guifontwide=MS_Gothic:h9:cSHIFTJIS
else
    set t_Co=256
    let g:solarized_termcolors=256
endif
call togglebg#map("<F5>")       "press F5 to change background color

set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
filetype plugin on
syntax on

set showmode                    " always show what mode we're currently editing in
set showcmd                     "Show (partial) command in the status line
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set scrolloff=3                 " show context above/below cursorline
set visualbell           " don't beep
set noerrorbells         " don't beep
set mouse=a

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"LINES
"Handle wrapping of text along with max line width
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=tab:▸\ ,eol:¬
set linespace=1
set lines=50 columns=100
set relativenumber

"Map ; to colon :D
nnoremap ; :
nnoremap ' ;

"Remove all trailing whitespaces
nnoremap <leader><space> :%s/\s\+$//<cr>:let @/=''<CR>

"NAVIGATION
" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
inoremap jj <esc>
nnoremap <tab> %
vnoremap <tab> %

" Get off my lawn
" hahhahahaa
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"WORKSPACE
"WINDOWS
"Resize vsplit
nnoremap <C-v> :vertical resize +5<cr>
nnoremap 25 :vertical resize 40<cr>
nnoremap 50 <c-w>=
nnoremap 75 :vertical resize 120<cr>
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Create split below
nnoremap :sp :rightbelow sp<cr>

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"BUFFERS
"Fast exits
nnoremap qq :bd<cr>
"Open a Scratch buffer


"DIRECTORIES
" Swap files out of the project root
if has("win32") || has("win32unix")
    set directory=$HOME/Documents/swaps/
else
    set directory=~/swaps/
endif

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,ld :lcd %:p:h<CR>:pwd<CR>

nnoremap <leader>w :w!<cr>
" Fast saves
autocmd BufLeave,FocusLost * silent! wall
nnoremap qa :qa<cr>
nnoremap <c-t> :tabnew<cr>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


"PLUGIN SPECIFIC

"AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
"EASYMOTION
map <Space> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
" Remove search results
command! H let @/=""
highlight Search cterm=underline
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
"NERDCOMMENTER
"Press \\ to toggle commenting of line or selection
map \\ <plug>NERDCommenterToggle
"CTRLP
"Search all buffers
nnoremap <leader>b :CtrlPBuffer<CR>
"Search recently opened files in history
nnoremap <leader>h :CtrlPMRUFiles<CR>
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
"NERDTREE
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
"YOUCOMPLETEME
"YCM is slow if used with ctags autotriggering for large projects. Also, I
"love to use <Tab> for UltiSnips rather than YCM
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_auto_trigger = 1
"ULTISNIPS
"Ultisnips
let g:UltiSnipsEditSplit="vertical"         "If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"EMMET
"hh in insert mode activates triggers emmet. No issues with UltiSnips anymore
imap hh <C-y>,
"TAGBAR
nnoremap <silent> <F9> :TagbarToggle<CR>
"TERN
let g:tern_show_signature_in_pum=1


" Abbreviations
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell


" Laravel framework commons
nnoremap <leader>lr :e app/routes.php<cr>
nnoremap <leader>lca :e app/config/app.php<cr>81Gf(%O
nnoremap <leader>lcd :e app/config/database.php<cr>
nnoremap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nnoremap ,lf :call FacadeLookup()<cr>
set runtimepath+=~/.vim/angular-vim-snippets

let g:used_javascript_libs = 'angularjs'
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>

"Copy to system clipboard easily
nnoremap <leader>y "+y
xnoremap <leader>y "+y
"Paste from system clipboard easily
nnoremap <leader>v :put +<cr>
