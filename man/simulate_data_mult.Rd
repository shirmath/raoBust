% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_data_mult.R
\name{simulate_data_mult}
\alias{simulate_data_mult}
\title{Simulate multinomial data under the null (strong or weak) or alternative}
\usage{
simulate_data_mult(
  nn,
  null = TRUE,
  strong = FALSE,
  alt_magnitude = 1,
  jj = 5,
  ms = 10000,
  jj_null = NULL,
  Beta = NULL,
  sd_beta0s = NULL,
  sd_beta1s = NULL,
  overdispersion = 0,
  covariate = NULL
)
}
\arguments{
\item{nn}{Number of observations}

\item{null}{If TRUE will simulate under the null, if FALSE will simulate under the alternative}

\item{strong}{If null is TRUE, simulate under the strong null? Defaults to FALSE (simulate under the weak null)}

\item{alt_magnitude}{The mean of each parameter in the beta1 vector if null = FALSE. Defaults to \eqn{1}.}

\item{jj}{Number of taxa}

\item{ms}{Number of counts per sample}

\item{jj_null}{For the weak null, which taxon should be null}

\item{Beta}{User-specified value of the true beta (if you wish to draw from a fixed beta rather than generate beta0's and beta1's).}

\item{sd_beta0s}{The beta0's are drawn from a normal distribution with mean zero. This is the standard deviation of that distribution.}

\item{sd_beta1s}{The beta1's are drawn from a normal distribution with mean zero under the null or non-zero under the alternative. This is the standard deviation of that distribution.}

\item{overdispersion}{An additional normal random variable can be added to the link function to add dispersion above a multinomial distribution. This is the standard aviation for that normal variable. Useful for confirming error rate control under model misspecification.}

\item{covariate}{An optional covariate vector, if not provided the covariate will be a sequence of increasing values from 0 to 1.}
}
\description{
By default, \eqn{p = 2} with a single Uniform(0,1) continuous covariate.
}
\author{
Amy Willis
}
