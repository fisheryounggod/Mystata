

/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/

/*-------------------------------------Ch1-2--数据输入--------------------------------*/

 

/*------导入面板数据----导入数据的方式还可以手动复制粘贴、参见Ch1-2节视频操作------*/   

* import excel "G:\Stataex\expd.xls", sheet("sheet11") firstrow clear
* save G:\Stataex\panelex2.dta,replace   /*----对数据进行指导位置的保存----*/


/*----调用面板数据----*/

cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\panelex2.dta,clear      /*----打开指定路径下的数据文件----*/


encode province, gen(provi)    /*----生成新变量provi(取值为1,2,3...)替代province----*/
                               /*----注意：若个体变量为1,2,3……整数，就无需使用encode命令----*/
xtset provi year               /*----告诉Stata该数据为面板数据----*/

