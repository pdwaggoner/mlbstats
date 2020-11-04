#' Calculates at bats per home run
#'
#' Takes number of at bats and divides by number of home runs
#'@param ab Number of at bats
#'@param hr Number of home runs
#'@return ab_hr
#'@examples
#' ab_hr(400, 25)
#'@export
ab_hr <- function(ab, hr) {
  ab_hr <- (ab/hr)
  return(ab_hr)
}

#' Calculates batting average
#'
#' Takes number of hits and divides by at bats. 1.000 (read ``one-thousand" is perfect)
#'@param h Number of hits
#'@param ab Number of at bats
#'@return ba
#'@examples
#' ba(200, 525)
#'@export
ba <- function(h, ab) {
  ba <- (h/ab)
  return(ba)
}

#' Calculates batting average on balls in play
#'
#' Generates the frequency a batter reaches a base after putting the ball in play (normal around .300)
#'@param h Number of hits
#'@param hr Number of home runs
#'@param ab Number of at bats
#'@param k Number of strikeouts
#'@param sf Number of sacrifice flies
#'@return babip
#'@examples
#' babip(200, 25, 525, 55, 6)
#'@export
babip <- function(h, hr, ab, k, sf) {
  babip <- (h-hr)/(ab-k-hr+sf)
  return(babip)
}

#' Calculates walk to strikeout ratio (batting)
#'
#' Takes the number of bases on balls and divides by number of strikeouts (for pitching version, see "k_bb")
#'@param bb Number of bases on balls
#'@param k Number of strikeouts
#'@return bb_k
#'@examples
#' bb_k(65, 125)
#'@export
bb_k <- function(bb, k) {
  bb_k  <- (bb/k)
  return(bb_k)
}

#' Calculates the base runs estimator
#'
#' Takes the number of hits, bases on balls, home runs, total bases, and at bats to compute the base runs estimator, which is similar to runs created
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param hr Number of home runs
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param ab Number of at bats
#'@return BsR
#'@examples
#' BsR(135, 22, 12, 155, 330)
#'@export
BsR <- function(h, bb, hr, tb, ab) {
  BsR  <- (((h + bb - hr) * ((1.4 * tb - .6 * h - 3 * hr + .1 * bb) * 1.02)) / (((1.4 * tb - .6 * h - 3 * hr + .1 * bb) * 1.02) + (ab - h))) + hr
  return(BsR)
}

#' Calculates equivalent average
#'
#' Takes the number of hits, total bases, bases on balls, hits by pitch, stolen bases, sacrifice hits, sacrifice flies, at bats, and caught stealing to compute the base runs, which is a player's batting average absent park and league effects
#'@param h Number of hits
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param bb Number of bases on balls
#'@param hbp Number of hits by pitch
#'@param sb Number of stolen bases
#'@param sh Number of sacrifice hits (typically bunts)
#'@param sf Number of sacrifice flies
#'@param ab Number of at bats
#'@param cs Number of caught stealing
#'@return EqA
#'@examples
#' EqA(135, 155, 22, 3, 15, 4, 2, 365, 1)
#'@export
EqA <- function(h, tb, bb, hbp, sb, sh, sf, ab, cs) {
  EqA  <- ((h + tb + 1.5*(bb + hbp) + sb + sh + sf) / (ab + bb + hbp + sh + sf + cs + sb/3))
  return(EqA)
}

#' Calculates ground outs-fly outs ratio (GO/AO)
#'
#' Takes the number of ground ball outs and divides by number of fly ball outs to compute the GO/AO ratio
#'@param go Number of ground ball outs
#'@param ao Number of fly ball outs
#'@return go_ao
#'@examples
#' go_ao(150, 88)
#'@export
go_ao <- function(go, ao) {
  go_ao  <- (go/ao)
  return(go_ao)
}

