

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch9.3--内生性问题------------------------*/
/*------可以与ch5--动态面板数据模型结合起来------*/



 cd G:\Stataex                          /*----指定默认路径----*/
 use G:\Stataex\ch9.dta,clear     /*----打开指定路径下的数据文件----*/


*  encode idcode, gen(idnew)    /*----生成新变量idnew(取值为1,2,3...)替代idcode----*/
                                /*----注意：此处idcode为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
 xtset idcode year	            /*----告诉Stata该数据为面板数据----*/
 browse                          /*----浏览数据----*/




* h xtivreg            /*----安装xtivreg等命令--点击安装即可----*/





/*--1-1-----固定效应----Within估计-------xtivreg：面板数据模型工具变量法--------
xtivreg depvar [varlist_1] (varlist_2 = varlist_iv) [if] [in] , fe [FE_options]

----选项----
fe ：使用固定效应的within法估计。
regress ：将所有协变量视为外生变量，即depvar对varlist_1和varlist_2回归，忽略varlist_iv。
vce(vcetype) ：参数估计量方差协方差矩阵稳健估计：robust、cluster 聚类变量名、
                                                 bootstrap、Jackknife。
level(#) ：置信水平，默认为95%。
first ：报告第一阶段估计结果。
small ：报告t和F统计量，而非Z和卡方统计量。
display_options ：控制行列的格式等。
-------------------------------------------------------------------------*/



/*----------接下来仅仅举个例子----示范regress选项--------*/
   quietly xtivreg ln_w age c.age#c.age (tenure = not_smsa), fe
   estimates store IVREG1
   quietly xtivreg ln_w age c.age#c.age (tenure = not_smsa), fe regress
   estimates store IVREG2
   quietly xtreg ln_w age c.age#c.age tenure, fe
   estimates store REG1

   *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab IVREG1 IVREG2 REG1 using testivreg1.doc, ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

/*----------上面仅仅举个例子----示范regress选项--------*/

		
		
		
   xtivreg ln_w age c.age#c.age not_smsa (tenure = union south), fe		
		
		
*   ssc install xtoverid, replace        /*-----安装命令包-----*/   
/*--------xtoverid：工具变量有效性检验--------------
xtoverid [, robust cluster(varlist) ]
 
----选项----
robust、cluster(varlist)
默认报告的是Sargan统计量，加了稳健性估计后，报告的是 Hansen J统计量。
-------------------------------------------------------------------------*/



*  ssc install ivreg2
*  ssc install ranktest
/*--注意：运行xtoverid后，请安装上述2个命令包，
             否则，运行xtoverid显示错误---------------*/ 
			 

   gen age2=c.age#c.age
   xtivreg ln_w age age2 not_smsa (tenure = union south), fe		
/*------------
   xtivreg ln_w age c.age#c.age not_smsa (tenure = union south), fe
   
注意：xtoverid要求xtivreg命令中的变量不能带有变量运算。否则，显示错误。
故，运行
   gen age2=c.age#c.age
再运行，
   xtivreg ln_w age age2 not_smsa (tenure = union south), fe		
-------------*/ 

   xtoverid
   xtoverid, robust
   xtoverid, cluster(idcode)

   
   
   xtivreg ln_w age age2 not_smsa (tenure = union south), fe vce(cluster idcode)		
   estimates store IVREG3
   xtoverid	
/*---------效果与下面是等价的----------
   quietly xtivreg ln_w age age2 not_smsa (tenure = union south), fe 		
   xtoverid, cluster(idcode)
-------------------------------------*/
	
  esttab IVREG3 using testivreg2.doc, ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace
	
	


	
	
	
	
/*---------下面，【仅仅举个例子】：若有多个内生解释变量，如何运行-----------	
  xtivreg ln_w age age2 not_smsa (wks_work tenure = union south hours), fe ///
                vce(cluster idcode)
				
注意：wks_work不一定是内生解释变量；hours也不一定是外生变量。
此处仅仅是举一个多个内生变量的情形下，采用工具变量法的操作而已。
--------------------------------------------------------------------------*/	


	
	
	
	
	
	
	
	
