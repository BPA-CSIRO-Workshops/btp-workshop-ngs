#!/bin/bash
# Get to the Travis build directory, configure git and clone the repo
cd $HOME
git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
 clone --quiet --branch=gh-pages https://${GH_TOKEN}@${GH_REF} gh-pages > /dev/null

# Commit and Push the Changes
cd gh-pages
git rm -f ./pdfs-latest/*.pdf
cp -Rf $HOME/traine{e,r}_*.pdf ./pdfs-latest
git add -f .
git commit -m "Lastest PDFs on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push -fq origin gh-pages > /dev/null
