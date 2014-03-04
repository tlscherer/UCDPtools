\name{UCDPindex}
\alias{UCDPindex}
\docType{data}
\title{
UCDP dataset index
}
\description{
Dataframe that lists UCDP datasets along with links to the website, data, and codebook for each.  Updated 3/3/2014.
}
\usage{data(index)}
\format{
  A data frame with 15 observations on the following 5 variables.
  \itemize{
    \item \code{shortname}: string, one word name used in getUCDP()
    \item \code{fullname}: string, full name of UCDP dataset
    \item \code{home_site} string, home URL for dataset
    \item \code{data_link} string, direct URL address for dataset
    \item \code{codebook_link} string, URL address for dataset codebook
  }
}
\details{
The main UCDP website is at \url{http://www.pcr.uu.se/research/ucdp/datasets/}.
}
\source{
}
\references{
}
\examples{
## add index to workspace

data(index)

## observe shortnames of datasets

index$shortname

## open the codebook for the Armed Conflict dataset

browseURL(index$codebook_link[index$shortname=="ArmedConflict"])
}
\keyword{datasets}

