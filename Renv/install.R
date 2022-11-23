# The renv library will be located on the docker image, in the /home/rstudio directory,
# yet it will use the renv.lock file located in the project's main directory to determine which dependencies to install.
setwd('/home/rstudio')
options(renv.consent = TRUE)
write("options(renv.consent = TRUE)", file="/home/rstudio/.Rprofile", append = TRUE)
renv::init(force = TRUE)
renv::restore(confirm = FALSE)

# Uncomment and adapt to install additional R dependencies.
# The installed packages will not be included in the project's renv.lock file
# unless you call renv::snapshot() and commit the changes.
# See README.md for a prefered way of installing R packages.

