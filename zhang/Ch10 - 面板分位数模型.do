

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch10--面板分位数模型------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch9.dta,clear     /*----打开指定路径下的数据文件----*/
 * 继续使用第9章的例子。

*  encode idcode, gen(idnew)    /*----生成新变量idnew(取值为1,2,3...)替代idcode----*/
                                /*----注意：此处idcode为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
 xtset idcode year	            /*----告诉Stata该数据为面板数据----*/
 browse                         /*----浏览数据----*/



 
 
 

*  ssc install qregpd            /*----安装qregpd等命令----*/







/*------------------qregpd：面板分位数模型--------------------------------------
qregpd depvar indepvars [if] [in] [weight] , /// 
        [quantile(#) instruments(varlist) identifier(varlist) fix(varlist) /// 
		  optimize(string) MCMC options Grid-search options ]

----选项----

quantile(#) ：设置分位数，取值范围0~1 。若#设置大于1的数，系统自动装换成#% 。
                默认为0.5，中位数。
instruments(varlist) ：包含所有外生解释变量和额外的工具变量；若instruments(varlist)
                         中不包含任何变量，则将所有RHS变量（模型中所有解释变量）
						 视为外生变量。
identifier(varlist) ：设置个体变量名。
fix(varlist) ：设置时点固定效应。
optimize(string) ：在估计qregpd时，有3种优化算法供选择：Nelder-Mead算法(默认),
                     自适应MCMC算法 和 Grid-search（网格搜索）算法。
* 注意：要求小T。
-------------------------------------------------------------------------*/



/*--MCMC--optimize(string)----------------------------------------------------
optimize(string) ：在估计qregpd时，有3种优化算法供选择：Nelder-Mead算法(默认),
                     自适应MCMC算法 和 Grid-search（网格搜索）算法。
					 
--MCMC Options--

*  ssc install  moremata   /*--使用MCMC之前，请安装moremata，否则，显示错误。--*/
*  ssc install amcmc       /*--使用MCMC之前，请安装amcmc，否则，显示错误。--*/

*  注意：有的Stata版本，只需安装其中一个就可以。实在不行，两个都安装吧！

draws(#) ：设置抽签次数。
burn(#) ：设置系统排除的次数，即算法是从最后的draws(#)-burn(#)中抽。
arate(#) ：算法接受率，取值范围0~1，默认0.234。
sampler(string) ：设置抽样方法：mwg：Metropolis-within-Gibbs抽样（函数的每个分量单独和按顺序采样）；
                    global；all-at-once抽样(defualt)。
dampparm(#) ：设置修正的参数，使得算法能够灵活或谨慎地去适应建议分布，
                去完成用户在arate(#)中设置的接受率。dampparm(#)需0~1，接近于0，
				表示适应慢；接近于1表示适应适度快。默认0.234。
				
from(string) ：初始参数不包括常数项，必须为Stata矩阵。若是空白，则起始值来自qreg。
fromvariance(#) ：初始协方差矩阵不包括常数项，必须为Stata矩阵。若是空白，则起始值来自qreg。
saving(string) ：保存参数抽样。
replace ：现有文件将被替代为参数抽样。
append ：现有文件将附加参数抽样。
thin(int) ：每次仅保存第#次抽样。
jumble ：有助于缓解抽样间的自相关。
noisy ：算法会反馈具体细节、步骤。
usemax ：MCMC抽样计算的均值作为参数“估计”去替代Stata传统的结果。默认。
analytic ：使用MCMC抽样计算的方差计算标准误去替代Stata传统的结果。默认。
-------------------------------------------------------------------------*/

 
 
  xtdes


  qregpd ln_wage tenure union, id(idcode) fix(south) 
  *fix(idcode)
  estimates store QREG1
  matrix list e(gamma)      /*--显示south固定效应估计值--【此处，仅举例而已】--*/
	
  qregpd ln_wage tenure union, id(idcode) fix(year)
  estimates store QREG2

  matrix list e(gamma)      /*--显示year时点固定效应估计值--【此处，仅举例而已】--*/
  
* ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab QREG1 QREG2 using testqreg1.doc, ar2(%8.4f) se(%8.4f) ///  
	      nogap brackets aic bic  mtitles replace

		  
  qregpd ln_wage tenure union, q(0.25) id(idcode) fix(south) 	/*----估计1/4分位数结果--默认是0.5，中位数--*/	 
			
  qregpd ln_wage tenure union, q(0.75) id(idcode) fix(south) 	/*----估计3/4分位数结果--默认是0.5，中位数--*/	 
			
			
			
/*----采用MCMC优化----*/	

*	ssc install  moremata   /*--使用MCMC之前，请安装moremata包，否则，显示错误。--*/
*	ssc install amcmc       /*--使用MCMC之前，请安装amcmc包，否则，显示错误。--*/
*   注意：有的Stata版本，只需安装其中一个就可以。实在不行，两个都安装吧！
	
  qregpd ln_wage tenure union, id(idcode) fix(year) optimize(mcmc) ///
	       noisy draws(1000) burn(100) arate(.5) 
		   
  estimates store QREGMCMC1
  
  matrix list e(gamma)        /*----显示时点固定效应估计值----*/

  
 
  qregpd ln_wage tenure union, id(idcode) fix(year) optimize(mcmc) ///
	       noisy draws(1000) burn(100) arate(.25)
		   
  estimates store QREGMCMC2	
  
  matrix list e(gamma)        /*----显示时点固定效应估计值----*/
  
* ssc install st0085_2        /*----安装非Stata系统软件包----*/
  esttab QREGMCMC1 QREGMCMC2 using testivreg1.doc, ar2(%8.4f) se(%8.4f) ///  
	      nogap brackets aic bic  mtitles replace
  
  
  
  
  
  

/*----带工具变量的情形--采用MCMC优化----*/	
  qregpd ln_wage tenure union, id(idcode) fix(year) optimize(mcmc) ///
	       draws(1000) burn(100) arate(.5) ///
		   noisy instruments(ttl_exp wks_work union)
    
  mat list e(gamma)

  
  qregpd ln_wage tenure union, q(0.25) id(idcode) fix(year) optimize(mcmc) ///
	       draws(1000) burn(100) arate(.5) ///
		   noisy instruments(ttl_exp wks_work union)
    /*----估计1/4分位数的结果--默认是0.5，中位数--*/
  mat list e(gamma)
  
  
  
  
  
  

/*----带工具变量的情形--采用grid优化----*/	
  qregpd ln_wage tenure union, id(idcode) fix(year) optimize(grid) ///
           instruments(ttl_exp wks_work union)
			
  mat list e(gamma)




