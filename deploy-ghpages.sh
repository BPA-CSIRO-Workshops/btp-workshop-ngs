#!/bin/bash
rm -rf out || exit 0
mkdir gh-pages
cd gh-pages
git init
git config user.name "Travis-CI"
git config user.email "travis@nodemeatspace.com"
cp ../traine{e,r}_*.pdf ./
git add .
git commit -m "Deployed Updated PDFs to Github Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
