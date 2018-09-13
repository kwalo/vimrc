" vim: filetype=vim
" --> [generals]
"
" this must be first, because it changes other options as a side effect
set nocompatible

" keep x lines of command line history
set history=150

" Better look in console
set t_Co=256

" Launch pathogen
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

set path+=**

" enable filetype plugins
filetype plugin indent on

" Disable GUI toolbar
set guioptions-=T

" set to auto read when a file is changed from the outside
set autoread

" autowrite buffer before executing most commands
set autowrite


" set mapleader
let mapleader = ";"
let g:mapleader = ";"

" fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>f :find<cr>

" Switch to prevoius buffer
nmap B :b#<cr>

" Cut/Copy/Paste from clipboard
map <leader>d "+d
map <leader>y "+y
map <leader>p "+gP

" Resize window vertically
map <C-W>, <C-W><
map <C-W>. <C-W>>

" Split and vsplit
map <leader>s :split<CR>
map <leader>v :vsplit<CR>

" Insert line break after cursor
nmap <leader>b a<CR><ESC>

" Select whole buffer
map <leader>G ggVG
" set rational tabs & co.
set expandtab
set softtabstop=4
set shiftwidth=4

" Disable text wraping
set textwidth=0
set nowrap

" --> [visuals]
"
" show the cursor position all the time
set ruler

" highlight syntax
syntax on

" show line nuber
set nonumber

" laeve some space when moving vertical
set scrolloff=3

" don't show statusline
set laststatus=0
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=\ %F%m%r%h\ %w\ \ cwd:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c

colorscheme comments

" highlight lines that expand above column 78 (my max width on vsplit)
highlight ColorColumn ctermfg=208 ctermbg=Black
call matchadd('ColorColumn', '\%78v\s*\zs\S', 100)

" --> [others]
"
" display incomplete commands
set showcmd

" do incremental searching
set incsearch
set noignorecase
set hlsearch

" don't use Ex mode, use Q for formatting
map Q gq

" Completion popup menu
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 

" no sound on errors
set noerrorbells
set novisualbell
set t_vb=

" set some magic
set magic

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set nice 'list' symbols (to actualy see them use :list)
set listchars=tab:>.,trail:.,eol:<

" set nice completion menu
set wildmenu
set wildmode=longest,full
set completeopt=longest,menu

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Change color of omnicomplete menu
highlight Pmenu guibg=Grey40

" turn on NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" quick make
map <leader>m :make<CR>

" quick :noh
map <leader>h :noh<CR>

" see list of buffers
map <leader>l :ls<CR>:

" ctags shortcut
map <leader>c :!ctags -R<CR>

" Bind S to search and replace last search
nnoremap S :%s///g<Left><Left>
vnoremap S  :s///g<Left><Left>

" Use space to jump down a page (like browsers do)...
nnoremap   <Space> <PageDown>
xnoremap   <Space> <PageDown>

" --> [autocommands]
"
" for all text files set 'textwidth' to 78 characters.


" when editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ 	exe "normal g`\"" |
\ endif


" --> [functions]
"

" Delete the current buffer, issuing bnext in all windows
" where displayed before that
function! DeleteBuffer2()
  let bid = bufnr("%")
  let wid = winnr()
  windo if bid == bufnr("%") | bprev | endif
  exe "bdel " . bid
  exe "normal " . wid . "^W^W"
endfunction

" count the number of buffers
function! BufferCount()
  " save cur buf number
  let cbuf = bufnr("%")
  let bnum = 0
  bufdo let bnum = bnum + 1
  " return to the buf
  exe "b " . cbuf
  return bnum
endfunction

function! DeleteBuffer()
  if BufferCount() > 1
    call DeleteBuffer2()
  else
    exe "bdel"
  endif
endfunction

" Kill the buffer quickly
map <leader>k :bd<CR>

" Tabularize shortcuts
map <Leader>a= :Tabularize /=
map <Leader>a: :Tabularize /:
map <Leader>a:: :Tabularize /:\zs
map <Leader>a, :Tabularize /,
map <Leader>a<Bar> :Tabularize /

" Ignore some files from editing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'



" Abbreviations
:ab ret return

" Autocommands
if has("autocmd")
    :autocmd FileType python     set makeprg=nosetests
    :autocmd FileType c          set tabstop=8 shiftwidth=8 softtabstop=8
    :autocmd FileType text       setlocal textwidth=78
    :autocmd FileType html       setlocal foldmethod=syntax
    :autocmd FileType html       syntax region htmlFold start="<\z([a-z0-9-]\+\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedIn=htmlHead,htmlH
    :autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2
    :autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
    :autocmd VimLeave * call system("tmux rename-window zsh")
    :autocmd BufEnter * let  &titlestring = " " . expand("%:t")
    set title
endif

