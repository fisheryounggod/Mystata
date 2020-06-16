



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-4--横截面空间计量模型4-含【内生变量】SARARM----------------------*/


 cd G:\Stataex                    /*----指定默认路径----*/


* net install sppack.pkg     /*----安装spreg的相关命令----*/
 
 h spreg                /*----安装spreg的相关命令----*/


 
 
 
 /*--4-1------------------打开空间权重矩阵数据库------------------------*/

 use G:\Stataex\columbusswm.dta, clear     /*----打开指定路径下的【空间权重矩阵】文件----*/

 browse                          /*----浏览数据----*/

* des                        /*----了解变量的含义----*/ 
 
 
 
 

/*--4-2------------------spmat：创建、管理空间权重矩阵----------------------
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
 
 spmat dta Ws a*, replace

 
 
 
 
 
 use G:\Stataex\columbusdata.dta, clear     /*----打开指定路径下的【变量数据】文件----*/
 
 
 
 
 
/*--4-3--------------spivreg：含【内生解释变量】的SARARM回归----------------------
spivreg depvar [varlist1] (varlist2 = [varlist_iv]) [if] [in], 
                id(varname) [options]

----选项----
depvar ：被解释变量。
varlist1 ：外生解释变量。
varlist2 ：内生解释变量。
varlist_iv ：工具变量。
id(varname) ：确定个体变量名。
dlmat(name) ：指定空间自回归模型SARM的空间权矩阵。
elmat(name) ：指定空间误差模型SEM的空间权矩阵。
noconstant ：不包含截距项。
heteroskedastic ：参数估计量方差协方差稳健估计，默认按同方差估计。
impower(q) ：工具变量阶数，默认为=2，impower(2)。
-------------------------------------------------------------------------*/
 
 spivreg crime (hoval = income), id(id) dlmat(Ws) elmat(Ws) het nolog
 est stor SPIVREG1
 
 spivreg crime (hoval = income), id(id) dlmat(Ws) elmat(Ws) het impower(3) nolog
 est stor SPIVREG2
 
*  ssc install st0085_2            /*----安装非Stata系统软件包----*/
  esttab SPIVREG1 SPIVREG2 using testspreg3.doc, ar2(%8.4f) ///  
	      se(%8.4f) nogap brackets aic bic  mtitles replace	  

 