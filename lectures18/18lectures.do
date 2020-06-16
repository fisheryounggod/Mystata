//STATA 18讲命令程序文件

*=======================================================================

clear //清除内存
set memory 10m //设置内存大小
cd ~/myprograme/Stata资料

sysuse auto

sum price
sum price weight

sum weight///
price///
length///

scatter price weight

clear
set obs 1000
gen x=_n //生成1—1000的边疆自然数，变量名为x
gen y = x+100


//STATA 18讲命令程序文件

*=======================常用命令================================================

* 需求帮助
help
search

* 进入路径
cd

* 设定内存
set memory 20m

* 打开和保存数据
clear
use
save

* 导入数据
input
edit
infile
insheet

* 重整数据
append
merge
xpose
reshape
generate
egen//?
rename
drop
keep
sort
encode
decode
order
by

* 报告数据
describe
codebook
list
count
inspect
table
tabulate

* 显示和保存结果
display
log

*=======================命令语句================================================

// 命令格式
// [by varlist:] command [varlist] [=exp] [if exp] [in range] [weight] [,options]
/* 

1. [by varlist:] 分类操作

2. command [varlist] 命令

3. [=exp] 赋值及运算表达式

4. [if exp] 条件表达式

5. [in range] 范围筛选

6. [weight] 加权
 
7. [,options] 其他可选项
*/

*===============================数据========================================

use auto,clear          // use 只能打开后缀为“.dat”的数据
sysuse auto,clear

use nlswork, clear
webuse nlswork,clear //   在线获取stata 官方数据

use http://fmwww.bc.edu/ec-p/data/wooldridge/CEOSAL1  // 获取伍德里奇计量经济学数据


* 数据类型：数值、字符、日期
// 数值：byte、int、long、float、double

lxh
sum t*
by for sum pri weigh
by fore: sum pri weigh
by fore,sort: sum pri weigh
gen nprice = price +10//新生成一列
list price nprice
replace nprice=nprice-10//替换一列
list price nprice
drop nprice//删除一列
sum price 1/5//
sum price in 1/5//选择范围：in
sum
list price in 1/10,sep =5//选择步长
list price in 1/10,sep(5)
list price in 1/8,nohead//不显示表头
clear
set obs 1 //样本量设置
gen a =1
d
compress //压缩
d
replace a = 100
compress
d
replace  a= 32741
gen double b = 1
recast double a //讲a生成双精度
recast double a
d

webuse destring, clear
webuse destring1, clear
d
sum
destring,replace
sum
gen nincom = income*1.3
list
webuse destring2,clear
list
destring date,replace
date
list date
destring date,replace ignore" " 
destring date,replace ignore (" ") //文本清洗并转数字
list date

destring price percent, replace ignore("$,%") //文本转数字
list
by percent,sort:list price //分类排序
sort:list price//?
sort price
list
list sort date//?
list, sort date//?
sort,list date
webuse census10,clear
d
list in 1/4 //1到4
format state %-14s //格式设置

list in 1/4
format region  %-8.0g
list in 1/4
format pop %12.0gc
list in 1/4
gen id = -n
gen id = _n
replace id=9812 in 3 //替换第三个值
list in 1/4
format id %05.0f//用0补齐
list in 1/4

// input
clear
input id str10 name economy
1 join 40
2 Chair 30
3 Jack 60
4 huang 90
5 Tom 50
end
save economy, ereplace 

// 导入其他数据

insheet using 3origin.txt,clear
infile id str10 name gender minority economy math using origin.txt,clear //先指出变量名
infix  //每个变量位数确定

// 导出
outsheet using myresult.txt,nonames replace

// 加标签：label
label data '***'
label var '***'
label values gender genderlb
label define genderlb 1'男' 0'女'
note:.....    // note 查看
label define 。。。,modify
label define 。。。,add

label list
label dir
label drop ...

// 保存和删除
save
erase  //必须加后缀

*=============================数据整理===========================================
drop:删除变量或观察值
keep：保留变量或观察值
append：观察值拼接
merge：变量合并
reshape：数据重整
stack：多列转为一列
xpose：数据转置

// 案例
//数据创建
chdir /Users/mac/MyPrograme/Stata资料
mkdir data
chdir /Users/mac/MyPrograme/Stata资料/data
clear
input id str10 name gender minority economy math
1 John 1 1 40 68
2 Chris 1 2 80 52
3 Jack 0 2 90 76
4 Huang 0 2 43 90
5 Tom 0 3 70 96
end
save mydata

// 案例1:横向拆分

clear
use mydata
drop economy math
save students,replace
use mydata,clear
keep id economy
save economy
use mydata,clear
keep id math
save math
clear

// 案例2:纵向拆分

use mydata,clear
list
keep if gender==1
save male
use mydata,clear
drop if gender == 1
save female

// 案例3:横向连接数据文件

chdir /Users/mac/MyPrograme/Stata资料/data
use economy,clear
sort id
save economy,replace
use math,clear
sort id
merge id using economy
tab_merge  //显示对接情况
drop_merge
sort id
save m_e, replace
use students,clear
sort id
merge id using m_e
tab_merge  //显示对接情况
drop_merge
save mymerge

// 案例4:纵向连接数据文件

use male,clear
append using female


// 案例5:面板数据重整--宽变长

reshape long 


// 案例6:面板数据重整--长变宽

reshape wide 

// 案例7: 多列变一列
stack 。。。 into 。。。


// 案例8: 转置
xpose,clear


