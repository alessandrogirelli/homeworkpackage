#' Multiple excel sheets
#'
#' @param file_name full path including file name
#'
#' @import readxl
#' @import assertthat
#'
#' @return list dataframes of excel sheets of a xlsx file
#' @export
#'
#' @examples
#' \dontrun{
#'  multi_excel("..")
#' }

multi_excel <- function(excel_file_name){
  assert_that(is.dir(dirname(excel_file_name)))
  assert_that(is.readable(excel_file_name))
  assert_that(has_extension(excel_file_name,"xlsx"))

  file_sheets <- lapply(excel_sheets(excel_file_name), read_excel, path=excel_file_name)
  return(file_sheets)
}
