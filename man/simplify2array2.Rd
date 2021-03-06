% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{simplify2array2}
\alias{simplify2array2}
\title{Mimics built-in simplify2array function.}
\usage{
simplify2array2(L, higher = TRUE)
}
\arguments{
\item{L}{- List of numeric vectors to convert}

\item{higher}{(optional) - not used in this implementation}
}
\value{
- matrix, vector or list
}
\description{
This function behaves as most similar
to simplify2array as possible.
If list contains vectors of length 1, returns vector.
If list contains vectors of the same length, returns matrix.
Otherwise returns not changed List.
}

