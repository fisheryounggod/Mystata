program regsim, rclass
* Performs one iteration of a Monte Carlo simulation comparing
* OLS regression (regress) with robust (rreg) and quantile
* (qreg and bsqreg) regression.  Generates one n = 100 sample
* with x ~ N(0,1) and y variables defined by the models:
*
*   MODEL 1:      y1 = 2x + e1         e1 ~ N(0,1)
*
*   MODEL 2:      y2 = 2x + e2         e2 ~ N(0,1) with p = .95
*                                      e2 ~ N(0,10) with p = .05
*
* Bootstrap standard errors for qreg involve 500 repetitions.
*
	version 8.0
	if "`1'" == "?" {
		#delimit ;
		global S_1 "b1 b1r se1r b1q se1q se1qb 
			b2 b2r se2r b2q se2q se2qb";
		#delimit cr
		exit
	}
	drop _all
	set obs 100                    
	generate x = invnorm(uniform())
	generate e = invnorm(uniform())
	generate y1 = 2*x + e
	reg y1 x
		return scalar B1 = _b[x]
	rreg y1 x, iterate(25)
		return scalar B1R = _b[x]
		return scalar SE1R = _se[x]
	qreg y1 x
		return scalar B1Q = _b[x]
		return scalar SE1Q = _se[x]
	bsqreg y1 x, reps(500)
		return scalar SE1QB = _se[x]
	replace e = 10 * e if uniform() < .05
	generate y2 = 2*x + e
	reg y2 x
		return scalar B2 = _b[x]
	rreg y2 x, iterate(25)
		return scalar B2R = _b[x]
		return scalar SE2R = _se[x]
	qreg y2 x
		return scalar B2Q = _b[x]
		return scalar SE2Q = _se[x]
	bsqreg y2 x, reps(500)
		return scalar SE2QB = _se[x]
end
