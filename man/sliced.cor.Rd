% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cor.R
\name{sliced.cor}
\alias{sliced.cor}
\title{Constructs very large correlation matrices}
\usage{
sliced.cor(dataframe, nblocks, cmethod, verbose, ...)
}
\arguments{
\item{dataframe}{A data frame object}

\item{nblocks}{Number of blocks}

\item{cmethod}{Correlation method}

\item{verbose}{TRUE or FALSE}
}
\value{
A virtual matrix
}
\description{
Cuts the large data frames into slices, calculates correlations, and combines them back.
             It makes possible that constructing very large correlation matrices on limited system resources.
}
\details{
Function: sliced.write
}
\author{
Samet Tenekeci
}
