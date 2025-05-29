#' A Custom ggplot2 Theme: theme_edge
#'
#' This function applies a custom theme to ggplot2 plots, featuring a
#' clean and bold aesthetic.
#'
#' @param base_size Base font size, given in pts.
#' @param base_family Base font family.
#'
#' @return A ggplot2 theme object.
#' @export
#' @importFrom ggplot2 theme_minimal theme element_text element_blank element_rect element_line margin "%+replace%"
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
#'   geom_point() +
#'   theme_edge() +
#'   labs(title = "Engine Displacement vs. Highway MPG",
#'        subtitle = "Styled with theme_edge")
#' }

theme_edge <- function() {
  
  theme_minimal() %+replace%
    
    theme(
      title = element_text(colour = "#23203F"),
      text = element_text(colour = "#23203F"),
      plot.title = element_text(size = rel(1.8), face = "bold", hjust = 0, margin = margin(b = 20)),
      plot.subtitle = element_text(size = rel(1.5), hjust = 0, margin = margin(b = 20)),
      plot.caption = element_text(hjust=1, size=rel(0.8)),
      axis.title.x = element_text(size = rel(1.3), face = "bold", margin = margin(t = 20, b = 10), hjust = 0.5),
      axis.title.y = element_text(size = rel(1.3), angle = 90, face = "bold", margin = margin(l = 15, r = 15)),
      axis.text = element_text(size = rel(1.2)),
      axis.line.y = element_blank(),
      axis.line.x = element_blank(),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = rel(1.2)),
      legend.background = element_blank(),
      legend.margin = margin(t = 5, b = 5),
      legend.direction = "horizontal",
      plot.margin = margin(t = 20, r = 20, b = 10, l = 0),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      strip.text = element_text(size = rel(1.1), face = "bold", colour = "#23203F"),
      panel.border = element_rect(colour = "#23203F", fill=NA, linewidth=1)
    )
}

