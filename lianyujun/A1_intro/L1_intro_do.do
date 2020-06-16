

cd D:\stata11\ado\personal\Net_course_A\A1_intro

*- 开始使用log文件        // -> 这是第一种注释方法
  cap log close
  log using L1_intro_do.log, replace

  sysuse auto, clear      // -> Note1: 调入数据

  sum                     // 基本统计量

  d,d
  
  #delimit ;              // -> 注意此处的断行方法
     grss twoway (scatter price wei)
            (lfit price wei),
            title("散点图和线性拟合图");
  #delimit cr

  log close           
  exit
 
 
*- 说明：
   这份文件用于说明stata中do文档和log文件的使用方法。 
