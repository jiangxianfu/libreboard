FROM debian:jessie
MAINTAINER jiangxianfu https://github.com/jiangxianfu

ENV DEBIAN_FRONTEND noninteractive
ENV PORT 80
# ENV METEOR_RELEASE 1.1.0.2


# Install Soft
RUN apt-get -qq update && apt-get install -qq -y curl procps git vim

# Install a specific Meteor release
RUN curl https://install.meteor.com | sh

# Init 
ADD . /app

WORKDIR /app

EXPOSE   80


# Build scripts
ADD ./meteor-build.sh /
ADD ./meteor-run.sh /



RUN sh /meteor-build.sh

## Development
# CMD meteor --port $PORT

## Production
# Remember: docker run -e "MONGO_URL=mongodb://172.17.0.4:27017/mytest" -e "ROOT_URL=http://example.com" 

# build + run 
# CMD sh /meteor-run.sh