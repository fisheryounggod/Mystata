program ols2
	version 8.0
	syntax varlist(min=1 numeric)
	tempname crossYX crossX crossY b
	quietly matrix accum `crossYX' = `varlist'
	matrix `crossX' = `crossYX'[2...,2...]
	matrix `crossY' = `crossYX'[2...,1]
	matrix `b' = syminv(`crossX') * `crossY'
	matrix list `b'
end
