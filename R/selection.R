#' Variable selection for a Blend object
#'
#' Variable selection for a Blend object
#'
#' @param obj Blend object.
#' @param sparse logical flag. If TRUE, spike-and-slab priors will be used to shrink coefficients of irrelevant covariates to zero exactly.
#'
#' @details If sparse, the median probability model (MPM) (Barbieri and Berger, 2004) is used to identify predictors that are significantly associated
#' with the response variable. Otherwise, variable selection is based on 95\% credible interval.
#' Please check the references for more details about the variable selection.
#'
#' @references
#' Ren, J., Zhou, F., Li, X., Ma, S., Jiang, Y. and Wu, C. (2023). Robust Bayesian variable selection for gene-environment interactions.
#' {\emph{Biometrics}, 79(2), 684-694 } \doi{10.1111/biom.13670}
#'
#' Barbieri, M.M. and Berger, J.O. (2004). Optimal predictive model selection. {\emph{Ann. Statist}, 32(3):870–897}
#'
#' @rdname selection
#' @return an object of class `selection' is returned, which is a list with component:
#' \item{method}{posterior samples from the MCMC}
#' \item{indices}{a list of indices and names of selected variables}
#' \item{summary}{a summary of selected variables}
#'
#' @seealso \code{\link{Blend}}
#'
#' @examples
#' data(dat)
#' ## sparse
#' fit = Blend(y,x,t,J,kn,degree)
#' selected=selection(fit,sparse=TRUE)
#' selected
#'
#' \donttest{
#' ## non-sparse
#' fit = Blend(y,x,t,J,kn,degree,sparse="FALSE")
#' selected=selection(fit,sparse=FALSE)
#' selected
#' }
#'
#' @export
selection = function(obj,sparse){
  if(sparse){
    out = Selection_Sparse(obj,burn.in=obj$burn.in)
  }
  else{
    out = Selection_Nonsparse(obj,burn.in=obj$burn.in)
  }
  out = out
  out
}
