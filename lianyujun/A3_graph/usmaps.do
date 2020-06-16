di in r "colorschemes.dta must be on the adopath" _n
use "rma_summary.dta", clear
tmap chor lossratio , id(id) map("us_west.dta") palette(Blues) ocolor(white) osize(medium)  legtitle("Loss Ratios")
tmap chor subsidy , id(id) map("us_east.dta") palette(Paired) legtitle("Total Subsidy")
gen indem = indemnity/1000000
tmap chor indem , id(id) map("us_midwest.dta") palette(Paired) clm(custom) clb(0 5 10 30 70 300) legtitle("Indemnity Payments") legformat(%3.0f)

*Highlight Northwest
use "us_west.dta", clear
replace _X = _X - 1 if fips == 16 | fips == 41 | fips == 53
replace _Y = _Y + .25 if fips == 16 | fips == 41 | fips == 53
save "us_west2.dta", replace

use "rma_summary.dta", clear
tmap chor lossratio , id(id) map("us_west2.dta") palette(Blues) ocolor(white) osize(medium) 
