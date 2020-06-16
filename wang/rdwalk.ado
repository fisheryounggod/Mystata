program rdwalk,rclass
version 10
syntax [, n(integer 100)]
drop _all
quietly set obs `n'
capture drop y x rndy rndx 
quietly {
	gen rndy=invnorm(uniform())
	gen rndx=invnorm(uniform())
	gen y=rndy
	gen x=rndx
	replace y=y[_n-1]+rndy[_n] in 2/`n'
	replace x=x[_n-1]+rndx[_n] in 2/`n'
	regress y x 
	matrix matb=e(b)
	matrix matv=e(V)
	return scalar b =  el(matb,1,2)
	return scalar se = sqrt(el(matv,2,2))
}
end
