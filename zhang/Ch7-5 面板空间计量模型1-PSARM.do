



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-5--面板空间计量模型1-PSARM-------------------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install xsmle,all from(http://fmwww.bc.edu/RePEc/bocode/x) replace   /*----安装xsmle的相关命令----*/
 
 h xsmle                /*----安装xsmle的相关命令----*/

 use G:\Stataex\product.dta, clear   /*----打开变量数据库----*/

 gen lngsp=log(gsp)
 gen lnpcap=log(pcap)
 gen lnpc=log(pc)
 gen lnemp=log(emp)
 
 
 spmat use usaww using ///
     http://www.econometrics.it/stata/data/xsmle/usaww.spmat
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

 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 hausman 
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) re ///
                 nolog effects
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) ///
                 hausman nolog effects
 est stor PSARM1
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) /// 
                 hausman nolog effects robust
 est stor PSARM2r
 
 xsmle lngsp lnpcap lnpc lnemp, wmat(usaww) model(sar) ///
                 robust nolog effects
 

 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSARM1 PSARM2r using testpsarm1.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

		
		
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///	
                 type(both) hausman nolog effects	
		
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 type(time) hausman nolog effects
 
	
	
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 robust nolog effects
 est stor PSARM3
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 type(ind) robust nolog effects
 est stor PSARM4
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 type(time) robust nolog effects
 est stor PSARM5
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 type(both) robust nolog effects
 est stor PSARM6
 
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSARM3 PSARM4 PSARM5 PSARM6 using testpsarm2.doc, ///
         ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

 
 
 
 
 xsmle lngsp lnpcap lnpc lnemp unemp, wmat(usaww) fe ///
                 dlag(1) nolog


 
 
		 