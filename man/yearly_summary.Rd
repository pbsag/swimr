% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{yearly_summary}
\alias{yearly_summary}
\title{Make a yearly summary table of a land use variable}
\usage{
yearly_summary(df, group, var)
}
\arguments{
\item{df}{A \code{data_frame} of zones, such as is stored in the sqlite
database.}

\item{group}{The variable to use for grouping the zones (for instance,
  "County").}

\item{var}{The variable to sum (for instaance, "POPULATION")}
}
\value{
A \code{data_frame} with the grouping variable in each row, and the
value of the variable at each time stage going across the columns.
}
\description{
Make a yearly summary table of a land use variable
}
