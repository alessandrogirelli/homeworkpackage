#' Draw development of multiple names
#'
#' @param name_vector vector of names to be drawn
#'
#' @import prenoms
#' @import dplyr
#' @import ggplot2
#' @import assertthat
#'
#' @return The ggplot of names
#' @export
#'
#' @examples
#' draw_names(c("Alessandro","Claire"))

draw_names <- function(name_vector){
  assert_that(is.character(name_vector))

  tmp <- prenoms::prenoms %>%
    filter(name %in% name_vector) %>%
    group_by(year,name) %>%
    summarize(n=sum(n)) %>%
    ggplot(aes(x=year,y=n, color=name)) +
    geom_line() +
    theme_gdocs()

  return(tmp)
}
