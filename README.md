[![Build Status](https://travis-ci.org/BPA-CSIRO-Workshops/ngs-handout.png?branch=master)](https://travis-ci.org/BPA-CSIRO-Workshops/ngs-handout)

Purpose
=======
This repository contains style information for use with LaTeX to generate
consistently styled handout documents for use in hands-on bioinformatics
training workshops.

Features
========
* Consistent styling of text blocks using:
  * Margin icons to guide the readers eye
  * Background shading to increase emphasis of important blocks
* Code blocks styled for easy copy-and-paste operations
* Ability to maintain trainer-specific and trainee-specific content in the same source file
* Trainee-specific styling:
  * Answers to questions hidden
  * Additional vertical space provided following posed questions to allow sufficent room to write answers
* Trainer-specific styling:
  * Red transperent background on front page
  * "Trainer's Manual" text in footer of all pages
  * Answers to questions displayed in red text

How to Use this Style
=====================
This still needs to be documented. However, we'll probably provide an example
repository showing how to use the various features of this style file. Stay tuned.

Installing the LateX Environment
================================
In order to build a PDF from LaTeX source files. You'll first need to install LaTeX
and some other LaTeX packages to get this style file to work.

We provide a script (`install_latex.sh`) which downloads and installs LaTeX,
as well as all the packages required for this style. Simply clone this
repository and run that script and you should have LaTeX ready to go in just
a few minutes:
```bash
git clone https://github.com/BioplatformsAustralia/LaTeX-style.git
cd LaTeX-style.git
sudo ./install_latex.sh
```

By default, the above script will download LaTeX packages from the default CTAN mirror.
You will benefit from faster downloads and a quicker install if you use a mirror closer
to where you are. To change the mirror, simply set the environmental variable
`CTAN_MIRROR_URL` to point to your favourite CTAN mirror (http://ctan.org/mirrors):
```bash
export CTAN_MIRROR_URL='http://mirror.aarnet.edu.au/pub/CTAN'
sudo -E ./install_latex.sh
```

Credits
=======
This style was originally designed for the Next Generation Sequencing (NGS)
hands-on workshop developed by Bioplatforms Australia (BPA), CSIRO
Bioinformatics Core and the EBI. It was written predominantly by Nathan S.
Watson-Haigh.

License
=======
The contents of this repository are released under the Creative Commons
Attribution 3.0 Unported License. For a summary of what this means,
please see:
http://creativecommons.org/licenses/by/3.0/deed.en_GB

