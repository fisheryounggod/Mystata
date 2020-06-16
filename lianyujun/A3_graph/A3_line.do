
 sysuse uslifeexp, clear

 gen diff = le_wmale - le_bmale
 label var diff "寿命差异"

 #delimit ;  
   twoway (line le_wmale year, yaxis(1 2) xaxis(1 2))
          (line le_bmale year)
          (line diff  year)
           ,
             ylabel(0 20(10)80,     gmax angle(horizontal))
             ylabel(0(5)20, axis(2) gmin angle(horizontal))
             xlabel(1918, axis(2)) 
               title("图2：白人和黑人预期寿命")
               subtitle("美国, 1900-1999")
               ytitle("预期寿命 (年)")
               xtitle("年份")
               ytitle("", axis(2))
               xtitle("", axis(2))
             note("数据来源:  美国国家重要统计资料报告, 第5卷-第6期"
                  "(1918 巨降 源于1918年全国性流行感冒)",linegap(1.2))
             legend(label(1 "白人男性") label(2 "黑人男性") 
                     rows(1) size(small));
      
         #delimit cr




















