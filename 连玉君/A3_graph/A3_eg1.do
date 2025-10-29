
sysuse lifeexp, clear

gen loggnp = log10(gnppc)
label var loggnp "人均GNP(Log10)"
label var lexp   "期望寿命"

scatter lexp loggnp, ysca(alt titlegap(1.5))   ///
                     xsca(alt titlegap(0.8)) ///
                     xlabel(, grid gmax)     ///
                     ylabel(,angle(0))  ///
                     saving(yx)
histogram lexp, percent xsca(alt reverse titlegap(0.8)) ///
                horiz xtitle(占比) ylabel(,angle(0)) ///
                saving(hy)
histogram loggnp, percent ysca(alt reverse titlegap(1.5))  ///
                  ytitle(占比) ylabel(,nogrid angle(0)) ///
                  xscale(titlegap(2)) xlabel(,grid gmax) ///
                  saving(hx)

graph combine hy.gph yx.gph hx.gph, ///
           hole(3) imargin(0 0 0 0) ///
           graphregion(margin(l=12 r=12)) ///
           title("图1：期望寿命与人均 GNP") ///
           note("资料来源:  世界银行小组，1988")

erase hy.gph
erase hx.gph
erase yx.gph
