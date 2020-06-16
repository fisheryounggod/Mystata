

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-------------------------------------Ch4-2--变系数模型回归--------------------------------*/


/*-----此处，介绍如何构建变系数面板模型-----*/


cd G:\Stataex                          /*----指定默认路径----*/

use G:\Stataex\panelex2ex.dta,clear    /*----打开指定路径下的数据文件----*/

/*    sysuse dir     */                /*----使用Stata中自带数据集----*/  

encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/


gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)






/*--【No.1】---------------------------【固定】变系数-----------------------------*/


/*--【1】-------------固定变系数--随【个体i】变------------------*/


/*---截距项【不变】--固定变系数--（1个变量系数）随个体变----*/

reg lnq lnarea lnfarmm lnagchf  i.provi#c.lnfarmm  ,r 
/*---lnfarmm系数的基础类型是provi=1，
     lnfarmm对应其他个体的系数应该加上基础类型的系数值----*/
estimates store OLSFVC1

reg lnq lnarea lnagchf  i.provi#c.lnfarmm  ,r
/*---lnfarmm对应其他个体的系数就是其自身的系数----*/
estimates store OLSFVC11

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab OLSFVC1 OLSFVC11 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/



/*---截距项【不变】--固定变系数--（2个变量系数）随个体变----*/

reg lnq lnarea lnfarmm lnagchf i.provi#c.lnarea i.provi#c.lnfarmm, vce(cluster provi)
estimates store OLSFVC2





/*---截距项随【个体】变--固定变系数--（1个变量系数）随个体变----*/

reg lnq lnarea lnfarmm lnagchf i.provi i.provi#c.lnfarmm, vce(cluster provi)
/*----quietly表示不显示回归结果的信息----*/
estimates store OLSFVC1

xtreg lnq lnarea lnfarmm lnagchf  i.provi#c.lnfarmm,fe vce(cluster provi)



/*---截距项随【时点】变--固定变系数--（2个变量系数）随个体变----*/

reg lnq lnarea lnfarmm lnagchf i.year i.provi#c.lnarea i.provi#c.lnfarmm, vce(cluster provi)
estimates store OLSFVC2



/*---截距项随【个体和时点】--固定变系数--（1个变量系数）随个体变----*/

xtreg lnq lnarea lnfarmm lnagchf i.year i.provi#c.lnfarmm,fe vce(cluster provi)
estimates store FEFVC

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab OLSFVC FEFVC using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/





/*--【2】---------------固定变系数--随【时点t】变------------------*/

/*---类似于固定变系数，随【个体】变----*/


quietly reg lnq lnarea lnfarmm lnagchf  i.provi i.year#c.lnagchf, vce(cluster provi)
estimates store OLSFVCT

xtreg lnq lnarea lnfarmm lnagchf  i.year#c.lnagchf,fe vce(cluster provi)
estimates store FEFVCT

estimates table OLSFVCT FEFVCT, b se


esttab OLSFVC FEFVC OLSFVCT FEFVCT using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/





/*--【3】---------------固定变系数--随【所在区域】变---------*/

reg lnq lnarea lnfarmm lnagchf i.provi i.qy#c.lnfarmm, vce(cluster provi)  /*---截距项随个体--固定变系数--（1个变量系数）随【所在区域】变----*/

/*----quietly表示不显示回归结果的信息----*/
estimates store OLSFVC1

xtreg lnq lnarea lnfarmm lnagchf  i.qy#c.lnfarmm,fe vce(cluster provi)


/*---截距项随个体和时点--固定变系数--（3个变量系数）随【所在区域】变----*/

xtreg lnq lnarea lnfarmm lnagchf i.year i.qy#c.lnarea i.qy#c.lnfarmm i.qy#c.lnagchf,fe vce(cluster provi)
estimates store OLSFVC2









/*--【No.2】----------------------------【随机】系数------------------------------*/

/*---【随机效应】变系数模型本质上也是个体随机效应变截距模型----*/


xtrc lnq lnarea lnfarmm lnagchf, betas vce(boot)
/*----betas表示显示不同系数的回归结果--不包含betas默认不显示--noconstant表示不含截距项----*/

xtrc lnq lnarea lnfarmm lnagchf, betas

xtrc lnq lnarea lnfarmm lnagchf, vce(boot)

xtrc lnq lnarea lnfarmm lnagchf, betas nocon


xtrc lnq lnarea lnfarmm lnagchf, betas nocon vce(boot)
