FROM debian:jessie
MAINTAINER jiangxianfu https://github.com/jiangxianfu
# linux debian
ENV DEBIAN_FRONTEND noninteractive

# meteor main.js port
ENV PORT 80


# Install Soft
RUN apt-get -qq update && apt-get install -qq -y curl procps git

# Install a specific Meteor release
RUN curl https://install.meteor.com | sh

# Init App
ADD . /app

WORKDIR /app

# expose port
EXPOSE   80


# Build Scripts
ADD ./meteor-build.sh /
ADD ./meteor-run.sh /


# Start Build
RUN sh /meteor-build.sh

## Development
# CMD meteor --port $PORT

## Production
# Remember: docker run -e "MONGO_URL=mongodb://172.17.0.4:27017/mytest" -e "ROOT_URL=http://example.com" 

# build + run 
# CMD sh /meteor-run.sh