

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-------------------------------------Ch1-3--基本操作--------------------------------*/

 
/*----导入面板数据----*/

import excel "G:\Stataex\expd.xls", sheet("sheet11") firstrow clear
save G:\Stataex\panelex2.dta,replace   /*----对数据进行指导位置的保存----*/


/*----调用面板数据----*/

pwd         /*----‘path of working directory’查看当前目录位置---*/

cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/


/*-----描述统计-----*/

xtdes                                  /*----显示面板数据的结构----*/
xtsum q area farmm agchf provi year    /*----显示面板数据的统计特征----*/
xttab q in 1/100                       /*----显示面板数据的分布频率----*/
xttab q if q<=1000
/*----xttab--使用命令：set maxsize #
      Stata/MP和Stata/SE，允许的范围：10 < # < 11000
	  Stata/IC：10 < # < 800--超过这个范围就会出错----*/

	  
list q area in 4/10                /*----显示指定变量从i=4到i=10的取值----*/
l q farmm if q<=2000               /*----显示指定变量满足q<=2000的取值----*/
l q farmm if q>=2000 & farmm<=230
l q farmm if 2000>=q & q>=1500

/*------------【以下命令慎用】-----最好，事先备份一份数据库-----------------
 drop farmm             /*----删除变量farmm----*/
 drop if q<=1200        /*----删除数据库中满足q<=1200对应的变量值----*/
 keep q area            /*----仅保留变量q和area----*/
 keep if q>=2300        /*----仅保留数据库中满足q>=2300对应的变量值----*/
 rename q q1            /*----把变量q的名字换成q1----*/
 -------------------------------------------------------------------------*/



/*-----生成新变量-----*/

gen lnq=log(q*2)
g lnq=log(q)
rename lnq lnq1

g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)
g qa=q*2-sqrt(area)
g qaa=exp(lnq)


g d_qy2=(qy==2)            /*----如果是中部省市，生成虚拟变量d_qy2=1，否则为0。----*/
g d_qy3=(qy==3)            /*----如果是西部省市，生成虚拟变量d_qy3=1，否则为0。----*/

reg lnq lnarea lnfarmm lnagchf  i.qy, r                  
estimates store POOL00
reg lnq lnarea lnfarmm lnagchf  d_qy2 d_qy3, r                  
estimates store POOL01

estimates table  POOL00 POOL01,b  se(%-9.2f) t stats(N r2_a ll aic bic)

g  jm=(year>=2006)           
/*----满足year>=2006时，生成虚拟变量jm=1，否则为0。农业税减免----*/ 

reg lnq lnarea lnfarmm lnagchf  i.year, r              
reg lnq lnarea lnfarmm lnagchf  jm, r                  


/*--变量滞后变换--*/
reg lnq lnarea lnfarmm lnagchf l.lnfarmm, r                  
reg lnq lnarea lnfarmm lnagchf l3.lnfarmm, r                  
reg lnq lnarea lnfarmm lnagchf l(1/4).lnfarmm, r                  

/*--变量差分变换--*/
reg lnq lnarea lnfarmm lnagchf d.lnfarmm, r                  
reg lnq lnarea lnfarmm lnagchf d3.lnfarmm, r                  
reg lnq lnarea lnfarmm lnagchf d(2/4).lnfarmm, r                  
 
 
 
/*-----画图-----*/ 

xtline q,overlay              /*----在同一图里，画变量q的时间序列图----*/
graph save panel2, replace    /*----将图片保存至默认路径，图名为panel2----*/

pwd

