


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-----此处---Ch5-3---介绍如何构建：短动态面板模型-----*/



cd G:\Stataex                          /*----指定默认路径----*/

use G:\Stataex\ch5dpdataex.dta,clear   /*----打开指定路径下的数据文件----*/
/*----数据来源于Arellano & Bond(1991)中的数据----*/


/*--
* webuse abdata,clear            /*----打开网络数据文件----*/
* keep emp wage cap indoutpt id yearm1
* drop if year<=1976
* drop if year>=1982
--*/


* encode id, gen(idp)       /*----生成新变量idp(取值为1,2,3...)替代id--*/
                            /*----注意：此处id为1,2,3……整数，故无需使用encode命令----*/

xtset id  year              /*----告诉Stata该数据为面板数据----*/

browse





gen lnemp=log(emp)
g   lnwage=log(wage)           /*----实际工资----*/
g   lncap=log(cap)             /*----总资本----*/
g   lnindoutpt=log(indoutpt)   /*----工业产出--衡量工业需求波动----*/







/*--No.1---【T较小】的动态面板模型-----*/


/*--1---【差分GMM】--Arellano-Bond(1991)----*/

xtabond lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) maxlags(5) ///
                pre(lnwage,lag(1,2)) endogenous(lncap,lag(2,2))  ///
                twostep  vce(robust)
/*----lags(2)表示模型中含被解释变量p=2阶滞后变量--默认为p=1--
      maxldep(3)表示最多使用被解释变量3阶滞后变量作为工具变量--
	                默认为使用所有可能滞后变量--
	  maxlags(5)表示模型中前定变量、内生变量作为IV，出现的最大滞后阶数为5--
	                默认前定变量使用T_i-p-1的滞后变量，内生变量T_i-p-2
      pre(lnwage,lag(0,2))表示lnwage为前定变量--0表示无滞后变量作为解释变量--
                 2表示使用其2个更高阶滞后变量作为工具变量--
	  endogenous()类似--
      inst()表示额外工具变量--
      twostep表示使用GMM--默认为一步估计GMM--
	  noconstant表示不包括常数项----*/
estimates store DIFFGMM




xtabond lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                pre(lnwage,lag(1,2)) pre(lncap,lag(2,2))  ///
                twostep  vce(robust)


				
xtabond lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                endogenous(lnwage,lag(1,.)) end(lncap,lag(2,.))  ///
                twostep  vce(robust)


estat abond, artests(3) 
/*----差分GMM--使用前提--原模型扰动项无自相关--
      等价于差分模型扰动项一阶自相关，二阶及以上无自相关--
      H0:差分模型扰动项无序列相关----*/

	  

quietly xtabond lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                        end(lnwage,lag(1,.)) endogenous(lncap,lag(2,.))  ///
                        twostep  

estat sargan
/*----sargan检验工具变量过度识别问题--
      H0:所有工具变量均有效--
      sargan检验假设扰动项iid--
	  sargan检验时，xtabond不能使用vce(robust)----*/


	  
	  

	
xtabond lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                end(lnwage,lag(1,.)) endogenous(lncap,lag(2,.))  ///
                twostep  vce(robust)	
	
estimates store DIFFGMM2
	
* ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab DIFFGMM2 using testdpdreg1.doc, ar2(%8.4f) se(%8.4f) ///  
	    nogap brackets aic bic  mtitles replace	
	
	
	
	
	
 
/*--2---【系统GMM】--Blundell-Bond(1998)----*/

xtdpdsys lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                 end(lnwage,lag(1,2)) endogenous(lncap,lag(2,2))  ///
                 twostep  vce(robust)

estimates store SYSGMM
 
* ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab DIFFGMM SYSGMM using testdpdreg2.doc, ar2(%8.4f) se(%8.4f) ///  
	    nogap brackets aic bic  mtitles replace

	
estat abond, artests(3) 
/*----差分GMM--使用前提--原模型扰动项无自相关--差分滞后被解释变量与个体效应不相关--
      等价于差分模型扰动项一阶自相关，二阶以上无自相关--
      H0:扰动项无序列相关----*/
 
 
 
 
xtdpdsys lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                 end(lnwage,lag(1,2)) endogenous(lncap,lag(2,2)) ///
				 twostep

				 			 
estat sargan
/*----sargan检验工具变量过度识别问题--
      H0:所有工具变量均有效----*/
 
 
 
 
xtdpdsys lnemp  l(0/2).lnindoutpt yr1980-yr1984, lags(2) maxldep(3) ///
                 end(lnwage,lag(1,2)) endogenous(lncap,lag(2,2))  ///
                 twostep  vce(robust)

estimates store SYSGMM2
 
* ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab SYSGMM2 using testdpdreg3.doc, ar2(%8.4f) se(%8.4f) ///  
	    nogap brackets aic bic  mtitles replace

 
 
 
 
 
/*-----【异方差稳健的Hansen检验】--工具变量有效性----*/

*  ssc install xtabond2     /*----安装非Stata系统命令包----*/
*  cd C:\ado\plus           /*----有时，不改变默认路径是无法使用新安装的命令包----*/ 
 
xtabond2 lnemp L(1/2).lnemp  L(0/1).(lnwage lncap lnindoutpt) ///
                yr1980-yr1984, gmm(lnemp, lag(3 4)) gmm(lncap,lag(2 3)) ///
				iv(yr1980-yr1984  lnindoutpt)  ///
                noleveleq twostep robust 
				
/*----gmm(lncap,lag(1 2))使用lncap的2和3阶滞后变量为IV--
      iv(lnindoutpt)表示lnindoutpt为额外IV--
      noleveleq表示不估计水平模型，为差分GMM--默认是系统GMM--
	  small报告t和F统计量的信息--*/
 

 
