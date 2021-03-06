
# Download and Install SWIMR Resources including Dependencies
# Matt Landis, matt.landis@rsginc.com, 11 Mar 2019

#Set repository
local({currentRepo <- getOption("repos")
currentRepo["CRAN"] <- "https://cloud.r-project.org/"
options(repos = currentRepo)
})

# CRAN packages
cat("\nInstalling dependencies\n")
pkgs <- c(
    "dbplyr",    # Not installed
    "devtools",
    "digest",   # 0.6.10
    "dplyr",    # 0.5.0
    "DT",       # not installed
    "ggplot2",  # 2.2.0
    "kfigr",
    "knitr",
    "leaflet",
    "plotly",
    "purrr",      # 0.2.2
    "readr",      # 1.0.0
    "rmarkdown",
    "RSQLite",    #1.0.0
    "sf",
    "tibble",     # 1.2
    "tidyr"       # 0.6.0
    "tidyverse",  # 1.0.0
    "zoo")        # 1.7.13
installed <- installed.packages()[, "Package"]

for ( p in pkgs ){
    if( !(p %in% installed) ) install.packages(p)
}

# Bioconductor dependency for omxr
source("http://bioconductor.org/biocLite.R")
pkgs <- c("rhdf5", "zlibbioc")    # 2.18.0 and 1.20.0
for ( p in pkgs ){
    if ( !(p %in% installed) ) biocLite(p)
}

# Github packages
devtools::install_github("gregmacfarlane/omxr")   # 0.2.1
devtools::install_github("skranz/dplyrExtras")    #
devtools::install_github("pbsag/outviz")          # 0.0.2
devtools::install_github("landisrm/swimr", dependencies=FALSE)

#Download the SWIMR repository
#
# #SWIMR GitHub repository location settings
# host <- "https://api.github.com/repos/" #github
# repo <- "landisrm/swimr"          #repository
# ref  <- "master"                        #branch, such as master or develop
# destfile <- "SWIMR.zip"
# destdir <- "/home/rstudio/swimr"
# cat("\nDownloading repository to", destdir, "\n")
# request <- httr::GET(paste0(host, repo, "zipball/", ref))
# if(httr::status_code(request) >= 400){
# 	stop("\nError downloading the repository\n")
# }
# writeBin(httr::content(request, "raw"), destfile)
# unzip(zipfile = destfile, exdir = destdir)
# destdir <- normalizePath(file.path(destdir, grep("swimr", list.files(destdir), value=TRUE, ignore.case=TRUE)))
# cat("\nFinished downloading repository\n")
# cat(paste0("\n","Download directory: ", destdir, "\n"))
#
# #Install the required VE framework package
# cat("\nInstalling swimr\n")
# devtools::install_local(normalizePath(file.path(destdir)),
#                         force=TRUE, upgrade=TRUE)

#Install complete
cat("\nInstall complete.  All required packages installed at: \n")
for (folder in .libPaths()) {
  cat(paste0(folder,"\n"))
}
