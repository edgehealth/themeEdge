# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

theme_edge <- function() {

  theme_minimal() %+replace%

    theme(
      title = element_text(colour = "#23203F"),
      text = element_text(colour = "#23203F"),
      plot.title = element_text(size = 20, face = "bold", hjust = 0, vjust = 10),
      plot.subtitle = element_text(size = 18, hjust = 0, vjust = 9),
      plot.caption = element_blank(),
      axis.title.x = element_text(size = 15.5, face = "bold", margin = margin(t = 20, b = 10), hjust = 0.5),
      axis.title.y = element_text(size = 15.5, angle = 90, face = "bold", margin = margin(l = 25, r = 25)),
      axis.text.x = element_text(size = 15.5),
      axis.text.y = element_text(size = 15.5),
      axis.line.y = element_blank(),
      axis.line.x = element_blank(),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = 15.5),
      legend.background = element_blank(),
      legend.margin = margin(10, 10, 20, 10),
      legend.direction = "horizontal",
      plot.margin = margin(70, 50, 10, 10),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
    #  plot.background = element_rect(fill = "#Fff"),
     # panel.grid.major =  element_line(colour = "#DAE8EE"),
     # panel.grid.minor =  element_line(colour = "#DAE8EE"),
      #strip.background = element_blank(),
      strip.text = element_text(size = 14),
      panel.border = element_rect(colour = "#23203F", fill=NA, linewidth=1)
    )
}
