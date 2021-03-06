#' Validate JSON
#' 
#' Test if a string is a valid JSON string. Characters vectors will be collapsed into a single string.
#' 
#' @param txt JSON string
#' @export
#' @examples #Output from toJSON and serializeJSON should pass validation
#' myjson <- toJSON(mtcars)
#' validate(myjson) #TRUE
#' 
#' #Something bad happened
#' truncated <- substring(myjson, 1, 100)
#' validate(truncated) #FALSE
validate <- function(txt) {
  stopifnot(is.character(txt))
  txt <- paste(txt, collapse = "\n")
  .Call("R_isValidJSON", as.character(txt))
} 
