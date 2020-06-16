



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*---------------------Ch13-2-2---模糊断点回归模型------------------------*/



 cd G:\Stataex                    /*----指定默认路径----*/
 use G:\Stataex\ch13.dta,clear    /*----打开指定路径下的数据文件----*/




 browse                           /*----浏览数据----*/
 
 
 des                        /*----了解变量的含义----*/
 
 
* ssc install rd, replace      /*----安装rd命令包------*/
 
 
/*-------rd-----------------------------------------------------------
 rd outcomevar [treatmentvar] assignmentvar [if] [in] [weight] [, options]

 outcomevar ：结果变量。
 treatmentvar ：处理变量。若忽略处理变量treatmentvar，则默认为【精确断点】回归，
             且根据分组变量assignmentvar来计算处理变量，
			 若assignmentvar>=z0，则treatmentvar=1，反之等于0。
 assignmentvar ：分组变量 Z。 
 
 ----选项----
 mbw(numlist) ：指定最优窗宽的倍数，默认为mbw(100,50,200)，即最优窗宽的1,0.5,2倍
                    进行局部线性回归。
 z0(real) ：断点位置，默认为z0(0)，即原点。
 strineq ：当assignmentvar严格大于z0时，treatmentvar=1，反之等于0。
 covar(varlist) ：指定加入局部线性回归的控制变量。 
 x(varlist) ：检验这些控制变量在断点处是否存在跳跃。
 ddens ：要求计算分组变量Z密度的断点。
 s(stubname) ：要求估计结果保存为以stubname为开头的新变量。
 graph ：根据所选的每一窗宽，画出对应的局部线性回归图。
 noscatter ：不画散点图。
 cluster(varlist) ：方差协方差稳健估计。
 scopt(string) ：为散点图提供选项列表。
 lineopt(string) ：为多个重叠的直线提供选项列表。
 n(real) ：指定在计算局部线性回归的点的个数。
 bwidth(real) ：局部线性回归的窗宽。默认使用Imbens and Kalyanaraman (2009)给出的最优窗宽估计。
 bdep ：画断点回归估计量与窗宽的图形，分析断点回归估计量对窗宽的依赖程度。
 oxline ：在bdep画出的图的最优窗宽上画一条直线，方便识别。
 bingraph ：画箱图而非散点图。
 binvar(varname) ：指定变量取计算箱（binned means）。
 kernel(rectangle) ：使用矩形核（均匀核），默认使用三角核。
-----------------------------------------------------------------------------*/
 
 
 
 
 
/*--1-1--McCrary（2008）检验分组变量的密度函数在断点处是否连续。
                     依此判断，是否为【内生分组】问题。--------------*/	
					 
/*----【注意】需要安装DCdensity命令包，并复制到C:\ado\plus----*/
* 下载地址：https://eml.berkeley.edu/~jmccrary/DCdensity/
	 
	 
  DCdensity	d, breakpoint(0) generate(Xj Yj r0 fhat se_fhat) ///
                graphname(testrd.eps)

 
*  若不拒绝原假设，说明无内生分组，可以考虑进行断点回归；
*  否则，不可进行断点回归。  

*  此处，检验不存在内生分组，故【继续】下面的操作。 
 
 
 
 
/*--1-2--判断是【精确断点】回归还是【模糊断点】回归？------------------------*/


  g  newwin=(d>=0)
  
  tabulate newwin win
   
*或者，等价于
  gen xw=newwin-win
  l xw

  
* 此处，分组变量d的断点是0，生成新虚拟变量newwin
* 因此，若newwin与处理变量win完全相等（即newwin-win全部等于0），
*       则属于精确断点回归；否则，属于模糊断点回归。


*  此处，是【精确断点】回归，故应该采用精确断点回归进行分析。



* 【特此说明】接下来的操作，【仅仅】是为了演示【模糊断点】回归操作而已。 




 
/*--2--【模糊断点】回归------------------------*/
/*------由于，处理变量win【完全】由分组变量d是否大于等于0所决定，
        若在rd命令中省略处理变量win或者采用win都是精确断点回归，
		因此，接下来，生成一个【新的处理变量】randwin，
		使得，randwin不完全由分组变量d所决定。------------------*/
 
