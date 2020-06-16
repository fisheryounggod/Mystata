capture program drop gossip	// FOR WRITING & DEBUGGING; DELETE LATER
program gossip
version 8.0
* Syntax requires user to specify two variables (Yvar and TIMEvar), and
* the span of the moving window.  Optionally, the user can ask to generate
* a new variable holding autocorrelations, to draw a graph, or both.
syntax varlist(min=1 max=2 numeric), SPan(integer) [GENerate(string) GRaph]
if int(`span'/2) != (`span' - 1)/2 {
	display as error "Span must be an odd integer"
}
else {
* The first variable in `varlist' becomes Yvar, the second TIMEvar.
	tokenize `varlist'
		local Yvar `1'
		local TIMEvar `2'
	tempvar NEWVAR
	quietly gen `NEWVAR' = .
	local miss = 0
* spanlo and spanhi are local macros holding the observation number at the
* low and high ends of a particular window.  spanmid holds the observation 
* number at the center of this window.
	local spanlo = 0
	local spanhi = `span'
	local spanmid = int(`span'/2)
	while `spanlo' <= _N -`span' {
		local spanhi = `span' + `spanlo'
		local spanlo = `spanlo' + 1
		local spanmid = `spanmid' + 1
* The next lines check whether missing values exist within the window.
* If they do exist, then no autocorrelation is calculated and we
* move on to the next window.  Users are informed that this occurred.
		quietly summ `Yvar' in `spanlo'/`spanhi'
		if r(N) != `span' {
			local miss = 1
		}
* The value of NEWVAR in observation `spanmid' is set equal to the first 
* row, first column (1,1) element of the row vector of autocorrelations 
* r(AC) saved by corrgram.
		else {
			quietly corrgram `Yvar' in `spanlo'/`spanhi', lag(1)
			quietly replace `NEWVAR' = el(r(AC),1,1) in `spanmid'
		}
	}
	if "`graph'" != "" {
* The following "graph" command illustrates the use of comments to cause
* Stata to skip over line breaks, so it reads the next two lines as if
* they were one.
		graph twoway spike `NEWVAR' `TIMEvar', yline(0) ///
		   ytitle("First-order autocorrelations of `Yvar' (span `span')")
	}
	if `miss' == 1 {
		display as error "Caution:  missing values exist"
	}
	if "`generate'" != "" {
		rename `NEWVAR' `generate'
		label variable `generate' /// 
		    "First-order autocorrelations of `Yvar' (span `span')"
	}		
}
end
