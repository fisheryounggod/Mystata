

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-------------Ch3补充内容---例如：控制行业、省份、区域、规模、企业性质等的影响--------------------*/



cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/


gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)
g d_qy2=(qy==2)            /*----如果是中部省市，生成虚拟变量d_qy2=1，否则为0。----*/
g d_qy3=(qy==3)            /*----如果是西部省市，生成虚拟变量d_qy3=1，否则为0。----*/



xtreg lnq lnarea lnfarmm lnagchf  d_qy2 d_qy3, fe r    /*----在个体固定效应变截距模型基础上，考虑控制区域因素的影响，失效----*/
estimates store FEdqy1

xtreg lnq lnarea lnfarmm lnagchf  i.qy, fe r            /*----Stata自动生成虚拟变量，失效----*/
estimates store FEdqy2

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab FEdqy1 FEdqy2 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/



reg lnq lnarea lnfarmm lnagchf  i.provi  i.qy , r        /*----在个体固定效应变截距模型基础上，LSDV估计下考虑控制区域因素的影响，失效----*/

reg lnq lnarea lnfarmm lnagchf  i.qy  i.provi , r


reg lnq lnarea lnfarmm lnagchf  i.qy, r                  /*----仅考虑控制区域因素的影响----*/
estimates store FE12



/*----reghdfe在【个体固定效应】模型下，考虑控制区域等不随时点变化因素的影响时，仍失效----*/

* ssc install reghdfe
reghdfe lnq lnarea lnfarmm lnagchf, absorb(provi year qy) vce(r)  
/*----在个体时点固定效应变截距模型基础上，考虑控制区域因素的影响，失效----*/

reghdfe lnq lnarea lnfarmm lnagchf, absorb(provi qy) vce(r)
/*----在个体固定效应变截距模型基础上，考虑控制区域因素的影响，失效----*/
estimates store FEqy2

/*------
xtreg lnq lnarea lnfarmm lnagchf   i.qy, fe r            /*----Stata自动生成虚拟变量，失效----*/
estimates store FEdqy2
-------*/

esttab FEdqy2 FEqy2 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/
/*----对比xtreg和reghdfe命令在个体固定效应下，考虑控制区域因素的影响，失效----*/


reghdfe lnq lnarea lnfarmm lnagchf, absorb(year qy) vce(r)
/*----在时点固定效应变截距模型基础上，考虑控制区域因素的影响----*/








/*------在【个体固定效应】模型下，即便区域等不随时点变化的量是【连续取值的定量变量】，仍失效-------*/

xtreg lnq lnarea lnfarmm lnagchf  qy , fe r       /*----在个体固定效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/

reg lnq lnarea lnfarmm lnagchf   i.provi qy, r    /*----在个体固定效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/

reg lnq lnarea lnfarmm lnagchf  qy i.provi , r    /*----在个体固定效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/

reghdfe lnq lnarea lnfarmm lnagchf  qy, absorb(provi year) vce(r) 





/*---------生成“自然地理位置”因素---------------------
g mj=1  in 1/204 
g mj2=2 in 205/442
g mj3=3 in 443/578
g mj4=4 in 579/748
g mj5=5 in 749/986

replace mj=0  if mj==.
replace mj2=0 if mj2==.
replace mj3=0 if mj3==.
replace mj4=0 if mj4==.
replace mj5=0 if mj5==.


g mji=mj+mj2+mj3+mj4+mj5
------------------------------------------------------*/

/*------在【非个体固定效应】模型下，可以控制区域等不随时点变化的量（虚拟变量、定量变量均可）-------*/

reg lnq lnarea lnfarmm lnagchf  i.qy i.year , r    /*----在时点固定效应变截距模型基础上，考虑控制区域因素的影响----*/

reg lnq lnarea lnfarmm lnagchf  i.mji i.qy i.year , r    /*----在时点固定效应变截距模型基础上，考虑控制区域、自然地理位置因素的影响----*/



reg lnq lnarea lnfarmm lnagchf  qy i.year , r    /*----在时点固定效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/


xtreg lnq lnarea lnfarmm lnagchf  i.qy ,re r    /*----在个体随机效应变截距模型基础上，考虑控制区域因素的影响----*/

xtreg lnq lnarea lnfarmm lnagchf  qy ,re r    
/*----在个体随机效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/




/*----------------------------安装含截距项的reghdfe软件包-----------------------*/

cap ado uninstall ftools
net install ftools, from("https://github.com/sergiocorreia/ftools/raw/master/src/")

cap ado uninstall reghdfe
net install reghdfe, from("https://github.com/sergiocorreia/reghdfe/raw/master/src/")

reghdfe lnq lnarea lnfarmm lnagchf  qy, absorb( year) vce(r) nocon   /*----nocon表示不报告截距项估计值----*/
/*----在时点固定效应变截距模型基础上，考虑控制区域因素（连续取值）的影响----*/

reghdfe lnq lnarea lnfarmm lnagchf , absorb(qy year) vce(r) con   /*----con表示显示截距项估计值（默认报告）----*/
/*----在时点固定效应变截距模型基础上，考虑控制区域因素（虚拟变量）的影响----*/
