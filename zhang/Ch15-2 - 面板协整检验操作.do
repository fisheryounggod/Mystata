


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/



/*---Ch15-2----此处，介绍如何进行【面板协整检验】-----*/



cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\cointegrationpdata.dta,clear      /*----打开指定路径下的数据文件----*/


*webuse xtcoint, clear                 /*----打开网络数据文件----*/

* encode id, gen(id1)      /*----生成新变量id(取值为1,2,3...)替代id----*/
xtset id time              /*----告诉Stata该数据为面板数据----*/

rename  productivity  y    /*----对变量重新命名，此处主要是为了后面操作简便----*/
rename  rddomestic    x1
rename  rdforeign     x2

 

***/*----常用的第一代面板协整检验--Kao、Pedroni、Westerlund检验--基于残差类--*/***


**/*--【No.1--Kao检验（1999）】--高志华--同质----1种情形----*/**

/*----Kao检验--H0：不存在协整关系--H1：所有个体存在协整关系----*/


xtcointtest kao y x1 x2,demean lags(bic 12) kernel(ba 6)
/*----y为被解释变量，x1和x2为被解释变量，进行面板协整Kao检验--
      demean是为了减轻截面相关对检验的影响--
      lags(bic 12)应用BIC准则选取ADF回归最优滞后阶数-
                      aic、hqic--12表示选个较大的滞后阶数--默认是lags(1)--
      kernel(ba 6)表示使用Bartlett核函数，6为最大滞后阶数,估计长期方差-
	                      pa、qu分别表示Parzen、quadratic spectral核函数--
	  kernel(ba nw)表示使用Bartlett核函数，Newey-West滞后阶数,估计长期方差-
	                       默认为此类型--
	  kernel(pa nw)、kernel(qu nw)，跟上述类似----*/
/*----【面板协整回归模型中】仅含个体固定效应项----*/
 




**/*--【No.2--Pedroni检验（1999,2004）】----异质 & 同质----3种情形----*/**

/*----Pedroni检验--H0：不存在协整关系--H1a：所有个体存在协整关系--Stata仅给了这种情形--
                                     --H1b：部分个体存在协整关系----*/
									 
/*--1--异根--Pedroni检验----*/
				 				 
xtcointtest pedroni y x1 x2,trend demean lags(bic 12) kernel(ba 6) ar(panels)
/*----y为被解释变量，x1和x2为被解释变量，进行面板协整Pedroni检验--
      demean是为了减轻截面相关对检验的影响--
      lags(bic 12)应用BIC准则选取ADF回归最优滞后阶数-
                      aic、hqic--12表示选个较大的滞后阶数--默认是lags(1)--
      kernel(ba 6)表示使用Bartlett核函数，6为最大滞后阶数,估计长期方差-
	                      pa、qu分别表示Parzen、quadratic spectral核函数--
	  kernel(ba nw)表示使用Bartlett核函数，Newey-West滞后阶数,估计长期方差-
	                       默认为此类型--
	  kernel(pa nw)、kernel(qu nw)，跟上述类似--
	  trend表示含个体固定效应和时间趋势（随个体不同）项--
	  ar(same)表示残差单位根检验的自回归系数同质--ar(panels)表示自回归系数异质--
	                                            默认为ar(panels)----*/
/*----【面板协整回归模型中】含个体固定效应和线性时间趋势（随个体不同）项----*/
 
xtcointtest pedroni y x1 x2, demean lags(bic 12) kernel(ba 6) ar(panels)
/*----【面板协整回归模型中】仅含个体固定效应项----*/

xtcointtest pedroni y x1 x2,noconstant demean lags(bic 12) kernel(ba 6) ar(panels)
/*----【面板协整回归模型中】none的情形----*/



/*--2--同根--Pedroni检验----*/
								 
xtcointtest pedroni y x1 x2,trend demean lags(bic 12) kernel(ba 6) ar(same)
/*----【面板协整回归模型中】含个体固定效应和线性时间趋势（随个体不同）项----*/
 
xtcointtest pedroni y x1 x2, demean lags(bic 12) kernel(ba 6) ar(same)
/*----【面板协整回归模型中】仅含个体固定效应项----*/

xtcointtest pedroni y x1 x2,noconstant demean lags(bic 12) kernel(ba 6) ar(same)
/*----【面板协整回归模型中】none的情形----*/





**/*--【No.3--Westerlund检验（2005）】----异质 & 同质----2种情形----*/**

/*----Westerlund检验--H0：不存在协整关系--H1a：所有个体存在协整关系--
                                        --H1b：部分个体存在协整关系----*/

										
/*--1--异质--Westerlund检验----*/								 

xtcointtest westerlund y x1 x2, trend  demean  some
/*----y为被解释变量，x1和x2为被解释变量，进行面板协整Westerlund检验--
      demean是为了减轻截面相关对检验的影响--
	  trend表示含个体固定效应和时间趋势（随个体不同）项--
	  all表示协整检验备择假设所有个体存在协整关系--some表示部分个体存在协整关系-
	         默认为some----*/
/*----【面板协整回归模型中】含个体固定效应和线性时间趋势（随个体不同）项----*/

xtcointtest westerlund y x1 x2, demean  some
/*----【面板协整回归模型中】仅含个体固定效应项----*/



/*--2--同质--Westerlund检验----*/								 

xtcointtest westerlund y x1 x2, trend  demean  all
/*----y为被解释变量，x1和x2为被解释变量，进行面板协整Westerlund检验--
      demean是为了减轻截面相关对检验的影响--
	  trend表示含个体固定效应和时间趋势（随个体不同）项--
	  all表示协整检验备择假设所有个体存在协整关系--some表示部分个体存在协整关系-
	         默认为some----*/
/*----【面板协整回归模型中】含个体固定效应和线性时间趋势（随个体不同）项----*/

xtcointtest westerlund y x1 x2, demean  all
/*----【面板协整回归模型中】仅含个体固定效应项----*/





/*--经检验，在个体固定效应情形下，存在协整关系，
--【面板协整回归模型中】仅含个体固定效应项----*/

xtreg y x1 x2,fe vce(cluster id)
estimates store COINFE

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab using coinfe1.doc, ar2(%8.4f) se(%8.4f) brackets aic bic  mtitles replace


