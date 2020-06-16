


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-----此处--Ch5-4--介绍如何构建：长动态面板模型-----*/


cd G:\Stataex                          /*----指定默认路径----*/

use G:\Stataex\ch5dpdataex.dta,clear      /*----打开指定路径下的数据文件----*/
/*----数据来源于Arellano & Bond(1991)中的数据----*/


/*--
* webuse abdata,clear            /*----打开网络数据文件----*/
* keep emp wage cap indoutpt id yearm1
* drop if year<=1976
* drop if year>=1982
--*/

* encode id, gen(idp)       /*----生成新变量idp(取值为1,2,3...)替代id--*/
                            /*----注意：此处id为1,2,3……整数，故无需使用encode命令----*/

xtset id  year              /*----告诉Stata该数据为面板数据----*/



gen lnemp=log(emp)
g   lnwage=log(wage)
g   lncap=log(cap)
g   lnindoutpt=log(indoutpt)




/*--No.1---T较大的动态面板模型-----*/

* ssc install xtlsdvc     /*----安装非Stata系统命令包----*/
* cd C:\ado\plus          /*----有时，不改变默认路径是无法使用新安装的命令包----*/   

xtlsdvc lnemp lnwage lncap lnindoutp, initial(ah) bias(1) vcov(40) first lsdv 
/*----LSDVC仅含被解释变量1阶滞后变量的情形--【且要求所有解释变量是严格外生的】--
      initial(ah)表示用Anderson-Hsiao估计量作为初始值--
      i(ab)用差分GMM-Arellano-Bond估计量--
	  i(bb)用系统GMM-Blundell-Bond估计量--
      bias(1)表示精度O(1/T)--
	  bias(2)表示精度O(1/N*1/T)--
	  bias(3)表示精度O(1/N*1/T^2)--默认为bias(1)--
      vcov(40)表示采用40次bootstrap抽样法估计方差-协方差矩阵--
	  first、lsdv分别表示显示第一阶段回归结果、lsdv回归结果----*/


xtlsdvc lnemp lnwage lncap lnindoutp, initial(ab) bias(1) vcov(40)
estimates store LSDVC1AB

xtlsdvc lnemp lnwage lncap lnindoutp, initial(ab) bias(2) vcov(40)
estimates store LSDVC2AB

xtlsdvc lnemp lnwage lncap lnindoutp, initial(bb) bias(1) vcov(40)
estimates store LSDVC1BB

* ssc install st0085_2            /*----安装非Stata系统软件包----*/
esttab LSDVC1AB LSDVC2AB LSDVC1BB using testlsdvc1.doc, ar2(%8.4f) se(%8.4f) ///  
	    nogap brackets aic bic  mtitles replace	
	
