
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
                subtitle("ͼ4��S&P 500 ������ (2001��1��-12��)")
                ytitle(Ƶ��)
                xtitle("������(ǧ��)") xscale(titlegap(2))
                xtitle("", axis(2))
                note("������Դ���Ż����ƾ�����");
       #delimit cr
                
      sum volume    
