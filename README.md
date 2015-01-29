# My development environment

A disposable development environment based on Docker.  It is conducive to
python and node.js programming and pretty personal to me and my coding style.
Feel free to fork and customize to your liking.

### Install
    $ boot2docker init -m 4096 (default is 2048 but building YouCompleteMe
    exhausts all available memory, 4096 makes it happy)
    $ boot2docker up
    $ docker build -t developer/devenv:latest .  
    $ docker run -it -p 3000:3000 -p 5858:8585 --name dev -v $HOME/dev:/home/developer/dev developer/devenv  

When you exit the container it will stop. To start it back up:

    $ docker start dev  
    $ docker attach dev  

Port 3000 is for whatever project I'm working on that I would like to expose to
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
* sudo
* [the\_platinum\_searcher](https://github.com/monochromegane/the_platinum_searcher)
* tmux
* vim-nox (because it has python support compiled in for YouCompleteMe and Ultisnips)
* zsh (with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh))  

[Tmux](http://tmux.sourceforge.net/) with a heavily customized [configuration](https://github.com/socketwiz/devenv/blob/master/.tmux.conf).  Prefix command has been changed to ctrl-space, color-scheme updates, keybinds for creating and manipulating windows and a custom status bar.  

[Vim](http://www.vim.org/) with the following addons and a highly customized
[.vimrc](https://github.com/socketwiz/devenv/blob/master/.vimrc).  The leader
key has been changed to &lt;space&gt; and the arrow keys have been disabled
among other things:

* [ ctrlp.vim ](https://github.com/kien/ctrlp.vim)
* [ javascript-libraries-syntax.vim ](https://github.com/othree/javascript-libraries-syntax.vim)
* [ sourcebeautify.vim ](https://github.com/michalliu/sourcebeautify.vim)
* [ tcomment\_vim ](https://github.com/tomtom/tcomment_vim)
* [ ultisnips ](https://github.com/SirVer/ultisnips)
* [ vim-fugitive ](https://github.com/tpope/vim-fugitive)
* [ vim-json ](https://github.com/elzr/vim-json)
* [ vim-markdown ](https://github.com/plasticboy/vim-markdown)
* [ vim-snippets ](https://github.com/honza/vim-snippets)
* [ vim-surround ](https://github.com/tpope/vim-surround)
* [ vim-unimpaired ](https://github.com/tpope/vim-unimpaired)
* [ YouCompleteMe ](https://github.com/Valloric/YouCompleteMe)

[Node](http://nodejs.org/) v0.10.36  
[Python](https://www.python.org/) v2.7.6  
[Ruby](https://www.ruby-lang.org/) v1.9.3p484  

[fzf](https://github.com/junegunn/fzf) a general-purpose fuzzy finder for your
shell. Active with ctrl-r.

### npm ls -g

* [phonegap](http://phonegap.com/)
* [strongloop](http://strongloop.com/)
