



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch12-4-1--倾向得分匹配------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch12.dta,clear    /*----打开指定路径下的数据文件----*/



 browse                           /*----浏览数据----*/

 des                              /*----了解变量的含义----*/
			 
			 

 sum
 
 tabulate treated  
 /*---了解处理组与控制组样本【占比】，例如，考虑是否进行有放回匹配等---*/
 
 
 
* ssc install psmatch2, replace   /*----安装psmatch2命令包------*/


* h psmatch2

 
 

/*--1-----一对一匹配-----------------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], [outcome(varlist) 
            pscore(varname) ai(integer k>1) mahalanobis(varlist) 
			caliper(real) noreplacement descending common trim(real) 
			odds index logit ties warnings quietly ate]

 ----选项----
 depvar ：处理变量。
 indepvars ：协变量。
 outcome(varlist) ：结果变量。
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
 ai(integer k>1) ：使用Abadie和Imbens（2006）提出的异方差稳健标准误估计，该选项
                  仅适用于使用马氏距离的k近邻匹配，integer表示用于计算稳健标准误
				  的近邻个数。和altvariance一起使用，指定使用Abadie et al.(2004)估计。
 mahalanobis(varlist) ：马氏匹配，指定计算马氏距离的协变量。
 caliper(real) ：设置卡尺epsilon，为正实数。
 noreplacement ：无放回一对一匹配，默认为有放回抽样。（仅适用于最近邻倾向得分匹配）
 descending ：按降序无放回一对一匹配。（仅适用于最近邻倾向得分匹配）
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 ties ：包括所有倾向得分相同的并列个体，默认是按照当前数据排序选择一个个体。
 warnings ：用重复倾向得分值检验控制组（观测数据）。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
-----------------------------------------------------------------------------*/







/*--2-----k近邻匹配-----------------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], [outcome(varlist) 
            pscore(varname) neighbor(integer k>1) caliper(real) 
			common trim(real) odds index logit ties warnings 
			quietly ate]

 ----选项---- 
 depvar ：处理变量。
 indepvars ：协变量。
 outcome(varlist) ：结果变量。
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
$ neighbor(integer k>1) ：进行k近邻匹配，默认k=1，即一对一匹配。
 caliper(real) ：设置卡尺epsilon，为正实数。
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 ties ：包括所有倾向得分相同的并列个体，默认是按照当前数据排序选择一个个体。
 warnings ：用重复倾向得分值检验控制组（观测数据）。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/




*--2-1--匹配前，对数据进行随机排序--------------------------------------
 set seed 12345
 gen neworder=runiform()
 sort neworder
 
 
 
*--2-2--匹配------------------------------------------------------------ 
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, outcome(realinc1978) ///
			 neighbor(5) common logit ties ate
 esti store PSMATCHreg1			 
		 
			 
* 进行bootstrap标准误估计，该结果仅供参考，未必正确。			 
 set seed 12345
 bootstrap r(att) r(atu) r(ate), reps(100) : /// 
             psmatch2 treated age edu black hisp_lati married /// 
			 realinc1974 realinc1975 unemp1974 unemp1975,  /// 
			 outcome(realinc1978) neighbor(1) common logit ties ate
 esti store PSMATCHreg2
 
/*----------上述bootstrap命令写法，等价于下式-------------------
  set seed 12345
  bs " psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 unemp1974 unemp1975, outcome(realinc1978) neighbor(1) common logit ties ate"  "r(att) r(atu) r(ate), reps(100) " 			 
  esti store PSMATCHreg3
--------------------------------*/			 
			 
* ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab PSMATCHreg1 PSMATCHreg2 using testpsmatch1.doc, ar2(%8.4f) se(%8.4f) ///  
	    nogap brackets aic bic  mtitles replace	


			 
			 
 summarize _pscore
 display 0.25*r(sd)   /*---epsilon<=0.23*sigma_hat---*/
 
 
 *k近邻卡尺匹配
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, outcome(realinc1978) ///
			 n(5) caliper(0.01) common logit ties ate		
 esti store PSMATCHreg4		


