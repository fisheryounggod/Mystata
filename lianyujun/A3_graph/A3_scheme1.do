
* A3_graph 图形外观的设定

cd D:\stata11\ado\personal\Net_course_A\A3_graph

cap graph drop "p1" "p2" "p3" "p4" "p5" "p6"
local sch "s2color"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))           ///
             (function y2=sin(x),range(0 10))     ///
             (function y3=x^(1/3),range(0 10)),   ///
              title("scheme `sch' ")              ///
              legend(rows(1))                     ///
              saving("p1")                        ///
              nodraw

local sch "s2mono"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))            ///
             (function y2=sin(x),range(0 10))      ///
             (function y3=x^(1/3),range(0 10)),    ///
              title("scheme `sch' ")               ///
              legend(rows(1))                      ///
              saving("p2")                         ///
              nodraw
  

local sch "s1color"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))          ///
             (function y2=sin(x),range(0 10))    ///
             (function y3=x^(1/3),range(0 10)),  ///
             title("scheme `sch' ")              ///
              legend(rows(1))                    ///
              saving("p3")                       ///
              nodraw


local sch "s1mono"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))          ///
             (function y2=sin(x),range(0 10))    ///
             (function y3=x^(1/3),range(0 10)),  ///
              title("scheme `sch' ")             ///
              legend(rows(1))                    ///
              saving("p4")                       ///
              nodraw


local sch "economist"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))          ///
             (function y2=sin(x),range(0 10))    ///
             (function y3=x^(1/3),range(0 10)),  ///
              title("scheme `sch' ")             ///
              legend(rows(1))                    ///
              saving("p5")                       ///
              nodraw


local sch "sj"
set scheme `sch'
twoway (function y1=cos(x),range(0 10))         ///
             (function y2=sin(x),range(0 10))   ///
             (function y3=x^(1/3),range(0 10)), ///
              title("scheme `sch' ")            ///
              legend(rows(1))                   ///
              saving("p6")                      ///
              nodraw


graph combine "p1" "p2" "p3" ///
              "p4" "p5" "p6", ///
              rows(3) saving(A3_scheme1)

*graph drop _all

