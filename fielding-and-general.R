#' Calculates fielding percentage
#'
#' Computes the fielding percentage (aka, fielding average), which reflects the percentage of proper ball handling
#'@param p Number of putouts
#'@param a Number of assists
#'@param e Number of errors
#'@return fp
#'@examples
#' fp(13, 4, 2)
#'@export
fp <- function(p, a, e) {
  fp  <- (p + a) / (p + a + e)
  return(fp)
}

#' Calculates range factor
#'
#' Computes the amount of the field covered by a player
#'@param p Number of putouts
#'@param a Number of assists
#'@param ip Number of innings played in a defensive position
#'@return rfa
#'@examples
#' rfa(20, 5, 450)
#'@export
rfa <- function(p, a, ip) {
  rfa  <- 9 * (p + a) / ip
  return(rfa)
}

#' Calculates total chances
#'
#' Computes the opportunities for defensive ball handling
#'@param p Number of putouts
#'@param a Number of assists
#'@param e Number of errors
#'@return tc
#'@examples
#' tc(11, 5, 5)
#'@export
tc <- function(p, a, e) {
  tc  <- (p + a + e)
  return(tc)
}

#' Calculates park factor
#'
#' Computes the runs a team scores at home versus away (it is often used in other metrics, e.g., adjusted era (ERA+) for pitchers; see "aera")
#'@param home_rs Number of pitcher's team runs scored at home park
#'@param home_ra Number of pitcher's team runs allowed at home park
#'@param home_r Total number of runs scored at home park
#'@param road_rs Number of pitcher's team runs scored at away park
#'@param road_ra Number of pitcher's team runs allowed at away park
#'@param road_r Total number of runs scored at away park
#'@return pafa
#'@examples
#' pafa(5, 6, 11, 4, 8, 12) # for a pair of games (one home, one away)
#'@export
pafa <- function(home_rs, home_ra, home_r, road_rs, road_ra, road_r) {
  pafa  <- 100 * ((home_rs + home_ra / home_r) / (road_rs + road_ra / road_r))
  return(pafa)
}

#' Calculates win ratio
#'
#' Computes a team's win ratio, which is used in the so-called "Pythagorean expectation"
#'@param rs Number of runs scored
#'@param ra Number of runs allowed
#'@return wra
#'@examples
#' wra(400, 301)
#'@export
wra <- function(rs, ra) {
  wra  <- (rs^2) / (rs^2 + ra^2)
  return(wra)
}
