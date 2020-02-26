#' @title Mean weighted absolute deviance (MWAD)
#' @description This function calculates MWAD for a given numeric vector and target.
#' @param x A \code{numeric} vector for which the MWAD should be computed.
#' @param weights A \code{numeric} vector of the same length as  \code{x} with weights. Default is
#'   NULL (no weights).
#' @param target A \code{numeric} value with the target from which the distance should be measured.
#' @return A \code{numeric} with MWAD.
#' @seealso \code{\link[firstPack]{CalculateMWAD}}
#' @examples
#' x <- 1:3
#' res <- secondPack::MWAD(x)
#'
#' expect_true(TRUE)
#' @export
#'
MWAD <- function(x, weights = NULL, target = 1L) {
  if (is.null(weights)) {
    weights <- 1.0 / length(x)
  } else {
    weights <- weights / sum(weights)
  }
  return(sum(weights * abs(x - target)))
}
