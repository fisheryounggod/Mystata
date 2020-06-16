

clear
input x1   y1 x2 y2  x3  y3   x4  y4   x5  y5  x6   y6  x7  y7   x8  y8
      1    1  3   1  2.5 1.45 2.4 1.5  5.5 1   4.9 1.47 4.9 1.52 6.5 1
      2    1  4.5 1  2.5 1.55 2.6 1.5  8   1   5.1 1.47 5.1 1.52 6.5 2
      2    2  4.5 2  .  .    .    .   8   2    .   .  .    .  .    .  
      1    2  3   2  .  .    .    .   5.5 2    .   .  .    .  .    .  
      1    1  3   1  .  .    .    .   5.5 1    .   .  .    .  .    .  
end

twoway (line y1 x1, lwidth(thick))    ///
       (line y2 x2, lwidth(thick))    ///
       (line y3 x3,lcolor(black))     /// 
       (line y4 x4,lcolor(black))     ///
       (line y6 x6,lcolor(black))     ///
       (line y7 x7,lcolor(black))     ///
       (line y8 x8, lwidth(medthick)) ///
       (line y5 x5, lwidth(thick)),   ///
       xscale(range(0 9)) yscale(range(0.5 2.5)) ///
       xlabel(none) ylabel(none) legend(off)     ///
       text(1.5 1.5 "A",color(blue))   ///
       text(1.5 3.75 "B",color(blue))  ///
       text(1.5 6 "A",color(blue))     ///
       text(1.5 7.25 "B",color(blue)) 

      
