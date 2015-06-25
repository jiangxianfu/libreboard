#!/bin/sh
BUNDLED=$HOME/.meteor/packages/meteor-tool/1.1.3/mt-os.linux.x86_64/dev_bundle/bin
(cd /app && meteor build --directory .)
(cd bundle/programs/server && $BUNDLED/npm install)