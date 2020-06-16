

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-------------------------------------Ch1-4--Stata结果输出--------------------------------*/


/*----导入面板数据----*/

import excel "G:\Stataex\expd.xls", sheet("sheet11") firstrow clear
save G:\Stataex\panelex2.dta,replace   /*----对数据进行指导位置的保存----*/


/*----调用面板数据----*/

cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/




/*-----Stata结果输出-----*/ 

gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)

*  ssc install st0085_2            /*----安装非Stata系统软件包----*/

* eststo clear                     /*----清除保存的估计结果----*/

reg lnq lnarea lnfarmm lnagchf,vce(cluster provi)  /*----pool回归，稳健估计----*/
* estimates store POOL11           /*----保存回归结果，命名为POOL11----*/
eststo POOL11

xtreg lnq lnarea lnfarmm lnagchf,fe vce(cluster provi)  /*----个体固定效应变截距模型--组内估计--*/
* estimates store FE1
eststo FE1


estout

esttab POOL11 FE1, ar2(%8.4f) se(%8.3f)  star(* 0.1 ** 0.05 *** 0.01)
esttab , ar2(%8.4f) se(%8.4f) brackets aic bic mtitles 

esttab POOL11 FE1 using test31.doc, ar2(%8.4f) se(%8.4f) aic bic mtitles  
esttab POOL11 FE1 using test1.xls, ar2(%8.4f) se(%8.4f) aic bic mtitles replace
esttab POOL11 FE1 using test1.xls, ar2(%8.4f) se(%8.4f) brackets nogap aic bic mtitles replace    /*--推荐使用--*/
esttab POOL11 FE1 using test1.xls, ar2(%8.4f) se(%8.4f) nogap aic bic mtitles replace  

/*----(%8.4f)表示数据保留小数点后4位有效数字--
       star(* 0.1 ** 0.05 *** 0.01)显著性水平--
	   brackets表示se放在中括号里--默认是小括号--
	   ar2表示修正的R2--r2表示R2--
	   se表示标准误--
	   aic、bic是信息准则--
	   mtitles表示把POOL11、FE1作为标题名，默认是被解释变量名--
	   using test1.doc表示将回归结果保存至Word文档----*/

	   

*  ssc install outreg2                       /*----安装非Stata系统软件包----*/
outreg2 using test2.doc,see replace 
outreg2 using test2.doc,replace adjr2
outreg2 [POOL11 FE1] using test2.doc,see replace  adjr2
 /*----adjr2表示修正的R2--
       see 表示将回归结果以dta的形式显示出来----*/

	   
logout, save(G:\testp2) word  replace: reg  lnq lnarea lnfarmm lnagchf, vce(cluster provi)
logout, save(G:\data222) word  replace



quietly reg lnq lnarea lnfarmm lnagchf,vce(cluster provi)  /*----pool回归，稳健估计----*/
* estimates store POOL11           /*----保存回归结果，命名为POOL11----*/
eststo POOL11

xtreg lnq lnarea lnfarmm lnagchf,fe vce(cluster provi)  /*----个体固定效应变截距模型--组内估计--*/
* estimates store FE1
eststo FE1


estimates table  POOL11 FE1,b(%9.4f)  se(%-9.2f) 
estimates table  POOL11 FE1,b(%9.4f)  star(0.1 0.05 0.01) stats(N r2_a ll aic bic)  /*--建议使用--*/
estimates table  POOL11 FE1,b  se(%-9.2f) t stats(N r2_a ll aic bic)
/*----(%-9.2f)表示数据保留小数点后2位有效数字--
       ”-“表示左对齐--
	   b表示参数估计值--
       star(0.1 0.05 0.01)显著性水平--【不能与se、p、t同时使用】--
	   r2_a表示修正的R2--r2表示R2--
	   se表示标准误--
	   aic、bic是信息准则--
	   ll表示对数似然函数----*/
