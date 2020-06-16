

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch6.2 & Ch6.3--面板向量自回归模型----PVAR------------------------*/


cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\ch6pvarex.dta,clear     /*----打开指定路径下的数据文件----*/


*  encode idcode, gen(idnew)    /*----生成新变量idnew(取值为1,2,3...)替代idcode----*/
                                /*----注意：此处idcode为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
 xtset idcode year	            /*----告诉Stata该数据为面板数据----*/
 browse                          /*----浏览数据----*/


 gen wage = exp(ln_wage)         /*----*/




* h pvar            /*----安装pvar等命令--点击st0455，再点击安装即可----*/








/*--------------------【命令使用顺序】--------------------*/

/*----pvar：PVAR模型进行回归------------------------------*/
/*----pvarsoc：确定PVAR模型最优滞后阶数-------------------*/
/*----pvar：使用最优滞后阶数【重新】对PVAR模型进行回归----*/
/*----pvarstable：PVAR模型稳定性检验----------------------*/
/*----pvargranger：PVAR模型Granger因果检验----------------*/
/*----pvarirf：PVAR模型脉冲响应---------------------------*/
/*----pvarfevd：PVAR模型方差分解--------------------------*/







/*--1-1----------------------pvar：PVAR模型进行回归--------------------------
pvar 被解释变量 [if] [in] [, 选项]

----选项----
lags(#) ：在PVAR中使用前#阶滞后项；默认lags(1)。
exog(变量) ：使用时变的外生变量。
fod ：使用Helmert变换消除模型中的个体固定效应项；默认为fod。注：一般使用默认即可。
fd ：使用一阶差分的方式消除模型中的个体固定效应项。注：一般不选。
td ：移除变量的横截面均值，可消除时点固定效应项。
instlags(#) ：使用被解释变量#阶滞后项作为工具变量；默认为使用滞后一阶作为IV。
gmmstyle : 用“GMM-style”工具变量。有instlags(#)时，才可用gmmstyle。
gmmopts(options) ：替换PVAR默认使用GMM估计。
vce( ) ：参数估计量方差协方差矩阵稳健估计：robust、cluster 聚类变量名、
          bootstrap、Jackknife、hac kernel lags、unadjusted，默认不修正。
overid ：报告过度识别Hansen's J统计检验结果。H0：所有IV均有效。
level(#) ：置信水平，默认为95%。
noprint ：不显示系数表格。
-------------------------------------------------------------------------*/
  pvar wage hours
  estimates store PVARM1
  
  pvar wage hours, lags(3)
  estimates store PVARM2 
 
  egen indocc = group(ind_code occ_code)  /*----按行业和职业聚类----*/
  pvar wage hours, vce(cluster indocc)  
  estimates store PVARMR1
  
  pvar wage hours, vce(robust)
  estimates store PVARMR2

  *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab PVARM1 PVARMR1 PVARMR2 using testpvar1.doc, ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

  
  pvar wage hours, lags(3) instlags(1/3)
  estimates store PVARMIV1
  
  pvar wage hours, lags(3) instlags(1/4) gmmstyle
  estimates store PVARMGMM1
  
  pvar wage hours, lags(3) instlags(1/3) gmmstyle
  estimates store PVARMGMM2

   *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab PVARMIV1 PVARMGMM1 PVARMGMM2 using testpvar2.doc, ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

  
  
  pvar wage hours, lags(3) instlags(1/4) gmmstyle overid  /*--报告工具变量有效性检验结果--*/

*  pvar wage hours, gmmopts(winitial(identity) wmatrix(robust) twostep vce(unadjusted))










/*--1-2----------------------pvarsoc：确定PVAR模型最优滞后阶数-----------------
pvarsoc 被解释变量 [if] [in] [, 选项]

----选项----
maxlag(#) ：设置最大滞后阶数；默认是maxlags(4)。
pinstlag(numlist) ：替代将被解释变量默认滞后阶数作为工具变量的阶数；
                    从被解释变量最高滞后阶数开始设定。
                    不能与pvaropts(instlag(numlist))同时使用 。
pvaropts(options) ：设置PVAR的选项。
--------------------------------------------------------------------------*/

        pvarsoc wage hours, maxlag(3)

        pvarsoc wage hours, maxlag(3) pvaro(instl(1/4))
		/*--注意--pvaro(instl(1/4))中滞后阶数4-1>=maxlag(3)中的3阶--*/

        pvarsoc wage hours,maxlag(1) pinstl(1/2)
		/*--注意--PVAR(1)：使用1-2阶滞后项作为IV；
		        --PVAR(2)：使用2-3阶滞后项作为IV；以此类推--*/


			
		
		
/*--1-3--【注意1】--通过pvarsoc确定好PVAR模型最优滞后阶数后，重新对PVAR回归----*/

  pvar wage hours, lags(1)  overid  vce(robust)
  estimates store PVARMS1

  
  
  
  
