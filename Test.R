What are repositories? A repository is a central location where many developed  ackages are located and available for download.

There are three big repositories:
  
  1. CRAN (Comprehensive R Archive Network): R’s main repository (>12,100 packages available!)
2. BioConductor: A repository mainly for bioinformatic-focused packages
3. GitHub: A very popular, open source repository (not R specific!)

Installing from CRAN

install.packages()
install.packages("ggplot2")
install.packages(c("ggplot2", "devtools", "lme4")) #install multiple packages at once

Installing from Bioconductor

source("https://bioconductor.org/biocLite.R") #get the basic functions required to install
biocLite(), ex: biocLite("GenomicFeatures")

Installing from GitHub

install.packages("devtools")
library(devtools)
install_github("author/package") replacing “author” and “package” with their GitHub username and the name of the package.

Checking what packages you have installed

installed.packages() or library() #with nothing between the parentheses to check!

Updating packages

old.packages() #check packages need an update
update.packages() #update all packages
install.packages("packagename") #update just one

Unloading packages

detach() #unload a given package; Ex: detach("package:ggplot2", unload=TRUE)

Uninstalling packages

remove.packages(); Ex: remove.packages("ggplot2")

How do you know what version of R you have?
  
  > version
> sessionInfor()

help(); Ex: help(package = "ggplot2")
browseVignettes(); Ex: browseVignettes("ggplot2") #see the vignettes included

Configuring Git

git config --global user.name "peterthai-dev"
git config --global user.email thaibaquoc@u.nus.edu
git config --list #check

Confirming Git user name and user email

config -> change -> exit

Linking RStudio and Git

Tools > Global Options > Git/SVN