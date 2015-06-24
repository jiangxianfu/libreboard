FROM meteorhacks/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

ONBUILD RUN apt-get update && apt-get install -yq git vim
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/on_build.sh


# Run as you wish!
# docker run -d --name libreboard-db mongo
# docker run -d --link "libreboard-db:db" -e "MONGO_URL=mongodb://db" \
#   -e "ROOT_URL=http://example.com" -p 8080:80 mquandalle/libreboard
