
*! A3_graph

   * range varname  #first  #last  [#obs]
  
   clear
   range theta 0  2*_pi  400
   gen r = 2*sin(2*theta)
   gen y = r*sin(theta)
   gen x = r*cos(theta)
   twoway line y x, c(l) s(i)  yline(0) xline(0)
   
   #delimit ;
   twoway (line y x) 
          (line y x if x>0&y>0,recast(area) color(pink*0.1))
          (line y x if x>0&y<0,recast(area) color(pink*0.3))
          (line y x if x<0&y<0,recast(area) color(pink*0.1))
          (line y x if x<0&y>0,recast(area) color(pink*0.3)),
          legend(off) yscale(off) xscale(off)  ;
   #delimit cr
 
