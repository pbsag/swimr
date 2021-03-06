% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zone_leaflet.R
\name{change_popup}
\alias{change_popup}
\title{Build change popup tag for leaflet}
\usage{
change_popup(shp, var, year1, year2)
}
\arguments{
\item{shp}{An object of class \code{SpatialPolygonsDataFrame} with the
plotting fields already appended.}

\item{var}{Variable to create popup tag for (e.g., \code{"pop"})}

\item{year1}{The first year}

\item{year2}{The second year}
}
\description{
Build change popup tag for leaflet
}
