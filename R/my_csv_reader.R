#' read csv files
#'
#' @param dir_path directory from which the csv files are read
#'
#' @import assertthat
#' @return list of csv files
#'
#' @export
#'
#' @examples
#' \dontrun{
#' my_csv_reader("..")
#' }
my_csv_reader <- function(dir_path=getwd()){
  assert_that(is.dir(dirname(dir_path)))
  assert_that(is.readable(dirname(dir_path)))

  csvs <- list.files(path=dir_path, pattern="*\\.csv$",full.names = TRUE)
  csv_list <- lapply(csvs, read.csv)
  return(csv_list)
}
