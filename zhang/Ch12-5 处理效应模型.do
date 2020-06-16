



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch12-5---处理效应模型------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch122.dta,clear    /*----打开指定路径下的数据文件----*/




 browse                           /*----浏览数据----*/

 des                        /*----了解变量的含义----*/
			 

 sum
 tabulate treated   /*---了解处理组与控制组样本占比，例如，考虑是否进行有放回匹配等---*/
 
 
* 【注意】treatreg命令已经更名为etregress

 
 
 
 
 
/*--0--基础格式---etregress（曾用名：treatreg）------处理效应模型---------------
 etregress depvar [indepvars], treat(depvar_t = indepvars_t) [twostep|cfunction]
-----------------------------------------------------------------------------*/



/*--1--ML估计格式---etregress（曾用名：treatreg）------处理效应模型-------------

 etregress depvar [indepvars] [if] [in] [weight], 
                     treat(depvar_t = indepvars_t [, noconstant])
                     [etregress_ml_options]
			 
 ----选项----
 depvar ：结果变量。
 indepvars ：直接影响结果变量depvar的自变量。
 treat(depvar_t = indepvars_t [, noconstant]) ：depvar_t为处理变量，
                                      indepvars_t为影响处理变量depvar_t的变量。
 
 ----etregress_ml_options----
 noconstant ：不包含截距项。
 poutcomes ：使用潜在结果模型区分实验组和控制组的方差相关参数。
 constraints(constraints) ：应用线性约束。
 collinear ：保留共线性变量。
 vce(vcetype) ：方差协方差矩阵稳健估计。可选oim, robust, cluster clustvar,
                    opg, bootstrap, 或者 jackknife。
 level(#) ：置信区间，默认为level(95)。
 first ：报告第一节probit估计结果。
 hazard(newvar) ：创建一个包含从处理方程的估计参数中计算的hazard的新变量。
 lrmodel ：采用似然比LR检验，默认为Wald检验。
 nocnsreport ：不显示约束条件。
 coeflegend ：显示图形，不显示统计量。
-----------------------------------------------------------------------------*/


* ML estimates
 etregress wage age grade smsa black tenure, ///
            treat(union = south black tenure) first


 etregress wage age grade smsa black tenure, ///
            treat(union = south black tenure) 

 etregress wage age grade smsa black tenure, ///
            treat(union = south black tenure) vce(robust)


/*--2--2阶段一致估计---etregress（曾用名：treatreg）------处理效应模型----------

 etregress depvar [indepvars] [if] [in], 
                     treat(depvar_t = indepvars_t [, noconstant]) 
					 twostep [etregress_ts_options]
				 			 
 ----选项----
 depvar ：结果变量。
 indepvars ：直接影响结果变量depvar的自变量。
 treat(depvar_t = indepvars_t [, noconstant]) ：depvar_t为处理变量，
                                      indepvars_t为影响处理变量depvar_t的变量。
 twostep ：两步估计，默认是ML估计。
 
 ----etregress_ts_options----
 noconstant ：不包含截距项。
 vce(vcetype) ：方差协方差矩阵稳健估计。可选conventional（依据渐近理论导出的标准误），
                  bootstrap, 或者 jackknife。默认为conventional。
 level(#) ：置信区间，默认为level(95)。
 first ：报告第一节probit估计结果。
 hazard(newvar) ：创建一个包含从处理方程的估计参数中计算的hazard的新变量。
 coeflegend ：显示图形，不显示统计量。
-----------------------------------------------------------------------------*/


* two-step consistent estimates
 etregress wage age grade smsa black tenure, ///
             treat(union = south black tenure) ///
			 twostep first

 
 etregress wage age grade smsa black tenure, ///
             treat(union = south black tenure) ///
			 twostep 
 
 
 etregress wage age grade smsa black tenure, ///
             treat(union = south black tenure) ///
			 twostep  vce(bootstrap) 
 
 
 
 
 
/*--3--控制函数估计格式---etregress（曾用名：treatreg）------处理效应模型-------

 etregress depvar [indepvars] [if] [in], 
                     treat(depvar_t = indepvars_t [, noconstant]) 
					 cfunction [etregress_cf_options]

 ----选项----
 depvar ：结果变量。
 indepvars ：直接影响结果变量depvar的自变量。
 treat(depvar_t = indepvars_t [, noconstant]) ：depvar_t为处理变量，
                                      indepvars_t为影响处理变量depvar_t的变量。
 cfunction ：生成控制函数（control-function）估计。
 
 ----etregress_cf_options----
 noconstant ：不包含截距项。
 poutcomes ：使用潜在结果模型区分实验组和控制组的方差相关参数。
 vce(vcetype) ：方差协方差矩阵稳健估计。可选robust, bootstrap, 或者 jackknife。
 level(#) ：置信区间，默认为level(95)。
 first ：报告第一节probit估计结果。
 hazard(newvar) ：创建一个包含从处理方程的估计参数中计算的hazard的新变量。
 coeflegend ：显示图形，不显示统计量。
-----------------------------------------------------------------------------*/


*    Setup
 use G:\Stataex\ch123.dta,clear    /*----打开指定路径下的数据文件----*/


*    Obtain control-function estimates for potential-outcome model
 etregress lndrug chron age lninc, treat(ins=age married lninc work) poutcomes cfunction

 
 
 
 
 
 
 
 
 
 
 
 