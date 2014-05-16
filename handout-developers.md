For Workshop Developers
=======================
```bash
# Clone the handout-template repository
WORKSHOP_NAME='ngs'
git clone https://github.com/BioplatformsAustralia/handout-template.git "${WORKSHOP_NAME}-handout"

# Setup a new repository empty repository via the github website (or using the
# github API if you're keen).
# Configure the `origin` (the repo you'll push to) to be the new repository and
# the original template repo to be the `upstream` (where you'll fetch template
# updates from).
cd "${WORKSHOP_NAME}-handout"
git remote rename origin upstream
git remote add origin git@github.com:BioplatformsAustralia/ngs-handout.git
git push -u origin master
```

Updating the Template
=====================
For details see: https://help.github.com/articles/syncing-a-fork

You can either update the template files in your cloned repository. However,
those changes will be specific to your new repository. Instead, you should
change them in the original repository from which you performed the clone and
then pull those changes into the cloned repository.

To pull changes from the original handout-template repository simply:
```bash
# Grab the upstream changes
git fetch upstream
# Merge any changes into our local repository
git checkout master
git merge upstream/master
# Push the changes up to your cloned repository
git push
```

Using the Github API
====================
We'll setup `hub` a commandline tool for interacting with github via it's API.
```bash
sudo apt-get install -y rake
git clone https://github.com/github/hub.git
cd hub
rake install prefix=$HOME/usr/local
```
