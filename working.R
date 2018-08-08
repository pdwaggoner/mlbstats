# Taken from Rothman's SABR piece on winning formulas: 
#``Empirically, this formula correlates fairly well with a team’s observed (actual) winning percentage, W%''
# Bill James' "Pythagorean" formula

w <- ((rs^2)/((rs^2)+(ra^2)))*100
