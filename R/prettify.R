#' Prettify adds indentation to a \code{JSON} string; minify removes all indentation/whitespace.
#' 
#' @rdname prettify
#' @title Prettify or minify a \code{JSON} string
#' @name prettify, minify
#' @aliases minify prettify
#' @export prettify minify
#' @param txt JSON string
#' @examples myjson <- toJSON(cars)
#' cat(myjson)
#' cat(prettify(myjson))
#' cat(minify(myjson))
prettify <- function(txt) {
  txt <- paste(as.character(txt), collapse = "\n")
  enc <- mapEncoding(Encoding(txt))
  ans <- .Call("R_jsonPrettyPrint", txt, enc)
  structure(ans, class="json")
} 

#' @rdname prettify
minify <- function(txt) {
  txt <- paste(as.character(txt), collapse = "\n")
  enc <- mapEncoding(Encoding(txt))
  ans <- .Call("R_jsonMiniPrint", txt, enc)
  structure(ans, class="json")
}


