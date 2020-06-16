
 use CA,clear
 tsset year
gen ca_per=ca/gdp
list year ca_
gen ga_per=ga/gdp
gen sa_per=sa/gdp
gen ra_per=ra/gdp
gen fa_per=fa/gdp
gen ka_per=ka/gdp

save "CA.dta", replace

*------* ADF 检验 *--------*
dfuller ga_per, trend regress
dfuller sa_per, trend regress
dfuller ra_per, trend regress
dfuller fa_per, trend regress
dfuller ka_per, trend regress

*------*  *--------*
// Johansen 协整检验

vecrank ca_per ka_per, lags(5) ic levela

irf create order1, set(myirf2)
irf graph oirf, impulse(ca_per) response(ka_per)
irf graph fevd, impulse(ka_per) response(ca_per) lstep(2) 


var ca_per ka_per
