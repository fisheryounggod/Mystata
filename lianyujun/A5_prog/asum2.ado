
program define asum2
  version 8.0
  args var     

  local n = wordcount("`var'")
  tempname aa  /*定义暂时性矩阵*/
  mat `aa' = J(`n',4,0)
  local i = 1
  foreach v of varlist `var'{
    qui sum `v'
    mat `aa'[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
  }
  mat colnames `aa' = 平均值 最小值 最大值 取值范围
  mat rownames `aa' = `var'
  * 列示结果
  dis _n in g _dup(20) "=" in y "我的统计结果" in g _dup(20) "=" 
  mat list `aa'

end


