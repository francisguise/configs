" vimrc
" "
" " version: 1
" " author:  fguise
" "
filetype plugin on

syntax on
"colorscheme moose


"Basic Settings
set title        "sets the terminal window title
set ruler        "shows current cursor position on lower right corner
set number       "show line numbers
set list         "lets list to show the tab and whitspace chars
set nowrap       "disables text wrapping
set ai           "enables auto indent
set incsearch    "searches for text as typed
set showmode     "displays the mode VI is in
set showmatch    "jumps briefly to brace/parenthese/brackets match of current block when closing brace typed
set showcmd      "shows aritalliy the command in the bottom right of screen
set ignorecase   "ignores case sensitivity when searching
set smartcase    "overrides 'ignorecase' when searching with capitals
set wildmenu     "this enables code completion
set ttyfast      "says we have a fast terminal, means more characters are passed back and forth"
set hlsearch     "enable search highlighting
set nocompatible "enable compatiblity


"Assigns
set shellcmdflag+=i                              "Append flags passed to shell when doing !cmd
set laststatus=2                                 "shows indenting and line numers by defualt
set listchars=tab:>\ ,trail:.                    "show tabs as > and trailing whitespace as .
" set shiftwidth=4                                 "number of spaces to use for each step of (auto)indent
set t_Co=256                                     "sets the number of colours to 256
set mouse=a                                      "defaults mouse on"
set completeopt=menuone,longest                  "for code completion always show menu and use longest match prevents first option being selected without showing menu!
set scrolloff=0                                  "sets scrolling happening x lines before beinging or end or file
set backspace=indent,eol,start                   "allow backspacing over everything in insert mode


"Key mappings
let g:SuperTabMappingForward   = '<nul>'   "shift-tab goes forward through autocompletion (backwards in my mind)
let g:SuperTabMappingBackward  = '<s-nul>' "tab goes backwards through autocompletion (forwards in my mind)
let g:omni_sql_no_default_maps = 1         "prevents default mapping in sql files

nnoremap <F2> :call ToggleMouse()<CR>

imap <NUL> <Space>

map <C-h> :set hlsearch!<CR>
map <C-Z> <Nop>
map <F3> :vsplit <CR>


 "Functions
function! ToggleMouse()
   if &mouse == 'a'
       set mouse=
       set nolist nonumber
       echo "Mouse usage disabled"
   else
       set mouse=a
       set list number
       echo "Mouse usage enabled"
   endif
endfunction

"New Syntax files
au BufRead,BufNewFile *.log set filetype=log
"au BufRead,BufNewFile *.html set filetype=html

au! Syntax log source ~/.vim/syntax/log.vim
"au! Syntax html source ~/.vim/syntax/html.vim
"set to non-vi mode
set smartindent
set paste
"set nocompatible
set tabstop=4
"set shiftwidth=4
"turnes \t into \n set expandtab
"set ts=4

" pathogen
" call pathogen#infect()
execute pathogen#infect()

" nerdtree
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" vsp! .
"

" ctag file
:set tags=/space/work/B_LBR_Skyfall_ITG94841/tags

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

command Rw :%s=\s\+$==
command Increment :let i=1 | .,$g/$/s/$/\=i/g | let i=i+1
