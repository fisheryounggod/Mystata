



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-4--横截面空间计量模型1-空间自相关检验---------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install sg162.pkg     /*----安装spat打头的所有命令----*/
 
 h spatreg                  /*----安装spat打头的所有命令----*/

 
 

* browse                          /*----浏览数据----*/


* des                        /*----了解变量的含义----*/
 
 
 
/*--1-------------------空间自相关检验------------------------*/

/*--1-1------------------spatwmat：定义空间权重矩阵------------------------
spatwmat [using filename], name(weights_matrix) [ drop(numlist) 
           xcoord(varname) ycoord(varname) band(numlist) friction(#)
		   binary standardize eigenval(eigen_matrix) ]

----选项----
using filename ：调用空间权重矩阵数据库。
name(weights_matrix) ：指定空间权重矩阵名。
drop(numlist) ：在生成权重矩阵前，删除空间权重矩阵数据库中指定行（对象）或列（变量）。
xcoord(varname) ：若未使用“using filename”选项，则需要该选项，
                    它指定包含每个分析位置对象x坐标的变量名。
ycoord(varname) ：若未使用“using filename”选项，则需要该选项，它指定包含每个分析
                    位置对象y坐标的变量名。其中，x坐标和y坐标都必须用投影单位表示，
					例如，米、公里、英里或任意数字化单位。
band(numlist) ：指定“邻居”的距离带的上下限，空间相邻分配一个非零空间权值。。
friction(#) : 指定在空间权值计算中使用的摩擦friction参数。
binary  ：指定生成一个二元空间权重矩阵。即所有非零的空间权值都设置为1。
standardize ：行标准化的空间权重矩阵，即权重矩阵中行元素之和为1。
eigenval(eigen_matrix) ：计算空间权重矩阵的特征向量，记为eigen_matrix。
                           spatreg中要求要有eigen_matrix。
*注意： 除spatcorr命令外，其他命令都要先使用spatwmat定义空间权重矩阵。
-------------------------------------------------------------------------*/
 
 

 
 spatwmat using G:\Stataex\columbusswm.dta, name(W)   /*----定义空间权重矩阵----*/
 
 spatwmat using columbusswm.dta, name(W) standardize

 spatwmat using columbusswm.dta, name(W) standardize eigenval(E)

 spatwmat using columbusswm.dta, name(W) eigenval(E)

 
 matrix list W                              /*----显示空间权重矩阵数据----*/
 
 
 
 use G:\Stataex\columbusdata.dta, clear     /*----打开指定路径下的【变量数据】文件----*/
 
 
* spatwmat, name(W) xcoord(x) ycoord(y) band(0 3) binary
 
 
 
 
/*--1-2------------------spatgsa：【全局】空间自相关检验------------------------
*-----H0：不存在全局空间自相关

spatgsa varlist , weights(matrix) [ moran geary go twotail ]

----选项----
varlist ：待检验的变量。
weights(matrix) ：指定空间权重矩阵。
moran ：指定Moran's I指数。
geary ：指定Geary's c指数。
go ：指定Getis & Ord's G指数。
twotail ：双边检验，默认为单边检验，即认为仅可能存在正空间自相关的检验。
*注意：  Moran's I, Geary's c 和 Getis and Ord's G至少选一个。
*注意： 除spatcorr命令外，其他命令都要先使用spatwmat定义空间权重矩阵。
-------------------------------------------------------------------------*/

 
 
 spatgsa hoval income crime, weights(W) moran geary go twotail
 
 
 spatgsa crime, weights(W) moran geary go twotail

 
 *若全局空间自相关检验不拒绝H0，表明不存在全局空间自相关；也可考虑空间效应检验。
 *若拒绝H0，表明存在全局空间自相关。接下来，可以考察是否存在局部空间自相关检验
 

 
 
