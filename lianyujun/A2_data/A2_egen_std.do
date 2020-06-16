
   twoway (histogram change,   color(blue))    ///
          (histogram s_change1,color(red ))    ///
          (histogram s_change2,color(green)),  ///
    legend(label(1 "原始数据(-0.54,15.8)") lab(2 "标准化数据(0,1)") lab(3 "(20,3)"))
