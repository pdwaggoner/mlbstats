#' Calculates stolen base attempts
#'
#' Computes total attempts to steal a base, by adding sb and cs
#'@param sb Number of stolen bases
#'@param cs Number of caught stealing
#'@return sba
#'@examples
#' sba(20, 4)
#'@export
sba <- function(sb, cs) {
  sba  <- (sb + cs)
  return(sba)
}

#' Calculates stolen base success rate
#'
#' Computes percentage of bases successfully stolen
#'@param sb Number of stolen bases
#'@param cs Number of caught stealing
#'@return sbsr
#'@examples
#' sbsr(20, 4)
#'@export
sbsr <- function(sb, cs) {
  sbsr  <- (sb) / (sb + cs)
  return(sbsr)
}