#' Calculates gross production average
#'
#' Computes the gross production average, which is 1.8 times on-base percentage (OBP) plus slugging percentage (SLG), divided by four
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param hbp Number of hits by pitch
#'@param ab Number of at bats
#'@param sf Number of sacrifice flies
#'@param b1 Number of singles
#'@param b2 Number of doubles
#'@param b3 Number of triples
#'@param hr Number of home runs
#'@return gpa
#'@examples
#' gpa(150, 40, 2, 400, 5, 100, 40, 3, 7)
#'@export
gpa <- function(h, bb, hbp, ab, sf, b1, b2, b3, hr) {
  gpa  <- 1.8*((h + bb + hbp) / (ab + bb + hbp + sf)) + (((b1) + (2*b2) + (3*b3) + (4*hr)) / ab) / 4
  return(gpa)
}

#' Calculates on-base percentage
#'
#' Computes the on-base percentage based on number of hits, bases on balls, hits by pitch, at bats, and sacrifice flies
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param hbp Number of hits by pitch
#'@param ab Number of at bats
#'@param sf Number of sacrifice flies
#'@return obp
#'@examples
#' obp(150, 40, 2, 400, 5)
#'@export
obp <- function(h, bb, hbp, ab, sf) {
  obp  <- (h + bb + hbp) / (ab + bb + hbp + sf)
  return(obp)
}

#' Calculates slugging percentage
#'
#' Computes the slugging percentage (SLG), based on the weighted number of singles, doubles, triples, home runs, and at bats
#'@param b1 Number of singles
#'@param b2 Number of doubles
#'@param b3 Number of triples
#'@param hr Number of home runs
#'@param ab Number of at bats
#'@return slg
#'@examples
#' slg(100, 40, 3, 7, 350)
#'@export
slg <- function(b1, b2, b3, hr, ab) {
  slg  <- ((b1) + (2*b2) + (3*b3) + (4*hr)) / ab
  return(slg)
}

#' Calculates isolated power
#'
#' Computes isolated power, which is a player's ability to obtain extra bases from a hit. The statistic subtracts a hitter's batting average from the slugging percentage, with the maximum ISO being 3.000.
#'@param b1 Number of singles
#'@param b2 Number of doubles
#'@param b3 Number of triples
#'@param hr Number of home runs
#'@param ab Number of at bats
#'@param h Number of hits
#'@return iso
#'@examples
#' iso(100, 40, 3, 7, 350, 150)
#'@export
iso <- function(b1, b2, b3, hr, ab, h) {
  iso  <- (((b1) + (2*b2) + (3*b3) + (4*hr)) / ab) - (h/ab)
  return(iso)
}

#' Calculates on-base plus slugging
#'
#' Computes the on-base percentage plus slugging average (OPS) based on number of hits, bases on balls, hits by pitch, at bats, sacrifice flies, and total weighted bases (represented individually, as in SLG and GPA calculations)
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param hbp Number of hits by pitch
#'@param ab Number of at bats
#'@param sf Number of sacrifice flies
#'@param b1 Number of singles
#'@param b2 Number of doubles
#'@param b3 Number of triples
#'@param hr Number of home runs
#'@return ops
#'@examples
#' ops(200, 18, 4, 401, 4, 50, 20, 3, 13)
#'@export
ops <- function(h, bb, hbp, ab, sf, b1, b2, b3, hr) {
  ops  <- ((h + bb + hbp) / (ab + bb + hbp + sf)) + (((b1) + (2*b2) + (3*b3) + (4*hr)) / ab)
  return(ops)
}

#' Calculates plate appearances per strikeout (PA/SO)
#'
#' Computes the number of times a hitter strikes out in relation to their plate appearances
#'@param pa Number of plate appearances
#'@param so Number of strikeouts
#'@return pa_so
#'@examples
#' pa_so(450, 120)
#'@export
pa_so <- function(pa, so) {
  pa_so  <- (pa/so)
  return(pa_so)
}

#' Calculates runs created
#'
#' Computes the basic version of the estimated runs a hitter creates or contributes (see also "rc2" for the 'stolen base' iteration and "rc3" for the technical iteration of the rc statistic)
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param ab Number of at bats
#'@return rc
#'@examples
#' rc(150, 35, 165, 400)
#'@export
rc <- function(h, bb, tb, ab) {
  rc  <- ((h + bb) * tb) / (ab + bb)
  return(rc)
}

