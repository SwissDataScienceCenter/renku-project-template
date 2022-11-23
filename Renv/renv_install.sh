#!/bin/bash
echo "Installing renv" 1>&2
if [[ -f renv.lock ]]; then
    echo "renv.lock file detected" 1>&2
    # Get the version of R in the container
    R_VER=$(Rscript --vanilla -e "rv<-R.Version();cat(paste0(rv[['major']],'.',rv[['minor']]))")
    # Get the version of R in the renv lock file
    RENV_R_VER=$(cat renv.lock | jq -r '.R.Version')
    if [[ $R_VER != $RENV_R_VER ]]; then
        echo "Container has R v$R_VER installed but renv.lock is expecting R v$RENV_R_VER" 1>&2
        exit 1
    fi
    # Get the version of Renv used from the renv lock file
    RENV_VERSION=$(cat renv.lock | jq -r '.Packages.renv.Version')
    # set the possible CRAN source packge download URLS
    # The current version of a package has a different path to the archived past versions
    # Current
    RENV_URL_CURRENT=$(printf "https://cran.r-project.org/src/contrib/renv_%s.tar.gz" $RENV_VERSION)
    # Archived
    RENV_URL_ARCHIVE=$(printf "https://cran.r-project.org/src/contrib/00Archive/renv/renv_%s.tar.gz" $RENV_VERSION)
    # Check if our version is the current one, if so install it, if not look in the archive
    if curl --output /dev/null --silent --head --fail "$RENV_URL_CURRENT"; then
        Rscript --vanilla -e "install.packages('$RENV_URL_CURRENT', repos = NULL, type = 'source', dependencies = TRUE)"
        echo "installed renv v$RENV_VERSION" 1>&2
    else
        Rscript --vanilla -e "install.packages('$RENV_URL_ARCHIVE', repos = NULL, type = 'source', dependencies = TRUE)"
        echo "installed renv v$RENV_VERSION" 1>&2
    fi
fi
