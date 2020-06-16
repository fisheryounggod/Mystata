

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-------------------------------------Ch4-3--变系数模型设定检验--------------------------------*/





/*--【No.1】------------------------固定变系数---随个体或区域变-----LR检验----------------------*/


cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/
	
	
gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)



/*---------pool回归--【约束模型】表示：H0成立时对应的回归模型------------*/

reg lnq lnarea lnfarmm lnagchf   
/*----pool回归--quietly表示不显示回归结果---*/
estimates store POOL1F

gen ll_r=e(ll)
display ll_r              /*----调用pool回归的对数似然函数值----*/



/*---------1个变量系数随【个体】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

reg lnq lnarea lnfarmm lnagchf  i.provi#c.lnfarmm
estimates store FE1F

gen ll_u=e(ll)
display ll_u             /*----调用对数似然函数值----*/

gen N=29                 /*----调用个体数N----*/


di "LR = "  -2*(ll_r-ll_u)                       /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N-1,0.05)      
/*----计算卡方检验5%显著性水平对应的临界值
     【注意】此处的约束条件的个数与仅变截距项时的检验不同，、
	 下同，故略----*/




/*---------2个变量系数随【区域】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

reg lnq lnarea lnfarmm lnagchf  i.qy#c.lnfarmm i.qy#c.lnagchf
estimates store FE1F

gen ll_u3=e(ll)
display ll_u3             /*----调用对数似然函数值----*/

gen Nq=3                 /*----调用区域个数Nq----*/


di "LR = "  -2*(ll_r-ll_u3)                      /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(2*(Nq-1),0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/





/*---1----个体固定效应变截距--1个变量系数随【个体】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf i.provi#c.lnfarmm,fe
estimates store FE1F

gen ll_u4=e(ll)
display ll_u4             /*----调用对数似然函数值----*/

gen N4=29                 /*----调用个体数N----*/


di "LR = " -2*(ll_r-ll_u4)                        /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N4-1+N4-1,0.05)      
/*----计算卡方检验5%显著性水平对应的临界值
     【注意】此处，连同截距项一起检验了----*/

	 
	 
	 
/*---2----个体固定效应变截距--变量系数不变--【约束模型】表示：H0：个体固定效应模型-----------------------*/
/*--------【注意】此处的备择假设H1：个体固定效应变截距，1个变量系数随【个体】变化的模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf ,fe
estimates store FE1F

gen ll_r7=e(ll)
display ll_r7             /*----调用对数似然函数值----*/


di "LR = " -2*(ll_r7-ll_u4)                        /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N4-1,0.05)      
/*----计算卡方检验5%显著性水平对应的临界值
     【注意】此处，在截距项是个体固定效应的前提下，
	 检验lnfarmm的系数是否随个体变化----*/
	 

	 
	 
  
	  
/*---1----个体固定效应变截距--2个变量系数随【区域】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf i.qy#c.lnfarmm i.qy#c.lnagchf,fe
estimates store FE1F

gen ll_u5=e(ll)
display ll_u5             /*----调用对数似然函数值----*/

gen Nq1=3                 /*----调用区域数----*/
gen N5=29                 /*----调用个体数----*/


di "LR = " -2*(ll_r-ll_u5)                       /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N5-1+2*(Nq1-1),0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/
/*----【注意】----对于个体固定效应变截距--2个变量系数随【区域】变化--的检验远比这里复杂，
      需遵循从一般到特殊的原则，逐次检验，此处不作要求。
	  下同，故略----------*/


/*---2----个体固定效应变截距--变量系数不变--【约束模型】表示：H0：个体固定效应模型------------*/
/*--------【注意】此处的备择假设H1：个体固定效应变截距，2个变量系数随【区域】变化的模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf ,fe
estimates store FE1F

gen ll_r8=e(ll)
display ll_r8             /*----调用对数似然函数值----*/

gen Nq8=3                 /*----调用区域数----*/
gen N8=29                 /*----调用个体数----*/


di "LR = " -2*(ll_r8-ll_u5)                       /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(2*(Nq8-1),0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/
/*----【注意】----对于个体固定效应变截距--2个变量系数随【区域】变化--的检验远比这里复杂，
      需遵循从一般到特殊的原则，逐次检验，此处不作要求。
	  下同，故略----------*/
	




/*--【No.2】------------------------固定变系数----随时点变----LR检验-----------------------*/



/*---------1个变量系数随【时点】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

reg lnq lnarea lnfarmm lnagchf  i.year#c.lnfarmm
estimates store FE1F

gen ll_u1=e(ll)
display ll_u1             /*----调用对数似然函数值----*/

gen T=34                 /*----调用时间长度T----*/


di "LR = " -2*(ll_r-ll_u1)    /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(T-1,0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/



*---------2个变量系数随【时点】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

reg lnq lnarea lnfarmm lnagchf i.year#c.lnarea i.year#c.lnfarmm
estimates store FE1F

gen ll_u2=e(ll)
display ll_u2             /*----调用对数似然函数值----*/

gen T1=34                 /*----调用时间长度T----*/


di "LR = " -2*(ll_r-ll_u2)                       /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(2*(T1-1),0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/



/*-----个体固定效应变截距----1个变量系数随【时点】变化--【无约束模型】表示：H1对应的回归模型------------*/
/*--------【注意】此处的原假设H0：pool模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf  i.year#c.lnfarmm, fe
estimates store FE1F

gen ll_u6=e(ll)
display ll_u6             /*----调用对数似然函数值----*/

gen N6=29                 /*----调用个体数N----*/
gen T6=34                 /*----调用时间长度T----*/


di "LR = " -2*(ll_r-ll_u6)                       /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N6-1+T6-1,0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/








/*--【No.3】------------------随机系数--------Stata自带检验方法Swamy检验----------*/



xtrc lnq lnarea lnfarmm lnagchf, betas vce(boot)
/*----betas表示显示不同系数的回归结果--不包含betas默认不显示----*/

xtrc lnq lnarea lnfarmm lnagchf, betas


xtrc lnq lnarea lnfarmm lnagchf,nocon





