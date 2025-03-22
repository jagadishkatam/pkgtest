#' to generate the summary dataframe
#'
#' @param data input the dataframe
#' @param by input the by group or groups
#' @param var input the variable
#'
#' @returns a dataframe
#' @export
#'
#' @examples
#' mean_by(mtcars, rlang::exprs(cyl, vs, am), mpg)
#'
#' @importFrom rlang enquo

mean_by <- function(data, by, var) {

  var <- enquo(var)  # Capture variable name

  data %>%
    dplyr::group_by(!!!by) %>%  # Unquote list of quosures
    dplyr::summarise(avg = mean({{ var }}, na.rm = TRUE), .groups = "drop")
}

