FROM debian:jessie
MAINTAINER Luigi Maselli http://grigio.org

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get install -qq -y curl procps git vim

# ENV METEOR_RELEASE 1.1.0.2

# Install a specific Meteor release
# RUN curl https://install.meteor.com | /bin/sh
ADD ./meteor-install.sh /
CMD sh /meteor-install.sh

# Build scripts
ADD ./meteor-build.sh /
ADD ./meteor-run.sh /


ENV PORT 80
EXPOSE   80

WORKDIR /app
ADD . /app


RUN /meteor-build.sh

## Development
# CMD meteor --port $PORT

## Production
# Remember: docker run -e "MONGO_URL=mongodb://172.17.0.4:27017/mytest" -e "ROOT_URL=http://example.com" 

# build + run 
# CMD sh /meteor-run.sh