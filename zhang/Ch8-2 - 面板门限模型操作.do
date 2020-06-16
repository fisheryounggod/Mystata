

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/
 

/*-------------------------Ch8.2--面板门限（槛）模型--------------------------*/


cd G:\Stataex                              /*----指定默认路径----*/
use G:\Stataex\ch8hansen1999.dta,clear     /*----打开指定路径下的数据文件----*/
/*----数据来源Hansen(1999)原文，大家可以参考其原文中的例子----*/

*  encode id, gen(idnew)        /*----生成新变量idnew(取值为1,2,3...)替代id----*/
                                /*----注意：此处id为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
xtset id year	                /*----告诉Stata该数据为面板数据----*/
browse                          /*----浏览数据----*/





/*---------------------------------------xthreg---------------------------------
*注意：xthreg要求平衡面板数据

xthreg depvar [indepvars] [if] [in], rx(varlist) qx(varname) 
              [thnum(#) grid(#) trim(numlist) bs(numlist) thlevel(#)
	                    gen(newvarname) noreg nobslog thgiven options]

-----选项-----
rx(varlist) ：制度(区域)内生变量，必选项。
qx(varname) ：门限变量，必选项。
thnum(#) ：门限个数。在Stata13-15版本中，#必须小于等于3，默认为thnum(1)。
grid(#) ：网格点数，在样本量较大时，该选项可以控制计算时间，默认为grid(300)。
trim(numlist) ：估计每个门限值时的修整比例，修整比例的个数
                必须与th中num(#)中的#相等，默认trim(0.01)。

bs(numlist) ：bootstrap迭代次数。若不设置bs()，xthreg将不会使用
              bootstrap进行门限效应检验。
thlevel(#) ：置信区间，默认为95%，即thlevel(95)。
gen(newvarname) ：对每个制度生成0,1,2,...的新分类变量。默认为gen(_cat)
noreg ：不显示回归结果。
nobslog ：不显示bootstrap迭代过程。
thgiven ：基于以前的结果拟合模型。
options ：xtreg中的选项。
------------------------------------------------------------------------------*/

 
/*----------------1个门限值情形----------------*/
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(1) trim(0.01) ///
                            grid(400) bs(300) 
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(1) trim(0.01) ///
                            grid(400) bs(300) vce(cluster id)

  
  /*-----在1个门限值情形下，画LR统计量对应的图形----*/
  _matplot e(LR),columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("Threshold Parameter") 

  /*-----7.35：5%的临界值，c(a)=-2log(1-(1-a)^(1/2))----*/ 
  di -2*log(1-(1-0.05)^(1/2))
  
  
  
  
  
  
  
/*----------------2个门限值情形----------------*/
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(2) trim(0.01 0.05) grid(400) bs(300 300)

  
  
  /*-----在2个门限值情形下，画LR统计量对应的图形----*/
  _matplot e(LR21), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("1st Threshold Parameter") name(LR213)

  _matplot e(LR22), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("2nd Threshold Parameter") name(LR223)
  
  graph combine LR213 LR223, cols(1)
  
  
  
  
  
  
  
/*----------------3个门限值情形----------------*/
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(3) trim(0.01 0.01 0.05) bs(0 300 300) thgiven
  xthreg i q1 q2 q3 d1 qd1, rx(c1) qx(d1) thnum(3) trim(0.01 0.01 0.05) grid(400) bs(300 300 300)
  
  
  
  /*-----在3个门限值情形下，画LR统计量对应的图形----*/
  _matplot e(LR21), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("1st Threshold Parameter") name(LR31)

  _matplot e(LR22), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("2nd Threshold Parameter") name(LR32)
					
  _matplot e(LR3), columns(1 2) yline(7.3523, lpattern(dash)) recast(line) ///
                    ytitle("Likelihood Ratio") xtitle("3rd Threshold Parameter") name(LR33)

  graph combine LR31 LR32 LR33, cols(1)

 
 
 

/*--
   matrix xx=e(LR21)
   matrix list xx
   mat  x4=xx[1...,1]
   mat list x4
   mat sum x4
--*/   
   
