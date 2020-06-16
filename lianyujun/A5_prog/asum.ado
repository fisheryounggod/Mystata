*! Author:  Roger Federer
*! Date:    2010.10.10
*! Version: 1.0.0
  
   cap program drop asum
   program define asum, rclass
   version 8.0
   syntax varname     // 输入项 

     local n = wordcount("`varlist'")
     tempname aa            // 定义暂时性矩阵 
     mat `aa' = J(`n',4,0)
     local i = 1
     foreach v of varlist `varlist'{
       qui sum `v'
       local range = r(max)-r(min)
       mat `aa'[`i++',1] = (r(mean), r(min), r(max), `range')
     }
     mat colnames `aa' = 平均值 最小值 最大值 取值范围
     mat rownames `aa' = `varlist'
     
   * 列示结果
     dis _n in g _dup(20) "=" in y "我的统计结果" in g _dup(20) "=" 
     mat list `aa', noheader
     
   * 返回值
     *return clear    // 清除 -sum- 命令的返回值
     return scalar range = `range'
     return matrix r     = `aa'
     
   end

