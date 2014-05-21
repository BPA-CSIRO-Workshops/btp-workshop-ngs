#!/bin/bash
# Configure git and clone the repo
git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@${GH_REF} gh-pages > /dev/null

# Commit and Push the Changes
cd gh-pages
mkdir -p pdfs-latest
rm -f pdfs-latest/*.pdf
cp -Rf ../*.pdf ./pdfs-latest
git add -f .
git commit -m "Lastest PDFs on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push -fq origin gh-pages > /dev/null
