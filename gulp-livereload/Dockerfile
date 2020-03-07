FROM node:alpine

MAINTAINER progonkpa <progonkpa@telenet.be>

ARG SRC_DIR_GUEST
ENV SRC_DIR_GUEST $SRC_DIR_GUEST

# Converts line seperators from Windows to UNIX.
RUN apk add dos2unix
RUN npm install --global gulp-cli

COPY setup-node.sh /setup-node.sh
RUN dos2unix /setup-node.sh

CMD ["/bin/sh", "/setup-node.sh"]

WORKDIR $SRC_DIR_GUEST

# Livereload.
EXPOSE 35729
