octave\_connect
================
Zander Gordan
2/11/2021

The R script provided here defines a [knitr
engine](https://bookdown.org/yihui/rmarkdown-cookbook/custom-engine.html)
that connects to [Octave](https://www.gnu.org/software/octave/) and
passes it a command defining an array based on an R array.

``` r
source("octave_connect.R")
example_array <- array(data = 1:16, dim = c(4,4))
example_array
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    5    9   13
    ## [2,]    2    6   10   14
    ## [3,]    3    7   11   15
    ## [4,]    4    8   12   16

``` octave_connect
sum(example_array)
```

    ## ans =
    ## 
    ##    10   26   42   58

### Note

`octave_connect` feeds your code to Octave as a single string, with `;`
separating the lines. This means that only a single `ans =` can be
returned to knitr. If you place a `;` on the final line of your
`octave_connect` chunk, nothing will be printed to the chunk output.
However, if you are copying existing Octave code, do not worry about
deleting any `;` at the end of intermediate lines, as that is not
necessary.
