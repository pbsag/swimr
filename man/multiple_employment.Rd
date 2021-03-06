% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/employment.R
\name{multiple_employment}
\alias{multiple_employment}
\title{Compare Employment by sector across multiple scenarios.}
\usage{
multiple_employment(dbset, db_names, ...)
}
\arguments{
\item{dbset}{A list of connections to SWIM databases.}

\item{db_names}{A character vector naming the scenarios.}

\item{...}{Arguments passed on to \code{extract_employment}
\describe{
  \item{db}{The scenario database.}
  \item{facet_var}{The variable in the zone table to facet by. Defaults to MPO}
  \item{facet_levels}{The levels of the facet variable to keep. Defaults to all
levels other than external stations.}
  \item{type_levels}{The types of employment to show in the plot.}
  \item{employment_categories}{[Optional] data_frame of employment aggregation categories;
if \code{NULL}, uses \code{\link{emp_types}}. Should have columns
\code{ACTIVITY} (full code of activity in AA databases) and \code{emp_type}.}
}}
}
\value{
a ggplot2 object.
}
\description{
Compare Employment by sector across multiple scenarios.
}
