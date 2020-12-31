#' Get color palette in the form of colorRampPalette functions.
#'
#' Get color palette in the form of colorRampPalette color interpolation functions. Use with get_col_gradient() or get_element_colors() from this package.
#'
#' @param brew_pal character string  or NA. Exact name of RColorBrewer palette. e.g. "RdBu".
#' @param custom  Na or character vector with colors specifying palette order. e.g. c("red", "white", "blue"). Any hex codes or R colors (see colors()) can be used.
#' @param rev logical; should the brew_pal color palette order be reversed?
#' @details Only one of the parameters (brew_pal or custom) must be specified (not NA), otherwise function will use custom only.
#' @examples
#' # Make a color palette of red to blue (RColorBrewer)
#' # The two lines of code below are equivalent
#' get_col_palette(brew_pal="RdBu")
#' colorRampPalette(RColorBrewer::brewer.pal(9, "RdBu"))
#' #' # Reverse the palette (i.e. blue to red)
#' get_col_palette(brew_pal="RdBu", rev=T)
#'
#' # Make a custom color palette of forestgreen to darkorchid4 (RColorBrewer)
#' # The two lines of code below are equivalent
#' get_col_palette(custom=c("forestgreen", "darkorchid4"))
#' colorRampPalette(c("forestgreen", "darkorchid4"))
#'
#' @seealso colorRampPalette function from {grDevices}. See ?colorRampPalette.
#' @return A colorRampPalette color interpolation functions.
#' @export
get_col_palette <- function(brew_pal=NA, custom=NA, rev=F){
  # If colors for palette aren't specified, return warning message
  if(is.na(brew_pal) & is.na(custom)){
    stop("Please specify either 'brew_pal' or 'custom'.")
  }

  # Get custom palette based on vector of colors
  if(!is.na(custom)) {
    colorRampPalette(custom)    #c(low_col, high_col))
  }

  # Get RColorBrewer palette
  if(!is.na(brew_pal)){
    # Get max colors of palette
    max_n <- brewer.pal.info$maxcolors[grep(brew_pal, rownames(brewer.pal.info))]
    # Create brewer pal
    # Reverse if required
    if(rev){
      brew <- rev(brewer.pal(n = max_n, name = brew_pal))
    }else{
      brew <- brewer.pal(n = max_n, name = brew_pal)
    }
    # Return palette
    colorRampPalette(brew)
  }
}