*注意：此处，esttab命令显示的没有进行匹配时的结果，所以，此处不建议大家采用该方法。 
* esttab PSMATCHreg1 PSMATCHreg4 using testpsmatch2.doc, ar2(%8.4f) se(%8.4f) ///  
*	    nogap brackets aic bic  mtitles replace			
	
	
	
*--2-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/
/*---如果平衡检验不是很合适，例如，可以通过更改psmatch2中n(3)中匹配数量
         或卡尺范围来加以调节匹配效果。---*/


		   
/*--2-4----psgraph-----------------------------------------------------------
 psgraph [, bin(#) treated(varname) support(varname) pscore(varname) graph_options]
 
 ----选项----
 bin(#) ：指定直方图的分组数，默认是bin(20)。
 treated(varname) ：指定处理变量。
 support(varname) ：共同取值范围示性变量。
 pscore(varname) ：指定倾向得分。
* 注意：在psmatch2执行后，psgraph后可不带任何选项。
-----------------------------------------------------------------------------*/

 psgraph
 
 psgraph, bin(40)






/*--3-----卡尺（半径）匹配----------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], radius caliper(real) 
             [outcome(varlist) pscore(varname) common trim(real) 
			   odds index logit quietly ate]

 ----选项----
 depvar ：处理变量。
 indepvars ：协变量。
$ radius ：卡尺（半径）匹配。
 caliper(real) ：设置卡尺epsilon，为正实数。
 outcome(varlist) ：结果变量。
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/



*--3-1--匹配前，对数据进行随机排序--------------------------------------
* set seed 12345
* gen neworder=runiform()
* sort neworder
 
 
 
*--3-2--匹配------------------------------------------------------------ 
 summarize _pscore
 display 0.25*r(sd)   /*---epsilon<=0.23*sigma_hat---*/
 
 
 *半径卡尺匹配
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, radius caliper(0.01) outcome(realinc1978) ///
			  common logit ties ate
 
 *k近邻卡尺匹配
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, caliper(0.01) outcome(realinc1978) ///
			 n(3) common logit ties ate
 

			 
* 进行bootstrap标准误估计			 
 set seed 12345
 bootstrap r(att) r(atu) r(ate),reps(100) : /// 
             psmatch2 treated age edu black hisp_lati married /// 
			 realinc1974 realinc1975 unemp1974 unemp1975,  /// 
			 radius caliper(0.01) outcome(realinc1978) ///
			 common logit ties ate

 

			
*--3-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/


		   
/*--3-4----psgraph-----------------------------------------------------------
 psgraph [, bin(#) treated(varname) support(varname) pscore(varname) graph_options]
 
 ----选项----
 bin(#) ：指定直方图的分组数，默认是bin(20)。
 treated(varname) ：指定处理变量。
 support(varname) ：共同取值范围示性变量。
 pscore(varname) ：指定倾向得分。
* 注意：在psmatch2执行后，psgraph后可不带任何选项。
-----------------------------------------------------------------------------*/

 psgraph
 
 psgraph, bin(40)







/*--4-----核匹配-----------------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], kernel [outcome(varlist) 
            kerneltype(kernel_type) pscore(varname) bwidth(real) 
			mahalanobis(varlist) common trim(real) odds index 
			logit quietly ate]

 ----选项----
 depvar ：处理变量。
 indepvars ：协变量。
$ kernel ：核匹配。
 outcome(varlist) ：结果变量。
$ kerneltype(kernel_type) ：设置核函数，默认为二次核（epan）。normal（gaussian核）、
                         biweight、epan（epanechnikov，默认）、uniform、tricube。
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
$ bwidth(real) ：指定窗宽，默认为0.06。
 mahalanobis(varlist) ：马氏匹配，指定计算马氏距离的协变量。
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/



*--4-1--匹配前，对数据进行随机排序--------------------------------------
* set seed 12345
* gen neworder=runiform()
* sort neworder
 
 
 
*--4-2--匹配------------------------------------------------------------ 
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, kernel outcome(realinc1978) ///
			 common logit ties ate

			 
* 进行bootstrap标准误估计			 
 set seed 12345
 bootstrap r(att) r(atu) r(ate),reps(100) : /// 
             psmatch2 treated age edu black hisp_lati married /// 
			 realinc1974 realinc1975 unemp1974 unemp1975,  /// 
			 kernel outcome(realinc1978)  common logit ties ate

 

			
*--4-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/


		   
/*--4-4----psgraph-----------------------------------------------------------
 psgraph [, bin(#) treated(varname) support(varname) pscore(varname) graph_options]
 
 ----选项----
 bin(#) ：指定直方图的分组数，默认是bin(20)。
 treated(varname) ：指定处理变量。
 support(varname) ：共同取值范围示性变量。
 pscore(varname) ：指定倾向得分。
* 注意：在psmatch2执行后，psgraph后可不带任何选项。
-----------------------------------------------------------------------------*/

 psgraph
 
 psgraph, bin(40)







