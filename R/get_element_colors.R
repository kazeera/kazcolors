#' Get colors for a named vector based on a color palette.
#'
#' Get colors for a named vector based on a color ramp palette.
#'
#' @param v character vector. Unique elements to get colors for.
#' @param colRamp colorRampPalette functions object containing colors for palette. Use function get_col_palette() to create. See ?colorRampPalette .
#' @param rearr logical; should vector be arranged so a color gradient isn't created with the original vector order?
#' @examples
#' x <- LETTERS[1:6]
#' get_element_colors(x, get_col_palette("RdBu"))
#' get_element_colors(x, colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu")))
#' @return A character vector of colors with the same length as v. The names of this vector are the unique elements specified by v.
#' @export
get_element_colors <- function(v, colRamp, rearr = F) {
  # Get unique elements and rearrange
  v <- unique(v)
  # Rearrange
  if (rearr) {
    v <- sample(v)
  }
  # Get color gradient
  myColors <- colRamp(length(v))
  names(myColors) <- v
  # Return character vector of color names
  return(myColors)
}
