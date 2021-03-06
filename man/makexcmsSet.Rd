% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internalProcessing.R
\name{makexcmsSet}
\alias{makexcmsSet}
\title{Convert peaklist from envipick to a xcmxSet to remove isotopes}
\usage{
makexcmsSet(envipick_object, files, pD, polarity)
}
\arguments{
\item{envipick_object}{output of mzpick function from enviPick}

\item{files}{.mzXML file path}

\item{pD}{phenoData}

\item{polarity}{positive or negative}
}
\value{
xcmsSet
}
\description{
Convert peaklist from envipick to a xcmxSet to remove isotopes.
}
\author{
M Isabel Alcoriza-Balaguer <maialba@alumni.uv.es>
}
\keyword{internal}
