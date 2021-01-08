FROM ubuntu

LABEL maintainer="sneivandt"

ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        ca-certificates \
        curl \
        exuberant-ctags \
        git \
        locales \
        openssh-client \
        shellcheck \
        tmux \
        vim \
        wget \
        zip \
        zsh \
        unzip \
        python \
        less \
    && rm -rf /var/lib/apt/lists/*

# Configure locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen


ENV TERM=xterm-256color
ENV COLORTERM=truecolor

# Add user
ARG USER=talma

# Add user
RUN useradd -ms /bin/zsh $USER
WORKDIR /home/$USER
ENV SHELL /bin/zsh
ENTRYPOINT /usr/bin/zsh

# Install dotfiles

USER $USER

#COPY --chown=$USER:$USER ./zshrc.sh /home/$USER/.zshrc
