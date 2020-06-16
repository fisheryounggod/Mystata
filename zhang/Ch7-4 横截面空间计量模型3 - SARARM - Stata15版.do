



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-4--横截面空间计量模型2-SARARM----------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install sppack.pkg     /*----安装spreg的相关命令----*/
 
 h spreg                /*----安装spreg的相关命令----*/


 
 
 
 /*--2-1------------------打开空间权重矩阵数据库------------------------*/

 use G:\Stataex\columbusswm.dta, clear     /*----打开指定路径下的【空间权重矩阵】文件----*/

 browse                          /*----浏览数据----*/

* des                        /*----了解变量的含义----*/ 
 
 
 

/*--2-2------------------spmat：创建、管理空间权重矩阵------------------------
spmat subcommand ... [, ...]

----选项----（在命令窗口输入：h spmat，根据具体问题选择合适的子命令即可。）
----子命令--------功能介绍----
    ------------------------------------------------------------------------
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
 
 spmat dta Ws a*, replace

 
 spset id
 spmatrix create contiguity W
  
 
 
 
 use G:\Stataex\columbusdata.dta, clear     /*----打开指定路径下的【变量数据】文件----*/
 
 
/*--2-3-------------spreg：一般化空间自相关模型SARARM回归-------------------
【注意】以下版本是【Stata15版本】的命令格式，与【Stata14】及以下版本，【有差别】。后面会介绍。

*--1--Generalized spatial two-stage least squares，GS2SLS

spregress depvar [indepvars] [if] [in], gs2sls [gs2sls_options]

----选项----
gs2sls ：使用GS2SLS。
dvarlag(spmatname) ：指定空间自回归模型SARM的空间权矩阵。
errorlag(spmatname) ：指定空间误差模型SEM的空间权矩阵。
ivarlag(spmatname : varlist) ：指定空间权矩阵，存在空间滞后的解释变量。
noconstant ：不包含截距项。
heteroskedastic  ：参数估计量方差协方差稳健估计。
force ：当估计样本是用于创建空间权重矩阵的样本的子集时，允许进行估计，默认不允许。
impower(#) ：工具变量近似阶数，默认为impower(2)。
level(#) ：置信区间，默认95%，level(95)。
-----------------


*--2--Maximum likelihood，ML

spregress depvar [indepvars] [if] [in], ml [ml_options]

----选项----
ml ：使用ML估计。
dvarlag(spmatname) ：指定空间自回归模型SARM的空间权矩阵。
errorlag(spmatname) ：指定空间误差模型SEM的空间权矩阵。
ivarlag(spmatname : varlist) ：指定空间权矩阵，存在空间滞后的解释变量。
noconstant ：不包含截距项。
constraints(constraints) ：应用指定的线性约束。
force ：当估计样本是用于创建空间权重矩阵的样本的子集时，允许进行估计，默认不允许。
vce(vcetype) ：vcetype可为 oim、robust。
level(#) ：置信区间，默认95%，level(95)。
nocnsreport ：不报告约束情形。
-------------------------------------------------------------------------*/
 
 
 spreg gs2sls crime hoval income, id(id) dlmat(Ws) elmat(Ws) het
 
 



*【注意】【Stata15版本】的命令格式，与【Stata14】及以下版本，【有差别】。
*【注意】以下版本是【Stata14版本】的命令格式。

/*--2-3-------------spreg：一般化空间自相关模型SARARM回归-------------------
spreg gs2sls depvar [indepvars] [if] [in], id() dlmat(Ws) elmat(Ws) het nolog

*去尝试稳健性估计是下面哪种形式？
spreg ml depvar [indepvars] [if] [in], id() dlmat(Ws) elmat(Ws) vec(robust) nolog
spreg ml depvar [indepvars] [if] [in], id() dlmat(Ws) elmat(Ws) robust nolog

----选项----
depvar ：被解释变量。
indepvars ：解释变量。
id() ：确定个体变量名。
dlmat(Ws) ：指定空间自回归模型SARM的空间权矩阵。
elmat(Ws) ：指定空间误差模型SEM的空间权矩阵。
heteroskedastic ：参数估计量方差协方差稳健估计。
vce(vcetype) ：vcetype可为 oim、robust。
nolog ：不报告迭代细节。
-----------------------------------------------------------------------------*/

 
 

 
 

 
 
/*--3---------------spivreg：含【内生解释变量】的SARARM回归----------------------
spivreg depvar [varlist1] (varlist2 = [varlist_iv]) [if] [in], 
                id(varname) [options]

----选项----
depvar ：被解释变量。
varlist1 ：外生解释变量。
varlist2 ：内生解释变量。
varlist_iv ：工具变量。
id(varname) ：确定个体变量名。
dlmat(name) ：指定空间自相关模型SARM的空间权矩阵。
elmat(name) ：指定空间误差模型SEM的空间权矩阵。
noconstant ：不包含截距项。
heteroskedastic ：参数估计量方差协方差稳健估计。
impower(q) ：工具变量近似阶数，默认为impower(2)。
-------------------------------------------------------------------------*/
 
 
 
 
 
 
