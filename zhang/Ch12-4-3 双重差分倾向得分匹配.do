



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch12-4-3--双重差分倾向得分匹配------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch11.dta,clear    /*----打开指定路径下的数据文件----*/



 browse                           /*----浏览数据----*/

 des                        /*----了解变量的含义----*/
 
*  ssc install diff, replace
 
 
 
/*-------diff---------双重差分法、倍差法、倍分法-------------------------------
 diff outcome_var [if] [in] [weight] ,[ options]

 outcome_var ：结果变量。
 
 ----模型要求选项----
 period(varname) ：二元实验期变量（1：实验之后；0：实验之前）。注意：如果数据里
                    包含周期频率（如每月、每季度、每年等），建议设定选项period(varname)，
					
 treated(varname) ：二元处理变量（1：被处理；0：被控制、未处理）。
 
 ----选项----
 cov(varlist) ：为模型设定前定处理协变量。当kernel被选用时，这些变量将用于去
                  估计倾向得分。
 kernel ：执行基于核的【双重差分倾向得分匹配】。该选项将生成变量_weights和_ps，
           _weights ：来自核倾向得分匹配的权重；
		   _ps ：pscore(varname)没有提供倾向得分时，报告得分。
		   且该选项要求使用id(varname)，除非重复横截面设置。		   
 id(varname) ：kernel选项要求使用。
 bw(#) ：提供核函数的窗宽，默认为0.06。
 ktype(kernel) ：指定核函数的类型。分别为epanechnikov (默认)，gaussian，
                                          biweight，uniform 和 tricube。
 rcs ：表示核已设定（重复横截面），该选项不要求id(varname)，选项rcs严格要求
                                            cov(varlist)中的协变量不随时点变化。
 qdid(quantile) ：执行分位数双重差分估计，分位数从0.1-0.9，可以与kernel和cov选项
                     联合使用，qdid选项不支持加权稳健标准误估计
 pscore(varname) ：提供倾向得分。
 logit ：指定倾向得分采用logit估计，默认是probit。
 support ：仅使用共同取值范围内的观测值进行匹配。
             在给定选项kernel的倾向得分下，执行diff命令。
 addcov(varlist) ：除了用于估计倾向得分的协变量外，指定额外的协变量。
                     在多频率数据的情形下，也可用于设定时点固定效应。
 ddd(varname) ：三重差分选项。treated(varname)被视为第1类；ddd(varname)视为第2类。
                   该选项不兼容kernel、test、qdid(quantile)。
 
 ----SE/Robust----
 cluster(varname) ：计算聚类标准误。
 robust ：计算稳健标准误。
 bs ：对参数和标准误采用bootstrap估计。
 reps(int) ：在bs被选用时，指定重复次数，默认为50。
 
 ----Balancing test----
 test ：采用balancing t检验，检验在基期时，协变量在控制组和实验组的均值是否有差异。
         同时使用test和kernel选项，执行加权协变量的balancing t检验。
 
 ----报告----
 report ：当设定选项kernel时，显示所包含的协变量的推断或倾向得分的估计。
 nostar ：去掉p值的星号。
-----------------------------------------------------------------------------*/

 
  
 
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              support report robust
			  
			  
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              support logit report robust

			  
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              support logit report robust test 
			  

			  
			  
			  
			  
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              support addcov(wendys) report logit robust
			    
			  
			  
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              ktype(gaussian) support logit report robust
              
			  
			  
  diff fte, t(treated) p(t) cov(bk kfc roys) kernel id(id) ///
              ktype(gaussian) bs reps(50) logit report test
              
		 
		 
		 


 
 
 
 
 
 
 
 
 
 
 
