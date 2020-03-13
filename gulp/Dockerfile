FROM node:alpine

# When you run the container for the first time, it's necessary to run npm install.
# docker run --rm -v /$(pwd)/symfony:/opt gulp npm install

RUN npm install -g gulp

WORKDIR /opt
VOLUME /opt

COPY run.sh /run.sh

CMD ["/bin/sh", "/run.sh"]

## Livereload.
EXPOSE 35729
