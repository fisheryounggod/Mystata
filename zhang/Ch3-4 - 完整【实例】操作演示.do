

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-----------------------------------Ch3-4--完整【实例】操作演示----------------------------------*/




/*--1--------------------------F、Chow、LR检验----【检验pool回归还是固定效应回归】--------------------------
       H0：pool模型；H1：固定效应模型-----*/

	   
cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2ex.dta,clear    /*----打开指定路径下的数据文件----*/


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

gen rss_r=e(rss)
display rss_r             /*----调用pool回归的残差平方和----*/

gen ll_r=e(ll)
display ll_r              /*----调用pool回归的对数似然函数值----*/



/*-----第1步----【个体、时点】双固定效应回归--
【无约束模型】表示：H1对应的回归模型------------*/
/*---------【注意】此处的原假设H0：pool模型-------------*/

quietly xtreg lnq lnarea lnfarmm lnagchf i.year,fe          /*----个体时点【双】固定效应回归【无约束回归】，附Chow检验，此Chow检验无效----*/

gen rss_u2=e(rss)
display rss_u2            /*----调用残差平方和----*/

gen ll_u2=e(ll)
display ll_u2             /*----调用对数似然函数值----*/

gen df_u2=e(df_r)
di df_u2                  /*----调用残差平方和的自由度NT-N-T-k+1（k为解释变量的个数）----*/

gen N2=e(N_g)
di N2                     /*----调用个体数N----*/

gen T2=e(N)/e(N_g)
di T2                     /*----调用时间长度T----*/

di "F = "  ((rss_r-rss_u2)/(N2-1+T2-1))/(rss_u2/df_u2)   /*----根据Chow检验定义构造Chow检验统计量----*/
di invFtail(N2-1+T2-1,df_u2,0.05)    /*----计算F检验5%显著性水平对应的临界值----*/
/*----对比F统计量的值和临界值的大小，
      若F统计量的值大，拒绝原假设H0（表示截距项应该变），
	  否则不拒绝H0，表明应该建立pool模型
	  下面的LR检验类似判断----*/

di "LR = "  -2*(ll_r-ll_u2)         /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N2-1+T2-1,0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/

/*----此处，不拒绝原假设H0，说明是pool模型，建立pool模型进行相应分析即可；
      若此处拒绝H0，进行下列检验----*/


	  
	  
/*-----第2步----【个体】固定效应回归--
【无约束模型】表示：H1对应的回归模型------------*/
/*---------【注意】此处的原假设H0：pool模型-------------*/

xtreg lnq lnarea lnfarmm lnagchf,fe    /*----个体固定效应回归【无约束回归】，附F、Chow检验----*/
estimates store FE1F
/*----对于【个体固定效应】模型，回归结果中附有F、Chow检验，可以不计算--
      当然，也可以根据下列算法计算Chow、F检验或者LR检验统计量。
	  但是，对应时点固定效应，个体时点双固定效应Stata未给出对应的F检验，
	  注意：个体时点双固定效应时，Stata回归结果中最下面一行给的F检验不是真正意义上的F检验----*/

gen rss_u=e(rss)
display rss_u            /*----调用残差平方和----*/

gen ll_u=e(ll)
display ll_u             /*----调用对数似然函数值----*/

gen df_u=e(df_r)
di df_u                  /*----调用残差平方和的自由度NT-N-k（k为解释变量的个数）----*/

gen N=e(N_g)
di N                     /*----调用个体数N----*/

gen T=e(N)/e(N_g)
di T                     /*----调用时间长度T----*/

di "F = " ((rss_r-rss_u)/(N-1))/(rss_u/df_u)     /*----根据Chow检验定义构造Chow检验统计量----*/
di invFtail(N-1,df_u,0.05)    /*----计算F检验5%显著性水平对应的临界值----*/
/*----对比F统计量的值和临界值的大小，
      若F统计量的值大，拒绝原假设H0（表示截距项应该变），
	  否则不拒绝H0，表明应该建立pool模型
	  下面的LR检验类似判断----*/

di "LR = " -2*(ll_r-ll_u)     /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(N-1,0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/




/*-----第2步----【时点】固定效应回归--
【无约束模型】表示：H1对应的回归模型------------*/
/*---------【注意】此处的原假设H0：pool模型-------------*/

reg lnq lnarea lnfarmm lnagchf i.year          /*----时点固定效应回归【无约束回归】----*/
estimates store FE2t

gen rss_u1=e(rss)
display rss_u1            /*----调用残差平方和----*/

gen ll_u1=e(ll)
display ll_u1             /*----调用对数似然函数值----*/

gen df_u1=e(df_r)
di df_u1                  /*----调用残差平方和的自由度NT-T-k（k为解释变量的个数）----*/


* gen F1=((rss_r-rss_u1)/(T-1))/(rss_u1/df_u1)   
/*----【注意】T就是时间长度，可以自己手动输入，也可以调用，
       此处需回归个体固定效应模型，因为此处的T是在个体固定计算出来的
	   只需将个体固定效应模型以及关于T的命令回归一次即可----*/

	   
di "F = "  ((rss_r-rss_u1)/(T-1))/(rss_u1/df_u1)  /*----根据Chow检验定义构造Chow检验统计量----*/
di invFtail(T-1,df_u1,0.05)    /*----计算F检验5%显著性水平对应的临界值----*/
/*----对比F统计量的值和临界值的大小，
      若F统计量的值大，拒绝原假设H0（表示截距项应该变），
	  否则不拒绝H0，表明应该建立pool模型
	  下面的LR检验类似判断----*/

	  
*gen LR1=-2*(ll_r-ll_u1)
di "LR = " -2*(ll_r-ll_u1)    /*----根据LR检验定义构造LR检验统计量----*/
di invchi2tail(T-1,0.05)      /*----计算卡方检验5%显著性水平对应的临界值----*/








/*--2---【注意】只有Chow、F检验拒绝原假设，才有进行Hausman检验的必要，否则，建立pool模型即可---------------*/


/*-----Hausman检验---------------------------
       H0：随机效应模型；H1：固定效应模型----*/

gen lnq=log(q)
g lnarea=log(area)
g lnfarmm=log(farmm)
g lnagchf=log(agchf)       /*----【注意】若前面已运行，此处就无需运行----*/



xtreg lnq lnarea lnfarmm lnagchf,fe     /*----个体固定效应回归，附Chow检验----*/
esti store FE1

xtreg lnq lnarea lnfarmm lnagchf,re     /*----个体随机效应变截距模型FGLS----*/
esti store RE1

hausman FE1 RE1,constant sigmamore
/*----Hausman检验，拒绝原假设H0，表示应建立个体固定效应模型----*/


xtreg lnq lnarea lnfarmm lnagchf,fe r
xtreg lnq lnarea lnfarmm lnagchf,fe vce(cluster provi)
* esttab    *参见Ch1-4视频 




/*----样本分类回归操作--
--此处，仅仅是举个例子--
--按不同区域的样本进行分类回归----*/

xtreg lnq lnarea lnfarmm lnagchf if qy==1,fe vce(cluster provi)
xtreg lnq lnarea lnfarmm lnagchf if qy==2,fe vce(cluster provi)
xtreg lnq lnarea lnfarmm lnagchf if qy==3,fe vce(cluster provi)
