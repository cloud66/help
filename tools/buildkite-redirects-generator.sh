#!/usr/bin/env bash
set -e
# load env vars
source ~/.profile

if [[ -z "$BUILDKITE_BUILD_ID" ]] || [[ -z "$BUILDKITE_BRANCH" ]]; then
  echo "FATAL: Build env vars missing"
  exit 22
fi
pwd=$(pwd)
echo " ---> Generating netlify-redirects.html via tools/redirects-generator.rb"
# run the site generator
mkdir -p netlify-redirects
tools/redirects-generator.rb --input="$pwd/netlify.toml" --output="$pwd/netlify-redirects/netlify-redirects.html"
# start a webserver for this
nohup npx http-server "$pwd/netlify-redirects" -a 127.0.0.1 >/tmp/http-server.log 2>&1 &
read varname
# run the link checker
blc "http://127.0.0.1:8080/netlify-redirects.html" -r -o -f --host-request 2 --requests 2 -g --filter-level 3 -e
# all done
echo "---> I'm Mr. Meeseeks! Look at me!"
