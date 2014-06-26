" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
" adjust configuration for such hostile environment as Windows {{{
if has("win32") || has("win32unix")
	call add(g:pathogen_disabled, 'vim-powerline')
	let g:airline_powerline_fonts=1
else
	call add(g:pathogen_disabled, 'vim-airline')
	let g:Powerline_symbols = 'fancy'
endif
" }}}
call pathogen#infect()
"call pathogen#runtime_prepend_subdirectories(expand('~/Dropbox/abhishek-common/dotfiles/vim/bundle'))
"call pathogen#runtime_prepend_subdirectories(expand(getcwd().'/vim/bundle'))
syntax on
set nocompatible   " Disable vi-compatibility
set t_Co=256
"Colorscheme 1
"colorscheme xoria256

"Colorscheme 2
let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized

set guifont=Sauce_Code_Powerline:h9
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=1
"set lines=50 columns=100

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
 
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
 
"Map yy to colon :D
map yy :

" Fast saves
nmap ww :w!<cr>

"Fast exits
nmap qq :q<cr>


" Down is really the next line
nnoremap j gj
nnoremap k gk
 
"Easy escaping to normal model
imap jj <esc>

"hh in insert mode activates triggers emmet. No issues with UltiSnips anymore
imap hh <C-y>, 

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
 
"Ultisnips
"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsSnippetDirectories  = ["snips"]

"Get UltiSnips to play nicely with YouCompleteMe
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <buffer> <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"


"easier window navigation
 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
 
"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>
 
nmap <C-b> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd l
autocmd BufNew   * wincmd l

 
"Show (partial) command in the status line
set showcmd
 
" Create split below
nmap :sp :rightbelow sp<cr>
 
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
 
highlight Search cterm=underline
 
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
 
 
" Easy motion stuff
" let g:EasyMotion_leader_key = '<Space>'
map <Space> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
 
" Remove search results
command! H let @/=""
 
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" Abbreviations
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration
 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
 
" Edit todo list for project
nmap ,todo :e todo.txt<cr>
 
" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>
 
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
nmap ,lf :call FacadeLookup()<cr>
 

" CtrlP Stuff
 
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>
 
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
 
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
 
" Create/edit file in the current directory
nmap :ed :edit %:p:h/
 

filetype plugin on

set runtimepath+=~/.vim/angular-vim-snippets

"autocmd FileType php set ft=php.laravel
let g:used_javascript_libs = 'angularjs'

set directory=.,$TEMP
