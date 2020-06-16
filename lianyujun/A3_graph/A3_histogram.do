
      sysuse sp500, clear
      
      #delimit ;
      histogram volume, freq normal 
                addlabels addlabopts(mlabcolor(blue))
                xaxis(1 2)
                ylabel(0(10)65, grid)
                xlabel( 12321 "mean"
                         9735 "-1 s.d."
                        14907 "+1 s.d."
                         7149 "-2 s.d."
                        17493 "+2 s.d."
                        20078 "+3 s.d."
                        22664 "+4 s.d."
                        ,axis(2) grid gmax
                       )
                subtitle("图4：S&P 500 交易量 (2001年1月-12月)")
                ytitle(频数)
                xtitle("交易量(千笔)") xscale(titlegap(2))
                xtitle("", axis(2))
                note("数据来源：雅虎！财经数据");
       #delimit cr
                
      sum volume    
