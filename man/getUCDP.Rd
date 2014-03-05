\name{getUCDP}
\alias{getUCDP}
\title{
Get UCDP datasets}
\description{
The one stop shop for accessing and managing datasets from the Uppsala Conflict Data Program (UCDP).
}
\usage{
getUCDP(dataset = "Armed", rawnames = FALSE, rawdata = FALSE, local.folder)
}
\arguments{
  \item{dataset}{character, specifies which UCDP dataset to load.  Must be one of the following 'shortnames' as listed in the dataset \code{UCDPindex}:
  \itemize{
  \item"Actor": Actor Dataset
  \item"Agreement": Peace Agreement Dataset
  \item"ArmedConflict": UCDP/PRIO Armed Conflict Dataset
  \item"BattleDeaths": Battle-Related Deaths Dataset
  \item"Categorical": Uppsala Conflict Database Categorial Variables
  \item"Dyadic": UCDP Dyadic Dataset
  \item"ExtSupport": UCDP External Support Data
  \item"GeorefEvents": UCDP Georeferenced Event Dataset
  \item"MIC": UCDP Managing Intrastate Conflict Africa Dataset
  \item"MILC": Managing Intrastate Low-intensity Conflict Dataset
  \item"Non-State": Non-State Conflict Dataset
  \item"One-Sided": One-sided Violenct Dataset
  \item"Onset": Onset of Intrastate Armed Conflict
  \item"TerminationConflict": UCDP Conflict Termination Dataset-conflict version
  \item"TerminationDyad": UCDP Conflict Termination Dataset-dyadic version}
  }
  \item{rawnames}{logical, if FALSE will make column names uniform using the list below:}
  \item{rawdata}{logical, if FALSE will make changes to the data to correct known errors.}
  \item{local.folder}{character, if specified, where zip files will be saved if necessary}
  \item{verbose}{logical, if FALSE it hides output comments}
}
\details{}
\value{Returns a single dataframe. Does not account for files with multiple dataframes (ie Categorical)}
\references{
\url{http://www.pcr.uu.se/research/ucdp/datasets/}
}
\author{
  Thomas Scherer \email{tscherer@princeton.edu}}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
armed <- getUCDP()
onesided <- getUCDP("One-Sided")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ UCDP }
\keyword{ dataset }% __ONLY ONE__ keyword per line

