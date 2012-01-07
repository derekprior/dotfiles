set nocompatible
filetype off          " required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-align'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-haml'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-markdown'
Bundle 'derekprior/vim-colorpack'
Bundle 'ervandew/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'scratch.vim'
Bundle 'git://github.com/wincent/Command-T.git'
filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


syntax on

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

set number            " line numbers
set ruler             " line and column numbers
set showcmd
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:->,trail:·

" Disabling Arrow Keys to force normal mode movement.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Always show at least 3 lines on either side of the cursor
set scrolloff=3

" Searching
set hlsearch          " highlight searches (:noh to turn off)
set incsearch         " highlight while typing search
set ignorecase        " case insensitive searching
set smartcase         " overrides ignorecase when pattern contains caps

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=.idea,tmp,vendor/bundle/**,*.png,*.jpg,*.gif

" ctags setting
let g:rails_ctags_arguments='--languages=-javascript --exclude=log --exclude=tmp --exclude=.git --exclude=.idea'
set tags=./tmp/tags,./tags

" use Ack instead of grep
set grepprg=ack

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Status bar
set laststatus=2      " always show the status bar

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" jj to switch back to normal mode
:inoremap jj <Esc>

" Set the leader key
let mapleader=","

" File Navigation
" %% to current file path
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Command-T mappings
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>

" Coffee Script Compilation
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" Switch between last two open files
nnoremap <leader><leader> <c-^>

" Substitute
nnoremap <leader>s :%s//<left>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Hide highlighted terms
map <silent> <leader><cr> :noh<cr>

if has('autocmd')
  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  " Remove trailing spaces from all lines
  au BufWritePre * :call <SID>StripTrailingWhitespaces()

  " File Type Settings
  au FileType text setlocal textwidth=78
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru}    set ft=ruby
  au BufNewFile,BufRead *.json set ft=javascript

  " If a file is read-only, try p4-edit
  let s:IgnoreChange=0
  autocmd! FileChangedRO * nested
      \ let s:IgnoreChange=1 |
      \ call system("p4 edit " . expand("%")) |
      \ set noreadonly
  autocmd! FileChangedShell *
      \ if 1 == s:IgnoreChange |
      \   let v:fcs_choice="" |
      \   let s:IgnoreChange=0 |
      \ else |
      \   let v:fcs_choice="ask" |
      \ endif
endif

" Color Scheme
if &term =~ "xterm-256"
  set t_Co=256
  let g:solarized_termcolors=256
else
  set t_Co=16
end
syntax enable
set background=dark
colorscheme grb4

