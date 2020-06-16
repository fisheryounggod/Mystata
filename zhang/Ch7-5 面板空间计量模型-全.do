



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-5--面板空间计量模型--------------------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install xsmle,all from(http://fmwww.bc.edu/RePEc/bocode/x) replace   /*----安装xsmle的相关命令----*/
 
 h xsmle                /*----安装xsmle的相关命令----*/

 use G:\Stataex\product.dta, clear   /*----打开变量数据库----*/

 gen lngsp=log(gsp)
 gen lnpcap=log(pcap)
 gen lnpc=log(pc)
 gen lnemp=log(emp)
 
 
 spmat use usaww using http://www.econometrics.it/stata/data/xsmle/usaww.spmat
 /*----指定空间权重矩阵名为usaww----*/
 

 
 
 
 
*----面板空间自回归模型PSARM------------*
*----面板空间杜宾模型PSDM---------------*
*----面板空间自相关模型PSACM------------*
*----面板空间误差模型PSEM---------------*
*----广义空间面板随机效应模型GSPREM------*

 
 
 
 
/*--模型1---------------面板空间自回归模型PSARM-----------------------
 xsmle depvar [indepvars] [if] [in] [weight] , wmat(name) 
                model(sar) [SAR_options]
 
 
 ----选项----【注意】默认是SAR模型，即不写 model(sar)。
 depvar ：被解释变量。
 indepvars ：解释变量。
 wmat(name) ：指定空间权重矩阵。
 re ：随机效应，默认为随机效应。
 fe ：固定效应。
 type(type_options) ：指定固定效应的类型。type_options有三种类型：
        ind ：个体固定效应（默认）；time ：时点固定效应；both ：个体时点双固定效应。

		
 vce(vcetype) ：参数估计量方差协方差矩阵稳健估计。 oim, opg, robust, 
                  cluster clustvar, dkraay #  。
				  oim ：观测信息矩阵（OIM）；
				  opg ：梯度外积（OPG）向量；
				  robust ：三明治估计量；
				  cluster clustvar ：聚类三明治估计量；
				  dkraay # ：Driscoll-Kraay 稳健估计量，# 是计算中最大滞后阶数。
 robust ：等同于vce(cluster panelvar)。
 cluster(clustvar) ：等同于vce(cluster clustvar)。

 
 dlag(dlag) ：dlag(1)表示模型含被解释变量时间滞后项、
              dlag(2)表示模型含y_(i,t-1)的空间滞后项、
			  dlag(3)表示模型两者均含。
			  默认为静态面板模型。
 noconstant ：不含截距项，仅在re选项中使用。
 effects ：计算直接、间接、总效应。
 vceeffects(vcee_type[, nsim(#)]) ：设置直接、间接、总效应的标准误。
             dm ：Delta方法标准误；
			 sim [,nsim(#)] ：蒙特卡罗标准误（默认），# ：迭代次数；
			 none ：无标准误。
 constraints(constraints) ：应用线性约束。
 from(init_specs) ：指定系数的初始值。
 hausman ：执行稳健的Hausman检验，仅允许在静态面板模型下使用。
 
 
 level(#) ：设置置信水平；默认level(95)，即95%。
--------------------------------------------------------------------*/

 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe hausman 
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) re nolog effects
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) hausman nolog effects
 est stor PSARM1
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) hausman robust ///
                 nolog effects
 est stor PSARM2r
 
 xsmle lngsp lnpcap lnpc lnemp, wmat(usaww) model(sar) robust nolog effects
 

 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab PSARM1 PSARM2r using testpsarm1.doc, ///
          ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

		
		
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe type(both) hausman	///
                 nolog effects	
		
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe type(time) hausman ///
                 nolog effects
 
	
	
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe robust nolog effects
 est stor PSARM3
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe type(ind) robust nolog effects
 est stor PSARM4
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe type(time) robust nolog effects
 est stor PSARM5
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe type(both) robust nolog effects
 est stor PSARM6
 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSARM3 PSARM4 PSARM5 PSARM6 using testpsarm2.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

 
 
 
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe dlag(1) nolog


 
 
 
 

