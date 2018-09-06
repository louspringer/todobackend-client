FROM ubuntu:bionic
MAINTAINER Lou Springer <lou@louspringer.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
# RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list 

# Install node.js
RUN apt-get update && \
    apt-get install curl git sudo gnupg -y && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    apt-get install -y nodejs 

ADD . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g grunt-cli && \
    npm install --unsafe-perm=true

# Set entrypoint
CMD ["node","app.js"]