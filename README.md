UCDPtools
=============

Description
-------
The one stop shop for accessing and managing datasets from the Uppsala Conflict Data Program (UCDP). UCDPtools makes it easy to access UCDP datasets and their codebooks.

Accessing UCDP
-------
# Access the index of UCDP datasets.  Download the dataset on One-Sided violence and access the codebook.
```
data(UCDPindex)
browseURL(UCDPindex$codebook_link[UCDPindex$shortname=="One-Sided"])
onesided <- getUCDP("One-Sided")
```

Installing
-------
# Access UCDPtools using the devtools package
```
library(devtools)
install_github("tlscherer/UCDPtools")
library(UCDPtools)
```

Troubleshooting
-------
This package was created on Windows, it has not been tested on other platforms. On Windows, your computer requires PERL for parts of `getUCDP()`.

License
-------
GPL-3