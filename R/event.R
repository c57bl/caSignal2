#' @import dplyr
NULL

event <- R6Class(
  "event",
  private = list(tb = NULL,
                 backup = NULL),
  initialize = function(x) {
    check_colname(x)
    private$tb <- x
    private$backup <- x
  }
  public = list(
    add_head <- function(layer,name,duration,gap){

    }
    add_tail <- function(layer,name,duration,gap){

    }
  )
)

check_colname <- function(data,type,addname = NULL){
  conserve <- if (type == "event")
    c("experiment","batch","mice","layer","name","start","end")
  else if (type == "record")
    c("experiment,batch,mice,file,channel,name")
  full <- unique(c(conserve,addname))
  lack.idx <- which(! full %in% colnames(data))
  if (length(lack.idx) > 0) {
    stop("can not find column: ", paste(full[lack.idx],collapse = ","))
  }
}