#' Calculates runs created accounting for stolen bases
#'
#' Computes the estimated runs a hitter creates or contributes, accounting for base stealing (see also "rc" for the basic iteration and "rc3" for the technical iteration of the rc statistic)
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param ab Number of at bats
#'@param cs Number of stolen bases caught
#'@param sb Number of stolen bases
#'@return rc2
#'@examples
#' rc2(150, 35, 165, 400, 7, 9)
#'@export
rc2 <- function(h, bb, tb, ab, cs, sb) {
  rc2  <- ((h + bb - cs) * (tb + (.55 * sb))) / (ab + bb)
  return(rc2)
}

#' Calculates runs created accounting for all offensive indicators
#'
#' Computes the technical iteration of estimated runs a hitter creates or contributes accounting for virtually all offensive indicators (see also "rc" for the basic iteration and "rc2" for the 'stolen base' iteration of the rc statistic)
#'@param h Number of hits
#'@param bb Number of bases on balls
#'@param ibb Number of intentional bases on balls
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param ab Number of at bats
#'@param cs Number of stolen bases caught
#'@param sb Number of stolen bases
#'@param hbp Number of hits by pitch
#'@param gidp Number of grounded into double play
#'@param sh Number of sacrifice hits
#'@param sf Number of sacrifice flies
#'@return rc3
#'@examples
#' rc3(150, 35, 3, 165, 400, 7, 9, 5, 1, 6, 2)
#'@export
rc3 <- function(h, bb, ibb, tb, ab, cs, sb, hbp, gidp, sh, sf) {
  rc3  <- ((h + bb - cs + hbp - gidp) * (tb + (.26 * (bb - ibb + hbp))) + (.52 * (sh + sf + sb))) / (ab + bb + hbp + sh + sf)
  return(rc3)
}

#' Calculates runs produced
#'
#' Computes the number of runs contributed by a hitter, based on runs, runs batted in, and home runs
#'@param r Number of runs
#'@param rbi Number of runs batted in
#'@param hr Number of home runs
#'@return rp
#'@examples
#' rp(70, 41, 22)
#'@export
rp <- function(r, rbi, hr) {
  rp  <- (r + rbi - hr)
  return(rp)
}

#' Calculates batting average with runners in scoring position
#'
#' Computes batting average accounting for runners in scoring position
#'@param hrisp Number of hits with runners in scoring position (on either 2nd or 3rd base)
#'@param abrisp Number of at bats with runners in scoring position (on either 2nd or 3rd base)
#'@return risp
#'@examples
#' risp(35, 120)
#'@export
risp <- function(hrisp, abrisp) {
  risp  <- (hrisp / abrisp)
  return(risp)
}

#' Calculates total average
#'
#' Computes overall offensive contribution of a single player
#'@param tb Number of total bases (one for 1B, two for 2B, three for 3B, and four for HR)
#'@param hbp Number of hits by pitch
#'@param bb Number of bases on balls
#'@param sb Number of stolen bases
#'@param ab Number of at bats
#'@param h Number of hits
#'@param cs Number of caught stealing
#'@param gidp Number of grounded into double play
#'@return ta
#'@examples
#' ta(125, 11, 40, 10, 400, 105, 2, 6)
#'@export
ta <- function(tb, hbp, bb, sb, ab, h, cs, gidp) {
  ta  <- (tb + hbp + bb + sb) / (ab - h + cs + gidp)
  return(ta)
}

#' Calculates times on base
#'
#' Computes total times a player reaches a base by adding h, hbp, and bb
#'@param h Number of hits
#'@param hbp Number of hits by pitch
#'@param bb Number of bases on balls
#'@return tob
#'@examples
#' tob(234, 6, 24)
#'@export
tob <- function(h, hbp, bb) {
  tob  <- (h + hbp + bb)
  return(tob)
}

#' Calculates extra base hits
#'
#' Computes total hits by a player greater than singles (1B) by adding 2B, 3B, and hr
#'@param b2 Number of doubles
#'@param b3 Number of triples
#'@param hr Number of home runs
#'@return xbh
#'@examples
#' xbh(20, 18, 4)
#'@export
xbh <- function(b2, b3, hr) {
  xbh  <- (b2 + b3 + hr)
  return(xbh)
}
