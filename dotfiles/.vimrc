"" General settings
""
set nocompatible " This must be first, because it changes other options as a side effect.
set title          " Changes the iterm title
set autoread       " Re-read file if it was changed from the outside
set showcmd " show latest command
set shell=/bin/zsh
set ttyfast " smoother scrolling
set visualbell " Flash the screen instead of beeping on errors.
set t_vb= " Disable flashing
set history=1000 " Increase the undo limit.
set undolevels=1000  " use many muchos levels of undo
set wildmenu        " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position when opening files

"" Syntax & Indentation 
""
syntax enable 
filetype plugin indent on
set autoindent    " New lines inherit the indentation of previous lines.
set smartindent   " Number of spaces to use for each step of (auto)indent.
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set showmatch      " When closing a bracket (like {}), show the enclosing bracket for a brief second

"" Tabs beaviour
""
set expandtab " Convert tabs to spaces.
set shiftwidth=4  " Number of spaces for each indent
set tabstop=4  " Number of spaces for each tab
set softtabstop=4
set smarttab " Insert “tabstop” number of spaces when the “tab” key is pressed.

"" Visibillity
""
set linebreak      " Avoid wrapping a line in the middle of a word.
set list  " show invisible chars #1
set listchars=tab:>.,trail:.,extends:#,nbsp:. " show invisible chars #2

""search
""
set hlsearch       " highlight reg. ex. in @/ register
set ignorecase     " Search case insensitive...
set smartcase      " ignore case if search pattern is all lowercase, case-sensitive otherwise

"" Code folding
""
set foldenable   " Folding #1
set foldlevelstart=20
set foldmethod=indent " Folding #3
set foldnestmax=10 " Folding #4
"""" ramp fold keys

"" Plugins
""
""
" Install Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')   "" need to check each and every one
   Plug 'w0rp/ale'
   Plug 'itchyny/lightline.vim'
   Plug 'scrooloose/nerdtree'
   Plug 'sheerun/vim-polyglot'
   Plug 'tomtom/tcomment_vim'
   Plug 'airblade/vim-gitgutter'
   Plug 'nathanaelkane/vim-indent-guides'
   Plug 'ConradIrwin/vim-bracketed-paste'
   Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --bin' }
   Plug 'junegunn/fzf.vim'
call plug#end()

"" Plugin Configurations
""

" FZF config
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_action = { 'enter': 'tabedit'}

" ALE config
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "∙∙"
let g:ale_enabled = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" NERDTree Config
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
let NERDTreeMapActivateNode='<right>'
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close window in only tree remains

" Indent Guides config
let g:indent_guides_guide_size = 1

" Gutgutter config
let g:gitgutter_enabled = 0 " start disabled

"" Status Line
""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

let s:hidden_statusline = 0
function! ToggleStatusline()
    if s:hidden_statusline  == 1
        set laststatus=1
        let s:hidden_statusline = 0
    else
        Set laststatus=2
        let s:hidden_statusline = 1
    endif
endfunction

" Line number function
"
let s:show_line_numbers = 1
function! ToggleLineNumber()
    if s:show_line_numbers  == 1
        set number
        let s:show_line_numbers = 0
    else
        set nonumber
        let s:show_line_numbers = 1
    endif
endfunction

" Cursor liner function
"
let s:show_cursor_line = 1
function! ToggleCursorLine()
    if s:show_cursor_line  == 1
        set cursorline
        let s:show_cursor_line = 0
    else
        set nocursorline
        let s:show_cursor_line = 1
    endif
endfunction







" Key Mapping
"
let mapleader = ',' " Leader Key
"
nnoremap <leader>k :Keymap " show keymaps (leader + k)
nnoremap <leader><ESC> :nohlsearch<CR> " exit search highlight (leader + esc)
map <leader>t  :tabe<CR> " Open new tab  (leader + t)
nnoremap <leader>rt :retab<cr> " Convert all tabs to spaces (leader + tt)
vnoremap <leader>64 y:let @"=system('base64 --decode', @")<cr>gvP " base64 decode (leader + 64)
nnoremap <leader>s :call ToggleStatusline()<CR> " statusline toggle (leader + s)
nnoremap <leader>n :call ToggleLineNumber()<CR> " Line number toggle (leader + n)
nnoremap <leader>l :call ToggleCursorLine()<CR> " Cursor line  toggle (leader + l)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR> " Open/Close folding (space)

" Plugin - toggles
" 
map <leader>u :PlugInstall<CR> " Update vundle plugins (leader + u)
map <leader>d :ALEToggle<CR> " Check code (ALE) (leader + d)
nmap <leader>j :NERDTreeToggle<CR> " Open folder tree (NERDTree) (leader + j)
nmap <leader>o :NERDTreeFind<CR> " Open folder tree in current dir (NERDTree) (leader + o)
map <S-Right> :tabn<CR> " Move between tabs (NERDTree) (Shift + ->)
map <S-Left>  :tabp<CR> " Move between tabs (NERDTree) (Shft + <-)
noremap <Leader>cc :TComment<CR> " Comment out lines (tcomment) (leader + cc)
map <leader>i :IndentGuidesToggle<CR> " Show indentation lines (IndentGuides) (leader + i)
map <leader>g :GitGutterToggle<CR> " Toggle gitgutter (leader + g)
nnoremap <Leader>f :Files<CR> " CtrlP like
nnoremap <Leader>b :Buffers<CR> " CtrlP like

" Commands
"
" Sudo save (:W)
command W execute "w !sudo tee % >/dev/null" 
" Show kwymap
command Keymap execute "!bat  ~/.vimrc -r 160:"
