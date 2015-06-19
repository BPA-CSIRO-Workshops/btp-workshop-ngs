#!/bin/bash

###############
## Compilers ##
###############
packages=(gcc g++ gfortran cmake cmake-curses-gui)
####################

#####################
## Package Install ##
#####################
apt-get install -y ${packages[@]}
####################
