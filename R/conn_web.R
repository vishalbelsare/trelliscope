#' Initialize a Web Connection
#'
#' Initialize a connection to a web server where Shiny apps are served.
#'
#' @param user the username to log on to the web server
#' @param ip the IP address of the web server - if \code{NULL}, it is assumed that your web server is on the same machine that you are working on
#' @param serverDir the directory where Shiny apps go on the web server - defaults to the default location of /srv/shiny-server
#' @param name the name of the directory in \code{serverDir} under which to store the application - if not supplied, it defaults to the name provided in the vdb connection
#'
#' @seealso \code{\link{webSync}}
#' @example man-roxygen/ex-webSync.R
#' @export
webConn <- function(
  user = NULL,
  ip = NULL,
  serverDir = "/srv/shiny-server",
  name = NULL
) {
  if(is.null(name)) {
    message("* Name not provided - attempting to use name in vdbConn")
    name <- getOption("vdbConn")$name
    if(is.null(name))
      stop("Web connection name not specified and VDB connection does not have a name - couldn't determine a name for the web connection.", call. = FALSE)
  }

  res <- structure(list(
    user = user,
    ip = ip,
    serverDir = serverDir,
    name = name
  ), class = "vdbWebConn")
  options(vdbWebConn = res)
  res
}

