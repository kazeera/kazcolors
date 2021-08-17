
# kazcolors

<!-- badges: start -->
<!-- badges: end -->

The goal of kazcolors is to quickly acquire color vectors (named palettes and colors for heatmaps/correlations/any scaled values) via the RColorBrewer package and colorRampPalette function. 

## Installation
You can install the latest version from Github:
``` r
devtools::install_github("kazeera/kazcolors", upgrade_dependencies = FALSE)
```

## How to Use 
Load package.
``` r
library(kazcolors)
library(dplyr)
```

Quick example. Link together.
``` r
get_col_pal("RdBu") %>%
  get_col_grad(n=3) %>%
  scales::show_col()
```
Note: use show_col() from scales package to show palette (vector of color HEX codes/names)

## 3 functions:
1. Get color palette in the form of colorRampPalette color interpolation functions. Use with get_col_gradient() or get_element_colors() from this package.
``` r
# Make a color palette of red to blue (RColorBrewer)
# The two lines of code below are equivalent
get_col_palette(brew_pal="RdBu")
colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu"))

# Reverse the palette (i.e. blue to red)
get_col_palette(brew_pal="RdBu", rev=T)

# Make a custom color palette of forestgreen to darkorchid4 (RColorBrewer)
# The two lines of code below are equivalent
get_col_palette(custom=c("forestgreen", "darkorchid4"))
colorRampPalette(c("forestgreen", "darkorchid4"))
```


2. Get color gradient for a colorRampPalette with n number of colors.
``` r
x <- LETTERS[1:6]

# The three lines of code below are equivalent
get_col_gradient(get_col_palette("RdBu"), 100)
get_col_palette("RdBu")(100)
colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu"))(100)
```


3. Get colors for a named vector based on a color palette.
``` r
x <- LETTERS[1:6]
get_element_colors(x, get_col_palette("RdBu"))
get_element_colors(x, colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu")))
```
