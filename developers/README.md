For Handout Document Developers
===============================
If you're creating new workshop documentation, you will probably want to clone
the handout-template repository, to provide you with access to the LaTeX style
files, and then make modifications from there.

You should first create an empty repository for which you have commit access. This
will become the home of your new workshop handout documentation. I will
assume this has been done on github and it's name is `${NEW_WORKSHOP_NAME}-handout`
and it is under the user/organisation name `${YOUR_GITHUB_USERNAME}`.

Next, clone the `handout-template` repository and reconfigure the `remotes` so you can:
* Commit your new workshop documentation to the empty repository you created above
* Merge in any template updates from this (`handout-template`) repository

```bash
# Clone the handout-template repository
NEW_WORKSHOP_NAME='ngs'
git clone https://github.com/BPA-CSIRO-Workshops/handout-template.git "${NEW_WORKSHOP_NAME}-handout"

# Change the origin to be an upstream - that way you can pull in changes from the handout-template repository
cd "${WORKSHOP_NAME}-handout"
git remote rename origin upstream

# Add a new origin, the repository you have commit access to:
git remote add origin git@github.com:${YOUR_GITHUB_USERNAME}/${NEW_WORKSHOP_NAME}-handout.git
git push -u origin master
```
Pulling in Changes from `handout-template`
==========================================
The beauty of having the `handout-template` set as an upstream, is that you can pull in changes
from that repository. i.e. The template files are managed in a single location. To pull in
changes from your origin and to also merge in any changes for the template files, simply:

```bash
# Pull/merge in the changes
git fetch origin
git fetch upstream
git merge upstream/master

# Fix up and commit any merge conflicts before pushing back to origin
git push
```
Github API
==========
There is an API for performing various github related activities, which are not possible through
the use of git alone. The command line tool is call `hub` and is available at https://hub.github.com/.
Think of "hub: makes git work better with github".

You can install it like this:

```bash
sudo apt-get install -y rake
git clone https://github.com/github/hub.git
cd hub
rake install prefix=$HOME/usr/local

# See the inline help
$HOME/usr/local/bin/hub
```
