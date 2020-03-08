#' @title Mean weighted absolute distance for data columns
#' @description This function returns MWAD for all columns in \code{data} specified by
#'   \code{lossRatioColumns}.
#' @param data a data.table
#' @param lossRatioColumns a \code{character} vector with loss ratio columns
#' @param weights a \code{character} specifying column name with weights. Default is NULL.
#' @return data.table
#' @seealso \code{\link[secondPack]{MWAD}}
#' @examples
#' data <- data.table::data.table(col1 = seq(0.8, 1.2, 0.1), col2 = rnorm(5, 1, 0.1),
#'                                ekspo = runif(5))
#' res <- firstPack::CalculateMWAD(data, lossRatioColumns = c("col1", "col2"), weights = "ekspo")
#' @import data.table
#' @importFrom secondPack MWAD
#' @importFrom futile.logger flog.debug
#' @export
#'
CalculateMWAD <- function(data, lossRatioColumns, weights = NULL) {
  flog.debug("Calculating MWAD.")
  if (!is.null(weights)) {
    results <- data[, lapply(.SD, MWAD, weights = get(weights)), .SDcols = lossRatioColumns]
  } else {
    results <- data[, lapply(.SD, MWAD), .SDcols = lossRatioColumns]
  }
  return(results)
}
