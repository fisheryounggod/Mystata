
          #delimit ;
          twoway 
              function y=normden(x), range(-4 -1.96) color(gs12) recast(area)
          ||  function y=normden(x), range(1.96 4)   color(gs12) recast(area)
          ||  function y=normden(x), range(-1.96 -1.64) color(green) recast(area)
          ||  function y=normden(x), range(1.64 1.96)   color(green) recast(area)
          ||  function y=normden(x), range(-4 4) lstyle(foreground)
          ||,
              plotregion(style(none))
              legend(off)
              xlabel(-4 "-4 sd" -3 "-3 sd" -2 "-2 sd" -1 "-1 sd" 0 "mean"
                      1  "1 sd"  2  "2 sd"  3  "3 sd"  4  "4 sd"
                      , grid gmin gmax)
              xtitle("");
          #delimit cr


