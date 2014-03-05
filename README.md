UCDPtools
=============

Description
-------
The one stop shop for accessing and managing datasets from the Uppsala Conflict Data Program (UCDP). UCDPtools makes it easy to access UCDP datasets and their codebooks.

Troubleshooting
-------
This package was created on Windows, it has not been tested on other platforms. On Windows, your computer requires PERL for parts of \code{getUCDP()}.

Example
-------
# Access UCDPtools using the devtools package
\code{
library(devtools)
install_github("tlscherer/UCDPtools")
library(UCDPtools)
}
# Access the index of UCDP datasets.  Download the dataset on One-Sided violence and access the codebook.
\code{
data(UCDPindex)
browseURL(UCDPindex$codebook_link[UCDPindex$shortname=="One-Sided"])
onesided <- getUCDP("One-Sided")
}
Contact
-------
Email Thomas Leo Scherer if you find errors or have ideas: tscherer (@) princeton.edu

License
-------
GPL-3