/*--1-3------------------spatlsa：【局部】空间自相关检验------------------------
*-----H0：不存在局部空间自相关

spatlsa varname, weights(matrix) [ moran geary go1 go2 id(varname)
              twotail sort graph(moran|go1|go1) symbol(id|n) map(filename)
              xcoord(varname) ycoord(varname) savegraph(filename [, replace])

----选项----
varname ：待检验的变量名。
weights(matrix) ：指定空间权重矩阵。
moran ：指定Moran's I指数。
geary ：指定Geary's c指数。
go1 ：指定Getis & Ord's G1指数，要求有选项weights(matrix)，
                       且权重矩阵是非标准化的对称二元权矩阵。
go2 ：指定Getis & Ord's G2指数，同上。
id(varname) ：指定个体变量名。
twotail ：双边检验，默认为单边检验，即认为仅可能存在正空间自相关的检验。
sort ：要求根据z值以升序显示统计结果，默认为个体顺序。
graph(moran|go1|go1) ：要求用图形显示结果。
       （1）graph(moran),且未设定选项map(filename)，将显示Moran散点图，
	        但要求选项weights(matrix)是行标准化的权重矩阵。
	   （2）graph(moran),且设定选项map(filename)，将显示Moran散点图，
	        但要求选项weights(matrix)是行标准化的权重矩阵。
       （3）graph(go1),且设定选项map(filename)，将显示G1i z值图，
	        但要求选项weights(matrix)是行标准化的权重矩阵。
       （4）graph(go2),且设定选项map(filename)，将显示G2i z值图，
	        但要求选项weights(matrix)是行标准化的权重矩阵。
symbol(id|n) ：要求在Moran散点图中，位置由标识符表示，而不是默认的图形符号。
       （1）symbol(id)：要求通过选项id(varname)指定的变量的值来标识位置。
	   （2）symbol(n)：要求通过个体对应的数来标识位置。
map(filename) ：指定包含分割分析对象地理区域的多边形坐标文件。
                  此选项要求指定选项xcoord(varname)和ycoord(varname)。
xcoord(varname) ：指定包含每个分析位置对象的x坐标的变量名。
ycoord(varname) ：指定包含每个分析位置对象的y坐标的变量名。
savegraph(filename [, replace]) ：要求将图保存图名为filename的图，
               且其扩展名必须是.ps, .eps, .prn, 或.wmf中的一个。
*注意：  Moran's I, Geary's c 和 Getis and Ord's G至少选一个。
*注意： 除spatcorr命令外，其他命令都要先使用spatwmat定义空间权重矩阵。
-------------------------------------------------------------------------*/
 
 
 spatlsa crime, weights(W) moran go2

 spatlsa crime, w(W) go2 graph(go2) map(columbusBoundary.dta) x(x) y(y) 
 
 
 
 *graph(moran)要使用行标准化后的空间权重矩阵
 spatwmat using columbusswm.dta, name(W2)  standardize
  
 spatlsa crime, weights(W2) moran graph(moran) symbol(n)

 spatlsa crime, weights(W2) moran graph(moran) id(id) symbol(id)

 
 *若局部空间自相关检验不拒绝H0，表明不存在局部空间自相关；也可考虑空间效应检验。
 *若拒绝H0，表明存在局部空间自相关。
 *接下来，可以考察空间自相关指标对距离临界值的依赖性、检验空间效应。

 
 
 
 
 
/*--1-4----------spatcorr：空间自相关指标对距离临界值的依赖性-----------
H0：全局空间不相关

spatcorr varname, bands(numlist) xcoord(varname) ycoord(varname) 
             [geary cumulative twotail graph needle 
			  savegraph(filename [, replace]) ]

----选项----
varname ：待检验的变量名。
bands(numlist) ：指定在计算空间相关图使用距离带的上下限的序列。
           （1）若bands(0 2 4 6)，且未设定选项cumulative，则计算时，
				 距离带为(0-2],(2-4],(4-6]。
           （2）若bands(0 2 4 6)，且设定选项cumulative，则计算时，
				 距离带为(0-2],(0-4],(0-6]。				 
xcoord(varname) ：指定包含每个分析位置对象的x坐标的变量名。
ycoord(varname) ：指定包含每个分析位置对象的y坐标的变量名。
                    其中，x坐标和y坐标都必须用投影单位表示，
					例如，米、公里、英里或任意数字化单位。
geary ：指定计算Geary's c指数，默认是Moran's I指数。
cumulative ：要求使用累积距离带，默认consecutive 连续距离带。
twotail ：双边检验，默认为单边检验，即认为仅可能存在正空间自相关的检验。
graph ：要求画空间相关图。
needle ：要求使用从0(若是Moran's I)或1(若Geary's c)
         到统计值的垂直线，绘制空间相关图，而不是连接统计值的直线。
savegraph(filename [, replace]) ：要求将图保存图名为filename的图，
               且其扩展名必须是.ps, .eps, .prn, 或.wmf中的一个。
-------------------------------------------------------------------------*/
 
 
 spatcorr crime, bands(0(1)5) xcoord(x) ycoord(y) twotail
 
 spatcorr crime, bands(0(1)5) xcoord(x) ycoord(y) geary twotail

 spatcorr crime, bands(0(1)5) xcoord(x) ycoord(y) cumulative twotail

 spatcorr crime, bands(0(1)5) xcoord(x) ycoord(y) graph twotail

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 *--【注意】--下面的程序是接着上面的结果来的--如果是打开Stata就想直接下面的操作，---
 *----请Ch7-4 横截面空间计量模型2 - SARM、SEM - 含空间效应检验.do---------------
 
 
/*--1-5----------------空间效应检验前，先reg回归----------------------*/
 
 
 reg crime hoval income
 est stor REG1 
 
/*--1-6----------------spatdiag：空间效应检验-------------------------
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

 
 
/*--1-7-----------spatwmat：计算空间权重矩阵的特征值向量----------------*/
 
 spatwmat using columbusswm.dta, name(W) standardize eigenval(E)
 
 spatwmat using columbusswm.dta, name(W)  eigenval(E)
 
 
 
/*--1-8------spatreg：空间计量模型（SARM、SEM）回归（含空间效应检验）------
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
 
 
 spatreg crime hoval income, weights(W) eigenval(E) model(lag)
 est stor SPATARM1
  
 spatreg crime hoval income, weights(W) eigenval(E) model(lag) robust nolog
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
 
 
 
 
 












