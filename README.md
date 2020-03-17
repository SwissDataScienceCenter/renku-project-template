# renku-project-template
A repository to hold template files for new Renku projects to be used on project creation by the Renku clients. The next sections outline what
different files in the template are used for.


## For running interactive environments from Renkulab
```
Dockerfile
----------
File for building a docker image that you can launch from renkulab to work on your project in the cloud; template-supplied contents will allow you to launch an interactive environment from renkulab, with pre-installed renku CLI & sw dependencies that you put into your `requirements.txt`, `environment.yml`, or `install.R`; you can and should add to this Dockerfile if libraries you install require linux sw installations as well; for more information see: https://github.com/SwissDataScienceCenter/renkulab-docker

.gitlab-ci.yml
--------------
Configuration for running gitlab CI, which builds a docker image out of the project on `git push` to renkulab so that you can launch your interactive environment (don't remove, but can modify to add extra CI functionality)

.dockerignore
-------------
Files and directories to be excluded from docker build (you can append to this list); https://docs.docker.com/engine/reference/builder/#dockerignore-file
```

## For managing sw dependencies
```
environment.yml
---------------
Required by template's Dockerfile; add your python conda dependencies here

requirements.txt
----------------
Required by template's Dockerfile; add your python pip dependencies here

install.R
---------
Required by template's Dockerfile FOR R-BASED PROJECTS only

```

## For the landing page for your project
```
README.md
---------
Edit this file to provide information about your own project.
Initial contents explain how to use a renku project.
```

## For renku CLI

```
.renku
------
Directory containing renku metadata that renku commands update (caution: don't update this manually)
```

## For organizing project files
```
data
----
Initially empty directory where `renku dataset` creates subdirectories for your named datasets and the files you add to those datasets (if you haven't or will not be creating renku datasets, you can remove this directory)

notebooks
---------
Initially empty directory to help you organize jupyter notebooks (remove if you'd like! no dependencies)
```

## For git to ignore
```
.gitignore
----------
Files and directories to be excluded from git repository (this template only requires the #renku section, but the others are nice-to-haves for common paths to ignore)
```
