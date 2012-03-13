set nocompatible

:let mapleader=","
:imap jj <Esc>

set number
set ruler
set paste
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" No backup
set nobackup
set nowritebackup

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*


"statusline setup
set statusline=%f                         "tail of the filename
set statusline+=%y                        "filetype
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=%{fugitive#statusline()}
set statusline+=%m                        "modified flag
set statusline+=%=                        "left/right separator
set statusline+=%c,                       "cursor column
set statusline+=%l/%L                     "cursor line/total lines
set statusline+=\ %P                      "percent through file
set laststatus=2


set linespace=1
set guifont=Monaco:h12
set t_Co=256
set background=dark
colorscheme default

" Display extra whitespace
set list listchars=tab:..,trail:·

" Command-T configuration
let g:CommandTMaxHeight=20

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" shift+arrow-keys to select text
set keymodel=startsel

" Show the next match while entering a search
set incsearch

"Highlighting search matches
set hlsearch

" MacVIM shift+arrow-keys behavior (required in .vimrc)
""let macvim_hig_shift_movement = 1
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Hitting F5 will clean out all trailing whitespace or tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
else
  set autoindent " always set autoindenting on
endif " has("autocmd")

" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction

autocmd VimEnter * call CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call UpdateNERDTree()
autocmd WinEnter * call CloseIfOnlyNerdTreeLeft()

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', '\.git']
map <Leader>n :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

" Utility functions to create file commands
function CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function DefineCommand(name, destination)
  call FileCommand(a:destination)
  call CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . fnameescape(a:dir)
  let stay = exists("a:1") ? a:1 : 1

  NERDTree

  if !stay
    wincmd p
  endif
endfunction

function Touch(file)
  execute "!touch " . shellescape(a:file, 1)
  call UpdateNERDTree()
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . shellescape(a:file, 1)
  endif

  call UpdateNERDTree()
endfunction

function Mkdir(file)
  execute "!mkdir " . shellescape(a:file, 1)
  call UpdateNERDTree()
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . fnameescape(a:file)

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call DefineCommand("cd", "ChangeDirectory")
call DefineCommand("touch", "Touch")
call DefineCommand("rm", "Remove")
call DefineCommand("e", "Edit")
call DefineCommand("mkdir", "Mkdir")

"Pathogne plugin
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" Re-enable per filetype plugins and indents after loading pathogen plugin
filetype plugin indent on

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

