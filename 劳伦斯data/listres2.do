* 	Perform simple or multiple regression and list 
* 	observations with # largest absolute residuals.
* listres2 yvar xvarlist [if] [in], number(#) [id(varname)]
program listres2, sortpreserve
version 8.0
syntax varlist(min=1) [if] [in], Number(integer) [Id(string)]
marksample touse
quietly regress `varlist' if `touse'
capture drop Yhat
capture drop Resid
capture drop Absres
quietly predict Yhat if `touse'
quietly predict Resid if `touse', resid
quietly gen Absres = abs(Resid)
gsort -Absres
drop Absres
list `id' `1' Yhat Resid in 1/`number'
end
