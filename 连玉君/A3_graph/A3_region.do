
    sysuse auto, clear
 
    scatter mpg weight,  ///
       graphregion(fcolor(green*0.8)) ///
       graphregion(ifcolor(yellow))   ///
       plotregion(fcolor(black*0.3))  ///  
       plotregion(ifcolor(white))     ///
       title("Title：全图内区 (inner graph region)") ///
       xtitle("Xtitle：汽车重量")      ///
       ytitle("Ytitle: 汽车里数")      ///
       note("Note：(1) 灰色部分称为“绘图外区”(outer plot region)"   ///
      "            (2) 绿色部分称为“全图外区”(outer graph region)") ///
       caption("Caption：各区域的面积决定于显示模式(scheme)和内容的多少")    ///
       text(30 3500 "绘图内区 (inner plot region)", ///
            color(blue)  size(*1.5)) 
