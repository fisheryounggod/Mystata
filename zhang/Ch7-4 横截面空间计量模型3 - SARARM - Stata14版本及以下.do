



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-4--横截面空间计量模型3-SARARM-Stata14版本及以下---------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install sppack.pkg     /*----安装spreg的相关命令----*/
 
 h spreg                /*----安装spreg的相关命令----*/


 
 
 
 /*--3-1-------------打开空间权重矩阵数据库------------------------*/

 use G:\Stataex\columbusswm.dta, clear     /*----打开指定路径下的【空间权重矩阵】文件----*/

 browse                          /*----浏览数据----*/

* des                        /*----了解变量的含义----*/ 
 
 
 
 

/*--3-2------------------spmat：创建、管理空间权重矩阵----------------------
spmat subcommand ... [, ...]

----选项----（在命令窗口输入：h spmat，根据具体问题选择合适的子命令即可。）
----子命令--------功能介绍----
    ------------------------------------------------------------------
    contiguity    创建一个spmat对象，该对象包含一个连续矩阵W。
    idistance     创建一个包含逆距离（距离倒数）矩阵W的spmat对象。

    summarize     总结spmat对象。
    note          manipulate a note attached to an spmat object
    graph         draw an intensity plot of W
    lag           create a spatially lagged variable
    eigenvalues   add eigenvalues of W to an spmat object
    drop          drop an spmat object from memory

    save          save an spmat object to disk in Stata's native format
    export        save an spmat object to disk as a text file
    getmatrix     copy a matrix from an spmat object to a Mata matrix
        
    use           create an spmat object from a file created by spmat save
    import        从text文件中创建spmat对象。
    dta           从Stata数据库.dta文件中创建spmat对象。
    putmatrix     copy a Mata matrix to an spmat object

    permute       permute rows and columns of W
    tobanded      transform an n x n W into a banded b x n W
	
----子命令--dta为例------介绍----
    spmat dta objname varlist [if] [in] [, options]
	
	----选项----
	objname ：指定生成空间权重矩阵名。
	varlist ：根据哪些变量来生成空间权重矩阵objname。空间权重矩阵是n*n维，
	              所以，varlist中变量个数必须等数据库中个体数n。
	id(varname) ：指定一个包含唯一位置标识符的变量。
	                 如果省略此选项，spmat dta将创建标识符为1,…,n。
	idistance ：告诉spmat数据将被转换成逆距离。d值将被转换为1/d，
	               但主对角线除外，为0。
	normalize(norm) ：指定规范化的方法。norm可以是row, minmax, 或spectral。
	replace ：如果变量objname已经存在，将其覆盖。
-------------------------------------------------------------------------*/
 
 
 spmat dta Ws a*
 
 spmat dta Ws a1 - a49
 
 spmat dta Ws a*, replace

 
 
 
 use G:\Stataex\columbusdata.dta, clear     /*----打开指定路径下的【变量数据】文件----*/

 

*【注意】【Stata15版本】的命令格式，与【Stata14】及以下版本，【有差别】。
*【注意】以下版本是【Stata14版本】的命令格式。

/*--3-3-------------spreg：一般化空间自相关模型SARARM回归-------------------
spreg estimator depvar [indepvars] [if] [in], id(varname) [options]

----选项----
estimator ：ml、gs2sls。
depvar ：被解释变量。
indepvars ：解释变量。
id(varname) ：确定个体变量名。
dlmat(name[, eig]) ：指定空间自回归模型SARM的空间权矩阵。
elmat(name[, eig]) ：指定空间误差模型SEM的空间权矩阵。
noconstant ：不包含截距项。
nolog ：不报告迭代细节。

--ML--选项--
gridsearch(#) ：指定参数lambda和rho的网格搜索算法的初始值，范围[0.001,0.1]，默认是0.1。
constraints(constraints) ：应用指定的线性约束。

--GS2SLS--选项--
heteroskedastic ：参数估计量方差协方差稳健估计，默认按同方差估计。
impower(q) ：工具变量阶数，默认为=2，impower(2)。
-----------------------------------------------------------------------------*/



 spreg gs2sls crime hoval income, id(id) dlmat(Ws) elmat(Ws) het

 spreg gs2sls crime hoval income, id(id) dlmat(Ws) elmat(Ws) het nolog
 est stor SPREGGS2SLS1
 
 spreg gs2sls crime hoval income, id(id) dlmat(Ws) elmat(Ws) nolog
 est stor SPREGGS2SLS2
 
 *  ssc install st0085_2            /*----安装非Stata系统软件包----*/
 esttab SPREGGS2SLS1 SPREGGS2SLS2 using testspreg1.doc, r2(%8.4f) ///  
	      se(%8.4f) nogap brackets aic bic  mtitles replace
 
 
 quietly 

 spreg ml crime hoval income, id(id) dlmat(Ws) elmat(Ws)  nolog
 est stor SPREGML1
 
*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab SPREGGS2SLS2 SPREGML1 using testspreg2.doc, ar2(%8.4f) ///  
	      se(%8.4f) nogap brackets aic bic  mtitles replace	  


		  
 spreg gs2sls crime hoval income, id(id) dlmat(Ws) het nolog
 est stor SPREGGS2SLS3

 spreg gs2sls crime hoval income, id(id) elmat(Ws) het nolog
 est stor SPREGGS2SLS4
