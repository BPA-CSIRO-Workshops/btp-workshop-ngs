#!/bin/bash

#########
## SCM ##
#########
packages=(git mercurial subversion)
####################

#####################
## Package Install ##
#####################
apt-get install -y ${packages[@]}
####################
