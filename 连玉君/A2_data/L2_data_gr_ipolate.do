clear
input y   x
      4   2
      10  5
      6   3
end
label define lb 2 "观测值1" 5 "观测值2" 3 "缺漏值" 
label values x lb

twoway (function y = 2*x, range(1 6)) ///
       (dropline y x, mlabel(x) mlabpos(9) yline(4))
