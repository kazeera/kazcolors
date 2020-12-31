#' Get color gradient 
#' 
#' Get color gradient for a colorRampPalette with n number of colors.
#' 
#' @param colRamp colorRampPalette functions object containing colors for palette. Use function get_col_palette() to create.
#' @param n numeric. Number of colors in gradient
#' @examples 
#' x <- LETTERS[1:6]
#' # The three lines of code below are equivalent 
#' get_col_gradient(get_col_palette("RdBu"), 100)
#' get_col_palette("RdBu")(100)
#' colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu"))(100)
#' @return A character vector, names of colors (hex).
#' @export
get_col_gradient <- function(colRamp, n=50){
  # Create and return gradient
  colRamp(n)
}
