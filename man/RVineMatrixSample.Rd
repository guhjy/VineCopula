% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RVineMatrixSample.R
\name{RVineMatrixSample}
\alias{RVineMatrixSample}
\title{Randomv sampling of R-Vine matices}
\usage{
RVineMatrixSample(d, size = 1, naturalOrder = FALSE)
}
\arguments{
\item{d}{Dimension of the R-Vine matrices.}

\item{size}{Number of matrices to sample.}

\item{naturalOrder}{Should the matrices be in the natural order
(default: \code{naturalOrder = FALSE}).}
}
\value{
A list of length \code{size} with each element containing one
R-Vine matrix.
}
\description{
Sample R-Vine matrices based on the algorithm of Joe et al. (2011).
}
\note{
For some reason, our implementaion of Joe et al.'s algorithm always
returns a star in the first tree. To fix this, we sample a vine matrix of
dimension d + 1 and remove the first tree afterwards
}
\examples{
# Matrix and sample sizes
d <- 10
size <- 5

# Sample R-vine matrices
RVM <- RVineMatrixSample(d, size)
sapply(RVM, RVineMatrixCheck)

# Sample R-vine matrices in the natural order
RVM <- RVineMatrixSample(d, size, naturalOrder = TRUE)
sapply(RVM, RVineMatrixCheck)

}
\references{
Joe H, Cooke RM and Kurowicka D (2011). Regular vines:
generation algorithm and number of equivalence classes. In Dependence
Modeling: Vine Copula Handbook, pp 219--231. World Scientific, Singapore.
}
\seealso{
\code{\link{RVineMatrix}}, \code{\link{RVineMatrixCheck}}
}
\author{
Thibault Vatter
}
