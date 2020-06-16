use china_label,clear
gen x = uniform()
format x %9.3g
spmap x using "china_map.dta", /// 
  id(id) label(label(ename)  ///
  xcoord(x_coord) ycoord(y_coord) size(*.66))
