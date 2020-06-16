


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-----------------------------------Ch3-2--变截距模型回归基本操作----------------------------------*/


/*----导入面板数据----*/

import excel "G:\Stataex\expd.xls", sheet("sheet11") firstrow clear
save G:\Stataex\panelex2.dta,replace   /*----对数据进行指导位置的保存----*/


/*----调用面板数据----*/

cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/



/*-----描述统计--参见Ch1-3基本操作---*/





	   
/*--1-------------------------------pool回归----------------------------------*/

gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)


reg lnq lnarea lnfarmm lnagchf,vce(cluster provi)   
/*----pool回归，稳健估计--nocon表示回归模型不带截距项，xtreg类似--*/
estimates store POOL11

reg lnq lnarea lnfarmm lnagchf,r   /*----pool回归，稳健估计----*/



predict lnqhat         /*----计算lnq样本条件均值--lnq_hat----*/
predict e1,r           /*----计算残差----*/
xtline e1,overlay
egen rss1=sum(e1^2)    /*----计算残差平方和----*/
di rss1

gen rss_r=e(rss)
display rss_r
/*----调用残差平方和----*/

gen ll_r=e(ll)
display ll_r
/*----调用对数似然函数值----*/


*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab using testpool1.doc, ar2(%8.4f) se(%8.4f) brackets aic bic  mtitles replace
/*----结果输出至Word里----*/
outreg2  using testpool2.xls, replace adjr2
/*----在Stata中预览结果，并保存至Excel中----*/
/*----【注意】----esttab、outreg2第一次使用是需要安装的，参见Ch1-4----*/







/*--2---------------------------固定效应变截距模型----------------------------*/

gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)     /*--【注意】--若前面已经运行过，此处无需操作----*/


xtreg lnq lnarea lnfarmm lnagchf,fe vce(cluster provi)  
estimates store FE1i1
/*----个体固定效应变截距模型--组内估计--
      fe表示个体固定效应--默认是个体随机效应--、
	  vce(cluster provi)表示稳健估计--或者--用r表示----*/
xtreg lnq lnarea lnfarmm lnagchf,fe r
estimates store FE1i2


*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab FE1i1 FE1i2 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/



reg lnq lnarea lnfarmm lnagchf i.provi,r        /*----个体固定效应LSDV法估计结果----*/
estimates store FE2i


*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab FE1i2 FE2i using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/
/*----将不同个体固定效应估计结果进行对比----*/



xtreg lnq lnarea lnfarmm lnagchf,fe             /*----个体固定效应回归，附Chow检验----*/
estimates store FE3i



reg lnq lnarea lnfarmm lnagchf i.year,r         /*----【时点】固定效应变截距模型----*/
estimates store FE4t



xtreg lnq lnarea lnfarmm lnagchf i.year,fe r    /*----【双】固定效应变截距模型----*/
estimates store FE5it


xtreg lnq lnarea lnfarmm lnagchf i.year,fe      /*----【双】固定效应变截距模型--中附带的F检验【失效】--*/


reg lnq lnarea lnfarmm lnagchf i.provi i.year,r   /*----个体时点【双】固定效应LSDV法估计结果----*/


predict lnqhat1        /*----计算lnq样本条件均值--lnq_hat----*/
l lnqhat1

predict e2,r           /*----计算残差----*/
xtline e2,overlay






/*--3-------------------------随机效应变截距模型------------------------------*/

gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)        /*--【注意】--若前面已经运行过，此处无需操作----*/


xtreg lnq lnarea lnfarmm lnagchf,mle          /*----个体随机效应变截距模型MLE--附LR检验--H0：sigmaU=0--*/
estimates store RE1i 

xtreg lnq lnarea lnfarmm lnagchf,re r theta   /*----个体随机效应变截距模型FGLS----*/
estimates store RE2i   

xttest0                   /*----LM检验--H0：sigmaU2=0----*/

xtreg lnq lnarea lnfarmm lnagchf, r theta   /*----个体随机效应变截距模型FGLS----*/
estimates store RE22i  


*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab RE22i RE2i using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/
/*----对比个体随机效应时，要不要写re结果相同----*/



/*----
mixed lnq lnarea lnfarmm lnagchf  || provi:    
/*----个体随机效应变截距模型MLE
      xtmixed从Stata13开始更名为mixed----*/
estimates store REI1

xtreg lnq lnarea lnfarmm lnagchf,mle
estimates store REI2

estimates table REI1 REI2,b(%-9.4f)  se(%-9.4f)  stats(N r2_a ll aic bic)


mixed lnq lnarea lnfarmm lnagchf || year:  ,r  /*----时点随机效应变截距模型MLE----*/

mixed lnq lnarea lnfarmm lnagchf || provi: ||year: ,iterate(50) tolerance(1e-4)   
/*----个体时点随机效应变截距模型MLE----*/


mixed lnq lnarea lnfarmm lnagchf i.year  || provi: ,r   /*----个体随机、时点固定效应变截距模型MLE----*/
estimates store REFE1
mixed lnq lnarea lnfarmm lnagchf i.provi  || year:    /*----个体固定、时点随机效应变截距模型MLE----*/
-----*/



xtreg lnq lnarea lnfarmm lnagchf i.year,re r theta   /*----个体随机、时点固定效应变截距模型FGLS----*/
estimates store REFE2

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab REFE1 REFE2 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/



predict lnqhat2        /*----计算lnq样本条件均值--lnq_hat----*/



/*------------------------------------------------
xtreg lnq lnarea lnfarmm lnagchf,be   
/*----随机效应变截距模型--组间估计----*/
------------------------------------------------*/


*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab FE1i2 RE2i using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/
/*----将个体固定效应和个体随机效应估计结果进行对比----*/




