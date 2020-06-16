



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-5--面板空间计量模型5-GSPREM-------------------------------*/


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
 est stor GSPREM1r
 
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
				 
				 
				 