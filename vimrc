
" .vimrc
" @zimu li

" Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
execute pathogen#infect()

" let Vundle manage Vundle, required
Bundle "altercation/vim-colors-solarized"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'klen/python-mode'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'rdnetto/YCM-Generator'

Plugin 'airblade/vim-gitgutter'  "show differences in files
Plugin 'amiel/vim-tmux-navigator'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dkprice/vim-easygrep'  "search through multiple files
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'  "html completion
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'  "Github tool
Plugin 'tpope/vim-surround'

Plugin 'SirVer/ultisnips'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Vim Session Manager
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Codekit 2 support for Vim
Plugin 'noahfrederick/vim-codekit'

" vim-css-color, display css color directly in vim, it's cool
Plugin 'ap/vim-css-color'

" vim better javascript completion
Plugin 'ternjs/tern_for_vim'

" vim-autoformat
Plugin 'Chiel92/vim-autoformat'

" vim-textobject plugin, treat all ' " ( { using just letter q
Bundle 'kana/vim-textobj-user'
Bundle 'beloglazov/vim-textobj-quotes'

" vim-php syntext
Plugin 'StanAngeloff/php.vim'

" vim-php correct indent
Plugin '2072/PHP-Indenting-for-VIm'
" vim-php with html better indent
Bundle 'captbaritone/better-indent-support-for-php-with-html'

" vim-vue.js syntax highlight
Plugin 'darthmall/vim-vue'

" vim php
Plugin 'jwalton512/vim-blade'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Plugin 'shawncplus/phpcomplete.vim'

" php auto namespacing
Bundle 'arnaud-lb/vim-php-namespace'

" vim startify
Plugin 'mhinz/vim-startify'

" vim php autocompletion server
" Plugin 'mkusher/padawan.vim'

let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required

" }}}l

" vimrc settings {{{
"
" .vimrc folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" Fold with space
nnoremap <space> za

" }}}

" Basics {{{

" Gratuitous theft from
" https://bitbucket.org/sjl/dotfiles

set mouse=a

set t_Co=256
" Who knows what the fuck 5 is supposed to mean?
set modelines=5

" Mode indications
set showmode
set showcmd

" Retain buffers until quit
set hidden

" No bells!
set visualbell

" Fast scrolling
set ttyfast

" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" Better dividers
set isk+=_,$,@,%,#,-

" Space it out a little more (easier to read)
set lsp=0

" Line numbers are nice
set ruler

" Backspace for normal people
set backspace=indent,eol,start

" Always show status
set laststatus=2

" Show whitespace
set list

" Pretty self-explanatory
set lazyredraw

" Brace face
set showmatch
set matchtime=3

" Split down and right
set splitbelow
set splitright

" Good indentation
" set shiftround

" Read filetype stuff
filetype plugin on
filetype indent on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set autoindent
set smartindent
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

" Search shows all results
set hlsearch
set incsearch
set ignorecase
set smartcase

" Showing Length
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80

" easier formatting of paragraphs
" vmap Q gq
" nmap Q gqap

" Line numbering
set relativenumber
set number

" highlight LineNr guibg=grey

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline

" }}}

" Filetypes {{{

" Remove trailing whitespace in files
autocmd BufWritePre * :%s/\s\+$//e

augroup trailing
    au!
    au InsertEnter * :set listchars-=tab:\ \ ,trail:.
    au InsertLeave * :set listchars+=tab:\ \ ,trail:.
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

augroup handlebars
    au!
    au BufNewFile,BufRead *.hbs,*.hbs.ember setlocal filetype=mustache
augroup END

augroup ft_go
    au!

    au Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    au Filetype go setlocal nolist
augroup END

autocmd FileType python nnoremap <silent> <leader>r :!clear;python %<CR>
autocmd FileType php nnoremap <silent> <leader>r :!clear;php %<CR>

" }}}

" Colors {{{
syntax enable
set background=dark
" colorscheme solarized
colorscheme material-theme

highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%81v', 100)

highlight LineNr guibg=bg

" }}}

" Plugins {{{

"" Ignore rules

set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*                   " Meh

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_max=500
let g:ctrlp_custom_ignore = 'tep$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor'
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -i -l --nocolor --nogroup -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" Easymotion
map \\ <Plug>(easymotion-prefix)

" Set MacVim attributes
" set guifont=Menlo\ for\ Powerline:h16
set guifont=SauceCodePro\ Nerd\ Font:h17
set linespace=3
set guioptions-=r
set guioptions-=L

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'
let g:airline_enable_syntastic = 1
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1

" Airline configuration

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" Comepletion
let g:neocomplcache_enable_at_startup = 0

let g:ycm_python_binary_path = '/usr/local/bin/python2.7'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <Leader>f :YcmDiags<CR>


" PyMode
let g:pymode_rope=0

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" EasyGrep Setting
let g:EasyGrepFilesToExclude=".svn,.git,.cogui,.comarker,.comemgui,.coproj,.map,.logi,.bin,.elf,.hex"
let g:EasyGrepRecursive = 1
let g:EasyGrepCommand = 1
let g:EasyGrepOpenWindowOnMatch = 1
let g:EasyGrepJumpToMatch = 0

" Tern for Vim Setting
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Syntastic setting
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "v-', "@", "is not recognized!", "discarding unexpected", "letter not allowed here"]
" let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-']

" PHPComplete
let g:phpcomplete_index_composer_command='composer'

" CtrlP setting
nnoremap \t :CtrlPBufTag<cr>

" NerdTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
" Automatically closing vim when Nerd-Tree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGlyphReadOnly = ''

"php autocompletion serverpadawan
" let g:padawan#composer_command = "composer"
" let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

" let g:ycm_semantic_triggers = {}
" let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\']
" }}}

" Key commands {{{

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

let mapleader = ","
let g:mapleader = ","

" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>- <C-w>s<C-w>k

" Open NERDTree "
nnoremap <leader>k :NERDTreeToggle<cr>

" j-k smash
inoremap jk <esc>
inoremap JK <esc>
"inoremap kj <esc>"
"

" Save, yo
" nnoremap <cr> :w<cr>
inoremap <c-z> <esc>:w<cr>
nnoremap <c-z> :w<cr>
vnoremap <c-z> <esc>:w<cr>

" Better command keys
nnoremap ; :
vnoremap ; :

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" Buffer commands
"nmap <c-m> :bprevious<CR>
"nmap <c-n> :bnext<CR>
"nmap bb :bw<CR>
"

" Turn off nohlsearch
nmap <silent> <leader><Space> :nohlsearch<CR>

" Switch between files with ,,
nnoremap <leader><leader> <c-^>

" Ruby hashrocket madness
"nnoremap <leader>r :%s/:\(\w*\)\s*=>\s*/\1: /gc<cr>

" easier moving between tabs
map <Leader>n <esc>:bprevious<CR>
map <Leader>t <esc>:enew<CR>
map <Leader>m <esc>:bnext<CR>
map <Leader>q <esc>:bp <BAR> bd #<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" close the preview window
nnoremap <Leader>p :pclose<CR>

" map sort function to a key
" vnoremap <Leader>s :sort<CR>

"easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

"ListToggle for YouCompleteMe
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>f'
let g:lt_height = 4

"Faster shortcut for commenting. map for Plugin T-Comment
map <leader>c <c-_><c-_>

" Paste the path of current file
nnoremap <Leader>% "%p

" Session management key binding
nnoremap <leader>so :OpenSession<space>
nnoremap <leader>ss :SaveSession<space>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

" Change file format
" :e ++ff=dos   or  :e ++ff=unix

" Easygrep key mapping
nnoremap \s :Grep<space>
nnoremap \r :Replace<space>

" Folding Code Block
nnoremap <leader>z zfat

" Auto formating
noremap <leader>j :Autoformat<cr>
vnoremap <leader>j :Autoformat<cr>

inoremap <c-l> <right>
inoremap <c-h> <left>
noremap <leader>o o<esc><s-o><esc>o
noremap <leader>O <s-o><esc>o<esc><s-o>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>a :ZoomToggle<CR>

" php auto namespacing key binding
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap \a :call PhpInsertUse()<CR>

" change the working directory to path of current file
nnoremap \c :cd %:p:h<cr>

vnoremap <tab> >gv
vnoremap <s-tab> <gv
" }}}

