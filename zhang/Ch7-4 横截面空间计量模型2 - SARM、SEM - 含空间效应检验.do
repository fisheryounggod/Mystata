



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*--------------Ch7-4--横截面空间计量模型2-SARM-SEM-含空间效应检验-----------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install sg162.pkg     /*----安装spat打头的所有命令----*/
 
 h spatreg                  /*----安装spat打头的所有命令----*/

 
 

* browse                          /*----浏览数据----*/


* des                        /*----了解变量的含义----*/
 
 
 
 
 use G:\Stataex\columbusdata.dta, clear     /*----打开指定路径下的【变量数据】文件----*/
 
 
* spatwmat, name(W) xcoord(x) ycoord(y) band(0 3) binary
 
 
 
 
/*--2-1----------------空间效应检验前，先reg回归----------------------*/
 
 reg crime hoval income
 est stor REG1 
 
 
 
 
 
/*--2-2----------------定义空间权重矩阵----------------------*/
 
 spatwmat using G:\Stataex\columbusswm.dta, name(W)   /*----定义空间权重矩阵----*/
 
 spatwmat using columbusswm.dta, name(W)  standardize

 spatwmat using columbusswm.dta, name(W) standardize eigenval(E)

 
 matrix list W                              /*----显示空间权重矩阵数据----*/
 
 
 
 
/*--2-3----------------spatdiag：空间效应检验-------------------------
*---H0：不存在空间效应

spatdiag , weights(matrix)

----选项----
weights(matrix) ：指定空间权重矩阵。
*注意：spatdiag命令要求先reg回归。
*注意： 除spatcorr命令外，其他命令都要先使用spatwmat定义空间权重矩阵。
---------------------------------------------------------------------*/
 
 
 spatdiag, weights(W)
 
 
 
 *若空间效应检验不拒绝H0，表明不存在空间效应；
 *      也可考虑建立空间计量模型进行检验。
 *若拒绝H0，表明存在空间效应。
 *      接下来，可以建立空间计量模型进行检验分析。

 
 
 
 
 
/*--2-4-----------spatwmat：计算空间权重矩阵的特征值向量----------------*/
 
 spatwmat using columbusswm.dta, name(W) standardize eigenval(E)
 

 spatwmat using columbusswm.dta, name(W) standardize eigenval(E)

 matrix list E
 
 
/*--2-5------spatreg：空间计量模型（SARM、SEM）回归（含空间效应检验）------
spatreg varlist , weights(weights_matrix) eigenval(eigen_matrix)
              model(lag|error) [ nolog robust level(#) ]

----选项----
varlist ：被解释变量、解释变量。
weights(weights_matrix) ：指定空间权重矩阵。
eigenval(eigen_matrix) ：指定空间权重矩阵的特征值向量。
model(lag|error) ：model(lag)表示应用空间自回归模型SARM；
                   model(error)表示应用空间误差模型SEM。
nolog ：不报告迭代记录。
robust ：参数估计量方差协方差矩阵的稳健性估计（Huber/White/sandwich）。
level(#) ：设置参数估计值的置信区间，默认level(95)，95%置信区间。 
*注意： 除spatcorr命令外，其他命令都要先使用spatwmat定义空间权重矩阵。
---------------------------------------------------------------------------*/
 
 
 spatreg crime hoval income, weights(W) eigenval(E) model(lag) nolog
 est stor SPATARM1
  
 spatreg crime hoval income, weights(W) eigenval(E) model(lag) robust
 est stor SPATARM1r
 
 spatreg crime hoval income, weights(W) eigenval(E) model(error) nolog
 est stor SPATAEM1

 spatreg crime hoval income, weights(W) eigenval(E) model(error) robust nolog
 est stor SPATAEM1r

 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab REG1 SPATARM1 SPATARM1r SPATAEM1 SPATAEM1r using testspat1.doc, ///
          ar2(%8.4f) se(%8.4f) nogap brackets aic bic  mtitles replace

		  
		  
		  
 
 *可以通过检验其空间自回归系数是否显著，来判断是否存在空间效应。
 *若空间效应检验不拒绝H0，表明不存在空间效应；
 *      也可考虑建立一般化的空间计量模型进行检验。
 *若拒绝H0，表明存在空间效应。
 *      接下来，可以考虑建立一般化的空间计量模型进行检验分析，
 *              综合判断采用何种模型。
 
 
 











