call pathogen#infect()
syntax on
filetype plugin indent on

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

set nocompatible
set number            " line numbers
set ruler             " line and column numbers
set showcmd
set encoding=utf-8

" Disable the splash screen
" set shortmess+=I

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:->,trail:·

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Status bar
set laststatus=2      " always show the status bar

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

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
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>

" Gemfile and Routes in their own split on top, 100% width
map <leader>gr :topleft 100 :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Make active split big, while minimizing others
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" Switch between last two open files
nnoremap <leader><leader> <c-^>

if has('autocmd')
  " Remove trailing spaces from all lines
  au BufWritePre * :call <SID>StripTrailingWhitespaces()

  " File Type Settings
  au FileType text setlocal textwidth=78
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
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
if has('gui_running')
  syntax enable
  set background=dark
  colorscheme solarized
else
  let g:solarized_termcolors=256
  syntax enable
  set background=dark
  colorscheme solarized
endif

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Set PeepOpen to command-T
  if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> <Plug>PeepOpen
    imap <D-t> <esc><Plug>PeepOpen
  end

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h

  " Adjust viewports to the same size
  map <Leader>= <C-w>=
  " imap <Leader>= <Esc> <C-w>=

  " Don't beep
  set visualbell

  " Start without the toolbar
  set guioptions-=T
endif

