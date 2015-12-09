FROM ubuntu:14.04

# give root access to installers
USER root

RUN apt-get update && apt-get install -y build-essential cmake curl git man-db net-tools python-dev python-pip ruby ssh openssh-server simpleproxy sudo tmux vim-nox zsh httpie postgresql-client
RUN mkdir /var/run/sshd
RUN locale-gen "en_US.UTF-8"
RUN dpkg-reconfigure locales
RUN chmod -R 755 /usr/local/share/zsh/site-functions
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g node-gyp
RUN node-gyp install
RUN npm cache clear
RUN apt-get clean
RUN useradd -ms /bin/zsh developer
RUN chown -R developer /usr/local
RUN echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# install the platinum searcher
RUN curl -L https://github.com/monochromegane/the_platinum_searcher/releases/download/v1.7.6/pt_linux_amd64.tar.gz | tar xz -C /tmp \
    && mv /tmp/pt_linux_amd64/pt /usr/local/bin \
    && rm -rf /tmp/*

RUN pip install virtualenv virtualenvwrapper
RUN gem install sass

# setup environment as user developer
USER developer
ENV NODE_ENV development
ENV HOME /home/developer

# directory that will be shared with host
WORKDIR $HOME/dev

ADD . $HOME
RUN sudo chown -R developer:developer $HOME

# miscellaneous configuration
RUN $HOME/bootstrap

# setup hubflow
RUN cd $HOME/gitflow && \
    ./install.sh

# run sshd as user root
USER root

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

