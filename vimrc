:let mapleader=","
:imap jj <Esc>

"Remove top bar
set guioptions=aAce

"Pathogne plugin
call pathogen#runtime_append_all_bundles() 

"color
syntax enable
set background=dark
colorscheme solarized

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set guitablabel=%M%t
    set lines=40
		set linespace=1
    set columns=115

    if has("gui_gnome")
        set term=gnome-256color
        colorscheme solarized
        set guifont=Monospace\ Bold\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
				colorscheme solarized
        set guifont=Menlo:h14
				"set guifont=Monaco:h12
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        "map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
        try
          set transparency=5
        catch
        endtry
    endif

else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme railscasts
    else
        colorscheme default
    endif
endif