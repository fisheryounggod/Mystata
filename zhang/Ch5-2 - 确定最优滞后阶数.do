


/*-------------------Ch5.2 确定短动态面板模型最优滞后阶数---------------------*/




cd G:\Stataex                          /*----指定默认路径----*/

use G:\Stataex\dynamicpdataex.dta,clear   /*----打开指定路径下的数据文件----*/

/*    sysuse dir     */                /*----使用Stata中自带数据集----*/  

/*--
* webuse abdata,clear            /*----打开网络数据文件----*/
* keep emp wage cap indoutpt id yearm1
* drop if year<=1976
* drop if year>=1982
--*/

* encode id, gen(idp)       
/*----生成新变量idp(取值为1,2,3...)替代id
      此处id为1,2,3的整数，故不需要此命令----*/

xtset id  year              /*----告诉Stata该数据为面板数据----*/


gen lnemp=log(emp)
g   lnwage=log(wage)
g   lncap=log(cap)
g   lnindoutpt=log(indoutpt)




/*--No.1---【T较小】的动态面板模型-----*/


/*--1---【差分GMM】--Arellano-Bond(1991)----*/
/*----程序代码--由微信公众号：财经节析--免费提供 EViews & Stata 操作视频----*/

xtabond lnemp lnwage lncap lnindoutpt, lags(2) maxldep(3) maxlags(4) /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap,lag()) inst(lnindoutpt)  /*--
--*/ twostep  vce(robust)
/*----lags(2)表示模型中含被解释变量p=2阶滞后变量--默认为p=1--
      maxldep(3)表示最多使用被解释变量3阶滞后变量作为工具变量--
	                默认为使用所有可能滞后变量--
	  maxlags(4)表示模型中前定变量、内生变量作为IV，出现的最大滞后阶数为4--
	                默认前定变量使用T_i-p-1的滞后变量，内生变量T_i-p-2
      pre(lnwage,lag(0,2))表示lnwage为前定变量--0表示无滞后变量作为解释变量--
                 2表示使用其2个更高阶滞后变量作为工具变量--
	  endogenous()类似--
      inst()表示额外工具变量--
      twostep表示使用GMM--默认为一步估计GMM----*/
estimates store DIFFGMM

xtabond lnemp lnwage lncap lnindoutpt, lags(2) maxldep(3) maxlags(4) /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap) twostep vce(robust) 

xtabond lnemp lnwage lncap lnindoutpt, lags(2) maxldep(3)  /*--
--*/ pre(lnwage,lag(1,2)) endogenous(lncap) twostep vce(robust) 

xtabond lnemp lnwage lncap lnindoutpt, lags(1) maxldep(2) maxlags(2)  /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap,lag(0,2)) twostep 
vce(robust) 

* xtreg lnemp lnwage lncap lnindoutpt, fe vce(r)

estat abond, artests(3) 
/*----差分GMM--使用前提--原模型扰动项无自相关--
      等价于差分模型扰动项一阶自相关，二阶以上无自相关--
      H0:扰动项无序列相关----*/
	  
quietly xtabond lnemp lnwage lncap lnindoutpt, lags(1) maxldep(2) maxlags(2) /*--
--*/  pre(lnwage, lag(0,2)) endogenous(lncap, lag(0,2)) twostep

estat sargan
/*----sargan检验工具变量过度识别问题--
      H0:所有工具变量均有效--
      sargan检验假设扰动项iid--
	  sargan检验时，xtabond不能使用vce(robust)----*/


*   di log(e(rss)/e(N_g))+2/e(N_g)*e(df_m)
/*----计算AIC的值----确定动态面板模型的中被解释变量的最优滞后阶数----*/
*   di log(e(rss)/e(N_g))+log(e(N_g))/e(N_g)*e(df_m)
/*----计算SIC的值----确定动态面板模型的中被解释变量的最优滞后阶数----*/
	  
 
/*--2---【系统GMM】--Blundell-Bond(1998)----*/
/*----程序代码--由微信公众号：财经节析--免费提供 EViews & Stata 操作视频----*/

xtdpdsys lnemp lnwage lncap lnindoutpt, lags(1) maxldep(3) /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap, lag(0,2)) twostep vce(r)

estimates store SYSGMM
 
estimates table DIFFGMM SYSGMM, b  star(0.01 0.05 0.1)
estimates table DIFFGMM SYSGMM, b(%9.4f)  se(%9.2f)  t p


estat abond, artests(3) 
/*----差分GMM--使用前提--原模型扰动项无自相关--差分滞后被解释变量与个体效应不相关--
      等价于差分模型扰动项一阶自相关，二阶以上无自相关--
      H0:扰动项无序列相关----*/
 
xtdpdsys lnemp lnwage lncap lnindoutpt, lags(1) maxldep(3) /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap, lag(0,2)) twostep

estat sargan
/*----sargan检验工具变量过度识别问题--
      H0:所有工具变量均有效----*/
 
 
 
xtdpdsys lnemp lnwage lncap lnindoutpt, lags(1) maxldep(3)  /*--
--*/ pre(lnwage,lag(0,2)) endogenous(lncap, lag(0,2)) twostep vce(robust)
 
estat abond
 
 
quietly xtdpdsys lnemp lnwage lncap lnindoutpt, lags(3) maxldep(3) /*-- 
--*/ pre(lnwage,lag(0,2)) endogenous(lncap, lag(0,2)) twostep

estat sargan
 
 
/*-----【异方差稳健的Hansen检验】--工具变量有效性----*/
/*----程序代码--由微信公众号：财经节析--免费提供 EViews & Stata 操作视频----*/

ssc install xtabond2     /*----安装非Stata系统命令包----*/
cd C:\ado\plus           /*----有时，不改变默认路径是无法使用新安装的命令包----*/ 
 
xtabond2 lnemp L(1).lnemp  L(0/1).lnwage lncap lnindoutpt, /*--
--*/ gmm(lnemp,lag(1 3)) gmm(lncap,lag(1 3))   /*--
--*/ noleveleq twostep robust 
small
/*----gmm(lncap,lag(1 2))使用lncap的2和3阶滞后变量为IV--
      iv(lnindoutpt)表示lnindoutpt为额外IV--
      noleveleq表示不估计水平模型--
	  small报告t和F统计量的信息--*/
 

 
