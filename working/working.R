# From Rothman's SABR piece on winning formulas: "Empirically, this formula correlates fairly well with a team’s observed (actual) winning percentage, W%"

# Bill James' "Pythagorean" formula

py <- function(rs, ra) {
  py <- ((rs^2)/((rs^2)+(ra^2)))*100
  return(py)
}

# where rs = team's runs scored, and ra = team's runs allowed
