#!/bin/bash

###################
## Miscellaneous ##
###################
packages=(wget curl vim screen zip unzip)
####################

#####################
## Package Install ##
#####################
apt-get install -y ${packages[@]}
####################
