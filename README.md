# devenv
My development environment

    $ boot2docker init -m 4096  
    $ docker build -t developer/devenv:latest .  
    $ docker run -it -p 3000:3000 -p 5858:8585 --name dev -v $HOME/dev:/home/strongloop/dev developer/devenv  

### Features

* Ubuntu 14.04
* Zsh (with oh-my-zsh)
* Tmux
* Vim
* python
* ruby
* node
* fzf


