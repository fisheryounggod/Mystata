* Perform simple regression and list observations with #
*     largest absolute residuals.
* 	syntax:	listres1 Yvariable Xvariable # IDvariable
program listres1, sortpreserve
version 8.0
args Yvar Xvar number id
quietly regress `Yvar' `Xvar'
capture drop Yhat
capture drop Resid
capture drop Absres
quietly predict Yhat
quietly predict Resid, resid
quietly gen Absres = abs(Resid)
gsort -Absres
drop Absres
list `id' `Yvar' Yhat Resid in 1/`number'
end
