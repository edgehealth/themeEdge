# Internal list to store the Edge palettes

.edge_palettes <- list(
    standard = c("#23203F", "#56BABF", "#F28F64", "#C18DBE", "#559370", "#f0e0fb"),
    primary = c("#23203F", "#C18DBE", "#f0e0fb", "#575756"), 
    expanded = c("#23203F", "#56BABF", "#F28F64", "#C18DBE", "#559370", "#878787", "#266164", "#494384", "#A3C736", "#BDBADC", "#6C3B69"),
    xl = c(
        "#23203F", "#878787", "#F28F64", "#266164", "#494384", "#559370", "#C18DBE", "maroon", "#A3C736", "#BDBADC", "#6C3B69",
        "#41C7C4", "#3940CF", "#A54ABE", "#471D53", "#AFBFD5", "#C7B9CB", "#FF7F50", "#008080", "#FFD700", "#8A2BE2", "#FF6347",
        "#20B2AA", "#8B4513", "#9370DB", "dodgerblue2", "#E31A1C", "green4", "#6A3D9A", "#FF7F00", "black", "steelblue4", "darkorange",
        "darkgreen", "darkred", "darkblue", "darkviolet", "darkturquoise", "mediumseagreen", "firebrick", "orchid", "slateblue", "goldenrod", "cadetblue", "chocolate"
    )
)

#' Edge Color Palette Generator
#'
#' This function is used by the \code{scale_colour_edge} and \code{scale_fill_edge}
#' functions to generate color palettes.
#'
#' @param palette Character name of palette in \code{.edge_palettes}.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments to pass to \code{grDevices::colorRampPalette()}.
#' @return A function that takes an integer \code{n} and returns \code{n} colors.
#' @keywords internal # This function is not meant to be called directly by users
#' @importFrom grDevices colorRampPalette
edge_pal <- function(palette_name = "standard", reverse = FALSE, ...) {
# Check if palette_name exists
if (!palette_name %in% names(.edge_palettes)) {
    stop(paste("Palette", palette_name, "not found. Available palettes:",
paste(names(.edge_palettes), collapse = ", ")))
}

# Get the actual vector of colors for the chosen palette
pal_colors <- .edge_palettes[[palette_name]]

# Reverse if requested
if (reverse) {
    pal_colors <- rev(pal_colors) }

function(n) {
    if (n > length(pal_colors)) {
grDevices::colorRampPalette(pal_colors, ...)(n)
    } else {     
pal_colors[1:n]
    }
}
}

#' @title Edge Colour and Fill Scales for ggplot2
#' @description
#' These functions provide discrete colour and fill scales based on predefined "edge" palettes.
#' Use these with ggplot2 to apply your custom color schemes.
#'
#' @param palette Character name of the palette to use.
#'                Available palettes are: \code{"standard"}, \code{"primary"}, \code{"expanded"},\code{"xl"}.
#' @param reverse Boolean, if \code{TRUE}, the order of colors is reversed.
#' @param ... Additional arguments passed to \code{ggplot2::discrete_scale()}.
#'
#' @return A ggplot2 scale function.
#' @name scale_edge
#' @rdname scale_edge
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' # Example with theme_edge and edge_core palette
#' ggplot(mpg, aes(x = class, y = hwy, fill = class)) +
#'   geom_col() +
#'   theme_edge() +
#'   scale_fill_edge(palette = "standard") +
#'   labs(title = "Highway Mileage by Class", subtitle = "Using standard palette")
#'
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'   geom_point(size = 3) +
#'   theme_edge() +
#'   scale_colour_edge(palette = "primary") +
#'   labs(title = "Iris Dataset", subtitle = "Using primary palette for points")
#'}
NULL # Necessary for roxygen2 to process the @name/@rdname block above

#' @rdname scale_edge
#' @export
#' @importFrom ggplot2 discrete_scale
scale_colour_edge <- function(palette = "standard", reverse = FALSE, ...) {
ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = paste0("edge_", palette),
    palette = edge_pal(palette = palette, reverse = reverse),
    ...
)
}

#' @rdname scale_edge
#' @export
#' @importFrom ggplot2 discrete_scale # Already imported if in same file and scale_colour_edge is above
scale_fill_edge <- function(palette = "edge6", reverse = FALSE, ...) {
ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = paste0("edge_", palette),
    palette = edge_pal(palette = palette, reverse = reverse),
    ...
)
}