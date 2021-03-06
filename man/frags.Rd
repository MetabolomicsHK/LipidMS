% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal.R
\name{frags}
\alias{frags}
\title{Search for fragments of interest withing a list of coeluting fragments}
\usage{
frags(df, ppm, db, mdiff, charge, n)
}
\arguments{
\item{df}{data frame containing coeluting fragments}

\item{ppm}{mass tolerance}

\item{db}{database (data frame with two columns) where to look into}

\item{charge}{mdiff}
}
\value{
Data frame containing matched ions information
}
\description{
Given a set of coeluting fragments, this function searches for matches within
a database. It is used by identification functions to extract fragments of
interest based on the fragmentation patterns of each class of lipid.
}
\author{
M Isabel Alcoriza-Balaguer <maialba@alumni.uv.es>
}
\keyword{internal}
