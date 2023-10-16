# {{ name }}
{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}
## Introduction

This is a Renku project - basically a git repository with some
bells and whistles. You'll find we have already created some
useful things like `data` and `notebooks` directories and
a `Dockerfile`.

Please note that the image in this template is pinned. Which means that the sessions
launched will always use the same image and the image will not be rebuilt on every commit.

To build a new image and pin this new image, do the following:
1. Tag the desired commit with a tag that starts with `X.X.X` where `X` is 
one or more numbers in the range from 0 to 9. For example `0.1.0` or
`0.0.1-test` are valid tags whereas `something-0.0.1` or `latest` are not.
2. Wait for the image to be built and published after the tag is pushed to Gitlab.
3. Update the pinned image to the newly built image through the Renkulab UI or 
through the CLI.

**NOTE:** Do **NOT** reuse the same tag for different images. This can cause different
versions of the image with the same tag to be cached in different places causing you to
have the correct image sometimes and sometimes having an image with the old contents.
Purging an image from these caches is not possible without intervention from an Admin.
If you accidentally use the wrong tag then do not re-use that tag - simply come up with a 
different one. The easiest and recommended way do create a new tag is to increment one of
the numbers in the version at the beginning of the tag name following the 
[Semantic versioning (semver) guidelines](https://semver.org/).

## Working with the project

The simplest way to start your project is right from the Renku
platform - just click on the `Sessions` tab and start a new session.
This will start an interactive environment right in your browser.

To work with the project anywhere outside the Renku platform,
click the `Settings` tab where you will find the
git repo URLs - use `git` to clone the project on whichever machine you want.

### Changing interactive session dependencies

This project just uses the base Renku image with Python and Jupyterlab and it does
not install any Python packages in the image. In addition the project pins
the image so that always the same image is used to launch sessions and it
does not rebuild the image on every commit. Instead the image is built on tag
that starts with the string `X.X.X` with `X` being one or more number in the range
from 0 to 9. It is expected that the user should modify the image if they want
to include any additional dependencies and that they will install the Python
dependencies once a session starts.

## Project configuration

Project options can be found in `.renku/renku.ini`. In this
project there is currently only two options, one specifies the image to be
used for every session launch and other specifies the default type of environment to open, 
in this case `/lab` for JupyterLab. You may also choose `/tree` to get to the "classic" Jupyter
interface.

## Moving forward

Once you feel at home with your project, we recommend that you replace
this README file with your own project documentation! Happy data wrangling!
