# renku-project-template
A repository to hold template files for new Renku projects to be used on project
creation by the Renku clients. The next sections outline what different files in
the template are used for.


## For running interactive environments from Renkulab

`Dockerfile` - File for building a docker image that you can launch from renkulab,
to work on your project in the cloud. Template-supplied contents will allow you to
launch an interactive environment from renkulab, with pre-installed renku CLI and
software dependencies that you put into your `requirements.txt`, `environment.yml`,
or `install.R`. You can and should add to this `Dockerfile` if libraries you install
require linux software installations as well; for more information see:
 https://github.com/SwissDataScienceCenter/renkulab-docker.

`.gitlab-ci.yml` - Configuration for running gitlab CI, which builds a docker image
out of the project on `git push` to renkulab so that you can launch your interactive
 environment (don't remove, but you can modify to add extra CI functionality).

`.dockerignore` - Files and directories to be excluded from docker build (you can
  append to this list); https://docs.docker.com/engine/reference/builder/#dockerignore-file.


## For managing software dependencies

`requirements.txt` - Required by template's Dockerfile; add your python pip
dependencies here.

`environment.yml` - Required by template's Dockerfile; add your python conda
dependencies here.

`install.R` - Required by template's Dockerfile (for r-based projects only).

## For the landing page for your project

`README.md` - Edit this file to provide information about your own project.
Initial contents explain how to use a renku project.

## For renku CLI

`.renku` - Directory containing renku metadata that renku commands update
(caution: don't update this manually).

`.renkulfsignore` - File similar to [.gitignore](https://git-scm.com/docs/gitignore)
for telling renku to NOT store listed files in git LFS. By default, `renku`
commands (like `renku run` and `renku dataset`) store outputs in
[git LFS](https://git-lfs.github.com/) to prevent accidentally committing large
files to git. However, sometimes:

* an imported dataset will come with code (e.g. `*.py`)
* a code file (like `*.ipynb`) will be generated from
  a `renku run` (e.g. with [papermill](https://papermill.readthedocs.io/en/latest/))
* a generated or imported file will be small enough (e.g. <1mb) that you want to use
  `git diff` to view changes, or view the file in the renku UI.

In these cases you can list files in the `.renkulfsignore` file to treat those
files like normal repo files when calling `renku` commands, untracked by git LFS.

## For organizing project files

`data` - Initially empty directory where `renku dataset` creates subdirectories
for your named datasets and the files you add to those datasets (if you haven't
or will not be creating renku datasets, you can remove this directory).

`notebooks` - Initially empty directory to help you organize jupyter notebooks
(not a requirement, you can remove this directory).

## For git to ignore

`.gitignore` - Files and directories to be excluded from git repository (this
  template only requires the #renku section, but the others are nice-to-haves
  for common paths to ignore).
