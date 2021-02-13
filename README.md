
<!-- README.md is generated from README.Rmd. Please edit that file -->

# octave.connect

<!-- badges: start -->
<!-- badges: end -->

This package defines a [knitr
engine](https://bookdown.org/yihui/rmarkdown-cookbook/custom-engine.html)
that connects to [Octave](https://www.gnu.org/software/octave/) and
passes it a command defining an array based on an R array.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("zandergordan/octave.connect")
```

## Example

Here is a basic example of using the package. First, anywhere in your
rmarkdown file (typically in the `setup`) chunk:

``` r
library(octave.connect)
octave_connect("C:\\Users\\alexander.gordan\\AppData\\Local\\Programs\\GNU Octave\\Octave-6.1.0\\mingw64\\bin\\octave")
```

Then, define an R array:

``` r
example_array <- array(data = 1:16, dim = c(4,4))
example_array
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    5    9   13
#> [2,]    2    6   10   14
#> [3,]    3    7   11   15
#> [4,]    4    8   12   16
```

And now we can use an `octave_connect` chunk to do things with the array
in Octave (to view the full syntax, look at `README.rmd` instead of the
rendered `README.md`):

``` octave_connect
sum(example_array)
#> ans =
#> 
#>    10   26   42   58
```
