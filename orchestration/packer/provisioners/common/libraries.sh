#!/bin/bash

##########################
## Development Packages ##
##########################
packages=(libgtextutils-dev libgtextutils0 libblas-dev liblapack-dev
texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
libgd-barcode-perl libgd-graph-perl libgd-graph3d-perl libxml-perl ant
libstatistics-descriptive-perl libdbi-perl python-setuptools libdbd-pg-perl
xorg-dev texinfo build-essential libpng12-0-dev libmysqlclient-dev hmmer
libboost1.48-all-dev libssl-dev zlib1g-dev ncurses-dev xorg-dev csh
libreadline6-dev texlive-latex-base texlive-fonts-extra libfontconfig1-dev
libfreetype6-dev libx11-dev libxcursor-dev libxext-dev libxft-dev clang
libxi-dev libxrandr-dev libxrender-dev libqt4-dev python-software-properties
libxml2-dev libeigen3-dev libeigen3-doc libcurl4-openssl-dev autoconf)
####################

#####################
## Package Install ##
#####################
apt-get install -y ${packages[@]}
#####################

################
## Pre Flight ##
################
cp -r /usr/include/eigen3/Eigen /usr/include/
####################
