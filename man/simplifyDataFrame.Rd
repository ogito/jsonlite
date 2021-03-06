\name{simplifyDataFrame}
\alias{simplifyDataFrame}
\title{Convert a list of records into a dataframe}
\usage{
simplifyDataFrame(recordlist, columns, flatten)
}
\arguments{
  \item{recordlist}{a list of named lists representing
  records (rows).}

  \item{columns}{character vector with names of the fields
  to extract. Optional but recommended when available.}

  \item{flatten}{automatically unlist nested lists within
  the records.}
}
\description{
A helper function to convert a list with records, which are
common in JSON datasets, into a dataframe.
}
\details{
Data frames in R are colum based, but most data sets in
JSON are provided in a row-based format; i.e. an array of
key-value pairs. For example
\url{https://api.github.com/users/hadley/repos}. This
function converts a collection of records into a data
frame. The input is a list of lists, as it would be
returned by \code{fromJSON} without any simplification.

The \code{column} argument is a vector specifying which
fields (list elements) need to be extracted and turned data
frame columns. These columns are then guaranteed to be in
the output data frame, even in the case when none of
records contained this field. If this argument is not
specified, each unique field appearing in any of the
records will used. Note that this can lead to very large
data frames with lots of \code{NA} values when the data
contains different fields for each record.

Finally, something that is common in the case of JSON
datasets is that records have again lists nested in them.
The \code{flatten} argument can be used to control how to
deal with these cases. When set to \code{TRUE}, they will
be unlisted and turn into several columns.
}
\examples{
\dontrun{
library(httr)
res <- GET('https://api.github.com/users/hadley/repos')
obj <- fromJSON(rawToChar(res$content))
mydf1 <- simplifyDataFrame(obj, flatten=FALSE)
mydf2 <- simplifyDataFrame(obj, flatten=TRUE)
}
}

