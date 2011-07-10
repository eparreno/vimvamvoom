# Vim, Vam, Voom

Vim, vam, voom is Emili Parreño's vim distribution. Still in development!!!

## Usage

    git clone git://github.com/eparreno/vimvamvoom.git ~/.vim

Then "cd" into the repo and run this to update submodules:

    git submodule update --init

Link vimrc, and gvimrc

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

### Updating to the latest version

  cd .vim
  git pull
  git submodule sync
  git submodule update --init --recursive

### Help tags

At first usage of vim execute:

    :Helptags

to generate tags. This will make the plugins documentations available upon :help

## Customization

Create ~/.vimrc.local and ~/.gvimrc.local for any local customizations.

    echo color desert  > ~/.vimrc.local
    echo color molokai > ~/.gvimrc.local

## Base Customizations

* Leader: space
* Line numbers
* Ruler
* Show git branch in status line
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Highlight unwanted spaces

## Mappings

* Cmd-Option-(left, right, up, down) switch viewports
* Cmd-(1-9) switch tabs
* Cmd-e Open a terminal
* <leader>=  Adjust viewports to the same size 

## Bundled Plugins

### Fugitive

support for Git, adding convenient commands such as :Gstatus, :Gread, :Gmove, :Gdiff, :Glog etc<br/>
https://github.com/tpope/vim-fugitive.git

### Nedtree

project navigator that you can open with <leader>n<br/>
http://www.vim.org/scripts/script.php?script_id=1658

### NERD_commenter

support to comment lines of code<br/>
[count]<leader>cc<br/>
Comment out the current line or text selected in visual mode<br/>
[count]<leader>c<space><br/>
Toggles the comment state of the selected line(s)<br/>

http://www.vim.org/scripts/script.php?script_id=1218<br/>
https://github.com/scrooloose/nerdcommenter<br/>

### Ack

type :Ack [search pattern] to search your entire project<br/>
https://github.com/mileszs/ack.vim

### Align

align blocks of text using equal sign, make comment boxes and more<br/>
<leader>cc and <leader>c<space><br/>
http://mysite.verizon.net/astronaut/vim/align.html#Examples<br/>
https://github.com/tsaleh/vim-align.git<br/>


### Rails

Rails support for vim
http://www.vim.org/scripts/script.php?script_id=1567
https://github.com/tpope/vim-rails

### vim-preview

[leader] P previews Markdown, Rdoc, Textile, html. Requires Ruby and other gems.
http://www.vim.org/scripts/script.php?script_id=3344
https://github.com/greyblake/vim-preview

### supertab

pseudo auto-complete with tab
http://www.vim.org/scripts/script.php?script_id=1643
https://github.com/ervandew/supertab

### Endwise

support to close Ruby blocks such as ‘if’, ‘do’ with ‘end’
http://www.vim.org/scripts/script.php?script_id=2386
https://github.com/tpope/vim-endwise

### vim-ruby

https://github.com/vim-ruby/vim-ruby/wiki
https://github.com/vim-ruby/vim-ruby

### ConqueTerm

<C-e> Displays a terminal window
https://github.com/rson/vim-conque.git
http://code.google.com/p/conque/

### Syntastic

checks for syntax errors in many languages
http://www.vim.org/scripts/script.php?script_id=2736
https://github.com/scrooloose/syntastic/

### Snipmate

TextMate's snippets features in Vim<br/>
http://www.vim.org/scripts/script.php?script_id=2540

## Contribute

I'm always happy to take pull requests from others and improve this vim distribution. Go ahead and fork me!

## Credits

Emili Parreño
Vim, Vam, Voom is based on various vim distributions and vim config files.
Thanks to Fabio Akita, Martin Grenfell, Carl Lerche, Yehuda Katz, Joe Ferris, Tim Pope and others.
