



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch12-4-2--偏差校正匹配估计------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch12.dta,clear    /*----打开指定路径下的数据文件----*/



 browse                           /*----浏览数据----*/

 
 des                        /*----了解变量的含义----*/


 sum
 
 tabulate treated  
 /*---了解处理组与控制组样本占比，例如，考虑是否进行有放回匹配等---*/


 
 
 
* ssc install nnmatch, replace

 h nnmatch
 
 
 
/*-------偏差校正匹配估计------------------------------------------------------
 nnmatch depvar treatvar varlist_nnmatch [if exp] [in range] [pw] 
                 [, tc(ate |att |atc) m(#) metric(maha |matname) 
				    exact(varlist_ex) biasadj(bias |varlist_adj) 
				    robust(#_v) population level(#) keep(filename) 
					replace]
				
 ----选项----
 depvar ：结果变量。
 treatvar ：处理变量。
 varlist_nnmatch ：匹配变量。
 tc(ate |att |atc) ：tc(ate)估计ATE、tc(att)估计ATT、tc(atc)估计ATU，默认估计ATE。
 m(#) ：进行#近邻匹配，默认#=1。
 metric(maha |matname) ：metric(maha)使用马氏距离度量，权重矩阵为样本协方差矩阵的逆矩阵；
                         metric(matname)是允许用户定义权重矩阵matname，
                         其中，matname是一个已经指定的k维对称正半定矩阵，
						 k是varlist_nnmatch中变量的个数。
 exact(varlist_ex) ：精确匹配。不能与varlist_nnmatch中的变量重叠。
 biasadj(bias |varlist_adj) ：biasadj(bias)根据原来的协变量进行偏差校正；
            默认不进行偏差校正。biasadj(varlist_adj)表示指定进行偏差校正的变量。
 robust(#_v) ：计算异方差稳健标准误，#_v为正整数。一般#_v等于m(#)中的#。
 population ：估计总体平均处理效应；默认估计样本平均处理效应。两种情形的估计值
               相同，但标准误有所差异。
 level(#) ：置信区间，默认level(95)。
 keep(filename) ：创建临时数据库文件显示相关信息。
 replace ：如果选项keep(filename)被使用，且filename.dta文件已存在，则替代它。
-----------------------------------------------------------------------------*/

 
 
 
  nnmatch realinc1978 treated age edu black hisp_lati married /// 
             realinc1974 realinc1975 unemp1974 unemp1975, /// 
			 tc(att) m(5) robust(5) 
 
 
 
 
 
 
  nnmatch realinc1978 treated age edu black hisp_lati married /// 
             realinc1974 realinc1975 unemp1974 unemp1975, /// 
			 tc(att) m(5) robust(5) biasadj(bias)
 
 
 
 
 
  nnmatch realinc1978 treated age edu black hisp_lati married /// 
             realinc1974 realinc1975 unemp1974 unemp1975, /// 
			 tc(att) m(5) robust(5) biasadj(bias) metric(maha)

			 
			 
			 
			 
	 