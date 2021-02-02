#' Get color names from unique groups in data frame
#'
#' @param df A data frame with the columns of interest
#' @param ann_cols The columns of interest (get colors for)
#' @param pal A named list. Existing colors in palette
#' @return A vector with color names from unique groups in data frame
#' @export
get_ann_colors <- function(df, ann_cols, pal = "") {
  pal2 <- lapply(ann_cols, function(c) {
    elem <- unique(df[, c])
    # If any colors exist in palette
    pal2 <- pal[names(pal) %in% elem]
    
    color_exists <- elem %in% names(pal)
    # Otherwise get new element colors (random)
    if (any(!color_exists)) {
      # If the max number of elements exceeds the max brewer palette, then use custom gradient
      if (all(length(elem[!color_exists]) > brewer.pal.info$maxcolors)) {
        colRamp <- get_col_palette(custom = c("forestgreen", "darkorchid4"))
      } else {
        # Get colors from a random palette from RColorBrewer
        repeat{
          palette <- brewer.pal.info %>%
            rownames() %>%
            sample(size = 1) # RColorBrewer and dplyr
          # Exit do-while loop when the max number of colors (max 12) in palette can accommodate all unique elements
          if (brewer.pal.info[palette, "maxcolors"] >= length(elem)) {
            break
          }
        }
        colRamp <- get_col_palette(palette)
      }
      # Get colors of elements
      pal2 <- c(pal2, get_element_colors(elem[!color_exists], colRamp, rearr = T))
    }
    # Return named list
    unlist(pal2, use.names = T)
  })
  names(pal2) <- ann_cols
  # Return new palette
  return(pal2)
}