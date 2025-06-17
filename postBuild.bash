#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it

# Install IRkernel and register it with Jupyter
Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source', repos='http://cran.rstudio.com/')"
Rscript -e "IRkernel::installspec(user = FALSE)"

# Set default R library path for user installs (optional but good practice)
mkdir -p ~/.R/library
chmod -R 777 ~/.R/library
echo "export R_LIBS_USER=~/.R/library" >> ~/.bashrc