/*--5-----局部线性回归匹配-----------------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], llr outcome(varlist) 
            [kerneltype(kernel_type) pscore(varname) bwidth(real) 
			  mahalanobis(varlist) common trim(real) odds index 
			  logit quietly ate]

 ----选项----
 depvar ：处理变量。
 indepvars ：协变量。
$ llr ：局部线性回归匹配。
 outcome(varlist) ：结果变量。
$ kerneltype(kernel_type) ：指定核函数，默认为三次核。normal（gaussian核）、
                         biweight、epan（epanechnikov，默认）、uniform、tricube。
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
$ bwidth(real) ：指定窗宽，默认为0.8。
 mahalanobis(varlist) ：马氏匹配，指定计算马氏距离的协变量。
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/



*--5-1--匹配前，对数据进行随机排序--------------------------------------
* set seed 12345
* gen neworder=runiform()
* sort neworder
 
 
 
*--5-2--匹配------------------------------------------------------------ 
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, llr outcome(realinc1978) ///
			 common logit ties ate

			 
* 进行bootstrap标准误估计			 
 set seed 12345
 bootstrap r(att) r(atu) r(ate),reps(100) : /// 
             psmatch2 treated age edu black hisp_lati married /// 
			 realinc1974 realinc1975 unemp1974 unemp1975, llr  /// 
			 outcome(realinc1978) common logit ties ate

 

			
*--5-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/


		   
/*--5-4----psgraph-----------------------------------------------------------
 psgraph [, bin(#) treated(varname) support(varname) pscore(varname) graph_options]
 
 ----选项----
 bin(#) ：指定直方图的分组数，默认是bin(20)。
 treated(varname) ：指定处理变量。
 support(varname) ：共同取值范围示性变量。
 pscore(varname) ：指定倾向得分。
* 注意：在psmatch2执行后，psgraph后可不带任何选项。
-----------------------------------------------------------------------------*/

 psgraph
 
 psgraph, bin(40)







/*--6-----样条匹配------------------------------------------------------------
 psmatch2 depvar [indepvars] [if exp] [in range], spline outcome(varlist) 
            [nknots(integer) pscore(varname) neighbor(integer) 
			  caliper(real) common trim(real) odds index logit 
			  ties warnings quietly ate]

 ----选项----
 depvar ：处理变量。
 indepvars ：协变量。
$ spline ：样条匹配。
 outcome(varlist) ：结果变量。
$ nknots(integer) ：指定样条平滑内点个数。默认is the fourth root of 
                                     the number of comparison units
 pscore(varname) ：指定变量估计倾向得分，默认使用indepvars中的变量。
 neighbor(integer) 进行k近邻匹配，默认k=1，即一对一匹配。
 caliper(real) ：设置卡尺epsilon，为正实数。
 common ：仅对共同取值范围内个体进行匹配，默认是对所有个体匹配。
 trim(real) ：通过删除#%的实验组数据使得控制组得分密度最低，得到共同取值范围。
 odds ：使用机会比率（p/(1-p)）进行匹配，默认使用倾向得分匹配。
 index ：使用潜变量指标=xb，而非概率。
 logit ：用logit模型估计倾向得分，默认是probit。
 ties ：包括所有倾向得分相同的并列个体，默认是按照当前数据排序选择一个个体。
 warnings ：用重复倾向得分值检验控制组（观测数据）。
 quietly ：不报告倾向得分估计过程。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/


*--6-1--匹配前，对数据进行随机排序--------------------------------------
* set seed 12345
* gen neworder=runiform()
* sort neworder
 
 net install snp7_1.pkg    /*-----安装spline---*/
 
