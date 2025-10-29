clear
input ///
x1 	y1	x2	y2	x3	y3	x4	y4	x5	y5	x6	y6	x7	y7	x8	y8
1	1	2.45	2	2.5	1.95	3	1.5	4.43	1.95	4.43	2.05	5	1	5	2
2	1	2.55	2	2.5	2.05	4	1.5	4.58	1.95	4.58	2.05	6	1	6	2
2	3	.	.	.	.	4	2.5	.	.	.	.	6	4	.	.
1	3	.	.	.	.	3	2.5	.	.	.	.	5	4	.	.
1	1	.	.	.	.	3	1.5	.	.	.	.	5	1	.	.
end

twoway ///
(line y1 x1, lwidth(thick)) ///
(line y2 x2,lcolor(black))  ///
(line y3 x3,lcolor(black))  ///
(line y4 x4, lwidth(thick)) ///
(line y5 x5,lcolor(black))  ///
(line y6 x6,lcolor(black))  ///
(line y7 x7, lwidth(thick)) ///
(line y8 x8, lwidth(medthick)), ///
   xscale(range(0 7)) yscale(range(0.5 4.5)) ///
   xlabel(none) ylabel(none) legend(off) ///
   text(2 1.5 "A",color(blue)) ///
   text(2 3.5 "B",color(blue))  ///
   text(1.5 5.5 "B",color(blue)) ///
   text(3 5.5  "A",color(blue)) 
