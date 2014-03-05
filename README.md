UCDPtools
=============

Description
-------
The one stop shop for accessing and managing datasets from the Uppsala Conflict Data Program (UCDP). UCDPtools makes it easy to access UCDP datasets and their codebooks. 

Future iterations will have the datasets with different units, for example a year-actor version of "ArmedConflict" with a conflict count.

Accessing UCDP
-------
Access the index of UCDP datasets, directly open codebooks, and load datasets with options to fix variable names and obvious data mistakes.

```
data(UCDPindex)
browseURL(UCDPindex$codebook_link[UCDPindex$shortname=="One-Sided"])
onesided <- getUCDP("One-Sided", rawdata=TRUE, rawnames=TRUE)
```

Installing
-------
Access UCDPtools using the devtools package. Note, on Windows you must have PERL for parts of `getUCDP()`. 

```
library(devtools)
install_github("tlscherer/UCDPtools")
library(UCDPtools)
```

Troubleshooting
-------
This package was created on Windows, it has not been tested on other platforms. Please contact tlscherer if you find errors or have ideas to improve it.

