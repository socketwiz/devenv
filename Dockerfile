FROM strongloop/node
# You start off as the 'strongloop' user.
# If a RUN command needs root, you can use sudo
# In addition to standard Linux commands you also have access to node, npm,
# and slc commands
RUN sudo apt-get update
RUN sudo apt-get install -y simpleproxy net-tools tmux zsh ruby cmake python-dev
ADD . /home/strongloop
RUN sudo chown -R strongloop:strongloop /home/strongloop
RUN sudo -u strongloop git submodule update --init --recursive
RUN sudo -u strongloop mv /home/strongloop/rickyn.zsh-theme /home/strongloop/.oh-my-zsh/themes
RUN sudo -u strongloop yes | /home/strongloop/.fzf/install
RUN sudo -u strongloop yes | /home/strongloop/.vim/bundle/YouCompleteMe/install.sh
WORKDIR /home/strongloop/app
ENV NODE_ENV development
CMD [ "/bin/zsh" ]
