



/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型、空间计量等---------*/

/*---------------------Ch7-4--横截面空间计量模型------------------------*/



 cd G:\Stataex                          /*----指定默认路径----*/
 use G:\Stataex\ch9.dta,clear     /*----打开指定路径下的数据文件----*/


*  encode idcode, gen(idnew)    /*----生成新变量idnew(取值为1,2,3...)替代idcode----*/
                                /*----注意：此处idcode为1,2,3……整数，故无需使用encode命令----*/
*  xtset idnew year             /*----告诉Stata该数据为面板数据----*/
	
 xtset idcode year	            /*----告诉Stata该数据为面板数据----*/
 browse                          /*----浏览数据----*/

 use https://stats.idre.ucla.edu/stat/stata/faq/ozone.dta, clear

 des                        /*----了解变量的含义----*/
 
 
 
* net install sg162.pkg     /*----安装spat打头的所有命令----*/
 

 h spatreg                  /*----安装spat打头的所有命令----*/

 
 空间自相关检验
空间计量模型（SARM、SEM）回归（含空间效应检验）
一般化空间计量模型（SARARM）回归（含空间效应检验）
含内生解释变量的SARARM回归（含空间效应检验）
