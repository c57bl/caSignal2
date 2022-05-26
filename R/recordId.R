#' @import R6
NULL

recordId <- R6Class(
  "recordId",
  inherit = "data.frame",
  private = list(
    experiment = NULL,
    batch = NULL,
    mice = NULL,
    id = NULL
  ),
  public = list(
    initialize = function(experiment = NULL,
                          batch = NULL,
                          mice = NULL) {
      private$experiment <- experiment
      private$batch <- batch
      private$mice <- mice
      private$id <- paste(experiment, batch, mice, sep = "/")
    }
  )
)

recordId_from_tb <- function(x){
  recordId$new(experiment = x$experiment,
               batch = x$batch,
               mice = x$mice)
}
