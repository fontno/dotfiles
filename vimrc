execute pathogen#infect()

""
"" Basic Setup
""
set nocompatible      " Use vim, no vi defaults
colorscheme github
set hidden            " Dont have to write file to switch files in same window
filetype plugin on    " filetype stuff
filetype indent on    " ""
set number            " Show line numbers
set ruler             " Show line and column number
""syntax enable         " Turn on syntax highlighting allowing local overrides
syntax on
set encoding=utf-8    " Set default encoding to UTF-8
set vb                " I hate that damned beeping
set showmode          " show the current mode
set laststatus=2      " tell Vim to always put a status line in
set scrolloff=1       " lines from top bottom when page scrolls
set ch=2              " cmdline height
set autoread
"set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B] 
"
"" Change cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""
set wildmenu        " Enable enhanced command-line completion
"

set wildmode=list:longest,list:full
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*


"" Backup and swap files
""
"set backupdir^=~/.vim/_backup//    " where to put backup files.
"set directory^=~/.vim/_temp//      " where to put swap files.
set nobackup
set noswapfile

""
"" Mappings
""
let mapleader = ";"

inoremap jk <esc>

" execute one normal mode command while in insert mode
inoremap kk <C-O>

" .vimrc operations
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

:cmap md !mkdir

"" space bar folding normal mode
:set foldmethod=manual

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"" gem-ctags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

"" nerdtree
"map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" insert newline above or below and stay in current position with shift enter or enter
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" toggle previous page
nnoremap <leader>f <C-^>

" insert mode new line anytime
let isGui  = has("gui_running")
let isMac  = has("mac")
if(isGui && isMac)
  inoremap <D-Enter> <ESC>o
else
  inoremap <C-Enter> <ESC>o
endif

noremap <leader>i <Esc>dd O

inoremap <leader>o <C-o><Up><C-T>
inoremap <leader>j <C-o><Down>
inoremap <leader>k <C-o><Up>

" delete previous word in insert mode
inoremap <leader>w <C-W>

" Save my pinky
inoremap <leader>j _
inoremap <leader>k "
inoremap <leader>l "
nnoremap <leader>a :
inoremap <leader>a :
inoremap <leader>s (
inoremap <leader>d )
inoremap <leader>w {
inoremap <leader>e }


" vim-rspec plugin mappings
nnoremap <Leader>rt :call RunCurrentSpecFile()<CR>
nnoremap <Leader>rn :call RunNearestSpec()<CR>
nnoremap <Leader>rl :call RunLastSpec()<CR>
nnoremap <Leader>ra :call RunAllSpecs()<CR>

" comment erb
" Nerdcommenter does not work for erb
xnoremap <leader>ct :s/^\s*<%/&#<CR><esc> :noh<return><esc>
nnoremap <leader>ct :s/^\s*<%/&#<CR><esc> :noh<return><esc>
" uncomment erb
xnoremap <leader>ut :s/\(^\s*<%\)#/\1<CR><esc> :noh<return><esc>
nnoremap <leader>ut :s/\(^\s*<%\)#/\1<CR><esc> :noh<return><esc>
