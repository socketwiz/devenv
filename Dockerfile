FROM ubuntu:latest

# Get up to date, install the bare necessities
# Create "developer" user
RUN DEBIAN_FRONTEND=noninteractive sh -c '( \
    apt-get update -q && \
    apt-get install -y -q build-essential cmake curl git man-db net-tools python-dev ruby ssh simpleproxy sudo tmux vim-nox zsh httpie && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get install -y nodejs && \
    npm install -g npm && \
    npm install -g phonegap strongloop && \
    apt-get clean )' > /dev/null && \
    useradd -ms /bin/zsh developer && \
    chown -R developer /usr/local && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# install the platinum searcher
RUN curl -L https://github.com/monochromegane/the_platinum_searcher/releases/download/v1.7.6/pt_linux_amd64.tar.gz | tar xz -C /tmp \
    && mv /tmp/pt_linux_amd64/pt /usr/local/bin \
    && rm -rf /tmp/*

# setup environment
ENV NODE_ENV development
ENV HOME /home/developer
USER developer

# directory that will be shared with host
WORKDIR $HOME/dev

ADD . $HOME
RUN sudo chown -R developer:developer $HOME

# miscellaneous configuration
RUN git submodule update --init --recursive
RUN mv $HOME/rickyn.zsh-theme $HOME/.oh-my-zsh/themes
RUN yes | $HOME/.fzf/install
RUN $HOME/.vim/bundle/YouCompleteMe/install.sh

# setup hubflow
RUN cd $HOME/gitflow && \
    ./install.sh

CMD [ "/bin/zsh" ]
