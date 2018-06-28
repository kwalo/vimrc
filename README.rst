Installation
````````````

::

    git clone git@github.com:kwalo/vimrc.git ~/.vim
    cd ~/.vim
    git submodule update --init
    echo ':source ~/.vim/profile' >> ~/.vimrc

Updating
````````

::

    git pull
    git submodule update --remote


Keyboard shortcuts
``````````````````

======== ==================== =======
Shortuct Vim command          Comment
======== ==================== =======
Normal mode
-------------------------------------
``B``    ``:b#``              Switch to last buffer
``S``    ``:%s///g``          Search and replace
``,d``   ``"+d``              Cut to clipboard
``,y``   ``"+y``              Copy to clipboard
``,p``   ``"+gP``             Paste from clipboard
``,G``   ``ggVG``             Select all text
``,n``   ``:NerdTreeToggle``  Show/Hide NERD Tree panel
``,t``   ``:TagbarToggle``     Show/Hode Tagbar panel
``,l``   ``<F4>``             Display quickbuf switcher
``,k``   ``:bd``              Kill current buffer
``,h``   ``:noh``             Unhighlight search matches
``,m``   ``:make``            Build project
``,c``   ``!ctags -R``        Update ctags file
Visual mode
-------------------------------------
``S``    ``:s///g``          Search and replace selection
Insert mode
-------------------------------------
``C-n``                       Completion popup menu
``C-h``  ``<Left>``           Cursor left
``C-j``  ``<Down>``           Cursor down
``C-k``  ``<Up>``             Cursor up
``C-l``  ``<Right>``          Cursor right
``C-a``  ``<Home>``           Home
``C-e``  ``<End>``            End
======== ==================== =======