/*--1-2-----固定效应-----一阶差分-------xtivreg：面板数据模型工具变量法---------
xtivreg depvar [varlist_1] (varlist_2 = varlist_iv) [if] [in] , fd [FD_options]

----选项----
noconstant ：模型不带常数项。
fd ：使用一阶差分法估计。
regress ：将所有协变量视为外生变量，即depvar对varlist_1和varlist_2回归，忽略varlist_iv。
vce(vcetype) ：参数估计量方差协方差矩阵稳健估计：robust、cluster 聚类变量名、
                                                 bootstrap、Jackknife。
level(#) ：置信水平，默认为95%。
first ：报告第一阶段估计结果。
small ：报告t和F统计量，而非Z和卡方统计量。
display_options ：控制行列的格式等。
-------------------------------------------------------------------------*/


   xtivreg ln_w age age2 not_smsa (tenure = union south), fd		
/*------------
   xtivreg ln_w age c.age#c.age not_smsa (tenure = union south), fd
   
注意：1.xtivreg , fd 中变量不能带运算，即上面的命令运行会有错。
      2. xtoverid要求xtivreg命令中的变量不能带有变量运算。否则，显示错误。
故，运行，
   gen age2=c.age#c.age
再运行，
   xtivreg ln_w age age2 not_smsa (tenure = union south), fd		
-------------*/ 
   
   xtoverid
   xtoverid, robust
   xtoverid, cluster(idcode)






/*--2------随机效应---------------xtivreg：面板数据模型工具变量法--------------
xtivreg depvar [varlist_1] (varlist_2 = varlist_iv) [if] [in] [, re RE_options]

----选项----
re ：使用随机效应FGLS方法估计，默认为随机效应模型。
ec2sls ：使用Baltagi随机效应估计。
nosa ：使用Baltagi-Chang（张）方差分量估计。
regress ：将所有协变量视为外生变量，即depvar对varlist_1和varlist_2回归，忽略varlist_iv。
vce(vcetype) ：参数估计量方差协方差矩阵稳健估计：robust、cluster 聚类变量名、
                                                 bootstrap、Jackknife。
level(#) ：置信水平，默认为95%。
first ：报告第一阶段估计结果。
small ：报告t和F统计量，而非Z和卡方统计量。
thelta ：报告thelta。
display_options ：控制行列的格式等。
-------------------------------------------------------------------------*/

   gen black=(race==2)
   
   xtivreg ln_w age age2 not_smsa black (tenure = union birth south), re
   
/*------------
   xtivreg ln_w age c.age#c.age not_smsa 2.race (tenure = union birth south), re
   
注意：xtoverid要求xtivreg命令中的变量不能带有变量运算。否则，显示错误。
故，运行
   gen black=(race==2)
   gen age2=c.age#c.age
-------------*/   

   xtoverid
   xtoverid, robust
   xtoverid, cluster(idcode)

   
   xtivreg ln_w age age2 not_smsa (tenure = union  south), re

   



   
   
   
   
   
   
/*----------------------------下面的命令大家自行练习--------------------------*/
  


*   ssc install xtivreg2        /*-----安装命令包-----*/
    /*--xtivreg2：也是用于解决内生变量问题--
	  --当工具变量个数多于内生变量个数时，其采用GMM估计更有效--*/

/*--------随机效应---------------xtivreg：面板数据模型工具变量法--------------
xtivreg2 depvar [varlist1] (varlist2=varlist_iv) [weight] [if exp] [in range] , {fe | fd} 
             [ivar(varname) tvar(varname) gmm bw(#) kernel(string) liml fuller(#) kclass(#) coviv cue
              cueinit(matrix) cueoptions(string) robust cluster(varlist) orthog(varlist_ex) endog(varlist_en)
              redundant(varlist_ex) fwl(varlist) small noconstant first ffirst savefirst savefprefix(prefix) rf
              saverf saverfprefix(prefix) nocollin noid level(#) noheader nofooter eform(string)
              depname(varname) plus ]

*注意：仅适用于固定效应within方法或一阶差分方法。
有兴趣的朋友可以运行：
h xtivreg2
查询更多的xtivreg2的用法。
-------------------------------------------------------------------------*/
