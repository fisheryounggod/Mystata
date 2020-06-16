



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-5--面板空间计量模型2-PSDM-------------------------------*/


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
                 dmat(usaww) nolog robust effects
 est stor PSDM1RE	
 
 
 xsmle lngsp lnpcap lnpc lnemp, re model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog effects
				 
 xsmle lngsp lnpcap lnpc lnemp, fe model(sdm) wmat(usaww) ///
                 dmat(usaww) hausman nolog effects
				 
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


			 