/*--1-4----------------------pvarstable：PVAR模型稳定性检验--------------------
pvarstable [, options]

----选项----
estimates(estname) ：使用之前保存过的估计结果estname；默认使用最近一次回归结果。
graph ：画伴随矩阵特征图。
nogrid ：不在特征图里画极坐标圆。

*注意：pvarstable命令，需在pvar命令运行后，方可使用。
--------------------------------------------------------------------------*/
pvarstable
pvarstable, estimates(PVARMS1) /*--运行了多个pvar回归时，想检验PVARM1的稳定性--*/

pvarstable, graph

pvarstable, graph nogrid




/*--【注意2】--若pvar模型不稳定，且从头检查仍无误，则分析结束。----
  -------------若稳定，则进行下列分析--------------------------------------*/


  
  


/*--1-5--------------------pvargranger：PVAR模型Granger因果检验----------------
*注意：展示【两两】Granger因果检验结果

pvargranger [, estimates(estname)]

----选项----
estimates(estname) ：使用之前保存过的估计结果estname；默认使用最近一次回归结果。

*注意：pvargranger命令，需在pvar命令运行后，方可使用。
--------------------------------------------------------------------------*/
pvargranger

pvargranger, estimates(PVARMS1)  
/*--运行了多个pvar回归时，想检验PVARM1中变量的Granger因果关系--*/





/*--【注意3】--若内生变量间不存在Granger因果关系，且从头检查仍无误，则分析结束。----
  -------------若存在因果关系，则进行下列分析--------------------------------------*/









/*--【注意4】-----------仅当以上检验都通过，方可进行下面的操作-------------------*/



/*--2-1------------------------pvarirf：PVAR模型脉冲响应-----------------------
pvarirf [, options]

----选项----
step(#) ：设置冲击后预测未来#期；默认是step(10).
impulse(impulsevars) ：设置脉冲变量。
response(responsevars) ：设置响应变量。
porder(varlist) ：估计正交IRFs时需设置Cholesky内生变量顺序；默认按pvar命令中的顺序。
oirf ：估计正交IRFs；默认是简单IRFs。
dm ：估计外生变量动态乘数，而非IRFs。
cumulative ：估计累积IRFs或动态乘数函数。需与oirf结合使用。
mc(#) ：使用#次Monte Carlo模拟去估计IRFs置信区间；默认不估计或画置信区间，即#=0。
table ：以表格形式展示累积IRFs或DMs估计结果；默认不列表展示。
level(#) ：设置置信水平；默认为95%。
dots ：展示迭代点；默认为每次迭代显示一个点字符。
save(filename) ：将保存累积IRFs结果保存为filename.dta；默认不保存。
byoption(by_option) ：改变子图如何结合、标记等。
                      可以运行 h by_option查看具体选项。
nodraw ：不显示估计的IRFs。

*注意：pvarirf命令，需在pvar命令运行后，方可使用。
--------------------------------------------------------------------------*/

         pvarirf
		 
		 pvarirf, impulse(wage) response(hours)
		 
         pvarirf, oirf mc(300) dots

         pvarirf, oirf mc(300) porder(hours wage) byoption(rescale) dots
		 graph save irf1, replace
         pvarirf, oirf mc(300) porder(wage hours) byoption(rescale) dots
		 graph save irf2, replace



         pvar wage hours, exog(wks_ue)      /*----添加外生变量----*/

		 pvarirf, dm        /*--dm：外生变量变动一单位，对内生变量的动态影响--*/
         pvarirf, dm mc(300) byoption(yrescale) dots


		 
		 /*----【仅举例而已】----*/
*		 pvar wage hours wks_ue       /*----多个变量的PVAR演示----*/
*        pvarirf

		 
		 
		 
		 
		 
		 
		 


/*--2-2------------------------pvarfevd：PVAR模型方差分解----------------------
pvarfevd [, options]

----选项----
step(#) ：设置冲击后预测未来#期；默认是step(10).
impulse(impulsevars) ：设置脉冲变量。
response(responsevars) ：设置响应变量。
porder(varlist) ：估计FEVDs时需设置Cholesky内生变量顺序；默认按pvar命令中的顺序。
mc(#) ：使用#次Monte Carlo模拟去估计FEVDs的标准误和90%置信区间，
        默认不估计或画置信区间，即#=0。
dots ：展示迭代点；默认为每次迭代显示一个点字符。
save(filename) ：将FEVDs结果保存为filename.dta；当设定mc(#)中#>1时，
                 标准误和90%置信区间会被保存。
notable ：不显示结果表。

*注意：pvarfevd命令，需在pvar命令运行后，方可使用。
--------------------------------------------------------------------------*/

     pvarfevd
	 
	 pvarfevd, porder(hours wage) mc(300) dots save(pvarex1)
	 
	 pvarfevd, porder(wage hours) mc(300) dots




