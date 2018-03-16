#' Calculates bases on balls per nine innings pitched (W/9)
#'
#' Computes bases on balls (walks) per nine innings pitched
#'@param bb Number of bases on balls
#'@param ip Number of innings pitched
#'@return bb9
#'@examples
#' bb9(35, 210)
#'@export
bb9 <- function(bb, ip) {
  bb9  <- (bb * 9) / ip
  return(bb9)
}

#' Calculates component earned run average
#'
#' Computes earned run average from hits and walks (compare with "era" which is the traditional formula for earned run average, "aera" which is a pitcher's adjusted earned run average, or "dice" which is the defense-independent component earned run average)
#'@param h Number of hits allowed
#'@param bb Number of bases on balls
#'@param hbp Number of hit batters
#'@param hr Number of home runs
#'@param ibb Number of intentional bases on balls
#'@param bfp Number of batters faced by pitcher
#'@param ip Number of innings pitched
#'@return erc
#'@examples
#' erc(110, 45, 10, 70, 5, 400, 215)
#'@export
erc <- function(h, bb, hbp, hr, ibb, bfp, ip) {
  erc  <- 9 * ((h + bb + hbp) * (0.89 * (1.255 * (h - hr) + 4 * hr) + 0.56 * (bb + hbp - ibb)) / (bfp * ip)) - 0.56
  return(erc)
}

#' Calculates defense-independent component earned run average
#'
#' Computes earned run average from hits and walks (compare with "era" which is the traditional formula for earned run average, "aera" which is a pitcher's adjusted earned run average, or "erc" which is the component earned run average)
#'@param bb Number of bases on balls
#'@param hbp Number of hit batters
#'@param hr Number of home runs
#'@param k Number of strikeouts
#'@param ip Number of innings pitched
#'@return dice
#'@examples
#' dice(45, 10, 60, 130, 400)
#'@export
dice <- function(bb, hbp, hr, k, ip) {
  dice  <- 3 + ((13 * hr) + (3 * (bb + hbp)) - (2 * k) / ip)
  return(dice)
}

#' Calculates earned run average
#'
#' Computes a pitcher's earned run average (compare with "erc" which is the component earned run average, "aera" which is a pitcher's adjusted earned run average, or "dice" which is the defense-independent component earned run average)
#'@param er Number of runs that did not occur as a result of errors or passed balls
#'@param ip Number of innings pitched
#'@return era
#'@examples
#' era(150, 400)
#'@export
era <- function(er, ip) {
  era  <- (er * 9) / ip
  return(era)
}

#' Calculates adjusted earned run average (ERA+)
#'
#' Computes adjusted earned run average accounting for park factor and league era (compare with "era" which is the traditional formula for earned run average, "erc" which is the component earned run average, or "dice" which is the defense-independent component earned run average)
#'@param er Number of runs that did not occur as a result of errors or passed balls
#'@param ip Number of innings pitched
#'@param lera Average league ERA
#'@param home_rs Number of pitcher's team runs scored at home park
#'@param home_ra Number of pitcher's team runs allowed at home park
#'@param home_r Total number of runs scored at home park
#'@param road_rs Number of pitcher's team runs scored at away park
#'@param road_ra Number of pitcher's team runs allowed at away park
#'@param road_r Total number of runs scored at away park
#'@return aera
#'@examples
#' aera(10, 5.5, 2.5, 8, 7, 15, 6, 4, 10) # for a pair of games (one away, one home)
#'@export
aera <- function(er, ip, lera, home_rs, home_ra, home_r, road_rs, road_ra, road_r) {
  aera  <- 100 * (2 - (((er * 9) / ip) / lera) * (1 / 100 * ((home_rs + home_ra / home_r) / (road_rs + road_ra / road_r))))
  return(aera)
}

#' Calculates fielding independent pitching
#'
#' Computes pitching performance statistic similar to ERA, but based on factors within the pitcher's control (compare with "dice" which is the defense-independent component earned run average)
#'@param hr Number of home runs
#'@param bb Number of bases on balls
#'@param k Number of strikeouts
#'@param ip Number of innings pitched
#'@return fip
#'@examples
#' fip(65, 50, 100, 175)
#'@export
fip <- function(hr, bb, k, ip) {
  fip  <- ((13 * hr) + (3 * bb) - (2 * k)) / ip
  return(fip)
}

