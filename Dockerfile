FROM strongloop/node
# You start off as the 'strongloop' user.
# If a RUN command needs root, you can use sudo
# In addition to standard Linux commands you also have access to node, npm,
# and slc commands
RUN sudo apt-get update
RUN sudo apt-get install -y simpleproxy net-tools tmux zsh
ADD . /home/strongloop
RUN sudo chown -R strongloop:strongloop /home/strongloop
WORKDIR /home/strongloop/app
ENV NODE_ENV development
CMD [ "/bin/zsh" ]
