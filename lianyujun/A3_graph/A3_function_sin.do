
*! A3_graph

   * range varname  #first  #last  [#obs]
  
   clear
   range theta 0  2*_pi  400
   gen r = 2*sin(2*theta)
   gen y = r*sin(theta)
   gen x = r*cos(theta)
   twoway line y x, c(l) s(i)  yline(0) xline(0)
   
