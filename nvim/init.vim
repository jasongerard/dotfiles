
"- Syntax highlighting is enabled by default
"- :filetype plugin indent on" is enabled by default

"- 'autoindent' is set by default
"- 'autoread' is set by default
"- 'backspace' defaults to \"indent,eol,start"
"- 'backupdir' defaults to .,~/.local/share/nvim/backup (|xdg|)
"- 'belloff' defaults to \"all"
"- 'complete' doesn't include \"i"
"- 'directory' defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created <- no it's not
"- 'display' defaults to \"lastline"
"- 'formatoptions' defaults to \"tcqj"
"- 'history' defaults to 10000 (the maximum)
"- 'hlsearch' is set by default
"- 'incsearch' is set by default
"- 'langnoremap' is enabled by default
"- 'langremap' is disabled by default
"- 'laststatus' defaults to 2 (statusline is always shown)
"- 'listchars' defaults to \"tab:> ,trail:-,nbsp:+"
"- 'nocompatible' is always set
"- 'nrformats' defaults to \"bin,hex"
"- 'ruler' is set by default
"- 'sessionoptions' doesn't include \"options"
"- 'showcmd' is set by default
"- 'smarttab' is set by default
"- 'tabpagemax' defaults to 50
"- 'tags' defaults to \"./tags;,tags"
"- 'ttyfast' is always set
"- 'undodir' defaults to ~/.local/share/nvim/undo (|xdg|), auto-created "<- no
"it's not
"- 'viminfo' includes \"!"
"- 'wildmenu' is set by default

" make SPACE the leader key
let mapleader="\<SPACE>"

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'derekwyatt/vim-scala'
Plug 'w0rp/ale'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'craigemery/vim-autotag'
" Plug 'neomake/neomake' 
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'danilo-augusto/vim-afterglow'
Plug 'benmills/vimux'
call plug#end()


" enable deoplete
call deoplete#enable()
" enable neomake on write and normal mode changes after 750ms
" call neomake#configure#automake('rw', 500)
set termguicolors
colorscheme afterglow
let g:airline_theme = 'afterglow'


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ vendor/\ --ignore\ node_modules/

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
" bind F to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

nnoremap \ :Ag<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" " CtrlP
" " Use this function to prevent CtrlP opening files inside non-writeable 
" " buffers, e.g. NERDTree

function! SwitchToWriteableBufferAndExec(command)
    let c = 0
    let wincount = winnr('$')
    " Don't open it here if current buffer is not writable (e.g. NERDTree)
    while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        exec 'wincmd w'
        let c = c + 1
    endwhile
    exec a:command
endfunction

" Disable default mapping since we are overriding it with our command
let g:ctrlp_map = ''
nnoremap <C-p> :call SwitchToWriteableBufferAndExec(':FZF .')<CR>


" don't wrap (insert New Line) until 500 chars in length
set textwidth=500
set encoding=utf8
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
set hidden
set clipboard=unnamedplus
set mouse=a
set cursorline
set relativenumber number
set wildignore+=*/tmp/*,*.so,*.sw*,*.zip

" ignore files in .gitignore for CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" let NERDTreeIgnore =['\.sw*$']
" nav to current file
nmap <Leader>n :NERDTreeFind<CR>

" don't require JSX extension for JSX parsing
let g:jsx_ext_required = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = 'it'
let g:airline_powerline_fonts = 1

" Run NeoMake on read and write operations
" au BufReadPost * Neomake
" au BufWritePost * Neomake

" Run each enabled maker one after the other.
" let g:neomake_serialize = 1

" Abort after the first error status is encountered
" let g:neomake_serialize_abort_on_error = 1

" Preseve cursor position when quickfix window is open
" let g:neomake_open_list = 2

" The height of quickfix list opened by Neomake
" let g:neomake_list_height = 10

" Shows warning and error counts in vim-airline
" let g:airline#extensions#neomake#enabled = 1

" let g:neomake_javascript_enabled_makers = ['eslint']

" let g:neomake_verbose = 3
" let g:neomake_logfile = '/tmp/neomake.log'




" new 'tab'
nmap <Leader>t :enew<cr>

" next buffer
nmap <C-Right> :bnext<CR>
nmap <Leader>l :bnext<CR>
nmap <Leader>k :bnext<CR>

" previous buffer
nmap <C-Left> :bprevious<CR>
nmap <Leader>h :bprevious<CR>
nmap <Leader>j :bprevious<CR>

" close current buffer
nmap <Leader>q :bp <BAR> bd #<CR>

" list buffers
nmap <Leader>bl :ls<CR>

nmap <Leader>c :windo lcl\|ccl<CR>

noremap <Leader>/ :Commentary<cr>
" Window Movement
" Normal mode:
noremap <A-Left> <C-w>h
noremap <A-Down> <C-w>j
noremap <A-Up> <C-w>k
noremap <A-Right> <C-w>l
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap <A-o> <C-w>o
" Terminal mode:
tnoremap <A-Left> <c-\><c-n><c-w>h
tnoremap <A-Down> <c-\><c-n><c-w>j
tnoremap <A-Up> <c-\><c-n><c-w>k
tnoremap <A-Right> <c-\><c-n><c-w>l
tnoremap <A-h> <c-\><c-n><c-w>h
tnoremap <A-j> <c-\><c-n><c-w>j
tnoremap <A-k> <c-\><c-n><c-w>k
tnoremap <A-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <A-Left> <Esc><c-w>h
inoremap <A-Down> <Esc><c-w>j
inoremap <A-Up> <Esc><c-w>k
inoremap <A-Right> <Esc><c-w>l
inoremap <A-h> <Esc><c-w>h
inoremap <A-j> <Esc><c-w>j
inoremap <A-k> <Esc><c-w>k
inoremap <A-l> <Esc><c-w>l
" Visual mode:
vnoremap <A-Left> <Esc><c-w>h
vnoremap <A-Down> <Esc><c-w>j
vnoremap <A-Up> <Esc><c-w>k
vnoremap <A-Right> <Esc><c-w>l
vnoremap <A-h> <Esc><c-w>h
vnoremap <A-j> <Esc><c-w>j
vnoremap <A-k> <Esc><c-w>k
vnoremap <A-l> <Esc><c-w>l
" use Ctrl-x to leave terminal mode
tnoremap <C-x> <C-\><C-n>
" Send esc in terminal mode to program
tnoremap <C-v><Esc> <Esc>

" remove search highlighting until next search
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

noremap <M-p> :echo expand('%:p:h')

" open NERDTree
" map <C-n> :NERDTreeToggle<CR>
" refresh NERDTree
" nmap <Leader>r :NERDTreeFocus<CR>R<C-w><C-p>

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType java setlocal omnifunc=javacomplete#Complete

hi CursorLine cterm=underline gui=underline guibg=black

" :set termguicolors
"let g:netrw_altv=1
"ctrl p for fuzzy finder"
nnoremap <C-p> :FZF .<CR>
"remap jj to Escape in insert mode"
inoremap jj <Esc>
