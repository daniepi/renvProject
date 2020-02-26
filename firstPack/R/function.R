#' @title Sum of two columns
#' @description Summing two columns of data
#' @param data a data.table
#' @param col1 first col
#' @param col2 second col
#' @return data.table
#' @import data.table
#' @export
#'
dtSUM <- function(data, col1, col2) {
    data[, ("sum") := get(col1) + get(col2)]
    return(data)
}
