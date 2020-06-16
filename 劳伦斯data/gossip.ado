*!  version 2.0
*!  L. Hamilton, Statistics with Stata (2004)
program gossip
version 8.0
syntax varlist(min=1 max=2 numeric), SPan(integer) [GENerate(string) GRaph]
if int(`span'/2) != (`span' - 1)/2 {
	display as error "Span must be an odd integer"
}
else {
	tokenize `varlist'
		local Yvar `1'
		local TIMEvar `2'
	tempvar NEWVAR
	quietly gen `NEWVAR' = .
	local miss = 0
	local spanlo = 0
	local spanhi = `span'
	local spanmid = int(`span'/2)
	while `spanlo' <= _N -`span' {
		local spanhi = `span' + `spanlo'
		local spanlo = `spanlo' + 1
		local spanmid = `spanmid' + 1
		quietly summ `Yvar' in `spanlo'/`spanhi'
		if r(N) != `span' {
			local miss = 1
		}
		else {
			quietly corrgram `Yvar' in `spanlo'/`spanhi', lag(1)
			quietly replace `NEWVAR' = el(r(AC),1,1) in `spanmid'
		}
	}
	if "`graph'" != "" {
		graph twoway spike `NEWVAR' `TIMEvar', yline(0) /*
		*/ ytitle("First-order autocorrelations of `Yvar' (span `span')")
	}
	if `miss' == 1 {
		display as error "Caution:  missing values exist"
	}
	if "`generate'" != "" {
		rename `NEWVAR' `generate'
		label variable `generate' /* 
		*/ "First-order autocorrelations of `Yvar' (span `span')"
	}		
}
end