*--6-2--匹配------------------------------------------------------------ 
 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, spline outcome(realinc1978) ///
			 common logit ties ate

 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, spline outcome(realinc1978) ///
			 neighbor(3) common logit ties ate

 psmatch2 treated age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, spline outcome(realinc1978) ///
			 caliper(0.01) common logit ties ate	
			 
			 
			 
* 进行bootstrap标准误估计			 
 set seed 12345
 bootstrap r(att) r(atu) r(ate),reps(100) : /// 
             psmatch2 treated age edu black hisp_lati married /// 
			 realinc1974 realinc1975 unemp1974 unemp1975,  /// 
			 outcome(realinc1978) neighbor(1) common logit ties ate

 

			
*--6-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/


		   
/*--6-4----psgraph-----------------------------------------------------------
 psgraph [, bin(#) treated(varname) support(varname) pscore(varname) graph_options]
 
 ----选项----
 bin(#) ：指定直方图的分组数，默认是bin(20)。
 treated(varname) ：指定处理变量。
 support(varname) ：共同取值范围示性变量。
 pscore(varname) ：指定倾向得分。
* 注意：在psmatch2执行后，psgraph后可不带任何选项。
-----------------------------------------------------------------------------*/

 psgraph
 
 psgraph, bin(40)






/*--7-----马氏距离匹配---------------------------------------------------------
 psmatch2 depvar [if exp] [in range], mahalanobis(varlist) outcome(varlist) 
             ai(integer) [population altvariance kernel(kernel_type) 
			 llr bwidth(real) caliper(real) w(matrix) ate]

 ----选项----
 depvar ：处理变量。
 mahalanobis(varlist) ：马氏匹配，指定计算马氏距离的协变量。
 outcome(varlist) ：结果变量。
$ ai(integer) ：使用Abadie和Imbens（2006）提出的异方差稳健标准误估计，该选项
                  仅适用于使用马氏距离的k近邻匹配，integer表示用于计算稳健标准误
				  的近邻个数。和altvariance一起使用，指定使用Abadie et al.(2004)估计。
$ population ：当使用选项ai(integer)时，计算总体方差而非样本方差（默认是样本方差）。
$ altvariance ：当使用选项ai(integer)时，使用Abadie et al.(2004)中的公式计算条件方差。
$ kernel(kernel_type) ：设置核函数，默认为二次核（epan）。normal（gaussian核）、
                         biweight、epan（epanechnikov，默认）、uniform、tricube。
 llr ：局部线性回归。
 bwidth(real) ：指定窗宽，默认为0.06。
 caliper(real) ：设置卡尺epsilon，为正实数。
$ w(matrix) ：指定alternative 权重矩阵。
 ate ：报告ATE、ATU、ATT，默认只报告ATT。
 
* 注意：$ 表示除了这个选项外，其他选项都以出现，即与前面命令中的含义一样。
-----------------------------------------------------------------------------*/



*--7-1--匹配前，对数据进行随机排序--------------------------------------
* set seed 12345
* gen neworder=runiform()
* sort neworder
 
 
 
*--7-2--匹配------------------------------------------------------------ 
 psmatch2 treated, mahal(age edu black hisp_lati married realinc1974 ///
                          realinc1975 unemp1974 unemp1975) ///
						  outcome(realinc1978) ai(5)  ate


			 


			
*--7-3----pstest-----------------------------------------------------------
 pstest age edu black hisp_lati married realinc1974 realinc1975 ///
             unemp1974 unemp1975, both graph
			 
/*---其中，both显示匹配前后数据平衡情况，默认仅显示匹配后平衡情况。
           graph表示用图形的方式显示各变量匹配前后的平衡情况---------*/


		   
		   
		   
		   
		   
		   
