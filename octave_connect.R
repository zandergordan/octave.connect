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
  code <- paste(options$code, collapse = '\n')
  # prefix the code with the string to load the data
  code <- paste(a, code, collapse = '\n')
  
  # define octave path for system call
  octave_path <- "C:\\Users\\alexander.gordan\\AppData\\Local\\Programs\\GNU Octave\\Octave-6.1.0\\mingw64\\bin\\octave"
  
  # Make system call
  out  <- system2(
  octave_path, c('--eval', shQuote(code)), stdout = TRUE
  )
  
  # format output
  knitr::engine_output(options, code, out)
})
