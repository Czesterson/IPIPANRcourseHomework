#' @title Returns vector's mode.
#' @description This function calculates the most frequently
#' occurring value in an integer vector (mode).
#' If the mode is ambiguous returns the lowest mode.
#' This is R reference function for benchmark tests.
#'
#' @param x - integer vector
#' @return - integer
#' @export
mode2 <- function(x)
{
    stopifnot(is.numeric(x), is.finite(x), is.vector(x))
    # lets sort x to have it in order from smallest to largest
    x2 <- sort(x)
    # 0 if neighbours are equal, >0 otherwise
    x3 <- x2[-1]-x2[-length(x2)]
    # border indices
    x4 <- c(0, which(x3>0), length(x2))
    # how many of each we have
    x5 <- x4[-1]-x4[-length(x4)]
    # which one is max
    x6 <- which(x5==max(x5))
    # in case more than one, select first
    x6 <- x6[1]
    # return corresponding indice
    x2[x4[x6+1]]
}
