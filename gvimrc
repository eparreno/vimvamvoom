" Don't beep && don't flash
set visualbell t_vb=

" Start without the toolbar
set guioptions=aAce

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

colorscheme ir_black

set showtabline=2 " always show tabs in gvim, but not vim

" Maximize gvim/macvim window.
set lines=999 columns=999

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions+=maxvert,maxhorz

  " Command-e for ConqueTerm
  map <D-e> :call StartTerm()<CR>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  "map <D-/> <plug>NERDCommenterToggle<CR>
  "imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

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
else
  " Alt-e for ConqueTerm
  map <A-e> :call StartTerm()<CR>

  " Alt-Shift-F for Ack
  " map <A-F> :Ack<space>

  " Alt-/ to toggle comments
  "map <A-/> <plug>NERDCommenterToggle<CR>
  "imap <A-/> <Esc><plug>NERDCommenterToggle<CR>i

  " Map Alt-# to switch tabs
  map  <A-0> 0gt
  imap <A-0> <Esc>0gt
  map  <A-1> 1gt
  imap <A-1> <Esc>1gt
  map  <A-2> 2gt
  imap <A-2> <Esc>2gt
  map  <A-3> 3gt
  imap <A-3> <Esc>3gt
  map  <A-4> 4gt
  imap <A-4> <Esc>4gt
  map  <A-5> 5gt
  imap <A-5> <Esc>5gt
  map  <A-6> 6gt
  imap <A-6> <Esc>6gt
  map  <A-7> 7gt
  imap <A-7> <Esc>7gt
  map  <A-8> 8gt
  imap <A-8> <Esc>8gt
  map  <A-9> 9gt
  imap <A-9> <Esc>9gt

  " Alt-ArrowKey to switch viewports
  map <A-Up> <C-w>k
  imap <A-Up> <Esc> <C-w>k
  map <A-Down> <C-w>j
  imap <A-Down> <Esc> <C-w>j
  map <A-Right> <C-w>l
  imap <A-Right> <Esc> <C-w>l
  map <A-Left> <C-w>h
  imap <A-Left> <C-w>h
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

autocmd VimEnter * call CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call UpdateNERDTree()
autocmd WinEnter * call CloseIfOnlyNerdTreeLeft()

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif

