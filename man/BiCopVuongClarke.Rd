% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BiCopVuongClarke.R
\name{BiCopVuongClarke}
\alias{BiCopVuongClarke}
\title{Scoring Goodness-of-Fit Test based on Vuong And Clarke Tests for Bivariate
Copula Data}
\usage{
BiCopVuongClarke(u1, u2, familyset = NA, correction = FALSE, level = 0.05,
  rotations = TRUE)
}
\arguments{
\item{u1, u2}{Data vectors of equal length with values in [0,1].}

\item{familyset}{An integer vector of bivariate copula families under
consideration, i.e., which are compared in the goodness-of-fit test.  If
\code{familyset = NA} (default), all possible families are compared.
Possible families are: \cr
\code{0} = independence copula \cr
\code{1} = Gaussian copula \cr
\code{2} = Student t copula (t-copula) \cr
\code{3} = Clayton copula \cr
\code{4} = Gumbel copula \cr
\code{5} = Frank copula \cr
\code{6} = Joe copula \cr
\code{7} = BB1 copula \cr
\code{8} = BB6 copula \cr
\code{9} = BB7 copula \cr
\code{10} = BB8 copula \cr
\code{13} = rotated Clayton copula (180 degrees; ``survival Clayton'') \cr
\code{14} = rotated Gumbel copula (180 degrees; ``survival Gumbel'') \cr
\code{16} = rotated Joe copula (180 degrees; ``survival Joe'') \cr
\code{17} = rotated BB1 copula (180 degrees; ``survival BB1'')\cr
\code{18} = rotated BB6 copula (180 degrees; ``survival BB6'')\cr
\code{19} = rotated BB7 copula (180 degrees; ``survival BB7'')\cr
\code{20} = rotated BB8 copula (180 degrees; ``survival BB8'')\cr
\code{23} = rotated Clayton copula (90 degrees) \cr
\code{24} = rotated Gumbel copula (90 degrees) \cr
\code{26} = rotated Joe copula (90 degrees) \cr
\code{27} = rotated BB1 copula (90 degrees) \cr
\code{28} = rotated BB6 copula (90 degrees) \cr
\code{29} = rotated BB7 copula (90 degrees) \cr
\code{30} = rotated BB8 copula (90 degrees) \cr
\code{33} = rotated Clayton copula (270 degrees) \cr
\code{34} = rotated Gumbel copula (270 degrees) \cr
\code{36} = rotated Joe copula (270 degrees) \cr
\code{37} = rotated BB1 copula (270 degrees) \cr
\code{38} = rotated BB6 copula (270 degrees) \cr
\code{39} = rotated BB7 copula (270 degrees) \cr
\code{40} = rotated BB8 copula (270 degrees) \cr
\code{104} = Tawn type 1 copula \cr
\code{114} = rotated Tawn type 1 copula (180 degrees) \cr
\code{124} = rotated Tawn type 1 copula (90 degrees) \cr
\code{134} = rotated Tawn type 1 copula (270 degrees) \cr
\code{204} = Tawn type 2 copula \cr
\code{214} = rotated Tawn type 2 copula (180 degrees) \cr
\code{224} = rotated Tawn type 2 copula (90 degrees) \cr
\code{234} = rotated Tawn type 2 copula (270 degrees) \cr}

\item{correction}{Correction for the number of parameters.  Possible
choices: \code{correction = FALSE} (no correction; default), \code{"Akaike"}
and \code{"Schwarz"}.}

\item{level}{Numerical; significance level of the tests (default:
\code{level = 0.05}).}

\item{rotations}{If \code{TRUE}, all rotations of the families in
\code{familyset} are included (or substracted).}
}
\value{
A matrix with Vuong test scores in the first and Clarke test scores
in the second row. Column names correspond to bivariate copula families (see
above).
}
\description{
Based on the Vuong and Clarke tests this function computes a goodness-of-fit
score for each bivariate copula family under consideration. For each
possible pair of copula families the Vuong and the Clarke tests decides
which of the two families fits the given data best and assigns a score---pro
or contra a copula family---according to this decision.
}
\details{
The Vuong as well as the Clarke test compare two models against each other
and based on their null hypothesis, allow for a statistically significant
decision among the two models (see the documentations of
\code{\link{RVineVuongTest}} and \code{\link{RVineClarkeTest}} for
descriptions of the two tests). In the goodness-of-fit test proposed by
Belgorodski (2010) this is used for bivariate copula selection. It compares
a model 0 to all other possible models under consideration. If model 0 is
favored over another model, a score of "+1" is assigned and similarly a
score of "-1" if the other model is determined to be superior. No score is
assigned, if the respective test cannot discriminate between two models.
Both tests can be corrected for the numbers of parameters used in the
copulas. Either no correction (\code{correction = FALSE}), the Akaike
correction (\code{correction = "Akaike"}) or the parsimonious Schwarz
correction (\code{correction = "Schwarz"}) can be used.

The models compared here are bivariate parametric copulas and we would like
to determine which family fits the data better than the other families.
E.g., if we would like to test the hypothesis that the bivariate Gaussian
copula fits the data best, then we compare the Gaussian copula against all
other copulas under consideration. In doing so, we investigate the null
hypothesis "The Gaussian copula fits the data better than all other copulas
under consideration", which corresponds to \eqn{k-1} times the hypothesis
"The Gaussian copula \eqn{C_j} fits the data better than copula \eqn{C_i}"
for all \eqn{i=1,...,k, i\neq j}{i=1,...,k, i!=j}, where \eqn{k} is the
number of bivariate copula families under consideration (length of
\code{familyset}). This procedure is done not only for one family but for
all families under consideration, i.e., two scores, one based on the Vuong
and one based on the Clarke test, are returned for each bivariate copula
family. If used as a goodness-of-fit procedure, the family with the highest
score should be selected.

For more and detailed information about the goodness-of-fit test see
Belgorodski (2010).
}
\examples{
\dontshow{set.seed(123)}
# simulate from a t-copula
dat <- BiCopSim(500, 2, 0.7, 5)
\dontshow{dat <- dat[1:100, ]}

# apply the test for families 1-6
BiCopVuongClarke(dat[,1], dat[,2], familyset = 1:6)

}
\references{
Belgorodski, N. (2010) Selecting pair-copula families for
regular vines with application to the multivariate analysis of European
stock market indices Diploma thesis, Technische Universitaet Muenchen.
\url{http://mediatum.ub.tum.de/?id=1079284}.

Clarke, K. A. (2007). A Simple Distribution-Free Test for Nonnested Model
Selection. Political Analysis, 15, 347-363.

Vuong, Q. H. (1989). Ratio tests for model selection and non-nested
hypotheses. Econometrica 57 (2), 307-333.
}
\seealso{
\code{\link{BiCopGofTest}}, \code{\link{RVineVuongTest}},
\code{\link{RVineClarkeTest}}, \code{\link{BiCopSelect}}
}
\author{
Ulf Schepsmeier, Eike Brechmann, Natalia Belgorodski
}