/*--模型2---------------面板空间杜宾模型PSDM--------------------------
 xsmle depvar [indepvars] [if] [in] [weight] , wmat(name) 
                model(sdm) [SDM_options]
 
 
 ----选项----
 wmat(name) ：指定空间权重矩阵。
 re ：随机效应，默认为随机效应。
 fe ：固定效应。
 type(type_options) ：指定固定效应的类型。type_options有三种类型：
        ind ：个体固定效应（默认）；time ：时点固定效应；both ：个体时点双固定效应。
 dmat(name) ：指定解释变量空间滞后权重矩阵，默认使用wmat(name)中的矩阵。
 durbin(varlist) ：指定空间滞后的解释变量，默认是所有解释变量。

 
 vce(vcetype) ：参数估计量方差协方差矩阵稳健估计。 oim, opg, robust, cluster clustvar, dkraay #
				  oim ：观测信息矩阵（OIM）；
				  opg ：梯度外积（OPG）向量；
				  robust ：三明治估计量；
				  cluster clustvar ：聚类三明治估计量；
				  dkraay # ：Driscoll-Kraay 稳健估计量，# 是计算中最大滞后阶数。
 robust ：等同于vce(cluster panelvar)。
 cluster(clustvar) ：等同于vce(cluster clustvar)。
 
 
 dlag(dlag) ：dlag(1)表示模型含被解释变量时间滞后项、
              dlag(2)表示模型含y_(i,t-1)的空间滞后项、
			  dlag(3)表示模型两者均含。
			  默认为静态面板模型。
 noconstant ：不含截距项，仅在re选项中使用。
 effects ：计算直接、间接、总效应。
 vceeffects(vcee_type[, nsim(#)]) ：设置直接、间接、总效应的标准误。
             dm ：Delta方法标准误；
			 sim [,nsim(#)] ：蒙特卡罗标准误（默认），# ：迭代次数；
			 none ：无标准误。
 constraints(constraints) ：应用线性约束。
 from(init_specs) ：指定系数的初始值。
 hausman ：执行稳健的Hausman检验，仅允许在静态面板模型下使用。
 
 
 level(#) ：设置置信水平；默认level(95)，即95%。
--------------------------------------------------------------------*/


 xsmle lngsp lnpcap lnpc lnemp, re model(sdm) wmat(usaww) ///
                 dmat(usaww) nolog

 xsmle lngsp lnpcap lnpc lnemp, re model(sdm) wmat(usaww) ///
                 dmat(usaww) nolog robust	effects
 est stor PSDM1RE	
 
 
 xsmle lngsp lnpcap lnpc lnemp, re model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog effects
				 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog  effects
				 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog robust effects

 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog robust type(both) ///
				 effects
				 
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) durbin(lnemp) nolog robust effects
 est stor PSDM1FE
 
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) durbin(lnemp) nolog robust ///
				 type(time) effects
 est stor PSDM1FEt
 
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) durbin(lnemp) nolog robust ///
				 type(both) effects
 est stor PSDM1FEit 
 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSDM1RE PSDM1FE PSDM1FEt PSDM1FEit using testpsdm1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace



 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) durbin(lnemp) nolog robust ///
				 type(both) dlag(1) effects




				 
				 

/*--模型3---------------面板空间自相关模型PSACM-----------------------
 xsmle depvar [indepvars] [if] [in] [weight] , wmat(name) 
                emat(name) model(sac) [SAC_options]
 
 
 ----选项----
 wmat(name) ：指定空间权重矩阵。
 fe ：固定效应。
 type(type_options) ：指定固定效应的类型。type_options有三种类型：
        ind ：个体固定效应（默认）；time ：时点固定效应；both ：个体时点双固定效应。
 emat(name) ：指定空间误差项的权重矩阵，默认使用wmat(name)中的矩阵。

 
 vce(vcetype) ：参数估计量方差协方差矩阵稳健估计。 oim, opg, robust, cluster clustvar, dkraay #
				  oim ：观测信息矩阵（OIM）；
				  opg ：梯度外积（OPG）向量；
				  robust ：三明治估计量；
				  cluster clustvar ：聚类三明治估计量；
				  dkraay # ：Driscoll-Kraay 稳健估计量，# 是计算中最大滞后阶数。
 robust ：等同于vce(cluster panelvar)。
 cluster(clustvar) ：等同于vce(cluster clustvar)。
 
 
 effects ：计算直接、间接、总效应。
 vceeffects(vcee_type[, nsim(#)]) ：设置直接、间接、总效应的标准误。
             dm ：Delta方法标准误；
			 sim [,nsim(#)] ：蒙特卡罗标准误（默认），# ：迭代次数；
			 none ：无标准误。
 constraints(constraints) ：应用线性约束。
 from(init_specs) ：指定系数的初始值。
 
 
 level(#) ：设置置信水平；默认level(95)，即95%。
--------------------------------------------------------------------*/


 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) nolog
 est stor PSACM1
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(ind) nolog effects
 est stor PSACM1i

 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(time) nolog effects
 est stor PSACM1t
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(both) nolog effects
 est stor PSACM1it
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(both) nolog effects robust
 est stor PSACM1itR
	 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSACM1 PSACM1i PSACM1t PSACM1it PSACM1itR using testpsacm1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace
 
 
 
 
 
 
