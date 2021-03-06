% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repair_draws.R
\name{repair_draws}
\alias{repair_draws}
\alias{repair_draws.draws_matrix}
\alias{repair_draws.draws_array}
\alias{repair_draws.draws_df}
\alias{repair_draws.draws_list}
\title{Repair indices of \code{draws} objects}
\usage{
repair_draws(x, order = TRUE, ...)

\method{repair_draws}{draws_matrix}(x, order = TRUE, ...)

\method{repair_draws}{draws_array}(x, order = TRUE, ...)

\method{repair_draws}{draws_df}(x, order = TRUE, ...)

\method{repair_draws}{draws_list}(x, order = TRUE, ...)
}
\arguments{
\item{x}{An \R object for which the methods are defined.}

\item{order}{Logical; Indicates if draws should be ordered (via
\code{\link{order_draws}}) before reparing indices. Defaults to \code{TRUE}.}

\item{...}{Arguments passed to individual methods (if applicable).}
}
\description{
Repair indices of \code{draws} objects so that iterations, chains, and draws
are continuously and consistently numbered.
}
\examples{
x <- as_draws_array(example_draws())
# manually select some iterations and chains
(x <- x[10:5, 3:4, ])
# repair iteration and chain indices
repair_draws(x)

}
