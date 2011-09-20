# Vim, Vam, Voom

Vim, Vam, Voom is Emili Parreño's vim distribution.

## Usage

    git clone git://github.com/eparreno/vimvamvoom.git ~/.vim

Then "cd" into the repo and run (notice: if you're using RVM, change to your Ruby system version before install or update):

    rake install

### Updating to the latest version

    cd .vim
    rake update

### Help tags

At first usage of vim execute:

    :Helptags

to generate tags. This will make the plugins documentations available upon :help

## Customization

Create ~/.vimrc.local and ~/.gvimrc.local for any local customizations.

## Base Customizations

* Leader: ","
* Line numbers
* Ruler
* Show git branch in status line
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Highlight unwanted spaces
* Select text in visual mode and indent with > and <

# Mappings

* Cmd+Option+(left, right, up, down) switch viewports
* Cmd+(1-9) switch tabs
* Cmd+e Open a terminal
* leader+=  Adjust viewports to the same size
* leader+t opens Command-T
* Fullscreen: Cmd + R
* Find in project with ack: Cmd + Shift + F

## Bundled Plugins

### Fugitive

Support for Git, adding convenient commands such as :Gstatus, :Gread, :Gmove, :Gdiff, :Glog etc<br/>
https://github.com/tpope/vim-fugitive.git

### Matchit

Configure % to match more than just single characters.  You can match words and even regular expressions.<br/>
http://www.vim.org/scripts/script.php?script_id=39

### Nedtree

Project navigator that you can open with leader+n<br/>
http://www.vim.org/scripts/script.php?script_id=1658

### NERD_commenter

Support to comment lines of code<br/>
[count]+leader+cc<br/>
Comment out the current line or text selected in visual mode<br/>
[count]+leader+c+space<br/>
Toggles the comment state of the selected line(s)<br/>

http://www.vim.org/scripts/script.php?script_id=1218<br/>
https://github.com/scrooloose/nerdcommenter<br/>

### Ack

type :Ack [search pattern] to search your entire project<br/>
https://github.com/mileszs/ack.vim

### Align

align blocks of text using equal sign or any other char<br/>
:Align<br/>
:5,10Align<br/>
http://mysite.verizon.net/astronaut/vim/align.html#Examples<br/>
https://github.com/tsaleh/vim-align<br/>

### Rails

Rails support for vim<br/>
http://www.vim.org/scripts/script.php?script_id=1567<br/>
https://github.com/tpope/vim-rails

### supertab

pseudo auto-complete with tab<br/>
http://www.vim.org/scripts/script.php?script_id=1643<br/>
https://github.com/ervandew/supertab

### Endwise

support to close Ruby blocks such as ‘if’, ‘do’ with ‘end’<br/>
http://www.vim.org/scripts/script.php?script_id=2386<br/>
https://github.com/tpope/vim-endwise

### vim-ruby

https://github.com/vim-ruby/vim-ruby/wiki<br/>
https://github.com/vim-ruby/vim-ruby

### ConqueTerm

Command+e Displays a terminal window<br/>
https://github.com/rson/vim-conque.git<br/>
http://code.google.com/p/conque/

### Syntastic

checks for syntax errors in many languages<br/>
http://www.vim.org/scripts/script.php?script_id=2736<br/>
https://github.com/scrooloose/syntastic/

### Snipmate

TextMate's snippets features in Vim<br/>
http://www.vim.org/scripts/script.php?script_id=2540

### Command-T

The Command-T plug-in provides an extremely fast, intuitive mechanism for opening files with
a minimal number of keystrokes. It's named "Command-T" because it is inspired by the "Go to File" 
window bound to Command-T in TextMate. 

http://www.vim.org/scripts/script.php?script_id=3025

### Treetop

Syntax highlighting for treetop files.

https://github.com/nanki/treetop


### Pathogen

Pathogen is a simple library for manipulating comma delimited path options. 

http://www.vim.org/scripts/script.php?script_id=2332

### Solarized

Solarized is a precision colorscheme with dark/light modes.

https://github.com/altercation/vim-colors-solarized

add this line to ~/.gvimrc to use solarized

    colorscheme 'solarized'

## Contributors

Contributions are welcomed. You can send your pull requests to improve this vim distribution

* Lleïr Borràs
* Arnau Siches

## Credits

Emili Parreño under MIT License<br/>
Vim, Vam, Voom is based on various vim distributions and vim config files.<br/>
Thanks to Fabio Akita, Martin Grenfell, Carl Lerche, Yehuda Katz, Joe Ferris, Tim Pope and many others.
