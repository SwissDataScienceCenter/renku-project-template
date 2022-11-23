# RStudio Customisations

If you want sutomatically have your custom RStudio preferences applied to your RStudio server session you can alter the contents of the the `rstudio-prefs.json` file in this directory.
You will also need to uncomment the line in the Dockerfile that copies it to `/home/rstudio/.config/rstudio/rstudio-prefs.json`. 
When you change your global preferences in RStudio this file is altered on your system so you can copy your `~/.config/rstudio/rstudio-prefs.json` to .rstudio__config_dir in your Renku project to have your existing preferences applied by default.

NB for any windows users out there you can find this config file in %appdata%\RStudio

