
* 应用 -do2htm- 命令制作网页

   cd `c(sysdir_personal)'Net_course_A\A1_intro

   sysuse auto, clear      // -> Note1: 调入数据

   sum                     // 基本统计量

   d,d                     // 样本概况描述
  
*- 绘制一张图形
     #delimit ;            // -> 注意此处的断行方法
      grss twoway (scatter price wei)
           (lfit price wei),
           title("散点图和线性拟合图");
     #delimit cr

*- 再绘制一张图形
     sysuse nlsw88, clear
     gen lnwage = ln(wage)
     grss histogram lnwage, normal
     
