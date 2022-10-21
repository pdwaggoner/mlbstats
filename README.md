# `mlbstats`: Major League Baseball Player Statistics Calculator

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/mlbstats)](http://cran.r-project.org/package=mlbstats)
[![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/mlbstats)](http://cranlogs.r-pkg.org/)
[![Documentation](https://img.shields.io/badge/documentation-mlbstats-orange.svg?colorB=E91E63)](https://www.r-pkg.org/pkg/mlbstats)
[![](https://img.shields.io/badge/CTV-SportsAnalytics-red)](https://cran.r-project.org/web/views/SportsAnalytics.html)


## Why should I use `mlbstats`?

This package is a player-level baseball statistics calculator. Similar to using `sum(2,2)` to perform the operation `2 + 2`, `mlbstats` allows for simple computation of a host of player-level metrics based on raw inputs. Common metrics from major league baseball (MLB) include batting, pitching, fielding, baserunning, and player-summary statistics. The goal of this package, then, is to provide an easy-to-use calculator to efficiently calculate player metrics based on raw, easily obtainable data. For some other metrics such as WAR, UZR, PWA, etc., see <https://www.baseball-reference.com/> or Bill James' sabermetrics guides.

Take a look at the package, along with many other excellent related packages, in the [Sports Analytics CRAN Task View](https://cran.r-project.org/web/views/SportsAnalytics.html). 

## How do I use `mlbstats`?

From the simplest calculations (e.g., batting average = number of hits / at bats) to complicated ones (e.g., a pitcher's component earned run average, calculated as, `9 * ((h + bb + hbp) * (0.89 * (1.255 * (h - hr) + 4 * hr) + 0.56 * (bb + hbp - ibb)) / (bfp * ip)) - 0.56)`), unique functions in `mlbstats` take unique values from player-level data, and return the desired metric.

## Installation

```{r }
install.packages("mlbstats")
library(mlbstats)
```

## Implementation

###### Jose Altuve's (Houston Astros Silver Slugger) 2017 Regular Season OBP (on-base percentage)

```{r }
obp(
  h = 204, # hits
  bb = 58, # walks
  hbp = 9, # hits by pitch
  ab = 590, # at bats
  sf = 4 # sacrifice flys
) 
```

[1] 0.4099849

Corroborate with the official MLB statistics, recording Altuve's 2017 regular season OBP as `0.410`. 

###### Chris Sale (Boston Red Sox Pitcher) 2017 Regular Season PFR (power finesse ratio)

```{r mlbstats}
pfr(
  k = 308, # strikeouts
  bb = 43, # walks
  ip = 214.1 # innings pitched
)
```

[1] 1.639421

## How do I get `mlbstats`?

Load the package (0.1.0) from [CRAN](https://CRAN.R-project.org/package=mlbstats). If you have any questions, find any bugs requiring fixing, or find metrics I left out, either open an [issue ticket](https://github.com/pdwaggoner/mlbstats/issues) or feel free to [reach out directly](https://pdwaggoner.github.io/). If you use the package for any published work, I would love to know!
