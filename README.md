# Vim, Vam, Voom

Vim, vam, voom is Emili Parreño's vim distribution. Still in development!!!

## Usage

		git clone git://github.com/eparreno/vimvamvoom.git ~/.vim

Then "cd" into the repo and run this to update submodules:

		git submodule update --init

Link vimrc, and gvimrc

    ln -s .vim/vimrc .vimrc
    ln -s .vim/gvimrc .gvimrc		

### Help tags

At first usage of vim execute:
	
	:Helptags to generate tags

This will make the plugins documentations available upon :help

## Customization

Create ~/.vimrc.local and ~/.gvimrc.local for any local customizations.

    echo color desert  > ~/.vimrc.local
    echo color molokai > ~/.gvimrc.local

## Base Customizations

* Line numbers
* Ruler
* Show git branch in status line
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Highlight unwanted spaces

## Bundled Plugins

### Fugitive

support for Git, adding convenient commands such as :Gstatus, :Gread, :Gmove, :Gdiff, :Glog etc
https://github.com/tpope/vim-fugitive.git

### Nedtree

project navigator that you can open with [leader] n
http://www.vim.org/scripts/script.php?script_id=1658

### NERD_commenter

support to comment lines of code
[count]<leader>cc 
Comment out the current line or text selected in visual mode
[count]<leader>c<space>
Toggles the comment state of the selected line(s)

	
http://www.vim.org/scripts/script.php?script_id=1218
https://github.com/scrooloose/nerdcommenter

### Ack

type :Ack [search pattern] to search your entire project
https://github.com/mileszs/ack.vim

### Align

align blocks of text using equal sign, make comment boxes and more
<leader>cc and <leader>c<space>
http://mysite.verizon.net/astronaut/vim/align.html#Examples
https://github.com/tsaleh/vim-align.git


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

## Learn Vim

Visit the following sites to learn more about Vim:

http://vimcasts.org

There are many sites teaching Vim, if you know of any other that are easy
to follow for newcomers, let me know

## Credits

Emili Parreño