#' Calculates hits per nine innings pitched (H/9IP)
#'
#' Computes hits per nine innings pitched
#'@param h Number of hits allowed
#'@param ip Number of innings pitched
#'@return h9
#'@examples
#' h9(150, 175)
#'@export
h9 <- function(h, ip) {
  h9  <- (h * 9) / ip
  return(h9)
}

#' Calculates strikeouts per nine innings pitched (K/9)
#'
#' Computes strikeouts per nine innings pitched
#'@param k Number of strikeouts
#'@param ip Number of innings pitched
#'@return k9
#'@examples
#' k9(105, 175)
#'@export
k9 <- function(k, ip) {
  k9  <- (k * 9) / ip
  return(k9)
}

#' Calculates strikeout to walk ratio (pitching)
#'
#' Computes strikeouts to walk ratio, based on number of strikeouts and number of walks  (for batting version, see "bb_k")
#'@param k Number of strikeouts
#'@param bb Number of bases on balls
#'@return k_bb
#'@examples
#' k_bb(105, 40)
#'@export
k_bb <- function(k, bb) {
  k_bb  <- (k / bb)
  return(k_bb)
}

#' Calculates batting average against
#'
#' Computes pitcher's ability to prevent hits, based on h, bfp, bb, hbp, sf, sh, and ci (catcher's interference)
#'@param h Number of hits allowed
#'@param bfp Number of batters facing pitcher
#'@param bb Number of bases on balls
#'@param hbp Number of hit batters
#'@param sh Number of sacrifice hits
#'@param sf Number of sacrifice flies
#'@param ci Number of catcher's interference
#'@return baa
#'@examples
#' baa(105, 250, 50, 15, 10, 5, 1)
#'@export
baa <- function(h, bfp, bb, hbp, sh, sf, ci) {
  baa  <- (h) / (bfp - bb - hbp - sh - sf - ci)
  return(baa)
}

#' Calculates power finesse ratio
#'
#' Computes pitcher's performance either by game or overall, based on k, bb, and ip
#'@param k Number of strikeouts
#'@param bb Number of bases on balls
#'@param ip Number of innings pitched
#'@return pfr
#'@examples
#' pfr(115, 30, 400)
#'@export
pfr <- function(k, bb, ip) {
  pfr  <- (k + bb) / ip
  return(pfr)
}

#' Calculates run average
#'
#' Computes pitcher's run average based on number of runs allowed and innings pitched
#'@param r Number of runs allowed
#'@param ip Number of innings pitched
#'@return ra
#'@examples
#' ra(75, 400)
#'@export
ra <- function(r, ip) {
  ra  <- (r * 9) / ip
  return(ra)
}

#' Calculates whiff rate
#'
#' Computes pitcher's ability to get a batter to swing and miss pitches over any period of time (e.g., in a single game, single season, career, etc.)
#'@param sw Number of swings and misses
#'@param tp Total pitches thrown
#'@return wr
#'@examples
#' wr(300, 750)
#'@export
wr <- function(sw, tp) {
  wr  <- (sw / tp)
  return(wr)
}

#' Calculates walks plus hits per innings pitched (WHIP)
#'
#' Computes walks plus hits per innings pitched, which reflects the number of baserunners allowed by a pitcher over a given period
#'@param bb Number of bases on balls
#'@param h Number of hits allowed
#'@param ip Number of innings pitched
#'@return whip
#'@examples
#' whip(50, 110, 425)
#'@export
whip <- function(bb, h, ip) {
  whip  <- (bb + h) / ip
  return(whip)
}

#' Calculates value over replacement player (pitching)
#'
#' Computes a pitcher's marginal utility
#'@param ip Number of innings pitched
#'@param lr Number of league runs
#'@param lg Number of league games played
#'@param r Number of runs
#'@return vorp
#'@examples
#' vorp(400, 98, 20, 110)
#'@export
vorp <- function(ip, lr, lg, r) {
  vorp  <- ip * (((lr / lg) + 1) - ((r * 9) / ip) / 9)
  return(vorp)
}
