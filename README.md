[![Build Status](https://travis-ci.org/BioplatformsAustralia/LaTeX-style.png?branch=master)](https://travis-ci.org/BioplatformsAustralia/LaTeX-style)

This repository contains LaTeX style information for use with handout documents
used in hands-on bioinformatics training workshops.

This style was originally designed for the Next Generation Sequencing (NGS)
hands-on workshop developed by Bioplatforms Australia (BPA), CSIRO
Bioinformatics Core and the EBI.

Installing LateX
================
The following script will install, LaTeX and other LaTeX packages required to
use this style. For speed, set `CTAN_MIRROR_URL` to be a mirror near you. A
list of mirrors can be found at http://ctan.org/mirrors

    CTAN_MIRROR_URL='http://mirror.aarnet.edu.au/pub/CTAN'
    
    # Install texlive use the supplied texlive.profile. This just installs a
    # basic LaTeX environment. We'll explicitly install the required packages
    # shortly.
    wget --continue ${CTAN_MIRROR_URL}/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xzf install-tl-unx.tar.gz && rm install-tl-unx.tar.gz
    sudo ./install-tl-*/install-tl -repository ${CTAN_MIRROR_URL}/systems/texlive/tlnet -no-gui -profile texlive.profile
    
    # Install packages required by this style
    sudo /usr/local/texlive/2013/bin/x86_64-linux/tlmgr \
      -repository ${CTAN_MIRROR_URL}/systems/texlive/tlnet \
      install \
        mdframed preprint enumitem etoolbox titlesec xmpincl comment latexmk \
        lm memoir listings xcolor url l3packages l3kernel placeins microtype \
        float latex-bin fancyhdr graphics psnfss pdftex-def oberdiek colortbl \
        hyperref

Using the Style
===============
This still needs to be documented.

Creative Commons License
========================
The documentation associated with this workshop are released under the Creative
Commons Attribution 3.0 Unported License. For a summary of what this means,
please see:
http://creativecommons.org/licenses/by/3.0/deed.en_GB

