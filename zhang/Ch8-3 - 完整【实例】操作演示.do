

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-----------------------------------Ch8-3--完整【实例】操作演示----------------------------------*/



use ch8hansen1999.dta,clear     /*----打开指定路径下的数据文件----*/
/*----数据来源Hansen(1999)原文，大家可以参考其原文中的例子----*/

encode id, gen(idnew)        /*----生成新变量idnew(取值为1,2,3...)替代id----*/
                                /*----注意：此处id为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
xtset id year	                /*----告诉Stata该数据为面板数据----*/
browse                          /*----浏览数据----*/







/*----------------实际操作流程-------从复杂（3个）到简单（1个）---------------*/



/*--1----3个门限值情形----考察有几个门限、或是否存在门限效应----*/
xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(3) trim(0.01 0.01 0.01) grid(400) bs(300 300 300) 


  
/*--若存在门限效应，确定几个门限值，然后重新回归--
    若不在门限效应，则建立普通的面板数据模型即可。----*/
  
  
  
  
/*-----2个门限值----*/
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(2) trim(0.01 0.01) grid(400) bs(300 300) vce(cluster id)

  
  
  /*-----在2个门限值情形下，画LR统计量对应的图形----*/
  _matplot e(LR21), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("1st Threshold Parameter") name(LR2113)

  _matplot e(LR22), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("2nd Threshold Parameter") name(LR2213)
  
  graph combine LR2113 LR2213, cols(1)  
  
  

  *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab  using test1threshold.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--结果输出：推荐使用--*/
 








