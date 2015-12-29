# My development environment

A disposable development environment based on Docker.  It is conducive to
python and node.js programming and pretty personal to me and my coding style.
Feel free to fork and customize to your liking.

### Install
    $ docker-machine create development
    $ docker-machine start development
    $ git clone https://github.com/socketwiz/devenv.git
    $ cd devenv
    $ # add your ssh public key to the .ssh/authorized_keys file
    $ ./build
    $ ./run
    $ ssh developer@<ip listed in run> -p <port listed in run>
    $ tmux new -s dev  
    $ simpleproxy -L 0.0.0.0:8585 -R 127.0.0.1:5858  
    # open new tmux window or split the window, whatever you prefer  
    $ node --debug app.js

Port 8000 is for whatever project I'm working on that I would like to expose to
a browser, port 5858 is so I can attach WebStorm to the nodejs debugger.  The
-v paths are so I can share a directory between my host and the development
environment.

# Features

[Ubuntu 14.04](http://www.ubuntu.com/) with the following bare necessites: 

* build-essential
* cmake
* curl
* git (git difftool runs vimdiff)
* man-db
* net-tools (for netstat, helps debug various web development problems)
* python-dev (needed to build YouCompleteMe)
* ruby
* simpleproxy (needed for port forwarding the nodejs debugging port)
* ssh
* sshd
* sudo
* [the\_platinum\_searcher](https://github.com/monochromegane/the_platinum_searcher)
* tmux
* vim-nox (because it has python support compiled in for YouCompleteMe and Ultisnips)
* zsh (with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh))  
* [httpie](http://httpie.org) (for debugging json APIs)  
* [hubflow](https://github.com/datasift/gitflow) (for better git branch management)  
* [fzf](https://github.com/junegunn/fzf) (a general-purpose fuzzy finder for your shell, activate with ctrl-r)

[Tmux](http://tmux.sourceforge.net/) with a heavily customized [configuration](https://github.com/socketwiz/devenv/blob/master/.tmux.conf).  Prefix command has been changed to ctrl-space, color-scheme updates, keybinds for creating and manipulating windows and a custom status bar.  

[Vim](http://www.vim.org/) with the following addons and a highly customized
[.vimrc](https://github.com/socketwiz/devenv/blob/master/.vimrc).  The leader
key has been changed to &lt;space&gt; and the arrow keys have been disabled
among other things:

* [ ctrlp.vim ](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru,
  tag, etc finder.
* [ sourcebeautify.vim ](https://github.com/michalliu/sourcebeautify.vim) - Beautify your javascript,html,css source code
* [ syntastic ](https://github.com/scrooloose/syntastic) - Syntax checking hacks
* [ tcomment\_vim ](https://github.com/tomtom/tcomment_vim) - An extensible
  & universal comment vim-plugin that also handles embedded filetypes
* [ ultisnips ](https://github.com/SirVer/ultisnips) - The ultimate snippet
  solution for Vim.
* [ vim-fugitive ](https://github.com/tpope/vim-fugitive) - a Git wrapper
* [ vim-gitgutter ](https://github.com/airblade/vim-gitgutter) - A Vim plugin
  which shows a git diff in the gutter (sign column) and stages/reverts hunks.
* [ vim-javascript ](https://github.com/pangloss/vim-javascript) - Vastly
  improved Javascript indentation and syntax support
* [ vim-json ](https://github.com/elzr/vim-json) - distinct highlighting of
  keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
* [ vim-markdown ](https://github.com/plasticboy/vim-markdown) - syntax
  highlighting and filetype plugins for Markdown
* [ vim-snippets ](https://github.com/honza/vim-snippets) - repository contains
  snippets files for various programming languages.
* [ vim-surround ](https://github.com/tpope/vim-surround) - quoting/parenthesizing made simple
* [ vim-unimpaired ](https://github.com/tpope/vim-unimpaired) - pairs of handy
  bracket mappings
* [ YouCompleteMe ](https://github.com/Valloric/YouCompleteMe) - A code
  completion engine

[Node](http://nodejs.org/) v0.10.36  
[Python](https://www.python.org/) v2.7.6  
[Ruby](https://www.ruby-lang.org/) v1.9.3p484  


### npm ls -g

* [strongloop](http://strongloop.com/)
* [mocha](https://github.com/mochajs/mocha)
