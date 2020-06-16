
          #delimit ;
          twoway 
              function y=normden(x), range(-1.96 1.96) color(yellow) recast(area)
          ||  function y=normden(x), range(-1.64 1.64) color(green) recast(area)
          ||  function y=normden(x), range(-4 4) lstyle(foreground) lwidth(thick)
          ||,
              plotregion(style(none))
              legend(off)
              xlabel(-4 "-4 sd" -3 "-3 sd" -2 "-2 sd" -1 "-1 sd" 0 "mean"
                      1  "1 sd"  2  "2 sd"  3  "3 sd"  4  "4 sd"
                      , grid gmin gmax)
              xtitle("")
              text(0.15 0 "绿色部分" "占总面积的90%",color(white) size(large));
          #delimit cr
