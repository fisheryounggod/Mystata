*! version 2.0 1aug2003
*! Matrix demonstration:  more complete OLS regression program.
program ols3, eclass
	version 8.0
	syntax varlist(min=1 numeric) [in] [if] [, Level(integer $S_level)]
	marksample touse
	tokenize "`varlist'"
	tempname crossYX crossX crossY b hat V
	quietly matrix accum `crossYX' = `varlist' if `touse'
	local nobs = r(N)
	local df = `nobs' - (rowsof(`crossYX') - 1)
	matrix `crossX' = `crossYX'[2...,2...]
	matrix `crossY' = `crossYX'[2...,1]
	matrix `b' = (syminv(`crossX') * `crossY')'
	matrix `hat' = `b' * `crossY'
	matrix `V' = syminv(`crossX') * (`crossYX'[1,1] - `hat'[1,1])/`df'
	ereturn post `b' `V', dof(`df') obs(`nobs') depname(`1') /*
		*/ esample(`touse')
	ereturn local depvar "`1'"
	ereturn local cmd "ols3"
	if `level' < 10 | `level' > 99 {
		display as error "level( ) must be between 10 and 99 inclusive."
		exit 198
	}
	ereturn display, level(`level')
end
