



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-5--面板空间计量模型3-PSACM-------------------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install xsmle,all from(http://fmwww.bc.edu/RePEc/bocode/x) replace   /*----安装xsmle的相关命令----*/
 
 h xsmle                /*----安装xsmle的相关命令----*/

 use G:\Stataex\product.dta, clear   /*----打开变量数据库----*/

 gen lngsp=log(gsp)
 gen lnpcap=log(pcap)
 gen lnpc=log(pc)
 gen lnemp=log(emp)
 
 
 spmat use usaww using http://www.econometrics.it/stata/data/xsmle/usaww.spmat, replace
 /*----指定空间权重矩阵名为usaww----*/
 

 
 
 
 
*----面板空间自回归模型PSARM------------*
*----面板空间杜宾模型PSDM---------------*
*----面板空间自相关模型PSACM------------*
*----面板空间误差模型PSEM---------------*
*----广义空间面板随机效应模型GSPREM------*

 
 

				 
				 

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
                 emat(usaww) type(ind) nolog effects robust
 est stor PSACM1ir
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(time) nolog effects robust
 est stor PSACM1t
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(both) nolog effects
 est stor PSACM1it
 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sac) wmat(usaww) ///
                 emat(usaww) type(both) nolog effects robust
 est stor PSACM1itR
	 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSACM1 PSACM1i PSACM1t PSACM1it PSACM1itR PSACM1ir using testpsacm1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace
 
 
 
 
			 
				 
				 
				 
