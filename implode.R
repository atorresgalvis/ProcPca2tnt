## Function to join strings from a vector. Written in R language, adapted from PHP (http://www.w3schools.com/php/func_string_implode.asp)
implode <- function(..., sep='') {
    paste(..., collapse=sep)
}
