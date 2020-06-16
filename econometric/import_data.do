* 首先，复习一下Stata添加注释的方法
* Stata中绿色的文字是不运行的

// 跟在command 之后的注释
/// 代表换行
* 星号作为一行开头，这一行都是注释
/*
			Purpose     :
			Auther      :
			Date created:

*/

* 清除Stata内存里所有数据和宏等
clear all

//set macvar 8000
* 如果你的变量>5000
* 最多变量，IC：2048   SE：32767   MP：12000

* 得到现在工作路径
pwd

*查看当前路径文件
dir

* 关闭打开的log
capture log close
* 打开新的log
log using *.log,replace

*******************************************************
***********************导入DTA数据*************************
*******************************************************

use "child.dta",clear
* 或
use "/……/……/*.dta",clear

*******************************************************
***********************导入csv数据*************************
*******************************************************

import delimited "2019.csv",clear

* 在导入 CSV 文件时，Statal 自己判断是否把 CSV 文件的第一行作为变量名导入我们可以让 Stata 不把 CSV 文件的第一行作为变量名导入
import delimited" child. csv", varnames (noname) clear

*我们也可以让 Stata 必把 CSV 文件的第一行作为变量名导入 
import delimited"child.csv", varnames(1) clear

*我们可以让 Stata 导入的时候把变量名全变成大写
import delimited child.csv, varnames (1) case(upper) clear

*或者全变成小写
import delimited child.csv, varnames (1) case(Lower) clear

*或者保留CSV里的形式
import delimited child.csv, varnames (1) case(preserve) clear

*******************************************************
***********************导入Excel数据*************************
*******************************************************
import excel "child.xlsx", clear
import excel "child.xlsx", firstrow clear
import excel "child.xlsx", firstrow sheet("sheet1") clear
import excel "child.xlsx", firstrow case(upper) clear
import excel "child.xlsx", firstrow case(lower) clear
import excel "child.xlsx", firstrow case(preserve) clear

