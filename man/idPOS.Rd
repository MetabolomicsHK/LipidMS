% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/idPOS.R
\name{idPOS}
\alias{idPOS}
\title{Lipids annotation for ESI+}
\usage{
idPOS(MS1, MSMS1, MSMS2, ppm_precursor = 10, ppm_products = 10,
  rttol = 10, coelCutoff = 0.8, dbs)
}
\arguments{
\item{MS1}{list with two data frames cointaining all peaks from the full MS
function ("peaklist" data frame) and the raw MS scans data ("rawScans" data
frame). They must have four columns: m.z, RT (in seconds), int (intensity)
and peakID (link between both data frames). Output of \link{dataProcessing}
function. In case no coelution score needs to be applied, this argument can
be just the peaklist data frame.}

\item{MSMS1}{list with two data frames cointaining all peaks from the high
energy function ("peaklist" data frame) and the raw MS scans data ("rawScans"
data frame). They must have four columns: m.z, RT (in seconds), int (intensity)
and peakID (link between both data frames). Output of \link{dataProcessing}
function. In case no coelution score needs to be applied, this argument can
be just the peaklist data frame.}

\item{MSMS2}{list with two data frames cointaining all peaks from a second high
energy function ("peaklist" data frame) and the raw MS scans data ("rawScans"
data frame). They must have four columns: m.z, RT (in seconds), int (intensity)
and peakID (link between both data frames). Output of \link{dataProcessing}
function. In case no coelution score needs to be applied, this argument can
be just the peaklist data frame. Optional.}

\item{ppm_precursor}{mass tolerance for precursor ions. By default, 5 ppm.}

\item{ppm_products}{mass tolerance for product ions. By default, 10 ppm.}

\item{rttol}{total rt window for coelution between precursor and product
ions. By default, 3 seconds.}

\item{coelCutoff}{coelution score threshold between parent and fragment ions.
Only applied if rawData info is supplied. By default, 0.8.}

\item{dbs}{list of data bases required for annotation. By default, dbs
contains the required data frames based on the default fragmentation rules.
If these rules are modified, dbs may need to be supplied. See \link{createLipidDB}
and \link{assignDB}.}
}
\value{
The output is a list with 2 elements: 1) a data frame that shows: ID,
class of lipid, CDB (total number of carbons and double bounds), FA
composition (specific chains composition if it has been confirmed), mz, RT
(in seconds), I (intensity, which comes directly from de input), Adducts,
ppm (m.z error), confidenceLevel (Subclass, FA level, where chains are known
but not their positions, or FA position level) and PFCS (parent-fragment
coelution score mean of all fragments used for the identification).; and
2) the original MS1 peaklist with the annotations on it.
}
\description{
Lipids annotation based on fragmentation patterns for LC-MS/MS all-ions data
acquired in positive mode. This function compiles all functions writen for
ESI+ annotations.
}
\examples{
\donttest{
idPOS(MS1 = LipidMS::serum_pos_fullMS, MSMS1 = LipidMS::serum_pos_Ce20,
MSMS2 = LipidMS::serum_pos_Ce40)
}

}
\author{
M Isabel Alcoriza-Balaguer <maialba@alumni.uv.es>
}
