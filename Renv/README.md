# {{ name }}
{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}
## Introduction

This is a Renku project - basically a git repository with some
bells and whistles. You'll find we have already created some
useful things like `data` and `notebooks` directories and
a `Dockerfile`.

## Working with the project

The simplest way to start your project is right from the Renku
platform - just click on the `Environments` tab and start a new session.
This will start an interactive environment right in your browser.

To work with the project anywhere outside the Renku platform,
click the `Settings` tab where you will find the
git repo URLs - use `git` to clone the project on whichever machine you want.

### Changing interactive environment dependencies

Initially we install a very minimal set of packages to keep the images small.
However, you can add python and conda packages in `requirements.txt` (pip)  and `environment.yml` (conda). 

#### {Renv} based R package managment

With this project template R packages are managed differently using the {[Renv](https://rstudio.github.io/renv/articles/renv.html)} package for project specific R package management.
The main advantage of using Renv in this context is to make your R environment reprodicible down to the package versions. 
You also get Renv's unified interface to CRAN, Bioc and github package installation.
Baseline knowledge of {[Renv](https://rstudio.github.io/renv/articles/renv.html)} is assumed, check out their documentation to learn how to use {[Renv](https://rstudio.github.io/renv/articles/renv.html)}.
This repo can be used just like the ordinary R template except that the installed packages and their version are set by {Renv} in `renv.lock` and `install.R` now just uses {Renv}'s tools to install all the packages in the lock file during the Docker image build.

Updating the `renv.lock` file can now be done with Renv's standard approaches in an interactive session and the changes to the lock file committed as usual.
For example you might run `renv::install("aPackage")`, use `aPackage` in your code somewhere and then update the lockfile to include this package with: `renv::snapshop()` and commit the changes in the lock file to git.
Then the next time `renv::restore()` is run in `install.R` during the image build and the new package will be installed in the image.

It is heavily based / substantially copied from this github repository: https://github.com/auwerxlab/renku-r-template


If you need more fine-grained control over your environment, please see [the documentation](https://renku.readthedocs.io/en/latest/user/advanced_interfaces.html#dockerfile-modifications).

## Project configuration

Project options can be found in `.renku/renku.ini`. In this
project there is currently only one option, which specifies
the default type of environment to open, in this case `/rstudio`.

## Moving forward

Once you feel at home with your project, we recommend that you replace
this README file with your own project documentation! Happy data wrangling!
