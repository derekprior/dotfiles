scriptencoding utf-8

let mapleader = " "

set backspace=2       " Backspace deletes like most programs in insert mode
set noshowmode        " powerline shows the mode
set hlsearch          " highlight searches (:noh to turn off)
set ignorecase        " case insensitive searching
set smartcase         " overrides ignorecase when pattern contains caps
set laststatus=2      " Always display the status line
set winwidth=80       " minimum width for active split
set clipboard=unnamed " use OS clipboard
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set nofoldenable      " I really don't like folding in vim
set nobackup          " don't create backup files
set nowritebackup     " really don't create backup files?
set noswapfile        " for real, don't create backup files
set history=50

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set nowrap
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set spellfile to location that is guaranteed to exist
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" Color scheme
set termguicolors
let ayucolor="light"
" let ayucolor="mirage"
" let ayucolor="dark"

colorscheme dracula
" colorshceme ayu
" colorscheme monokai_pro
" colorscheme github


" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " File Type Settings
  autocmd filetype qf setlocal wrap

  " Help System Speedups
  autocmd filetype help nnoremap <buffer><CR> <c-]>
  autocmd filetype help nnoremap <buffer><bs> <c-T>
  autocmd filetype help nnoremap <buffer>q :q<CR>
  autocmd filetype help set nonumber
augroup END

" git shortcuts
noremap <leader>gb :Git blame<CR>
noremap <leader>gd :Git diff<CR>

" simple vertical splits
map <leader>v <C-w>v

" Mappings for quick search & replace.
" Do a / search first, then leave pattern empty in :s// to use last
map <Leader>sra :%s///g<Left><Left>
map <Leader>src :%s///gc<Left><Left><Left>

" Hide highlighted terms
map <silent> <leader><CR> :noh<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" vim-test mappings
nnoremap <silent> <Leader>a :TestFile<CR>
nnoremap <silent> <Leader>t :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>A :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" SplitJoin
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" FZF
nnoremap <C-p> :Files<cr>

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_files_options =
  \ '--reverse ' .
  \ '--preview "bat {} 2> /dev/null | head -'.&lines.'"'

if executable('rg')
  set grepprg=rg\ --color=never
  let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git" --sort path'
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
