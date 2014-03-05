\name{UCDPtools-package}
\alias{UCDPtools-package}
\docType{package}
\title{
Toolset for Uppsala Conflict Data Program (UCDP)
}
\description{
The one stop shop for accessing and managing datasets from the Uppsala Conflict Data Program (UCDP).
}
\details{
\tabular{ll}{
Package: \tab UCDPtools\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-01-26\cr
License: \tab GPL-3\cr
}
This package uses gdata, which requires perl. Perl can be installed from http://strawberryperl.com/. 
}
\author{
  Thomas Scherer \email{tscherer@princeton.edu}}
\references{
  \url{http://www.pcr.uu.se/research/ucdp/datasets/}}
\keyword{ package }
\keyword{ UCDP }
\keyword{ conflict }
\seealso{
}
\examples{

## Download the "UCDP One-sided Violence Dataset v 1.4-2013, 1989-2012" and open the codebook.

data(UCDPindex)
browseURL(UCDPindex$codebook_link[UCDPindex$shortname=="One-Sided"])
onesided <- getUCDP("One-Sided")

}