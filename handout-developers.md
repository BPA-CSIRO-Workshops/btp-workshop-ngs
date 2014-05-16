For Handout Document Developers
===============================
If you're creating new workshop documentation, you will probably want to clone
the handout-template repository to provide you with access to the LaTeX style
files.

Before, you proceed, you should first create an empty repository
which will become the home of your new workshop handout documentation. I will
assume this has been done on github and it's name is `${NEW_WORKSHOP_NAME}-handout`

You will now clone the `handout-template` repository and reconfigure it so you
will be able to:
* Commit changes to the empty repository you created above. i.e. this is where all your new workshop documentation will reside.
* Fetch any template updates into your new workshop documentation. i.e. the handout-template will be the central place to maintain the style files and will be easily propegated to your new workshop documentation

```bash
# Clone the handout-template repository
NEW_WORKSHOP_NAME='ngs'
git clone https://github.com/BioplatformsAustralia/handout-template.git "${NEW_WORKSHOP_NAME}-handout"

cd "${WORKSHOP_NAME}-handout"
git remote rename origin upstream
git remote add origin git@github.com:BioplatformsAustralia/ngs-handout.git
git push -u origin master
```

Updating the Template
=====================
You could update the template files in your `${NEW_WORKSHOP_NAME}-handout` repository. However,
those changes will be specific to your new workshop documentation. If you want consistent
styling across multiple workshop documents, you should instead make changes in the
original `handout-template` repository and then pull those changes into the cloned repository.

If changes have been made in the original `handout-template` repository, then you can merge these
changes into your `${NEW_WORKSHOP_NAME}-handout` repository simply by doing the following:

```bash
# Grab the upstream changes from the original repository
git fetch upstream
# Merge any changes into the local repository of your workshop documentation
git checkout master
git merge upstream/master
# Push the changes up to your new workshop documentation repository residing on github
git push
```

For details see: https://help.github.com/articles/syncing-a-fork

Using the Github API
====================
If you're interested in using the github API, you can use `hub`.

```bash
sudo apt-get install -y rake
git clone https://github.com/github/hub.git
cd hub
rake install prefix=$HOME/usr/local
```

For details see: https://hub.github.com/ and https://hub.github.com/hub.1.html
