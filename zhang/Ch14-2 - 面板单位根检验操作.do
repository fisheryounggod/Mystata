


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-----此处，--Ch14-2--介绍如何进行面板单位根检验-----*/

cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/

gen lnq=log(q)



***/*----常用的第一代面板单位根检验--LLC & IPS检验----*/***



**/*--No.1--LLC检验（2002）----同根----一般适用于T较大的情形，第1种情形除外----*/**

xtunitroot llc lnq,trend demean lags(bic 12)  
/*----对lnq进行面板单位根LLC检验--
----demean是为了减轻截面相关对检验的影响--
----lag(bic 12)应用BIC准则选取最优滞后阶数，不同个体可以有不同的滞后阶数--
------aic、hqic--12表示选个较大的滞后阶数--
----含个体固定效应和线性时间趋势项----*/
 
xtunitroot llc lnq, demean lags(bic 12)    
/*----仅含个体固定效应项----*/

xtunitroot llc lnq,noconstant demean lags(bic 12)   
/*----none的情形----*/

xtline lnq, overlay


/*---下面对差分后的变量进行面板单位根检验--检验步骤与不差分情形一样---*/
xtunitroot llc d.lnq, demean lags(bic 12)  
/*--此处，LLC检验lnq是趋势平稳，因此，无须对lnq进行差分变换，再进行单位根检验。--
--此处，仅仅是演示差分后的变量如何进行单位根检验--*/
xtunitroot llc d(2).lnq, demean lags(bic 12)    
xtunitroot llc d2.lnq, demean lags(bic 12)    



**/*--No.2--IPS检验（2003）----异根----*/**

xtunitroot ips lnq,trend demean lags(bic 8)  
/*----对lnq进行面板单位根IPS检验--
----demean是为了减轻截面相关对检验的影响--
----lag(bic 12)应用BIC准则选取最优滞后阶数，不同个体可以有不同的滞后阶数--
------aic、hqic--12表示选个较大的滞后阶数--
----含个体固定效应和线性时间趋势项----*/
 
xtunitroot ips lnq, demean lags(bic 8)    
/*----仅含个体固定效应项----*/

xtline lnq, overlay



***/*----其他4种--面板单位根检验----*/***


**/*--No.1--HT检验（1999）----同根----T固定，N->∞ 的情形--DF类--AR(1)--*/**

xtunitroot ht lnq, trend demean   
/*----含个体固定效应项和趋势项--Harris & Tzavalis(1999)--
----demean是为了减轻截面相关对检验的影响----*/

xtunitroot ht lnq, demean   
/*----仅含个体固定效应项----*/

xtunitroot ht lnq, noconstant demean   
/*----None的情形----*/

xtline lnq, overlay



**/*--No.2--Breitung检验（2000，2005）----同根----(T,N)_seq->∞ 的情形----*/**

xtunitroot breitung lnq, trend lags(3) robust 
/*----含个体固定效应项和时间趋势项--
----robust表示允许【同期截面相关】，得到稳健统计量--Breitung & Das(2005)--
----lags(3)表示允许扰动项出现自相关情形--AR(4)模型--默认是AR(1)--*/
 
xtunitroot breitung lnq,  lags(3) robust 
/*----仅含个体固定效应项----*/

xtunitroot breitung lnq, noconstant lags(3) robust
/*----None的情形----*/

xtline lnq, overlay



**/*--No.3--Fisher检验（Choi,2001）----异根----T->∞ 的情形----*/**

/*--1--ADF类----*/
xtunitroot fisher lnq, dfuller trend lags(3) demean
/*----含个体固定效应项和时间趋势项--
----demean是为了减轻截面相关对检验的影响--
----lags(3)表示ADF检验滞后阶数----*/

xtunitroot fisher lnq, dfuller drift lags(3) demean
/*----仅含个体固定效应项----*/

* xtunitroot fisher lnq, dfuller noconstant lags(3) demean
/*----None的情形--尽管时序dfuller检验中包含了none的情形，但此处不可用--*/

xtline lnq, overlay



/*--2--pperron类----*/
xtunitroot fisher lnq, pperron trend lags(3) demean
/*----含个体固定效应项和时间趋势项--
----demean是为了减轻截面相关对检验的影响--
----lags(3)表示计算标准误的滞后阶数----*/

xtunitroot fisher lnq, pperron  lags(3) demean
/*----仅含个体固定效应项----*/

* xtunitroot fisher lnq, pperron noconstant lags(3) demean
/*----None的情形--尽管时序pperron检验中包含了none的情形，但此处不可用--*/

xtline lnq, overlay



**/*--No.4--Hadri检验（2000）----异根----(T,N)_seq->∞ 的情形----*/**

/*----【注意】--Hadri检验--H0：所以个体均平稳--H1:部分个体含单位根过程----*/

xtunitroot hadri lnq, trend demean   kernel(bartlett 4) 
xtunitroot hadri lnq, trend demean   robust 
/*----含个体固定效应项和时间趋势项--
----demean是为了减轻截面相关对检验的影响--
----kernel(bartlett 4)表示核函数和滞后阶数，估计长期方差--存在异方差或自相关时，
------仍可用。----此外，还有--parzen、quadraticspectral核函数--
----robust表示允许个体异方差，得到稳健统计量--
----【注意】robust与kernel()不能同时使用--*/

xtunitroot hadri lnq, demean   kernel(bartlett 4) 
/*----仅含个体固定效应项----*/

xtline lnq, overlay
