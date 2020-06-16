

      
*- 《上市公司资本结构影响因素的实证分析》一文的数据处理和模型估计
*- 2008.10.10 (with Zoufan)     
      
  *cd D:\stata11\ado\personal\Net_course_A\A1_intro
  cd `c(sysdir_personal)'Net_course_A\A1_intro
  
  cap log close
  log using paper01, text replace 
      
      
  *- 《上市公司资本结构影响因素的实证分析》 
  *- 2008.10.10
      
  *--------------
  * -1- 数据处理
  *--------------
     use xtcs.dta, clear
     tsset code year
     xtdes
     winsor tl, gen(tl_w) p(0.01)
     winsor tobin, gen(tobin_w) p(0.01)
         
  *----------------
  * -2- 基本统计量
  *----------------
     local xx "tl sl size ndts-tobin"
     tabstat `xx', stat(mean sd min p50 max) format(%6.3f) c(s)
      
  *--------------
  * -3- 回归分析
  *--------------  
    *- Pooled OLS
       reg tl size ndts tang npr tshr tobin, robust
       est store ols
    *- FE
       xtreg tl size ndts tang npr tshr tobin, fe robust
       est store fe
    *- RE
       xtreg tl size ndts tang npr tshr tobin, re robust
       est store re    
       
    *- 呈现结果
       local m "ols fe re"
       esttab `m', mtitle(`m') compress nogap b(%6.3f)  ///
              scalars(r2_a N F) star(* 0.1 ** 0.05 *** 0.01) 
    
	*- 输出到 Excel 文档 
       local m "ols fe re"
       esttab `m' using R.csv, replace                  ///
	          mtitle(`m') compress nogap b(%6.3f)       ///
              scalars(r2_a N F) star(* 0.1 ** 0.05 *** 0.01) 
			  
  log close
  exit
  
  
  
* 尚待完善的工作：
  * (1) 模型筛选；
  * (2) 稳健性检验；
  * (3) 考虑使用动态模型进行分析
       
       
       