/*--模型4---------------面板空间误差模型PSEM--------------------------
xsmle depvar [indepvars] [if] [in] [weight] , emat(name) 
               model(sem) [SEM_options]
 
 
 ----选项----
 re ：随机效应，默认为随机效应。
 fe ：固定效应。
 type(type_options) ：指定固定效应的类型。type_options有三种类型：
        ind ：个体固定效应（默认）；time ：时点固定效应；both ：个体时点双固定效应。
 emat(name) ：指定空间误差项的权重矩阵。
 

 vce(vcetype) ：参数估计量方差协方差矩阵稳健估计。 oim, opg, robust, cluster clustvar, dkraay #
				  oim ：观测信息矩阵（OIM）；
				  opg ：梯度外积（OPG）向量；
				  robust ：三明治估计量；
				  cluster clustvar ：聚类三明治估计量；
				  dkraay # ：Driscoll-Kraay 稳健估计量，# 是计算中最大滞后阶数。
 robust ：等同于vce(cluster panelvar)。
 cluster(clustvar) ：等同于vce(cluster clustvar)。
 
 
 noconstant ：不含截距项，仅在re选项中使用。
 constraints(constraints) ：应用线性约束。
 from(init_specs) ：指定系数的初始值。
 hausman ：执行稳健的Hausman检验，仅允许在静态面板模型下使用。

 
 level(#) ：设置置信水平；默认level(95)，即95%。
--------------------------------------------------------------------*/

 xsmle lngsp lnpcap lnpc lnemp, re model(sem) emat(usaww) ///
                 hausman nolog effects
				 
 xsmle lngsp lnpcap lnpc lnemp, re model(sem) emat(usaww) ///
                 hausman nolog  robust
 est stor PSEM1re
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sem) emat(usaww) ///
                 nolog hausman
 est stor PSEM1
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sem) emat(usaww) ///
                 type(ind) nolog 
 est stor PSEM1i

 xsmle lngsp lnpcap lnpc lnemp, fe model(sem) emat(usaww) ///
                type(time) nolog
 est stor PSEM1t
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sem) emat(usaww) ///
                 type(both) nolog 
 est stor PSEM1it
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sem) emat(usaww) ///
                 type(both) nolog robust
 est stor PSEM1itR
	 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSEM1re PSEM1 PSEM1i PSEM1t PSEM1it PSEM1itR using testpsem1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace
 
 




/*--模型5---------------广义空间面板随机效应模型GSPREM-----------------
 xsmle depvar [indepvars] [if] [in] [weight] , wmat(name) 
                model(gspre) [emat(name) GSPRE_options]
 
 
 ----选项----
 wmat(name) ：指定空间随机效应的权重矩阵。wmat(name)或者emat(name)的设定与error(#)有关。
 emat(name) ：指定空间误差项的权重矩阵。 
 re ：随机效应，默认为随机效应。
 error(#) ：定义空间随机效应误差结构。error(1) ：phi != lambda != 0 ，默认。
            error(2) ： phi != 0, lambda == 0
			error(3) ： phi == 0, lambda != 0（等同于SEM）
			error(4) ： phi == lambda。
	
	
 vce(vcetype) ：参数估计量方差协方差矩阵稳健估计。 oim, opg, robust, cluster clustvar, dkraay #
				  oim ：观测信息矩阵（OIM）；
				  opg ：梯度外积（OPG）向量；
				  robust ：三明治估计量；
				  cluster clustvar ：聚类三明治估计量；
				  dkraay # ：Driscoll-Kraay 稳健估计量，# 是计算中最大滞后阶数。 
 robust ：等同于vce(cluster panelvar)。
 cluster(clustvar) ：等同于vce(cluster clustvar)。
 
 
 noconstant ：不含截距项，仅在re选项中使用。
 constraints(constraints) ：应用线性约束。
 from(init_specs) ：指定系数的初始值。
 
 level(#) ：设置置信水平；默认level(95)，即95%。
--------------------------------------------------------------------*/

 xsmle lngsp lnpcap lnpc lnemp, model(gspre) wmat(usaww) emat(usaww) ///
                 error(1) nolog effects
 est stor GSPREM1
 
 xsmle lngsp lnpcap lnpc lnemp, model(gspre) wmat(usaww) emat(usaww) ///
                 error(1) nolog re robust
 est stor GSPREM1
 
 xsmle lngsp lnpcap lnpc lnemp, re model(gspre) wmat(usaww) ///
                 error(2) nolog  robust
 est stor GSPREM2
 
 xsmle lngsp lnpcap lnpc lnemp, re model(gspre) emat(usaww) ///
                 error(3) nolog  robust
 est stor GSPREM3
 
 xsmle lngsp lnpcap lnpc lnemp, model(gspre) wmat(usaww) emat(usaww) ///
                 error(4) nolog robust
 est stor GSPREM4
	 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab GSPREM1 GSPREM1r GSPREM2r GSPREM3r GSPREM4r using testgsprem1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace				 
				 
				 
				 