# My Vim 

just my macvim config

## Usage

		git clone git://github.com/akitaonrails/vimfiles.git ~/.vim

Then ‘cd’ into the repo and run this to get the snippets submodule:

		git submodule update --init
		
Now you should create a new .vimrc file in your home directory that
loads the pre-configured one that comes bundled in this package. You can do it
on Linux/Mac like this:

		echo "source ~/.vim/vimrc" > ~/.vimrc
	
You should also create a new .gvimrc file in your home directory. You can do 
it on Linux/Mac like this:


		echo "source ~/.vim/gvimrc" > ~/.gvimrc
		
## Customizations
Line numbers
Ruler
Show git branch in status line
Soft 2-space tabs, and default hard tabs to 2 spaces
Cmd + Enter : Full screen mode
Solarized colors http://ethanschoonover.com/solarized

## Bundled Plugins

Vim Fugitive
https://github.com/tpope/vim-fugitive.git

Nedtree
http://www.vim.org/scripts/script.php?script_id=1658