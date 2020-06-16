拿到一个数据集之后……?

	一定不是分析数据、绘图！
	一定不是看统计量（缺失值、最大值、最小值）』

是什么？

	有多少个变量？
	有多少个观测值？
	符合某些条件的观测值有多少个？
	ー人ー条数据？or ー人多条数据？

1. describe

2. count [if]

3. isid

4. unique
	ssc install unique

5. codebook [varlist] [if] [in] [,option]
	数据字典:变量名 逻辑 第几 自定义

6. summarize [varlist] [if] [in] [weigt] [,option]
	summ

7. histogram varname [if] [in] [weigt] [,[continuous_opts |discrete_opts]options]
	//直方图
	hist varname
	hist varname,freq
	hist varname,by(varname2)
	hist varname,normal
	
8. graph box
	graph box-and-whisker plot
	
9. violin plot
	ssc install vioplot
	//小提琴图
	
10.graph query,scheme
	set ...
	
11.twoway scatter varlist[if] [in] [,option]
	//scatter plot 
	twoway scatter y x
	twoway scatter y1 y2 y3 ...x

 // 跟在Command之后的注释
 *  星号作为一行开头，这一行都是注释
 /* 两个星号之间加多行注释*/
 /*
	Porpose     : This do file is used for ...
	Author      :
	Date creat  :
	Lat modified:
	*/
12. clear all //Clear all the thing from Stata memory

13. pwd //Get the current working diretory
14. cd "~/documents/Stata"  //Change to your working directory

15. log using "Lecture",replace //Open a log-file

116.use auto.dta,clear //Open a new data

** Some exploratory data analysis using commands we learnt previously
sum price
codebook mpg
corr weight length

** Copy from the "Command" section or from screen

17. log close //Close the log-file 

18. 
import excel "/Users/mac/Documents/Stata/vba.xls", sheet("sheet1") firstrow clear//导入excel，第一行作为变量
import delimited /Users/mac/Documents/Stata/vba.csv, case(upper) encoding(utf8) 





