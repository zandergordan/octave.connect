#' Knitr Engine That Passes R Arrays to Octave
#'
#' It is important to provide the engine with the right path to the Octave binary.
#' On my Windows 10 machine with Octave 6.1.0, I use:
#' "C:/Users/zander/AppData/Local/Programs/GNU Octave/Octave-6.1.0/mingw64/bin/octave"
#'
#' @param octave_path This should be the path to your local Octave binary or batch file.
#'
#' @export
#'
octave_connect = function(octave_path) {

  knitr::knit_engines$set(octave_connect = function(options) {

    # get r_array
    if (!is.null(options$r_array)) {
      r_array <- get(options$r_array)
    }
    # turn r_array content into comma-separated string
    r_array_string <- paste(r_array, collapse = ',')
    # turn r_array shape into comma-separated string
    r_array_shape <- paste(dim(r_array), collapse = ',')
    # Create an Octave reshape command to load the data from r_array
    a <- paste0(options$r_array, "=reshape([", r_array_string, "],", r_array_shape, ");")

    # combine source code to be fed to the system call
    code <- paste(options$code, collapse = ';')
    # prefix the code with the string to load the data
    code <- paste(c(a, code), collapse = ';')

    # Make system call
    out  <- system2(
    octave_path, paste('--eval', shQuote(code)), stdout = TRUE, stderr = TRUE
    )

    # format output
    knitr::engine_output(options, options$code, out)
  })
}