/*--【注意】此处，【仅仅】是作为【模糊断点】回归的一个例子进行操作演示而已----*/


* 【注意】在实证分析中，如果处理变量真的不完全由分组变量所决定，
*         那就不需要进行下面的随机生成新处理变量的命令。

 set seed 12345
 g byte randwin=cond(uniform()<.1,1-win, win)
 


 tabulate randwin win
* 【结果】显示randwin与win相关，但不完全相等，
*  说明randwin不完全由分组变量d所决定。满足模糊断点回归的条件。 
 
 
 


/*--2-1--选择【最优窗宽】：设置不同窗宽，通过图形选择----*/ 
* 注意：选择最优窗宽时，可以考虑加协变量进行选择。大家自己尝试。

*从默认的3种窗宽mbw(100,50,200)中，选一个最优的。
  rd lne randwin d, gr bdep oxline 

  
*从25~300，间隔为5中，选一个最优的。
  rd lne randwin d, mbw(25(5)300) bdep ox
 
 
*含协变量情形，从25~300，间隔为5中，选一个最优的。
  rd lne randwin d, mbw(25(5)300) covar(i votpop black blucllr ///
             fedwrkr forborn manuf unemplyd union ///
			 urban veterans) bdep ox 

			 
*  此处，含有无协变量情形，最优窗宽都是105，选100也可以的。  



/*--2-2--【检验】协变量是否在断点处，存在跳跃----*/ 
  rd lne randwin d, mbw(100) x(i votpop black blucllr ///
             farmer fedwrkr forborn manuf unemplyd union ///
			 urban veterans)   
			 
			 
* 检验结果表明，变量farmer的P值小于0.05，
* 说明变量farmer在断点处存在跳跃，故剔除（注意内生性问题）。
* 故，【继续】下面的操作。	 
	
	
	
 
  
  
/*--2-3-1--【含协变量】的断点回归------------*/

  rd lne randwin d, gr mbw(100) covar(i votpop black blucllr ///
             fedwrkr forborn manuf unemplyd union ///
			 urban veterans)
  estimates store RD1
  

* 将窗宽mbw(100,105)对应的情形都估计一遍。默认三角核
  rd lne randwin d, mbw(105) covar(i votpop black blucllr ///
             fedwrkr forborn manuf unemplyd union ///
			 urban veterans)  
  estimates store RD2
  
  
* 将窗宽mbw(100,105)对应的情形都估计一遍。矩形核
  rd lne randwin d, mbw(105) covar(i votpop black blucllr ///
             fedwrkr forborn manuf unemplyd union ///
			 urban veterans)  kernel(rectangle)
  estimates store RD3  
		 
			 
*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab RD1 RD2 RD3 using testrd1.doc, ar2(%8.4f) se(%8.4f) ///  
	     nogap brackets aic bic  mtitles replace	  

		 
* 将默认的3种窗宽mbw(100,50,200)对应的情形都估计一遍。
  rd lne randwin d, covar(i votpop black blucllr ///
             fedwrkr forborn manuf unemplyd union ///
			 urban veterans) 		 
  
			 
/*--2-3-2--【不含协变量】的断点回归------------*/
* 类似于上面的情形进行回归


*从默认的3种窗宽mbw(100,50,200)中，选一个最优的。
  rd lne randwin d, gr bdep oxline 

  
*从25~300，间隔为5中，选一个最优的。
  rd lne randwin d, mbw(25(5)300) bdep ox
 
 
*  此处，选的最优窗宽是105，100也可以的。





  rd lne randwin d, gr mbw(100)
  
*  rd lne d, gr mbw(100) line(`"xla(-.2 "Repub" 0 .3 "Democ", noticks)"')


  rd lne randwin d, gr mbw(105)
  
  rd lne randwin d 
  

  
  
  


			 

 
 
 
 
