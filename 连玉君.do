

          ****** 人大网络课堂：STATA 专题 ******

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第一讲  STATA简介(1)
          *       =====================



*--------------------
*-> Stata 是何方神圣？
*--------------------
   * 短小精悍

   * 运算速度极快

   * 绘图功能卓越
     cd D:\stata9\ado\personal\Net_course\A1_intro
     sysuse auto, clear
     graph matrix mpg weight displ, by(foreign)

   * 更新和发展速度惊人


*--------------------
*->    课程纲要
*--------------------
/*
第一部分：Stata 操作
1．Stata简介
2．数据处理
3．绘图初步
4．矩阵运算
5．编程初步

第二部分：计量分析与Stata应用
1．普通最小二乘法（OLS）
2．广义最小二乘法（GLS）
3．非线性最小二乘法（NLS）
4．最大似然估计（MLE）
5．工具变量法与GMM
6．时间序列分析
7．面板数据模型

第三部分：Stata进阶
1．编写一个自己的Stata命令
2．模拟分析（Simulation）与自体抽样（Bootstrap） 
3．Stata 与 LaTeX 和 Word 的完美结合
*/


*--------------------
*->     课程特点
*--------------------
* 系统有序的结构安排，帮助您快速建立Stata的学习架构
* 注重与实际应用相结合
* 翔实的配套资料


*--------------------
*->   课程配套资料
*--------------------
* 本课程中使用的 do 文档和 ado 文档
* 范例数据
* 对于登陆国际网有困难的学员，提供STATA官方范例数据包
* STATA外部命令包：plus


*--------------------
*->    讨论和建议
*--------------------
* 人大论坛计量版之STATA专版：http://www.pinggu.org/bbs/index.asp?boardid=67
*   在百度中搜索关键词“Stata专版”
* Arlion 的博客：http://blog.cnfol.com/arlion
*   在百度中搜索关键词“Arlion 的博客 - 中金博客”
* E-mail: arlionn@163.com

*=================================================================================


*-----------------
*-> STATA 概貌 
*-----------------
* 四个窗口，一个菜单条
* 两种执行命令的方式
   * 菜单
   * 命令
     * 一个实例->
     *   连玉君,钟经樊. 中国上市公司资本结构动态调整机制研究. 南方经济,2007(1):23-38.
         cd /users/mac/documents/stata 
         doedit 连玉君.do


*-----------------
*-> 输入和导入数据  
*-----------------
* 实证分析的第一步：数据处理！
* 收集数据、存储、修改、分析、输出结果
*                  =本节命令=  
* ================================================
* input, infile, insheet, type, rename, xpose, cd
* ================================================

* 三种方式：
*   手动输入
*   从 txt 或 Excel 文档中粘贴
*   使用 Stata 命令

*-1 手动输入 (极少使用) 
   clear
   input x y z
     1 2 3
     4 5 6
   end

*-2 从 .txt, excel 表格中粘贴

*-3 使用stata命令：infile, insheet, infix
cd ./lianyujun/A1_intro

*-3.1 以 -tab- 分隔的数据：insheet
type d1.txt              /*查看原始资料的形态*/
type d1.txt, showtabs
insheet using d1.txt, clear

type d11.txt    /*一份没有变量名称的数据*/
insheet using d11.txt, clear 
rename v1  price
rename v2  weight 
rename v3  length

insheet price weight length  using d11.txt, clear


*-3.2 以 空格 分隔的数据：infile 
type d21.txt
insheet using d21.txt, clear     /*空格 分隔的数据无法直接用 insheet 命令导入*/
insheet using d21.txt, clear delimiter(" ") /*需要通过 delimiter 选项制等分隔符号*/
infile v1 v2 v3 using d21.txt, clear  /*空格 分隔的数据用 infile  命令导入比较方便*/

* 我们也可以指定数据的完整存储路径
infile price weight length using "D:\stata9\ado\personal\Net_course\L1_intro\d21.txt", clear

* 包含文字变量的情形
type d2.txt
infile using d2.txt, clear        /*错误的方式*/
infile v1-v5 using d2.txt, clear  /*文字变量全部变成了缺漏值*/
infile str30 v1  int v2  int v3  int v4  str10 v5 using d2.txt, clear  /*指定变量类型*/

* 逗号 分隔的数据
type d3.txt
infile str30 v1 int v2 int v3 int v4 str10 v5 using d3.txt, clear

* 数据的存储
save d3.dta, replace

* 调入STATA格式的数据
use d3.dta, clear
use "D:\stata9\ado\Examples\XTFiles\invest2.dta", clear
sysuse auto, clear   清空内存数据


*-3.3 行列对调的数据
type d5.txt        /*常规数据*/
type d51.txt       /*对调数据*/
insheet using d51.txt, clear 
xpose, clear       /*对调*/
rename v1 year
rename v2 invest
rename v3 income
rename v4 consume

* 4. 时间序列资料
tsset year      就year变量进行排序

* 5. 面板资料
type d6_panel.txt
insheet using d6_panel.txt, clear
tsset code year    /*stata8.0 以下版本适用*/
xtset code year    /*stata9.0 以下版本适用*/先就code排序,再就year排序
* xpose 命令同样适用于面板数据资料
type d6_pdpose.txt 
insheet using d6_pdpose.txt, clear
xpose, clear
list

* 6. STATA官方提供的资料
help dta_contents
 help dta_examples
 help dta_manuals
 use http://www.stata-press.com/data/r9/educ99gdp.dta


          *       =====================
          *         第一讲  STATA简介(2)
          *       =====================



*-------------------
*->    浏览资料
*-------------------
*                    =本节命令=  
* ==================================================
* sysuse, use, describe, compress, label, summarize
* codebook, inspect, histogram, kdensity
* help, search, findit, recast, format
* ==================================================

*---------------------------------------------------------------
*-> 变量的存储类型
*- 整数的存储类型
  * byte     字节型     (-100, +100)
  * int      一般整数型 (-32000, +32000)
  * long     长整数型   (-2.14*10^10, +2.14*10^10)，即，正负21亿 
*- 小数的存储类型
  * float    浮点型   8 位有效数字
  * double   双精度   16位有效数字


*-> 变量的名称
  * 由英为字母、数字或 _ 组成，至多不超过 32 个；
  * 首字母必须为 字母 或 _ ；
  * 英文字母的大写和小写具有不同的含义；
  * 例如：abc_1 a1 _a2 _Gdp_ 都是合理的变量名
          5gdp 2invest 则不是；
  * ^特别注意^：建议不要使用 _ 作为变量的第一个字母，
  *            因为许多stata的内部变量都是以 _ 开头的，
  *            如，_n, _N, _cons, _b 等等。
*---------------------------------------------------------------

*---------------------
*-1. 查看资料的结构 
sysuse auto, clear
describe
describe, detail

*-1.0 更改变量的存储类型 recast
list gear_ratio in 1/5
d gear_ratio
recast int gear_ratio, force
d gear_ratio
list gear_ratio in 1/5

*-1.1 定义变量的显示格式
  * str18    文字型变量，每个观察值占据18个空格
  * %-18s    靠左列印于屏幕上；若%18s，则靠右列印；若 %~18s, 则居中列印
  * %8.0g    在 `8.0' 的原则下，以尽量多的有效位数列出
  * %6.2f    总共占个空格，小数位占两个空格
list price gear in 1/5
format price %6.1f
format gear  %6.4f
list price gear in 1/5

*-1.2 精简资料的存储格式
compress

*-1.3 标签
  d
  *-a 样本标签
    label data "这是一份汽车价格资料"
  *-b 变量的标签
    label var price    汽车价格
    label var foreign  "汽车产地(1 国外; 2 国内)"
    d
  *-c 类别变量的文字标签
    * label define 标签名
    * label values 变量名 标签名 /*将变量值和标签联系起来*/
    edit
    label define repair  1 "好" 2 "较好" 3 "中" 4 "较差" 5 "差"
    label values rep78 repair
    edit
  *-d 标签的管理
    label dir
    label list
    label drop repair
    label list


*-----------------
*-2 基本统计量

summarize 
format price %6.2f
sum price, format
su  price wei, detail

* codebook 命令
codebook price weight
codebook rep78      /*当一个变量中的非重复值小于9个时，Stata便会视此变量为类别变量，并列表统计之*/

* inspect 命令
* 相对于 codebook 命令，该命令还进一步绘制出直方图，以便对样本的分布有更直观的了解
inspect price weight length

* 列表统计 table tabulate
sysuse auto,clear

tabulate foreign
tab      rep78
table    rep78
tab   foreign rep78
table foreign rep78, c(mean price) f(%9.2f) center row col

* 论文格式的统计表格 tabstat
sysuse auto, clear
tabstat price weight length
tabstat price weight length, stats(mean p50 min max) 
tabstat price weight length, stats(mean med min max) col(s) format(%6.2f)
tabstat price weight length, s(mean p25 med p75 min max) c(s) f(%6.2f)
tabstat price weight length, s(mean p25 med p75 min max) c(s) f(%6.2f) by(foreign)


*---------------------
*-3 基本图形分析

*-3.1 直方图
sysuse nlsw88.dta, clear
* 图形的纵坐标
histogram wage             /*长条的高度对应样本数占总样本的比例，总面积为1*/
graph save g0.gph
histogram wage, fraction   /*将长条的高度总和限制为1*/
graph save g_frac.gph
histogram wage, frequency  /*纵坐标为对应的样本数，而非比例*/
graph save g_freq.gph
graph combine g0.gph g_frac.gph g_freq.gph
* 其他选项
histogram ttl_exp, normal  /*附加正态分布曲线*/
histogram wage, kdensity   /*附加密度函数曲线*/
histogram wage, addlabels  /*每个长条上方附加一个表示其高度的数字*/
histogram wage, by(race)
* 离散变量的直方图
histogram grade
graph save d1
histogram grade, discrete  /*离散变量的直方图必须附加 discrete 选项*/ 
graph save d2
graph combine d1.gph d2.gph

*-3.2 密度函数图
kdensity wage     /*它是直方图的平滑曲线*/


*---------------
*-4 执行指令

* stata命令的通用格式: command varlist [if] [in] [ , options] 
* [if] [in] 用于限制样本范围 
* [options] “可选项”，增加了命令的弹性
help sum

*-4.1 指令的适用范围
*-a 列举多个变量
sum age race married never_married grade
sum age-grade
sum s*           /* "*" 是孙悟空，可以表示`任何'长度的字母或数字*/
sum ?a?e         /* "?" 是猪八戒，只能替代`一个'长度的字母或数字*/ 

*-b 样本的限制
sum in 10/20       /*正数第10至第20个观察值之间的观察值*/
sum wage in -5/-1  /*倒数...*/
sum wage hours if race = = 1            /*等于*/
sum wage if race != 3                  /*不等于*/
sum wage if (race==2) & (married==1)   /*且*/
sum wage if (race==3) | (married==0)   /*或*/
sum wage if hours >= 40                /*大等于*/

*-4.2 指令作用的增减：使用选项
sum wage , d

*-4.3 获取帮助
 help sum            /*打开特定stata命令的帮助文件*/
 help regress   
 search panel data, all   /*获取指定关键词相关的帮助资料*/
 findit white noise       /*具有与 search 相似的功能*/
 help net_mnu             /*Stata提供的外部命令链接*/


*-------------------
*->    修改资料
*-------------------
* 目的： 对现有变量进行修正和转换，或产生新的变量
*                  =本节命令=  
* =====================================================
* gen, replace, drop, order, aorder, move, sort, gsort, 
* assert, count, compare, encode, decode, recode, 
* note, notes, notes drop, char, char list
* =====================================================

*----------------
*-1 数学表达式
* 三类：关系运算；逻辑运算；算术运算

* 关系运算符  = =;  >;  <;  >=;  <=;  !=;  ~=
sysuse auto,clear
list price if foreign == 0
sum price  if foreign != 1

逻辑运算符： & (与)  | (或) 
sysuse auto, clear
sum price wei if (foreign==1 & rep78<=3)
sum price wei if (rep78==1) | (rep78==5) | (foreign !=0)
sum price wei if (rep78>2 & rep78<5) | (price>10000)

* 算术运算符：+; -; *; /; ^(幂)
display 5^2
dis     1 - 3*2 + 4/5 - 9^3  


*-----------------------
*-2 变量的创建和修改
* 2.1 创建新变量 generate
generate price2  = price^2
gen price2f = price^2  if foreign == 1
gen wlratio = weight/length 

* 2.2 修改旧变量
replace price = 10000 if price>10000
gen     bad = 0
replace bad = 1 if rep78>3
  list rep78 bad
* 另一种方式
gen bad2 = rep78>3
  list bad*

* 2.3 删除变量和样本值 drop
drop price2          /*删除一个变量*/
drop wlratio-bad2    /*删除一组变量*/

  list price in 1/5
drop in 1/3          /*删除指定区间的观察值*/
  list price in 1/5

drop _all            /*删除内存中的所有变量*/

* 2.4 移动变量窗口中变量的位置 order gorder move
sysuse auto, clear
order price weight length foreign
aorder                        /*按字母对变量排序*/
move displacement weight      /*把 变量1 移动到 变量2 的位置上*/


*----------------
*-3 数学函数
help math functions

sysuse nlsw88.dta, clear
gen ln_wage    = ln(wage)
gen sqrt_hours = sqrt(hours) 
gen int_wage   = int(wage)
gen floor_wage = floor(wage)
gen ceil_wage  = ceil(wage)
list *wage in 1/5


*---------------------------
*-4 样本值的排序 sort gsort 
sort wage 
list wage in 1/10
gsort -wage
list wage in 1/10
gsort wage, gen(numb)
list numb wage in 1/10


*---------------------------------
*-5 检验变量 assert count compare

* 5.1 条件检验
assert  wage>0
assert  wage<0   检验wage<0是否成立，成立不返回任何信息，不成立返回“assert in false”；
assert  wage<20                          同时返回不符合假设的样本（观察值）的个数

assert  age<40
  sum age
assert  hours<10 | hours>70
  list hours if (hours<10 | hours>70)

* 5.2 计数
count if (hours<10 | hours>70)   符合某个条件样本（观察值）的个数
count if race >=2
count if hours == .
   list wage race if hours == .

* 比较变量的大小
sysuse sp500.dta, clear
compare open close             比较变量值的大小


* 5.3 一些简单的假设检验
* t 检验
ttest change = 0           /*单变量t检验*/            结果的比较？？？  Ha理解？？
  display  -.5473282/1.00817
ttest open = 1000
ttest open = close         /*比较两个变量是否想等*/

sysuse auto, clear
ttest price, by(foreign)   /*两组均值比较*/
  dis  -312.2587 / 754.4488

* 方差检验
sysuse sp500, clear
 sdtest open=100       /*公式：chi2=[(n-1)sd^2] / [100^2] */
  dis (248-1)*87.12808^2 / 100^2
 sdtest open = close   /*检验两个变量的方差是否相等*/
                       /*公式：F = s1^2/s2^2*/
sysuse nlsw88, clear
 sdtest wage, by(married)  检验wage在已婚和未婚之间方差是否存在差异
  dis 6.336071^2/ 5.399229^2

* 置信区间
sysuse sp500,clear
ci close
ci open close change, level(90)
 do L1_intro_graph_ci95.do
 do L1_intro_graph_ci90.do  

* 正态分布检验
* sktest
sktest open close change
histogram change, normal    /*尖峰厚尾*/

* swilk -- Shapiro-Wilk test
swilk open close change

* sfrancia -- Shapiro-Francia W' test
sfrancia open close change

          *       =====================
          *         第一讲  STATA简介（3）
          *       =====================
*-6 将连续变量转换为类别变量

* 转换连续变量为等分组的类别变量
sysuse nlsw88.dta, clear
sort wage 
gen  g_wage = group(5)
tab g_wage
tabstat wage, stat(N mean med min max) by(g_wage) f(%4.2f)

* 指定分界点的转换方式
sum age
recode age (min/39 = 1) (39/42 = 2) (42/max = 3), gen(g_age) 
* 1  if  age<=39         右封闭区间
* 2  if  39<age<=42
* 3  if  age>42
list  age g_age  in 1/20

*? 如果希望将 39 岁女员工归入第 2 类，该如何下达命令？
recode age (39/42 = 2) (min/39 = 1) (42/max = 3), gen(g1_age) 

* 利用irecode() 和 recode() 函数进行转换
gen g2_age = irecode(age, 39, 42)  将39以下定义为0；39-42定义为2；42以上定义为2
ttest g_age = g2_age
* 另一个函数
gen g3_age = recode(age, 39, 42) 将39以下定义为39；39-42定义为42；42以上定义为42
list age *_age in 1/10


*-7 虚拟变量的产生

* 基本方式
gen dum_race2 = 0
replace dum_race2 = 1 if race == 2
gen dum_race3 = 0
replace dum_race3 = 1 if race == 3
list race dum_race* in 1/20

* 简洁方式
  * tab 命令
   tab race, gen(dum_r)
   list race dum_r1-dum_r3 in 1/20
  * xi 命令
   xi i.race     /*自动定义虚拟变量的名称*/
   list race _Irace_2 _Irace_3 in 1/20

* 将连续变量转换为虚拟变量
*   结合使用 recode() 和 tab 命令产生虚拟变量
gen g_hours = irecode(hours, 20, 40) 
tab g_hours, gen(dum_h)  
list age dum_h* in 1/20

* 一些外部命令：dummieslab 
  findit dummieslab
dummieslab race
  list race  white black other in 1/10


* 利用条件函数创造虚拟变量
 * cond() 函数
 * cond(s,a,b,c)
   * a  if 表达式 s 为真；
   * b  if 表达式 s 为假；
   * c  if 表达式 s 为缺漏值。
   gen dum_hours  = cond(hours>40, 1, 0, -999)
    list hours dum_hours in 1/20
   gen dum_ratio = cond(wage/hours, 1, 0, -999)
    list wage hours dum_ratio in 1/20
 * inlist() 函数
 * inlist(x, a,b,c,...)
   * 1  if x = a,b,c,...中的任何一个；
   * 0  otherwise。
   label list occlbl
   gen dum_occu = inlist(occupation, 1,2)  
   list occu dum_occu in 1/20
    * 等价于
    gen dum_occu1 = (occ==1|occ==2)

 * inrange() 函数
 * inrange(x, a,b)
   * 1  if  a<= x <= b；
   * 0  otherwise。
   gen dum_h2  = inrange(hours, 30,40)
    * 等价于
    gen dum_h3 = (hours>=30 & hours<=40) 
    list hours dum_h2 dum_h3 in 1/20

 * clip() 函数 
 * clip(x, a,b)
   * a  if x<=a;
   * x  if a<x<b;
   * b  if x>=b
   gen dum_h4 = clip(hours, 30, 40)
   list hours dum_h4 in 1/20



*-------------------
*->  单值(scalar)
*-------------------
gen x = 3
* 存放数值
clear
set obs 100
scalar a = 3
scalar b = ln(3) + (3^4.2)/exp(2)
display a
dis     b
  gen a = 3       /*单值和变量可以重名*/
  list a in 1/20

* 存放字符串 
scalar c = .a
dis c
scalar s1 = "hello, Arlion"
scalar s2 = substr(s1,1,5)
dis s1
dis s2

* display 命令还是一个简单的计算器
dis       ln(3) + (3^4.2)/exp(2)
dis %6.2f ln(3) + (3^4.2)/exp(2)

* 标示出变量的特定观察值
sysuse auto,clear
dis price[3]
 list price in 1/3
sort price 
gen pp = price[74]
 list pp in 1/20

* 执行命令后的单值结果
sum price 
return list
  dis r(N)
scalar range = r(max) - r(min)
  dis range
gen qq = r(sd)
  list qq in 1/10

* Stata返回值的种类：r-class; r-class; s-class

regress price weight length
ereturn list

* 单值的管理 scalar list/dir/drop
scalar dir
scalar list
scalar drop a
scalar list
scalar drop _all
scalar list


*-------------------
*->    log 文件
*-------------------
* 记录你的分析过程
************************记录开始************************
  cd D:\stata9\ado\personal\Net_course\A1_intro
  sysuse auto, clear

  *---------mylog1.log---------------
  log using mylog1.log, text replace
   dis "Part I：统计分析"
   sum price weight length
  log close
  *------------over-------------

   tab rep78
   d, d
 
  *--------mylog2.log----------------
  log using mylog2.log, text replace
   tab rep78 foreign
   d price rep78 foreign, d
  log close
  *------------over------------- 
************************记录结束************************


*-------------------
*->    do 文档
*-------------------
*-> ==说明==
   *- do 文档实际上是Stata命令的集合，方便我们一次性执行多条stata命令;
   *- do 文档的使用使我们的分析工作具有可重复性；
   *- 在一篇文章的实证分析过程中，我们通常将数据的分析工作写在 do 文档中，
   
*-1. 打开do文档编辑器
  doedit
  * 设置属性

*-2. 保存和关闭

*-3. 使用 log 文件
* log   using 文件名.log, 选项
* cmdlg using 文件名.log, 选项
*log    using d:\stata9\ado\personal\stata.log,   text replace
*cmdlog using d:\stata9\ado\personal\command.log, append 

*-4. 合理规划你的do文档
   *= 尽量加入注释语句： *；/**/； //
     sum price weight  /*变量的基本统计量*/
    // 产生一个新的变量
     gen x = 5
   *= 断行 
      *三种方式： “///” 、 “/* */” 、 #delimit 命令
        twoway (scatter price weight) ///
                (lfit price weight),    /*
              */title("散点图和线性拟合图")
      * #delimit 命令
        #delimit ;
          twoway (scatter price wei)
                 (lfit price wei),
                 title("散点图和线性拟合图");
        #delimit cr
   *= 列印文字
     * 将文字置于 " " 或 `" "' 之间
      display "This is a pretty girl!"
      dis     `"This is a "pretty" girl!"'
     * 颜色1：red green yellow white
      dis in green "I have being with Stata for four years"
      dis in w "This " in y "is " in g "a " in red "pretty" in g " girl"
     * 颜色2：as text(绿色)| as result(黄色)| as error(红色)| as input(白色)
      dis as result "Stata is Good !"
     * 列印的位置
     * ------------------------------------------
     *   副命令  |             定义                   
     * ------------------------------------------             
     *   _col(#) | 从第 # 格开始列印
     *   _s(#)   | 跳过 # 格开始列印
     *   _n(#)   | 从第 # 行开始列印
     *   _c      | 下次列印解着列印而无须从起一行
     *   _dup(#) | 重复列印 # 次
     * ------------------------------------------
       display "Stata is good"
       display _col(12) "Stata is good"
       display "Stata is good" _s(8) "I like Stata"
       display _dup(3) "Stata is good！ "
       display "Stata is good","I like it"
       display "Stata is good",,"I like it"
       display _n(3) "Stata is good"
     * 更精美的列印方式
       help smcl  /*我们在第三部分会对此作详细介绍*/

*-5 执行 do 文档
 doedit L1_intro_do.do
 do     L1_intro_do.do

   * 一个实例->
   *   连玉君,钟经樊. 中国上市公司资本结构动态调整机制研究. 南方经济,2007(1):23-38.
       cd D:\stata9\ado\personal\dycs\NFJJ
       doedit dycs_NFJJ_final.do
       do     dycs_NFJJ_final.do


*--------------------
*->  Stata 界面的设定
*--------------------
*-0 窗口和字体的设定
  help winfonts
 * 字体的设定
   * 窗口：    右击 —>选择 Font... —>从下拉菜单中选中字体
   * do编辑器：右击do编辑器 —>选择 Preferences... —>选中字体
 * 颜色设定
   * 右击 —> 选择 Preferences... —>选色
 * 保存设定
   *1. 依次点击：Prefs—>Manage Preferences—>Save Preferences—>New Preference Set.
   *2. 输入一个 preference_name，如 my_pref, pref_font10


*-1 Stata 的系统参数
 * 关于版本
  *about
 * 验证是否正确安装
   verinst
 * 系统参数范围
   help limits
   
 * 一些常用的设定
   clear
   set obs 200      /*设定观察值的个数*/
   set memory 40m 
*------------------------------------------ 
   set more on   /*开启 分屏显示*/
    sysuse auto, clear
    list price
   set more off  /*禁止 分屏显示*/
    list price
*------------------------------------------ 
   clear 
  set memory 40m   /*设定内存的大小*/
  set matsize 3000 /*设定矩阵的最大维度*/
*------------------------------------------  
  set trace on     /*跟踪调试*/
    sysuse auto, clear
    tab foreign
  set trace off
*------------------------------------------ 
  set seed 1357923 /*产生随机数时的种子*/
   matrix a = matuniform(2,2)
   matrix list a
*------------------------------------------
  help set_defaults    /*恢复系统参数的默认值*/
  set_defaults memory  /*仅恢复 memory 项*/ 
  set_defaults _all    /*全部恢复*/

*-2  文件目录
help sysdir
sysdir 
sysdir list
personal 
personal dir

*-3  每次启动时均需执行的命令
* 建立一个 profile.do 文档，存于 D:\stata9\ado\personal 下
* --------begin profile.do------------
* 基本参数设定
  set type double
  set memory 50m
  set matsize 2000
  set more off,perma
* log 文件设定
  log using    D:\stata9\ado\personal\stata.log, text replace
  cmdlog using D:\stata9\ado\personal\command.log, append
* 文件目录设定
  sysdir set PLUS     "D:\stata9\ado\plus"  /*外部命令的存放地址*/
  sysdir set OLDPLACE "D:\ado"
  sysdir set PERSONAL "D:\stata9\ado\personal"
* ado文档查找路径  
  adopath + "D:\stata9\ado\personal"
  adopath + "D:\stata9\ado\personal\_Myado"
* 当前命令执行路径
  cd d:\stata9\ado\personal
* --------end profile.do------------

* 我的 profile.do 文档
doedit D:\stata9\profile.do


          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *          第二讲  数据处理
          *       =====================



*---------------------
*-> 变量转换的更多技巧 
*---------------------
*                  =本节命令=  
* ================================================
*       _n, _N, tsset, egen, display, list
* ================================================
cd D:\stata9\ado\personal\Net_course\L2_data_manage

*-1. 样本数指标和样本序号
 * _n 和 _N
 * _n "样本序号变量"，是一个变量，内容为 1,2,3,...,n
 * _N "样本数指标",   是一个单值，内容为 样本数

sysuse nlsw88.dta, clear
list _n    /*_n 是一个永远存在，但却不能 list 出来的特殊变量*/
* _n 的取值会随样本排序的变化而变化
sort hours
  gen nid_1 = _n
  list nid_1 hours race in  1/10 
sort wage
  gen nid_2 = _n
  list nid_1 nid_2 hours race in 1/10

dis _N
scalar N = _N
quietly  sum wage
 dis r(mean)*N

sysuse sp500.dta, clear
sort open
sum open
dis r(max)
gen o_max   = open[_N]
gen o_diff  = open[_n] - open[_N]
list open o_max o_diff in 1/20

sort date
* 差分
gen d_open = open[_n] - open[_n-1]
* 对数差分
gen dln_open = ln(open[_n]) - ln(open[_n-1])
* 移动平均
gen mv3_open = (open[_n-1] + open[_n] + open[_n+1]) / 3
list open o_max o_diff dln_open mv3_open in 1/10

* 滞后项、前推项、差分
tsset date  /*声明数据为时间序列*/
gen open_lag  = L.open
gen open_lag2 = L2.open
gen open_forward  = F.open
gen open_diff  = D.open
gen open_diff2 = D2.open
list open* in 1/10

reg close L(1/3).(close open)

*-2. egen 命令
  * extended generate 的缩写
help egen

 * 2.1 egen 与 gen 的区别
  gen  sum_close0 = sum(close)
  egen sum_close1 = sum(close)
  list close sum_close0 sum_close1 in 1/10

 * 2.2 产生等差数列: seq() 函数
  egen x1 = seq(), from(-1)
    list x1 in 1/10
  egen year = seq(), from(2000) to(2005)
    list year in 1/20
  egen code = seq(), from(1) block(6)
    list code in 1/20
    list code year in 1/20

 * 2.3 填充数据：fill() 函数
  egen r2 = fill(2 4)  /*间隔 2  的递增数列*/
  egen r3 = fill(6 3)  /*间隔 -3 的递减数列*/
  egen r4 = fill(1990 1991 1992 1990 1991 1992) /*分块重复数列*/
    list r2-r4 in 1/20

 * 2.4 产生组内均值
 sysuse nlsw88.dta, clear
  egen avg_w_r = mean(wage), by(race)
   list wage race avg_w_r in 1/20 
 
* 2.5 跨变量的比较和统计
sysuse sp500.dta, clear
 egen avg_price = rmean(open close)
   list open avg_price close in 1/10
replace open = int(open)
replace close= int(close)
 egen diff = diff(open close)
   sort diff
   list open diff close in 1/10

* 2.6 变量的标准化
 * 定义：x_s = (x - x_m) / x_sd
 * x_s 的均值将为 0； 标准差将为 1
 * 线性转换，并不改变变量间的相对大小
  egen s_change1 = std(change)
  egen s_change2 = std(change), mean(20) std(3)
   sum change s_change*
    cd D:\stata9\ado\personal\Net_course\A2_data_manage
    do A2_egen_std.do

* 2.7 变量的平滑化（Moving Average）
tsset date
 egen mv3_open        = ma(open)
 egen mv5_open        = ma(open), t(5)
 egen mv5_open_nomiss = ma(open), t(5) nomiss
list *open* in 1/10
 dis (1320.28+1283.27+1347.56)/3  /*第一个观察值*/
 dis (1283.27+1347.56+1333.34)/3  /*第二个观察值*/


*-------------------
*-> 重复样本值的处理
*-------------------
cd D:\stata9\ado\personal\Net_course\A2_data_manage
* 类别变量中样本的重复非常普遍，也具有特殊的含义
* 连续变量中的重复样本往往因为资料谬误所致。
*                  =本节命令=  
* ================================================
* isid, duplicates report/examples/list/tag/drop
* ================================================
 *-1 检查重复的样本组合
sysuse nlsw88.dta, clear
* isid 命令 学号和姓名
isid idcode
isid race age

* duplicates list 命令
duplicates list race married in 1/20

* duplicates report 命令
duplicates report race
duplicates report race married
duplicates report race married occupation

* duplicates example 命令
duplicates example race married
tab race married


 *-2 标记重复的样本组合
sysuse nlsw88.dta, clear
*2.1 使用group()函数
egen rm = group(race married)
  tab rm, gen(dum_rm)  /*可以进一步用此变量创造虚拟变量*/
egen rm_lb = group(race married), label
  label list rm_lb
  list rm rm_lb in 1/10
  order race married rm_lb rm
  edit
*2.2 使用 tag() 函数，第一个非重复样本为1，其他为零
egen rm_tag = tag(race married) 
  list rm* in 1/20
*2.3 使用duplicates tag 命令
duplicates tag race married, gen(rm_dtag)  /*重复值的个数*/
  list rm* in 1/20

 *-3 删除重复的样本组合 duplicates drop; contract 
duplicates drop race married, force


*---------------
*-> 缺漏值的处理 
*---------------
 *-1 缺漏值的标记
* 数值型缺漏值
sysuse nlsw88.dta, clear
  list age race industry if industry == .
mvencode _all, mv(-99)
  list age race industry if industry == -99
mvdecode _all, mv(-99)
  list age race industry if industry == .
* 文字型缺漏值
type d201.txt
insheet using d201.txt, clear
 replace x1 = .  if x1== "N/A"  /*错误方式*/
replace  x1 ="." if x1== "N/A"
 encode x1, gen(x11)
 drop x1

 *-2 查找缺漏值  inspect egen(rmiss())
 sysuse nlsw88.dta, clear
egen miss = rmiss(wage industry occupation)
 list wage industry occupation miss if mis!=0 

 *-3 删除/缺漏值
 drop if miss!=0

 *-4 填补缺漏值  impute ipolate hotdeck
     sysuse auto, clear
     gen price2 = price
     replace price2 =. if price2>10000
   * 回归法
      impute price2 weight length foreign turn gear, gen(i_price)
     list price price2 i_price if price2==.
   * 插值法
      ipolate price2 weight, gen(ip_price) epolate 
     list price price2 i_price ip_price if price2==.
    doedit L2_data_gr_ipolate.do  /*图解*/
  * 如果缺漏值的数目较多，并不建议采用插值法，因为无法提供新的信息
  * 插值法比较适用于时间序列


*---------------
*-> 离群值的处理  
*---------------
* histogram winsor hadimvo iqr adjacent fsreg lv
 *-1 离群值的影响
* 例：离群值对回归结果的影响
sysuse auto, clear
histogram price
count if price>13000
gen dum_out = price>13000
reg price weight length foreign
 est store r1
reg price weight length foreign if ~dum_out
 est store r2
esttab r1 r2, mtitle("with" "without")
* 结论：虽然离群值只有4个，但对回归结果的影响却很大

 *-2 查找离群值
*------------------------------------------------
*                    基本概念
* 第25、50、75百分位上的数值分别称为第1、2、3四分位
* 四分位间距(interquartile range): iqr = p75-p25
* 上界(upper adjacent) = p75 + 1.5*iqr
* 下界(lower adjacent) = p25 - 1.5*iqr
*------------------------------------------------
* adjacent 命令
 adjacent price
 adjacent price, by(foreign)
 
* iqr 命令
 help iqr
 iqr price

* 箱形图
help graph box
 graph box price
 graph box price, by(foreign)
 graph box weight, by(foreign)

 *-3 处理方法
*3.1 删除
 adjacent price, by(foreign)
 drop if (price>8814&foreign==0) | (price>9735&foreign==1) 
*3.2 对数转换
sysuse nlsw88, clear

 gen ln_wage   = ln(wage)
 twoway (histogram wage,color(green)) ///
        (histogram ln_wage,color(yellow))
sum wage ln_wage, d
graph box wage
graph box ln_wage
iqr wage
iqr ln_wage
*3.3 缩尾处理
sysuse nlsw88.dta, clear
 histogram wage
winsor wage, gen(wage_w) p(0.02)
 twoway (histogram wage,color(green))     ///
        (histogram wage_w,color(yellow)), ///
        legend(label(1 "wage") label(2 "wage_winsored")) 

                   *           ::第一部分::
          *            Stata 操作
          *       =====================
          *          第二讲  数据处理
          *       =====================

*-------------
*-> 资料的合并 
*-------------
cd D:\stata9\ado\personal\Net_course\A2_data_manage
* merge append jionby
 
 *-1 横向合并：变量的合并 
do L2_data_gr_merge.do 
use merge_m.dta, clear
 browse
 sort date 
 save,replace
use merge_u.dta, clear
 browse
 sort date 
 save,replace
 
merge date using merge_m.dta

 *-2 纵向合并：样本的追加
do L2_data_gr_append.do  
use append_m.dta, clear
 browse
use append_u.dta, clear
 browse
 
use append_m.dta, clear
append using append_u.dta
 browse



*---------------
*-> 重新组合样本
*---------------
 *-1 样本的转置
use d205.dta, clear
list v1-v7
xpose, clear   /*clear选项必须加*/
rename v1 date
rename v2 open
rename v3 close
save d204.dta, replace  /*另存一份数据，因为原始数据已被修改*/

*-----------------
*-> 文字变量的处理
*-----------------
 *-1 以文字类型存储的数字
* 从 .txt 文档中读入数值变量之所以会以文字值方式存储，
* 主要原因是变量中可能包含了如下特殊符号：
* 金额`$'、逗号`,'、斜线`/'、百分比`%'、破折号`-'
type d202.txt
insheet code year	date size leverage gov using d202.txt, clear
save d202.dta, replace
d
sum
* 1.1 destring 命令
destring code, gen(code1) ignore(" ")
destring leverage, gen(lev) percent
destring year date size leverage, replace ignore("-/,%")

* 1.2 decode 命令
encode gov, gen(gov1)
label dir 
label list gov1

 *-2 文字样本值的分解
use d202.dta,clear
list
* 从 year 变量中提取年份
split year, parse(-)
order year year1 year2
list
edit
* destring year1, replace /*另一种方式*/
gen year3 = real(year1) /*year1中全为数值，但以文字型存储*/

* 从 date 变量中提取年份、月度和日期,并转化为数值
split date,parse(/) destring ignore("/") 
order date date*
edit

*-3 处理文字的函数
 help string functions

*3.1 文字函数示例
 dis lower("AbCDef")
 dis length("I Love Stata") 
 dis proper("mR. joHn a. sMitH")

*3.2 应用举例
 type d203.txt
 insheet date sic location using d203.txt, clear
 save d203.dta, replace
 list
 edit

* 从date中分离出年、月、日
  gen year  = int(date/10000)
  
 tostring date, gen(date1)
  gen year1 = substr(date1,1,4)
 gen year2 = real(year1)
 
  gen month = substr(date1,5,2)
 gen month1= real(month)
 
  gen day   = substr(date1,7,2)
 gen day1  = real(day)
 list

* 从行业大类sic中分离出行业门类
 gen sic_men0 = substr(sic,1,2)
 encode sic_men0, gen(sic_men)
 tab sic_men
 label list sic_men

 * 从地点中分离出省份和城市
 use d203.dta,clear
 list
 gen province1 = substr(location, 1,2)
 gen city1     = substr(location, 4,4)
  list location province1 city1
 gen province2 = word(location, 1)
 gen city2     = word(location, 2)
 list location province1 city1 province2 city2

*-----------------
*-> 类别变量的分析
*-----------------
 *-1 分组统计量
*-1.1 单层分组统计量 
* bysort,sum
sysuse nlsw88.dta,clear
bysort race: sum wage
* tabstat 命令
tabstat wage, by(race) stat(mean sd med min max) 
tabstat wage hours ttl_exp, by(race)  ///
  stat(n mean sd med min max) format(%6.2f) c(s) lo
*tabulate 命令
tabulate industry
tabulate industry, sort
tabulate industry, summarize(wage) 

*-1.2 二层次和三层次分组统计量
bysort race married: sum wage
bysort race married: tabstat wage, by(union) s(n mean sd p50 min max)
 tabstat wage, by(race married union) s(n mean sd p50 min max) /*错误方式*/
bysort race married: tab union, sum(wage)

*-1.3 多层次分组统计量
* 基本架构：table var1 var2 var3, by(var4) contents(...)
table race married union, by(collgrad) c(mean wage) format(%4.2f)
table race married union, by(collgrad) c(mean wage freq) format(%4.2f)


 *-2 计算分组统计量的其它方法
*-2.1 egen 命令
 bysort industry: egen wage_ind = mean(wage)
 bysort industry: egen wage_p25 = pctile(wage), p(25)
  list wage indust wage_ind wage_p25 in 1/30

*-2.2 转换原资料为分组统计量：collapse 命令
 sysuse nlsw88.dta,clear
 help collapse
* 几点说明：
* 1. 经常保存do文档，但不要轻易选择保存数据文件
* 2. collapse命令结构：collapse (统计量1) 新变量名=原变量名 (统计量2) ...
* 3. by() 选项是必填选项，不可省略

collapse (mean) wage hours (count) n_w=wage n_h=hours, by(industry)
 browse
 sysuse nlsw88.dta,clear
collapse (mean) wage hours (count) n_w=wage n_h=hours, by(industry race) 
 browse

 *-3 图示分组统计量
*-3.1 柱状图
* 纵向柱状图
sysuse nlsw88.dta, clear
graph bar (mean) wage, over(smsa) over(married) over(collgrad)
  do     L2_data_gr_bar1.do  /*更完整的图示*/
  doedit L2_data_gr_bar1.do
* 横向柱状图
graph hbar (mean) hours, over(union) over(industry)
  *note：over() 选项的顺序决定了分组的层次关系，
graph hbar (mean) hours, over(union) over(industry) asyvars 
graph hbar (mean) hours, over(union) over(married) over(race) percent asyvars
* 多变量柱状图
graph bar wage hours, over(race) over(married)
graph bar wage hours, over(race) over(married) stack
* over() 选项的子选项
graph bar wage hours, stack ///
      over(race, relabel(1 "白人" 2 "黑人" 3 "其他")) ///
      over(married, relabel(1 "单身" 2 "已婚"))       ///
      legend(label(1 "工资水平") label(2 "工作时数")) 


*-3.2 箱形图
* 箱形图能较清晰的呈现各组样本值的分布情况              
graph box wage, over(race)
graph box hours, over(race) over(married)
graph box hours, over(race) over(married) nooutsides


          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================

*------------------------
*        简   介
*------------------------
cd D:\stata9\ado\personal\Net_course\A3_graph

*-1. Stata 图形的种类
/*------------------------
 graph twoway   二维图
   scatter   散点图
   line      折线图
   area      区域图
   lfit      线性拟合图
   qfit      非线性拟合图
   histogram 直方图
   kdensity  密度函数图
   function  函数图
------------------------
 graph matrix   矩阵图
 graph bar      条形图
 graph dot      点图
 graph box      箱形图
 graph pie      饼图
------------------------
 ac    相关系数图
 pac   偏相关系数图
 irf   脉冲相应函数图
------------------------
     ... ...              */ 

*-2. 二维图命令的基本结构
  *-2.1 整体架构 
    *  twoway (单元图定义1) (单元图定义2) ... ， 二维图选项1 二维图选项2 ...
    *  twoway  单元图定义1 || 单元图定义2 ... ， 二维图选项2 二维图选项2 ...
  *-2.2 单元图的定义
    *  (单元图类型 纵轴变量1 纵轴变量2 ... 横轴变量 , 单元图选项1 单元图选项2 ...)
  *-2.3 二维图选项的定义
    *  二维图选项标题 (定义内容 , 子选项 子选项 ...)
  *-2.4 一个标准的实例
   *---------------------------------------------------------------------
    sysuse sp500, clear
    twoway (line high date) (line low date)     ///
           ,   /*逗号后全部为选项*/              ///  
           title("图1：股票最高价与最低价时序图",box margin(medsmall)) ///
           xtitle("交易日期",margin(medsmall))            ///
           ytitle("股票价格")                             ///
           ylabel(900(200)1400) ymtick(##5)               ///
           legend(label(1 "最高价") label(2 "最低价"))     ///
           note("资料来源：Stata公司，SP500.dta")          ///
           caption("特别说明：这是我做的第一幅Stata图形！")
   *---------------------------------------------------------------------

*                      +--------+
*=======================本讲导读========================
*                      +--------+
* 图形无非是点、线(面)、文字等元素的组合
* 这些组合的整体“风格”构成了图类:  单元图（逗号前的部分）
* 每种图形的具体特征由元素的特征决定：选 项（逗号后的部分）
* 因此，选项的填写是Stata绘图的关键！
*=======================================================



*-3. 概览：几种常用图形的简单示例
  * 散点图
    twoway scatter high date
  * 折线图
    twoway line change date
  * 柱状图
    twoway bar open date in 1/50
  * 直方图
    histogram change
  * 密度函数图
    kdensity close, normal
  * 数学函数图
    twoway (function y=sin(x), range(-10 10))  ///
           (function y=cos(x), range(-10 10)), ///
           ytick(-2(0.5)2)  ///
           yline(0,lcolor(black*0.4) lpattern(dash))
 
*-4. 图形的管理
 * 保存
  help graph save
    * 第一种方式
      twoway line high date
       graph save fig1.gph, replace 
    * 第二种方式
      twoway line high date,saving(A3_price.gph, replace)
    * 手动方式：右击 —> Save graph ...—> 填入图形名称，选择保存类型

 * 导出
  help graph export
    twoway line  high low  date
    graph export A3_price.wmf, replace

    *     后缀       附加选项       输出格式
    *    ------------------------------------------------------------
    *     .ps        as(ps)         PostScript
    *     .eps       as(eps)        Encapsulated PostScript
    *     .wmf       as(wmf)        Windows Metafile
    *     .emf       as(emf)        Windows Enhanced Metafile
    *     .pict      as(pict)       Macintosh PICT format
    *     .png       as(png)        PNG (Portable Network Graphics)
    *     .tif       as(tif)        TIFF
    *      other                    must specify as()
    *    ------------------------------------------------------------

 * 调入
  help graph use
    graph use A3_price.gph 
    graph use A3_price.gph, scheme(s1mono)

 * 插入 Word：
 *  右击 —> copy —> 粘贴到Word中

 * 查询
  graph dir

 * 重新显示
  twoway line  high low  date
  graph display, scheme(sj)
  graph save A3_price_sj.gph, replace

 *  合并
  help graph combine
  graph combine A3_price.gph  A3_price_sj.gph

 * 删除
  erase A3_price.gph

 * 显示模式
  * 显示模式种类
    help schemes   /*Stata 提供的显示模式*/
    findit scheme  /*更多的显示模式*/
  * 两种设定方式
  *  set scheme schemename [, permanently]
  *  graph ...  [, ...  scheme(schemename) ...]
  * ----实例-----
    sysuse auto, clear
     twoway scatter price weight, scheme(sj)
     graph save A3_gr1.gph, replace
     graph use  A3_gr1.gph, scheme(s2color)
    set scheme  economist
     twoway scatter price weight
  * 各种显示模式一览
    graph use A3_scheme1.gph 
    doedit A3_scheme1.do




*------------------------
*      二维图选项
*------------------------
help twoway_options

*---------------------------------------
*-1 ===::坐标类::===
  help axis_options

 *-1.1 坐标轴刻度(tick)及刻度标签(label)
    help axis_label_options
    scatter mpg weight, xlabel(#10)
    * 主刻度及标签：ylabel(), xlabel()  /*显示刻度标签时，一定同时显示刻度*/
    * 主刻度：ytick(),  xtick()         /*按设定显示刻度，仅显示主要刻度的标签*/
    * 子刻度及标签：ymlable(), xmlabel()
    * 子刻度：ymtick(), xmtick()
   * 实例
    set scheme s2color
    scatter mpg weight              /*Stata 默认设定，比较宽松*/
    scatter mpg weight, xlabel(#10) /*在横坐标上列示10个最佳的刻度及其标签*/
    scatter mpg weight, xtick(#10)
    scatter mpg weight, ylabel(10(5)45) xlabel(1500 2000 3000 4000 4500 5000)
                                   /*自行设定刻度标签*/
    scatter mpg weight, ymlabel(##5) xmtick(##10) /*子刻度和子刻度标签*/
    scatter mpg weight, xlabel(1500 2500 3190 "中位数" 3500 4500) 
                                   /*刻度标签由`数字'替换为`文字'*/

     * 参数设定规则：
     *   rule     example    description
     *  --------------------------------------------------------------
     *   #?       #4         4 个最佳值
     *   ##?      ##10       10-1=9 个子刻度列印于主刻度之间
     *                         仅适用于 mlabel() 和 mtick() 选项
     *   ?(?)?    10(5)45    在 10 到 45 范围内，每隔 5 列印一个子刻度
     *   none     none       不显示刻度标签
     *  --------------------------------------------------------------
     *   注：#? 和 ##? 比较常用

    * 刻度标签的角度(详见文字选项部分) 
     scatter mpg weight, xlabel(,angle(45)) ylabel(,angle(-15))

 *-1.2 坐标轴标题: ytitle() xtitle()
     help axis_title_options
     scatter mpg weight, ytitle("汽车     里数") xtitle("汽车   重量") 
   * 坐标轴标题的位置
     scatter mpg weight, ytitle("汽车里数",place(top))  ///
                         xtitle("汽车重量",place(right)) 

 *-1.3 坐标结构: yscale() xscale()
    help axis_scale_options
  *-显示范围的控制
   scatter mpg weight,xscale(range(0 5000)) xlabel(0(1000)5000)   
   scatter mpg weight,xscale(range(1000 6000))
   scatter mpg weight,xscale(range(3000 4000))
   scatter mpg weight if (wei>=3000&wei<=4000)  /*局部显示需要用if语句*/
  *-坐标轴标题间距的控制
   label var mpg    "汽车里数"
   label var weight "汽车重量"
   scatter mpg weight       /*默认设置*/               
   scatter mpg weight, xscale(titlegap(2))   /*坐标轴与坐标轴标题间距*/
   scatter mpg weight, xscale(titlegap(2) outergap(-2)) /*坐标轴标题下边距*/
  *-坐标轴的显示
    * 不显示坐标轴
      scatter mpg weight, yscale(noline) xscale(noline)  
    * 不显示坐标轴和刻度标签
      scatter mpg weight, yscale(off) xscale(off)  
    * 无边距
      scatter mpg weight, yscale(off) xscale(off) plotregion(style(none))
  *-坐标轴线型
     scatter mpg weight, xscale(lcolor(red) lwidth(vvthick))

 *-1.4 双坐标系 
  help axis_choice_options 
  * 共用 x 轴
    sysuse sp500, clear
      twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2))
      twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2)), ///
             ylabel(-50(10)40,axis(2) angle(0) labsize(small))
  
  * 单独的 y 轴和 x 轴
      twoway (line close  date, yaxis(1) xaxis(1))  ///
             (line change date, yaxis(2) xaxis(2)), ///
              ylabel(-50(10)40,   axis(2)) ///
              xlabel(15005 15239, axis(2)) ///
              xtitle("", axis(2))
 

*---------------------------------------
*-2 ===::标题类::===

*-2.1 标题的种类:
  * 主标题、副标题、注释、说明
  * title()、subtitle()、note()、caption()
  help title_options
*-2.2 示例
sysuse auto,clear
  scatter mpg weight,   title("Mileage and weight")
    scatter mpg weight, title("Mileage and weight", box)
    scatter mpg weight, title("Mileage and weight", box bexpand)
  scatter mpg weight, title("主标题") subtitle("副标题")
  scatter mpg weight, title("主标题") ///
                      subtitle("副标题") ///
                      note("注释内容")   ///
                      caption("进一步的说明")
  scatter mpg weight, title("汽车里数和重量的" "散点图") ///
                      subtitle("——美国资料实例")
*-2.3 标题的位置
* 说明：本节内容同样适用于其它包含 legend() 选项的类目
  * 默认位置
     *   -----------------------------------
     *   title()                 居中
     *   subtitle()              居中
     *   note()                  左对齐
     *   caption()               左对齐
     *   -----------------------------------
  * 重新定位：position() 的取值 
    *        +---------------------------------------+
    *        |        11         12        1         |
    *        |                                       |
    *        |       +-----------------------+       |
    *        |10     |10 or 11   12   1 or 2 |     2 |
    *        |       |                       |       |
    *        |       |        绘 图 区       |       |
    *        | 9     | 9       ring=0      3 |     3 |
    *        |       |                       |       |
    *        |       |                       |       |
    *        | 8     | 7 or 8     6   4 or 5 |     4 |
    *        |       +-----------------------+       |
    *        |                                       |
    *        |         7         6         5         |
    *        +---------------------------------------+
  * 默认相对间距：ring() 的取值
    * ---------------------------------------------------------
    * plot region        0     | ring(0) = 绘图区内
    * {t|b|l|r}1title()  1     |
    * {t|b|l|r}2title()  2     | ring(k), k>0, 绘图区以外
    * legend()           3     | 
    * note()             4     |
    * caption()          5     | ring() 的值越大，距离绘图区越远
    * subtitle()         6     | 
    * title()            7     | 
    * ---------------------------------------------------------
  * 示例
  scatter mpg weight, title("汽车里数和重量",position(5))
  scatter mpg weight, title("汽车里数和重量",position(3) ring(0)) 
  scatter mpg weight, title("汽车里数和重量",position(3) ring(12))   


*---------------------------------------
*-3 ===::区域类::===
  help region_options
  sysuse auto,clear

 *-3.1 Stata图形的区域划分
    cd D:\stata9\ado\personal\Net_course\A3_graph
    do A3_region.do
 *-3.2 控制内区和外区的边距
    twoway function y=x
    twoway function y=x, plotregion(fcolor(green*0.8)) ///
                         plotregion(ifcolor(white))
    twoway function y=x, plotregion(margin(0)) 
    twoway function y=x, graphregion(margin(0))   
    twoway function y=x, plotregion(margin(l-15 r+5 t=10 b+4))  
                                        /*四个边距可以分别控制*/
 *-3.3 控制图形的纵横比例
    twoway function y=x  /*如何得到正方形的图形？*/
    twoway function y=x, ysize(5) xsize(5)
 *-3.4 绘图区的显示模式
    twoway function y=x, plotregion(style(none))    
    twoway function y=x, plotregion(style(ci2))
 *-3.5 绘图区和全图区背景颜色的控制
    scatter mpg weight, graphregion(fcolor(green*0.8)) ///
                        graphregion(ifcolor(yellow))   ///
                        plotregion(fcolor(black*0.3))  ///  
                        plotregion(ifcolor(white))     ///
                        title("Stata图形分成四个区域")

*---------------------------------------
*-4 ===::图例类::===
  help legend_options

 *-4.1 自动产生的图例
  * 一张图中同时呈现多个序列，便会自动产生图例
  * 对于变量而言，其默认图例是它的变量标签
  sysuse sp500, clear
    twoway (line high date) (line low date) /*那么，如何加入中文图例？*/
  sysuse auto, clear
    twoway (scatter price weight if foreign==1) ///
             (lfit price weight if foreign==1)  ///
           (scatter price weight if foreign==0) ///
             (lfit price weight if foreign==0)     /*此时，图例显得过于繁琐*/

 *-4.2 从新定制图例
  * a. 基本方式
    sysuse sp500, clear
   * 第一种方式：预先定义变量标签
     label var high 最高股价
     label var low  最低股价
     twoway (line high date) (line low date)
   * 第二种方式：每个图单独加图例
     twoway (line high date,legend(label (1 "最高价"))) ///
            (line low date, legend(label (2 "最低价")))
   * 第三种方式：整体加图例
     twoway line high date || line low date, ///
         legend(label(1 "最高价") label(2 "最低价"))
   * 不显示图例 legend(off)
     twoway (line high date) (line low date),legend(off)

 *-4.3 图例的位置
  * legend 的默认位置是 ring(3)
  * 绘图区`外'的时钟点上
    twoway line high date || line low date, legend(position(12))  
  * 绘图区`内'的时钟点上
    twoway line high date || line low date, legend(ring(0)) 
    twoway line high date || line low date, legend(position(12) ring(0)) 
  * 改变legend()的相对位置
    * note()   的默认位置是 ring(4)
    * caption()的默认位置是 ring(5)
     twoway line high date || line low date,note("addad") caption(资料来源：Stata 公司)
     twoway line high date || line low date,   ///
         caption(资料来源：Stata 公司, ring(3)) ///
         legend(ring(5))    

 *-4.4 多个图例的重排
   sysuse uslifeexp.dta, clear
   line  le le_w le_b  year
   line  le le_w le_b  year, legend(rows(1) size(small))
   line  le le_w le_b  year, legend(cols(1) size(small))


*---------------------------------------
*-5 ===::附加线类::===
  help added_line_options
  * 本节中介绍的附加线属性适用于所有与线相关的对象

 *-5.1 选项结构
  * twoway ..., yline(数字, 子选项)
  * twoway ..., xline(数字, 子选项)
    *-数 字： 控制附加线的位置
    *-子选项：控制附加线的类型、颜色、宽度等
 *-5.2 附加线 位置
  sysuse sp500, clear
  line open date, yline(1100)
  line open date, yline(1100 1313) xline(15242)
 *-5.3 附加线 风格
  * defult      决定于显示模式(set scheme)
  * extended      延伸到绘图外区
  * unextended  不延伸到绘图外区
  line open date, yline(1100,style(unextended))
 *-5.4 附加线 线宽
  help linewidthstyle
  line open date, yline(1100,lwidth(thick))  /*采用代号设定*/
  line open date, yline(1100,lwidth(*0.5))     /*设定相对宽度*/
 *-5.4 附加线 颜色
  graph query colorstyle
  line open date, yline(1100,lcolor(blue))  
  line open date, yline(1100,lcolor(black*0.3))   
 *-5.5 附加线 线型
  help linepatternstyle
  palette linepalette 
  line open date, yline(1100,lpattern(dash) lcolor(black*0.3))  
  line open date, yline(1100,lpattern(dot))  
 *-5.5 附加线属性的独立性
  line open date, yline(1100,lp(shortdash_dot) lc(blue*0.6))  ///
                  yline(1313,lw(*2.5) lc(green*0.4))          ///
                  xline(15242,lw(*2) lc(pink*0.4) lp(longdash))

*---------------------------------------
*-6 ===::文字与文本框::===
  help textbox_options
    help textstyle
  help textboxstyle
  * 指点迷津：word 中的文本框
  * 凡是出现文字的地方都可以做下面的设定

 *-6.1 选项类别
   * 文字和文本框的整体风格：  标题、副标题、文本、小号
   * 文本框相关设定：文本框颜色、背景、与文字的边距等
   * 文字相关的设定：大小、颜色、位置、行距

 *-6.2 文字和文本框的整体风格
   * 文字的风格: 文字的标准化大小
     help textstyle
   * 文本框的风格
     help textboxstyle
     line open date, title("SP500 开盘价",tstyle(subheading))
   * 文字与文本框的区别：
   *  文字：  单行，无边框
   *  文本框：单行或多行，可加边框，是文字的更一般化定义

 *-6.3 文本框属性
  * 显示文本框
    line open date, title("SP500 开盘价", box)
  * 文本框的相对大小
    line open date, title("SP500 开盘价", box width(60) height(15)) 
  * 文本框的背景和边框的颜色
    line open date, title("SP500 开盘价", box fcolor(blue*0.2))   /*仅背景*/
    line open date, title("SP500 开盘价", box bcolor(yellow*0.4)) /*背景和边框*/
    line open date, title("SP500 开盘价", box fc(blue*0.2) lc(red))
  * 边框的粗细、线型
    line open date, title("SP500 开盘价", box fc(yellow*0.2) lc(green) ///
                            lwidth(*2.5) lpattern(dash)) 
  * 文字与边框的相对位置
    line open date, title("SP500 开盘价", box width(60) height(15) ///
                     alignment(middle))    /*纵向定位*/
    line open date, title("SP500 开盘价", box width(60) height(15) ///
                     justification(right)) /*横向定位*/ 

 *-6.4 文字属性  
  * 文字位置
    help compassdirstyle
     * 控制标题等位置: place()
       line open date, xtitle("交易日期", place(right)) ///
                       ytitle("开盘价格", place(top))
     * 在图形中的特定坐标点添加文字
      line open date, text(1324.83 15117 "一个波峰") 
  * 文字的角度
    help anglestyle
    line open date
    line open date, xlabel(,angle(45)) ylabel(,angle(0))
    line open date, xlabel(,angle(45)) ylabel(,angle(15)) ymlabel(##4,angle(15))
  * 文字大小
    help textsizestyle
     line open date, text(1324.83 15117 "一个波峰",size(huge)) /*绝对大小*/
     line open date, text(1324.83 15117 "一个波峰",size(*0.6)) /*相对大小*/    
  * 文字颜色
    help colorstyle
     line open date, text(1324.83 15117 "一个波峰",color(blue))
     line open date, text(1324.83 15117 "一个波峰",color(black*0.4))
  * 文字行距
     line open date, note("SP500指数的时序图""(在此期间，股市两次大跌！)",color(blue))
     line open date, note("SP500指数的时序图""(在此期间，股市两次大跌！)", ///
                           linegap(2.5) color(blue))

*---------------------------------------
*-7 ===::图标类::===
  help markerlabelstyle
  help marker_options
  help marker_label_options

 *-7.1 简介
   * 命令结构：  twoway (单元图) , mlabel(文字变量) 其他选项
      sysuse lifeexp, clear
       do A3_mlabel.do
       list lexp gnppc country2 if region==2
     scatter lexp gnppc if region==2, mlabel(country2)

 *-7.2 图标的位置
   * 整体设定
    scatter lexp gnppc if region==2, mlabel(country2) mlabposition(9)
    scatter lexp gnppc if region==2, mlabel(country2) mlabp(3) 
               help clockposstyle
             *         11  12  1
             *       10         2
             *        9    0    3
             *        8         4
             *          7  6  5  
   * 个别设定
    gen pos = 3
    replace pos = 4  if country2=="美国"
    replace pos = 1  if country2=="宏都拉斯"
    scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos)
    scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                    xscale(range(-2000 33000))
                                    
 *-7.3 图标的大小
   * 标准化大小
    help textstyle
    scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                    mlabtextstyle(heading)
   * 任意大小
    help textsizestyle
    scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                     mlabsize(vsmall)   
    scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                     mlabsize(*0.7)  /*推荐采用此法！*/
 *-7.4 图标的角度 
   * 可以是任意数值
   * 0 水平  90 竖直 
   help anglestyle
   scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                    mlabangle(15)
   scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
               xscale(r(35000) log) mlabangle(-15)  
 *-7.5 图标的颜色
   help colorstyle
   scatter lexp gnppc if region==2, mlabel(country2) mlabvp(pos) ///
                                    mlabcolor(green)



*---------------------------------------
*-8 ===::其它选项::===

* 分组绘图
  help by_option
   sysuse auto, clear
   scatter mpg weight, by(foreign)
   scatter mpg weight, by(foreign, total)
   scatter mpg weight, by(foreign, total rows(1))
   scatter mpg weight, by(foreign, total holes(3) style(compact))

* 重新设置变量标签
  help advanced_options
   sysuse sp500, clear
   twoway line close date, yvarlabel("收盘价") xvarlabel("交易日期")
   twoway line high low date,               ///
                    yvarl("最高价" "最低价") ///
                    xvarl("交易日期")
  * 说明：比 legend() 命令要简洁

* 重新设置变量显示格式
  help advanced_options 
   twoway line high date, xvarformat(%tdY-n-d) yvarformat(%6.2f) 

* 重设图形种类
  twoway line change date, recast(area)
    twoway area change date
  twoway (line change date if change>0, recast(spike)) ///
         (line change date if change<0, recast(area))
  twoway (line change date, recast(area) color(blue)) ///
         (line change date if abs(change)<15, recast(area) color(red)), ///
         legend(label(1 "|change|>=15") label(2 "|change|<15"))
         
  twoway function y=normalden(x), range(-4 4) 
  twoway function y=normalden(x), range(-4 4) recast(spike)
  twoway (function y=normalden(x), range(-4 4)) ///
     (function y=normalden(x), range(-4 -1.96) recast(area) color(black*0.4))  ///
     (function y=normalden(x), range(1.96   4) recast(area) color(black*0.4)), ///
     legend(off)
         
*------------------------
*       元素代号
*------------------------

*--------------
*-1 颜色代号
  help colorstyle
  graph query colorstyle
  * 显示特定的颜色
    palette color  blue brown
    palette color  olive dkorange
  * 调制自己喜欢的颜色
  *    代码格式                  调色方式
  * ------------------------------------------------------------
  *   # # #        RGB value; white = "255 255 255"
  *   # # # #      CMYK value; yellow = "0 0 255 0"
  *   color*#      color with adjusted intensity; yellow*1.2
  *   *#           default color with adjusted intensity
  * ------------------------------------------------------------

*------------------
*-2 线 相关的代号
 *-2.1 线型代号
   help linepatternstyle
   palette linepalette           /*图示*/
   graph query linepatternstyle  /*列示代码*/
  twoway function y=normalden(x), range(-4 4) lpattern(longdash)
 *-2.2 线宽代号
   help linewidthstyle
   graph query linewidthstyle
  twoway function y=normalden(x), range(-4 4) lwidth(vthick)
 *-2.3 连接方式代号
   help connectstyle
   graph query connectstyle
  twoway function y=normalden(x), range(-4 4) n(50) connect(stepstair)

*--------------
*-3 符号的代号
  help symbolstyle
  palette symbolpalette   
   * 符号样式
   sysuse auto, clear
   twoway (scatter price weight if foreign,  msymbol(T))  ///
          (scatter price weight if !foreign, msymbol(dh)),  ///
          legend(label(1 "国产") label(2 "进口"))
   * 另一种语法格式
    sysuse sp500, clear
    twoway scatter high low date, msymbol(oh dh)
   * 符号的边界和填充
   * mlcolor()：边界颜色； mfcolor(): 填充颜色
    sysuse auto, clear
    scatter mpg weight, msymbol(O) mlcolor(green) mfcolor(yellow*0.5)

*-------------------
*-4 文字相关的代号
 *-4.1 文字大小代号
   help textsizestyle
 *-4.2 文字角度代号
   help anglestyle
 *-4.3 文字对齐方式的代号
   help justificationstyle  /*左右对齐方式*/
   help alignmentstyle      /*上下对齐方式*/

*-------------------
*-5 边距大小的代号
   help marginstyle

*---------------------关于代号的一个说明-------------------------
*  多数情况下，Stata都支持相对数值，为我们提供了一种便捷的设定方式
*  如, text("文字",size(*0.5) color(green*0.3))
*      xline(30, lwidth(*1.5))
*---------------------------------------------------------------


          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================

*------------------------
*     常用图形示例
*------------------------

*-0 帮助文件的使用
* 各类图形的选项分为两类：`专属选项' 和 `公共选项'
* 公共选项可以参考上面的说明进行填写
* 专属选项通常较少，也容易填写

  help twoway bar
  help twoway lfit
  help twoway scatter

*--------------
*-1 散点图
  help twoway scatter
  
     sysuse uslifeexp2, clear
     #delimit ;
        scatter le year,
                title("图1: 散点图示例")
                subtitle("预期寿命, 美国")
                yvarlabel(预期寿命)
                xvarlabel(年份)
                note("1")
                caption("数据来源:  美国国家重要统计资料报告,
                         第5卷-第6期")
                scheme(economist);
      #delimit cr

*--------------
*-2 折线图
  help line  
  
  * 注意：需要对 x 变量排序
     sysuse auto, clear
     line mpg weight
     line mpg weight, sort
     
  * 一个较复杂的例子   
     doedit A3_line.do  
     
     
*--------------
*- 区域图
   help twoway area
 * 事实上是折线图的变形，无非是在折线下方的区域内涂上颜色而已！
 
   sysuse gnp96, clear
   twoway line d.gnp96 date, yline(0,lc(black*0.4) lp(dash))
   twoway area d.gnp96 date
   
  * 一个相对完整的示例
    #delimit ;
     twoway area d.gnp96 date, 
                 xlabel(36(8)164, angle(45))
                 ylabel(-100(50)200, angle(0))
                 ytitle("Billions of 1996 Dollars")
                 xtitle("")
                 subtitle("Change in U.S. GNP", position(11))
                 note("Source: U.S. Department of Commerce,
                       Bureau of Economic Analysis") ;
    #delimit cr
        
*------------
* 钉形图
   help twoway spike   /*简单钉形图*/
   help twoway rspike  /*区域钉形图*/
 * 多用于股票数据
  
    sysuse sp500, clear
    twoway spike high date
    twoway rspike high low date
    twoway (rspike hi low date) (line close date) in 1/57
               
  * 一个完整示例      
    replace volume = volume/1000
    #delimit ;
        twoway (rspike hi low date)
               (line   close  date)
               (bar    volume date, barw(.25) yaxis(2))
                in 1/57
          , yscale(axis(1) r(900 1400))
            yscale(axis(2) r(  9   45))
            ylabel(, axis(2) grid)
            ytitle("股价 -- 最高, 最低, 收盘",place(top))
            ytitle("交易量 (百万股)", axis(2) bexpand just(left))
            xtitle(" ")
            legend(off)
            subtitle("S&P 500", margin(b+2.5))
            note("数据来源: 雅虎财经！");
    #delimit cr


*-----------------------------------
*- 直方图和密度函数图 (参见第一讲) 
  help histogram
      sysuse nlsw88, clear
      histogram wage
      histogram wage, normal kdensity
  help kdensity
      kdensity wage, normal
    
    * 附加标签  
    sysuse auto, clear
      histogram price, percent addlabels gap(15)

    * 分组绘制直方图
      histogram mpg, percent discrete                ///
          by(foreign, col(1) note(分组指标：汽车产地) ///
                      title("图3：不同产地汽车里数")  ///
                      subtitle("直方图")             ///
             )                                      ///
          ytitle(百分比) xtitle(汽车里数) 
    
    * 一个较复杂的例子     
       doedit A3_histogram.do
       
*--------------------------
*- 线性/非线性 拟合图
 help twoway lfit
 help twoway qfit
 
 *-.1 简单示例
  sysuse auto, clear
  scatter mpg weight || lfit mpg weight
  scatter mpg weight || lfit mpg weight ||, by(foreign, total row(1))
 *-.2 附加置信区间
  help twoway lfitci
  help twoway qfitci
  twoway (lfitci mpg wei, stdf) (scatter mpg wei)  /*线性拟合的置信区间*/
  twoway (scatter mpg wei) (lfitci mpg wei, stdf)  /*图层的概念*/
  twoway (qfitci mpg wei, stdf) (scatter mpg wei)  /*非线性拟合*/
  twoway (qfitci mpg wei, stdf level(99) color(yellow))  ///
         (qfitci mpg wei, stdf level(90))  ///
         (scatter mpg wei)                         /*置信水准*/

*---------------------------------
*- 矩阵图: 显示变量间的相关性
  help graph matrix
  
  sysuse auto, clear
  graph matrix mpg weight length
  graph matrix mpg weight length,  ///
         diag("mpg(汽车里数)" . "weight (汽车长度)")
  
  * 整体缩放
    graph matrix mpg weight length, scale(1.5)
    graph matrix mpg weight length, scale(0.8)
  
  * 图标
     sysuse citytemp, clear
     graph matrix heatdd-tempjuly
     gr mat       heatdd-tempjuly, msymbol(point)
     help symbolstyle
     
  * 半边显示
     gr mat heatdd-tempjuly, ms(p) half
     
  * 坐标刻度和标签
     gr mat heatdd-tempjuly, ms(p) maxes(ylab(#4) xlab(#4))

  * 附加网格线
     gr mat heatdd-tempjuly, ms(p) maxes(ylab(#4, grid) xlab(#4, grid))


*--------------
*- 柱状图 (参见第二讲)
  help graph bar
 * 命令格式1：
 *   graph bar yvars ... 
 * 命令格式2：
 *   graph bar (mean) varlist, over(g1) over(g2)... [other options]
  
  * 柱状图的原始含义: graph bar yvars ...  
    sysuse nlsw88, clear
     collapse wage, by(race)
     xpose,clear
     rename v1 white 
     rename v2 black
     rename v3 other
    graph bar white black other
  
  * 组变量的设定
    sysuse nlsw88, clear
    graph bar (mean) wage, over(race) scheme(s1mono) 
 
    graph bar (mean) wage, over(smsa) over(married) over(collgrad) 

    #delimit ;
     graph bar (mean) wage, over(smsa) over(married) over(collgrad)
               title("Average Hourly Wage, 1988, Women Aged 34-46")
               subtitle("by College Graduation, Marital Status,
                          and SMSA residence")
                note("Source:  1988 data from NLS, U.S. Dept. of Labor,
                      Bureau of Labor Statistics");
     #delimit cr

  * 柱体的样式
    help barlook_options
    graph bar (mean) wage hours, over(race) over(married) ///
                     scheme(s1mono)      ///
                     bar(1, bstyle(p1))  ///
                     bar(2, bstyle(p6))
           
  * 柱体的标签
    help blabel_option
    graph bar (mean) wage, over(race) over(married) ///
           blabel(bar, position(outside) format(%3.1f) color(green))
    graph hbar (mean) wage, over(industry) over(married) ///
           blabel(bar, position(outside) format(%3.1f) ///
                       color(blue) size(vsmall))
  
   * 累加柱体
     sysuse educ99gdp, clear
     generate total = private + public
     graph hbar (mean) public private, over(country)
     graph hbar (mean) public private, over(country) stack 
     
     * 完整示例
     #delimit ;
       graph hbar (asis) public private, stack 
          over(country, sort(total) descending)
          blabel(bar, posi(center) color(white) format(%3.1f))
          title( "Spending on tertiary education as % of GDP, 1999",
                  span pos(11))
          subtitle(" ")
          note("Source:  OECD, Education at a Glance 2002", span) ;
     #delimit cr
     
   * 图形的比例
     sysuse nlsw88, clear
      graph hbar wage, over(ind, sort(1)) over(collgrad)
      graph hbar wage, over(ind, sort(1)) over(collgrad) ///
                       ysize(6)

*-----------
*- 点 图
   help graph dot  
 * 事实上是柱状图的另一种表示方法，比较适合中文投稿，省墨！

  sysuse nlsw88, clear
  graph dot wage, over(occ) by(collgrad)
  graph dot wage, over(occ,sort(1)) by(collgrad)
  * 一个相对完整的示例
  #delimit ;
   graph dot wage, over(occ, sort(1))
          by(collgrad,
             title("Average hourly wage, 1988, women aged 34-46", span)
             subtitle(" ")
             note("Source:  1988 data from NLS, U.S. Dept. of Labor,
                   Bureau of Labor Statistics", span)
            );
   #delimit cr

*------------
*- 函数图
   help twoway function
   
   twoway function y=normalden(x), range(-4 4) n(15) 
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96)
     twoway function y=normalden(x), range(-4 4) xline(-1.96 1.96)
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96) horizon

   twoway function y=exp(-x/6)*sin(x), range(0 12.57) ///
           xlabel(0 3.14 "pi" 6.28 "2 pi" 9.42 "3 pi" 12.57 "4 pi") ///
           yline(0, lstyle(foreground)) dropline(1.48)         ///
           plotregion(style(none)) ///
           xsca(noline)


*--------------
 * 合图示例 graph combine
   do A3_eg1.do
   doedit A3_eg1.do
 * 函数图示例
   do A3_function_ci90.do
   doedit A3_function_ci90.do


*------------------------
*- 箱形图 (详见第二讲)



*------------------------
*- 其他图形：

*    学会帮助画天下！




*-----------------------------OVER------------------------------------------

/* 备用资料
  scatter price wei, ///
      xlabel(2000 3000 "绘图外区" 4000 "绘图外区" 5000) ///
      ylabel(0 7500 "绘图外区" 15000) ///
      title("title    全 图 内 区""(inner graph region)",box bex color(blue) size(*1.0) bmargin(medsmall) margin(medsmall) fcolor(yellow*0.3)) ///
      ytitle("ytitle  全 图 内 区""(inner graph region)",box bex color(blue) size(*1.2) bmargin(medsmall) margin(medsmall) fcolor(yellow*0.3))  ///
      xtitle("xtitle, note, caption  全 图 内 区""(inner graph region)",box bex color(blue) size(*1.2) bmargin(medsmall) margin(medsmall) fcolor(yellow*0.3))  ///
      text(9000 3400 "绘图内区""(inner plot region)", box color(blue) fcolor(orange*0.2) size(*2.5) linegap(*3.5) margin(medsmall)) 

* 一个圆圈，尚未搞定
    twoway (function y=sqrt(1-x^2),  plotregion(margin(0))  range(-1.5 1.5) lc(blue) ) ///
           (function y=-sqrt(1-x^2), range(-1.5 1.5) lc(blue)) , ///
           ysize(2) xsize(2) ylabel(-1.5 1.5) xlabel(-1.5 1.5) ///
            yline(0)

*/

           *           ::第一部分::
          *            Stata 操作
          *       =====================
          *          第四讲  矩阵操作
          *       =====================

*---------------------
*-1    矩阵的定义
*---------------------
*                          本节命令
*--------------------------------------------------------------
* matrix, matrix dir, matrix list, matrix rename, matrix drop
* matmissing(), rowsof(), colsof(), matuniform(), diag(), 
*--------------------------------------------------------------

*-1.1  基本定义方式
sysuse auto, clear
keep in 1/10 
keep price mpg weight length
list

* 规则：逗号分列  反斜线分行
matrix a = (1,2,3 \ 4,5,6)
 mat list a
matrix b = (-1.3, 2.6 \ 3.89, 0.42 \ 50.1, -0.634)
 mat list b
matrix c = (-10 \ -5 \ -8 \ 3 \ 5.6 \ 9)
 mat list c
matrix d = (-10,-5,-8,5.6,9)
 mat list d
matrix e = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
 mat list e


*1.2  矩阵的管理 

* 矩阵的名称
  * 可以和内存中的变量同名
  mat price  = (2,3)
  * 不可以和单值重名，虽然不会提示错误信息，但会自动覆盖
  * 在数学运算中，如果表达式中出现一个既是变量名称又是矩阵名称的名称，
  *   stata会将其解释为变量名称。
    clear 
    set obs 100
    gen x = 5
    mat x = J(3,3,2) 
    sum x

* 列示矩阵
  mat list a 
  mat list b               /*元素的默认显示格式为：%10.0g*/
  mat list b, format(%3.1f)
  mat list e 
  mat list e, nohalf
  mat list e, nohalf nonames 
  mat list e, nonames title("一个5*5的对称矩阵")

* 查找矩阵
  mat dir

* 矩阵的行数和列数
  display colsof(d)
  display rowsof(c)
  scalar ra = rowsof(a)
  scalar ca = colsof(a)
  dis in g "矩阵 a 的行数是: " in y ra 
  dis in g "矩阵 a 的列数是: " in y ca

* 矩阵更名 
  mat dir
  matrix rename a  MM
  mat dir

* 删除矩阵 
  mat drop MM
 *mat drop _all

* 查验矩阵中是否存在缺漏值
  mat list e
  display matmissing(e)
  mat e[2,3] = .
  mat list e
  display matmissing(e)

*-1.3 选取部分矩阵

* 选取1个元素: 1*1矩阵
matrix a = (1,2,3 \ 4,5,6)
 mat list a
mat a1 = a[1,1]
 mat list a1
mat a4 = a[2,1]
 mat list a4

* 选取子矩阵
 mat list e,nohalf
mat ec3 = e[1..3,3]
 mat list ec3
mat e3c = e[....,3]
 mat list e3c
mat e34 = e[3...,4...]
 mat list e
 mat list e34

* 更一般化的矩阵定义
mat a1 = (1, 2, 3 \ 42, 50, 63)
mat a2 = (-3,-5,-7 \ -9 , -11, -13)
 mat list a1
 mat list a2 
mat aa  = [a1, a2]
 mat list aa
mat aaa = [a1 \ a2]
 mat list aaa
* 矩阵中的每一个元素都可以视为一个1*1维矩阵，
* 所以矩阵的操作可以分块进行

* 修改部分矩阵的定义
 matrix a = (1,2,3 \ 4,5,6)
 mat list a
mat a[1,2] = -10
 mat list a
mat a[2,2] = (-9, 20)
 mat list a

*-1.4 一些常用矩阵

* 单位矩阵
mat I = I(5)
 mat list I

* 具有相同元素的矩阵
mat r1 = J(5,5,1)
mat r2 = J(2,6,-3)
 mat list r1
 mat list r2
 * -----------------
 * 一个实例：差分矩阵
  * 构造
   local T = 5
   mat B = J(`T'-1,`T',0)
   mat B[1,1] = -1*I(`T'-1)
   mat B1 = B
   mat B = J(`T'-1,`T',0)
   mat B[1,2] = I(`T'-1)
   mat B2 = B
   mat B = B1 + B2
    mat list B1
    mat list B2
    mat list B
  * 应用
   mat cc = J(5,5,1) + 2*I(5)
   mat rownames cc = 1998 1999 2000 2001 2002 /*定义矩阵的行名*/
    mat list B, nonames
    mat list cc, nohalf   
   mat dd = B*cc
   mat list dd
   mat rownames dd = 1999 2000 2001 2002 

    mat list dd
 * -----------------

* 元素为随机数的矩阵
mat r3 = matuniform(10,4)
 mat list r3

* 对角矩阵
mat u = J(5,1,-0.5)
 mat list u
mat du = diag(u)
 mat list du
mat v = diag(matuniform(5,1)) /*一个任意的5*5对角矩阵*/
 mat list v

*---------------------
*-2    矩阵的运算
*---------------------
*                          本节命令
*-------------------------------------------------------
* hadamard(), inv(), issym(), det(), trace(), vecdiag()
* diag0cnt(), + - * / #
*-------------------------------------------------------
 
* 2.1 加(+)、减(-)、乘(*)、直乘(#)、哈式乘法
matrix e   = J(5,5,3)
matrix I5  = 5*I(5)
 mat list e, nohalf 
 mat list I5

* 加法
mat add = e + I5
 mat list e, nohalf
 mat list add, nohalf
 
mat add1 = e + 2         /*错误方式*/
mat add1 = e + J(5,5,2)
mat list add1

* 减法
mat sub = e - I5
 mat list e
 mat list sub, nohalf

* 乘法
mat prod= e*I5
 mat list prod

* 直乘
*--eg1----------------
 mat one = J(4,1,1)
 mat I1  = I(5)
mat kro = I1 # one
 mat list one
 mat list I1
 mat list kro
*--eg2----------------
mat xx = J(3,3,-1)
mat kro2 = I1 # xx
 mat list xx, nonames nohalf
 mat list I1, nonames nohalf
 mat list kro2, nohalf
*--eg3----------------
mat kro3 = a # xx
 mat list a
 mat list xx, nohalf
 mat list kro3

* 哈式乘法
* (Hadamard)：两个维度相同的矩阵对应元素相乘
 mat a = (1,2  \ 3,4 \ 5, 6)
 mat b = (-1,4 \ 0,1 \ -3,12)
mat aHb = hadamard(a,b)
 mat m = J(3,1,.) 
 mat R = (a, m, b, m, aHb)
 mat list R

* 2.2 矩阵的转置: 行列互换
 matrix A = (-1, 2 \ 3, 4 )
 matrix B = ( 4, 1, 2, 5 )
 mat    C = (4,1 \ 2, 5)
 mat list A
mat At = A'
 mat list At 
 mat list B
mat Bt = B'
 mat list Bt
* ----------------------------
* 公式：(A*C)' = C'*A' != A'*C'
mat ACt  = (A*C)'
mat AtCt = A'*C'  
mat CtAt = C'*A'  /*转置运算优先于乘法运算*/
mat list ACt
mat list CtAt
mat list AtCt

* 2.3 矩阵的逆矩阵
 * 矩阵的横列式：描述矩阵特征的一个统计量
  matrix A = (-1, 2 \ 3, 4)
  scalar detA = det(A)
  dis detA
  dis -1*4 - 3*2
  *= 性质：
  * (1) 若A不可逆，则 |A|=0, 反之亦然
  * (2) |A'|  = |A|
  * (3) |A*B| = |A|*|B|
  * (4) |5*A| = 5^n*|A| 
  * (5) |A 0| __ 
  *     |0 B| -- |A|*|B|
 * 取逆
 dis issym(A)         /*判断一个矩阵是否为对称矩阵*/
  mat invA = inv(A)
  mat IA   = A*invA
   mat list A
   mat list invA
   mat list IA

* 2.4 向量化
 * 向量化矩阵
 * 类似于变量操作中 stack 命令
  mat vA = vec(A)
   mat list A
   mat list vA 
 * 向量化方阵的对角元素
   mat E = e + 0.9*I(5)
  mat dA = vecdiag(A)
  mat dE = vecdiag(E)
   mat list A
   mat list dA
   mat list E
   mat list dE

* 2.5 矩阵的对角值(trace)
 * 定义：方阵的对角元素之和
 * 性质：
 * (1) tr(AB) = tr(BA)  /*A,B可乘*/
 * (2) tr(cA) = c*tr(A) /*c 是单值*/
 mat Atr = trace(A)
 scalar Etr = trace(e)
  mat list A
  mat list Atr
  mat list e
  dis Etr 

* 2.6 矩阵与单值的运算
 scalar c = 5
 mat D = J(4,4,1)
 mat Dc = D*c
 mat cD = c*D
  mat list D
  mat list Dc
  mat list cD
 mat D_c = D/c
  mat list D_c

*---------------------
*-3    矩阵的分解
*---------------------
*                          本节命令
*-------------------------------------------------------
* rank(), mat symeigen, mat eigenvalues, cholesky()
*-------------------------------------------------------

* 3.1 线性相关、线性独立和正交向量
 * 线性相关和独立
   * 矩阵 A = [A1, A2, ..., An]
   * 对于 c1*A1 + c2*A2 + ... + cn*An = 0 (ci为常数)
   * 若存在一组系数 c1,c2,...,cn 使得上式成立，则称 A1,A2,...,An线性相关；
   * 反之，称其线性独立。
 * 正交向量
   * 若 Ai'*Aj = 0,(i!=j),则称向量 Ai 与 Aj 正交

* 3.2 矩阵的秩(rank)
 * rank(A) = min(行向量中线性独立的个数，列向量中线性独立的个数)
 * 含义：彼此线性相关的两个变量并不能提供更多的信息，
 *      如，薪水、基本工资、奖金，给定任意两个变可计算出第三个

* 3.3 对称矩阵的 特征根和特征向量
*=定义： 
*     给定方阵 A，若能找到行向量 h 和一个单值 e, 使得
*                      A*h = e*h
*     成立，则称 h 为 A 的特征向量，而 e 为 A 的特征根。
*=含义：
*     相当于把矩阵的一个方向分解出来，而 A 可能包含 n 个方向
*     即，特征根：Lamda=(e1,e2,...,en); 特征向量：H=(h1,h2,...,hn)
*=性质：
*    (1) rank(A) = 非零特征值的个数(如果有一个特征值为0，则矩阵非满秩)
*    (2) det(A)  = 特征值的乘积
*    (3) trace(A)= 特征值的和
*    (4) inv(A) 的特征值为 1/e1, 1/e2, ..., 1/en

*=Stata操作： 
* -语法格式： 
*   非对称方阵：mat eigenvalues 特征根实部 特征根虚部 = 矩阵名
*   对称方阵：  mat symeigen    特征向量名 特征根名   = 矩阵名 
*----eg1：非对称矩阵-------
matrix A = (23,12,-9 \ 2,4,-6 \ 5,1,3)
 dis det(A)
mat eigenvalues H Lamda = A
mat list H        /*特征根实部*/
mat list Lamda    /*特征根虚部*/
*----eg2：非满秩对称矩阵-------
 mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
 mat list A
 dis det(A)
mat symeigen H Lamda = A
 mat list H,format(%6.2f)      /*特征向量*/
 mat Lamda = diag(Lamda)
 mat list Lamda
 mat list Lamda,format(%5.4f)  /*特征根*/
*----eg3：满秩对称矩阵-------
 mat A = (12,35,-13 \ 35,108,0.3 \ -13,0.3,42)
 mat list A
mat symeigen H L = A
 mat list L       /*特征根*/
 mat list H       /*特征向量*/
 *验证上述性质：
 * 秩(rank) 3
 * 横列式(determine)
     dis det(A)
     dis L[1,1] * L[1,2] * L[1,3]
 * 对角和(trace)
     dis trace(A)
     dis L[1,1] + L[1,2] + L[1,3]
 * 逆矩阵的特征根：留给读者吧
    
* 3.4 正定矩阵、负定矩阵与裘氏分解
* 定义：
*   给定 n*n 正方矩阵 A 和`任意' n*1 向量 x，矩阵的二次型定义为：
*             x'Ax  (一个单值)
*  A 正定：  若 x'Ax > 0
*  A 负定：  若 x'Ax < 0 
*  A 半正定：若 x'Ax >= 0
*  A 半负定：若 x'Ax <= 0

* 裘氏分解(cholesky factorization) 
* 相当于矩阵开根号
* ！只有正定对称矩阵才可进行此分解
 mat A = (23,12,-9 \ 2,4,-6 \ 5,1,3) /*非对称*/
  mat chA = cholesky(A)
 mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
  mat chA = cholesky(A)              /*非正定*/

 mat A = J(4,4,1) + 3*I(4)   /*正定且对称*/
 mat B = cholesky(A)         /* A=B*B'*/          
 mat list A             
 mat list B
 mat AA = B*B'       
 mat list AA


*---------------------
*-4   矩阵的特殊操作
*---------------------
*                本节命令
*------------------------------------------
* rownames, colnames, rownumb(), colnumb() 
* roweq, coleq, mkmat, svmat, set matsize, 
* mat accum, mat glsaccum, mat opaccum
*------------------------------------------
* 4.1 矩阵的行名和列名
 mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
 mat rownames A = 1998 1999 2000 2001
 mat colnames A = y x1 x2 x3 
 mat list A

 mat r = rownumb(A, "2000")
 mat c = colnumb(A, "x1")
 mat list r
 mat list c

* 4.2 变量和矩阵的相互转换
* 变量 —> 矩阵
 sysuse auto,clear
 * 转换单变量为同名列向量
 mkmat price in 1/10   /*生成一个 10*1 的列向量，矩阵名为 price*/
  mat list price
 mkmat price weight length if rep78==4  /*生成三个同名列向量*/
  mat list price
  mat list weight
  mat list length
 * 将多个变量合并至一个矩阵
  mkmat price, matrix(Y)
  gen cons= 1
  mkmat weight length foreign cons, mat(X)
   mat list Y
   mat list X
   *应用实例：OLS 系数估计
    mat b = inv(X'*X)*X'*Y
    mat list b
    reg price weight length foreign
 * 缺漏值的处理
    count if price>10000
   replace price =. if price>10000
    count if weight>4000
   replace weight =. if weight>4000 
  mkmat price wei, mat(pw)
   dis rowsof(pw)
  mkmat price wei, mat(pw_no) nomissing
   dis rowsof(pw_no)
  list price weight if price==.|wei==.
   count if price==.|wei==.

* 矩阵 —> 变量
svmat b, names(coff)
 list coff1 in 1/5
svmat X, names(var)  /*自行定义统一的变量名*/
 drop weight length foreign cons
svmat X, names(col)  /*用矩阵的列名作为变量的名称*/

* 4.3 矩阵函数
help matrix functions

* 4.4 矩阵对内存的需求
/*  
                            表4-1 不同版本下参数的设定
      +-------------------------------------------------------------------+
      |           |  -- Intercooled Stata --  |  ------- Stata/SE ------  |
      | Parameter |  Default     min     max  |  Default     min     max  |
      |-----------+---------------------------+---------------------------|
      | maxvar    |    2,047   2,047   2,047  |    5,000   2,047  32,766  |
      | matsize   |      200      10     800  |      400      10  11,000  |
      | memory    |       1M    500K     ...  |      10M    500K     ...  |
      +-------------------------------------------------------------------+

                         表4-2 矩阵大小对内存的需求
                       +--------------------------+
                       |  matsize  |  memory use  |
                       |-----------+--------------|
                       |      400  |      1.254M  |
                       |      800  |      4.950M  |
                       |    1,600  |     19.666M  |
                       |    3,200  |     78.394M  |
                       |    6,400  |    313.037M  |
                       |   11,000  |    924.080M  |
                       +--------------------------+
*/
set matsize 200
 mat a = J(300,1,0)
set matsize 400
 mat a = J(300,1,0)


* --------------------- over --------------------

        *             ::第一部分::
          *              Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================

*---------------------
*       简  介
*---------------------
cd D:\stata9\ado\personal\Net_course\A5_prog

*-1 Stata 程序的基本结构
* -----------------------------
   program define myprog
     version 9.2
       ... ...
   end
* -----------------------------
* 保存为 myprog.ado (文件的扩展名为 `.ado')

*-2 一个简单的例子
 *·2.1 第一种执行方式
 doedit mynba.ado
 adopath + D:\stata9\ado\personal\Net_course\A5_prog
 mynba

 *·2.2 第二种执行方式
 * 选中点击`run current file'键
   program define mynike
     version 8.0
     dis in red "Just do it! "
   end      
 mynike

 *·2.3 常用命令的存放
 personal 
 personal dir

*-3 程序的管理
program dir         /*查找内存中的程序*/
program list mynba
program list _all
program drop mynike /*删除内存中调入的程序，但不影响硬盘中存储的文件*/
   program define mynike
     version 8.0
     dis in red "Just do it! haha! "
   end      
 mynike

*discard            /*清空内存中的所有信息,较少使用*/


*-4 避免列印过多的结果
sysuse auto, clear
 quietly sum price
  scalar avg = r(mean)
  dis avg

 quietly{
   sum price if foreign == 0
    scalar avg1 = r(mean)
   sum price if foreign == 1
    scalar avg2 = r(mean)
   scalar diff = avg2 - avg1
 }
 dis diff

*-5 避免程序因错误而中断
 sysuse auto, clear
 drop prcie
 dis _rc
  capture drop prcie
  sum price
  cap noisily drop prcie
  sum price 

*-6 避免数据在程序执行过后有所变动
preserve 
  keep price weight foreign
  drop if price > 10000
  sum 
  save auto_new.dta, replace
restore
  .....
use auto_new.dta,clear
* 说明：
* (1) 多数情况下，我们改动资料都是为了得到特定的结果；
* (2) 在 preserve 和 restore 之间对资料进行的任何修改都无法保留； 



*---------------------
*       暂  元
*---------------------
*-1 暂元的定义和引用

* 存放数字
 local a = 5
  dis `a'
 local b = `a' + 7
  dis `b'
  
* 存放文字
 local name1  "Arlion: "
  dis "`name1'"
 local name2  中山大学 岭南学院
  dis "`name2'"
 local name3  `name1'`name2'
  dis "`name3'"
  
* 存放变量名称
 sysuse auto, clear
 local varlist price weight rep78 length
  sum `varlist'
  des `varlist'
  
  dis `varlist'   /*列印各变量的第一个观察值*/
   dis price weight rep78 length
   list price weight rep78 length in 1/1
  dis "`varlist'" /*列印变量名称*/
  
* 数学运算符的处理
 local a "2+2"
  dis `a'
  dis "`a'"
 local b = 2+2
  dis `b'
  dis "`b'"
  
* 文字中包含 `' 和 "" 的情形: `" `暂元名' "'(长引号)
 local tt  John's "car"
  dis "`tt'"             /*错误方式*/
  dis "John's " car ""
 local tt  John's "car"  /*正确方式*/
  dis `" `tt' "'  
  
* 暂元中的暂元
 local a1  = 2
 local a2  "var"
 local a3  = 2*`a1'
 local a4  `a`a1''
 local `a2'`a1' = 2*`a3'
 local `a`a3''  "``a`a1''2'"  /*从第一个完整的` '分析起*/
 dis `a1'
 dis "`a2'"  
 dis `a3'           /*4*/
 dis "`a4'"         /*暂元 a2 中的内容*/
 dis ``a2'`a1''     /*8*/
 dis "`a`a3''"      /*?*/
 dis "``a`a3'''"    /*8*/
 
 
* 暂元引用机制的简化
 * 数学运算式的简化
 gen price2 = price^2 
 local i = 1
 local j = (`i'+7)/4
  sum price`j'
  * 等价于：
  local i = 1
  sum price`=(`i'+7)/4'   /*price`=j'*/  
  
 * 逻辑运算的简化
   gen price1 = price if foreign==1
   gen price0 = price if foreign==0
  local i = 0
  sum price`=(`i'>0)'
  
 * 暂元内数值的递增和递减
  local i = `i' + 1
    local i++       /*执行运算`之后' 加 1 */
    local ++i       /*执行运算`之前' 加 1 */
  local j = `j' - 1
    local j--
    local --j
  * e.g.
    local i = 1
      dis `i++'
      dis `i'
    local i = 1
      dis `++i'
      dis `i'


*-2 全局暂元
global aa "This is my first program!"      
dis "$aa"

global x1 = 5
global x2 = 2^$x1
dis $x2


*-3 暂元的管理
macro list
macro dir
macro drop x2
 macro dir x2
 macro dir aa


*---------------------
*    其它暂时性物件
*---------------------

*-1 暂时性变量
sysuse nlsw88, clear
tempvar x1 x2
gen `x1' = hours^2
gen `x2' = ln(wage)
sum `x1' `x2'
* 暂时性变量的名称可与永久性变量同名，因为二者的引用方法有别
*---------------一个实例-------------------
 cap program drop mysum
 program define mysum
  version 8.0
  args var             /*输入项 help args*/ 
  tempvar x1 x2 
  gen `x1' = sqrt(`var')
  gen `x2' = ln(`var')
  dis in y "The summary of `var' is: " 
   sum `var'
  dis _n in y "The summary of `var'_sqr is:"
   sum `x1'
  dis _n in y "The summary of ln_`var' is:"
   sum `x2'
 end
*------------------------------------------
 mysum wage


*-2 暂时性矩阵和暂时性单值
local j = 7
tempname mymat 
mat `mymat' = I(`j')
mat list `mymat'

* 一个实例
* 求取一个矩阵各行的和
mat a = J(4,4,1) + I(4)
tempname pp 
local c = colsof(a)
mat `pp' = J(`c',1,1)
mat `pp' = a*`pp'     /*求和*/
mat list `pp'
mat list a, nohalf
* 关于暂时性单值的两点说明：
* (1) 可以将其视为 1*1 暂时性矩阵
* (2) 尽量避免暂时性单值的使用，而用暂元替代之


*-3 暂时性文件
*定义： tempfile file1
*调用： use "`file1'"
* -------- 一个实例 ------------
* 数据：沪市的7家公司财务数据
cd D:\stata9\ado\personal\Net_course\A5_prog
use A5_tempfile1.dta, clear
list
* 任务：产生一个新的公司代码变量,值为：1,2,3 
* 思路：应用 _n 和 egen 命令

preserve
  keep id
  duplicates drop
  sort id
  gen id_new = _n
    list 
  tempfile id_data
  sort id
  save "`id_data'", replace
restore
  sort id year
  merge id using "`id_data'"
  sort id_new year



*---------------------
*      控制语句
*---------------------
*          本节命令
*---------------------------------
* if, while, forvalues, foreach 
*---------------------------------
*-1. 条件语句
scalar tt = 7^2 + 3*29 + ln(100) 
if tt>0{
   dis in g "The valus is" in y " positive! "
}
dis tt

scalar aa = 1
*scalar aa = 0
if aa ==1{
   dis "这小子真帅！"
}
else if aa==0{
   dis "这女孩真靓！"
}

sysuse nlsw88.dta, clear
sort wage
forvalues i = 1(1)20{
  if race[`i'] == 1{
    dis in y "`i'" in g " 号是" in y " 白人"
  }
  else if race[`i'] ==2{
    dis in y "`i'" in g " 号是" in y " 黑人"
  }
  else{
    dis in y "`i'" in g " 号是" in y " 其它人种"
  }
}

*-2. 循环语句
* 2.1 条件循环：while 语句
local j = 0
while `j'<5{
   dis _s(10) `j++'
  * local j = `j'+1
}

* 2.2 forvalues 语句   /*数字的循环*/
forvalues i = 0(-1)-14{
  dis _s(8) `i'
}

forvalues i = 0/4{
  dis _s(10) `i'
}

forvalues i = 10(-2)1{
  dis _s(8) `i'
}

mat mm = J(10,3,0)
forvalues i = 1/10{
  forvalues j = 1/3{
    mat mm[`i',`j'] = `i' + `j'
  }
} 
mat list mm

 
* 2.3 foreach 语句   /*变量、暂元、文件等的循环*/

help foreach   /*语法格式*/

cd D:\stata9\ado\personal\Net_course\A5_prog

*- a. 任意格式：foreach v in ...
type d1.txt
type d2.txt 
type d3.txt
foreach file in  d1 d2 d3{
   local varname id year invest market stock 
     insheet `varname' using `file'.txt,clear
     save `file'.dta, replace 
}
* 追加样本
use d1.dta, clear
foreach file in  d2.dta d3.dta{
  append using `file'
}

*-b. 变量名循环：
* foreach v of varlist ...
sysuse auto,clear
local vars "price weight length"
foreach v of varlist `vars'{
  dis _n(2) in y "summary of `v': "
  sum `v' 
}

*-c. 暂元循环：foreach cc of local ...
local vars price weight length
foreach v of local vars{
  gen `v'_2 = `v'^2 
}

*-d. 数字循环：foreach num of numlist ...
foreach num of numlist 1 4/8 13(2)21 103 {
    display _s(10) `num'
}


*-----------------------
*  引用 Stata 命令的结果
*-----------------------
*                 本节命令
*-----------------------------------------
* return list, ereturn list, sreturn list 
*-----------------------------------------
*-1 留存在内存中的结果
*=Stata 命令分为三种类型：
*  (1) r-class 与模型估计无关的命令； 如，summary
*  (2) e-class 与模型估计有关的命令； 如，regress
*  (3) s-class 其它命令；            如，list
*=显示留存值的方法：
*  r-class: return  list
*  e-class: ereturn list
*  s-class: sreturn list
*=留存值分为四种类型：
* 单值：  如，r(mean), r(max), r(N), e(r2), e(F)
* 矩阵：  如，e(b), e(V)
* 暂元：  如，e(cmd), e(depvar)
* 函变量：如，e(sample)

* r-class
 sysuse auto, clear
 sum price
return list
 dis "汽车的平均价格是：" in g `r(mean)'  /*两种方法均可*/
 dis "汽车的平均价格是：" in g  r(mean)
local ss = r(sum)                        /*引用留存值*/
 dis "所有汽车的价格总和是：" in g `ss'

*----------------示 例------------------
* 计算一组变量的取值范围，并存于一个矩阵中
 local vars "price weight gear_ratio"
 local n = wordcount("`vars'")
 mat aa = J(`n',4,0)
 local i = 1
 foreach v of varlist `vars'{
   qui sum `v'
   mat aa[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
 }
 mat colnames aa = mean min max range
 mat rownames aa = `vars'
 mat list aa


* e-class 
 regress price weight length foreign
 ereturn list
 dis "The method is: " in g e(model)
 dis "最大似然值 = " in g e(ll)

 dis "系数向量为：" 
 mat list e(b)

 dis "系数的方差-协方差矩阵为："
 mat list e(V), format(%6.2f)

* e(sample) 的内容
 sysuse auto, clear
 count if rep78>4
 replace rep78 =. if rep78>4
 reg price weight length rep78
 sum price
 sum price if e(sample) == 1
 gen e_sample = e(sample)
 list rep78 e_sample in 1/20


*----------------------------------
*        一个简单的程序
*----------------------------------
* 封装上面那个计算变量取值范围的程序
*---------begin-------- asum.ado --------------
cap program drop asum
program define asum
  version 8.0
  syntax varlist     /*输入项*/

  local n = wordcount("`varlist'")
  tempname aa  /*定义暂时性矩阵*/
  mat `aa' = J(`n',4,0)
  local i = 1
  foreach v of varlist `varlist'{
    qui sum `v'
    mat `aa'[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
  }
  mat colnames `aa' = 平均值 最小值 最大值 取值范围
  mat rownames `aa' = `varlist'
  * 列示结果
  dis _n in g _dup(20) "=" in y "我的统计结果" in g _dup(20) "=" 
  mat list `aa'
end
*---------over------- asum.ado ----------------

sysuse auto, clear
asum price weight length

sysuse sp500, clear
asum open 
asum open close

 adopath + D:\stata9\ado\personal\Net_course\A5_prog
 asum open

* 该程序的缺陷：
* (1) 结果的显示不够美观；
* (2) 程序没有选项，缺乏弹性；

*==========================后 记===============================
* 至此，我们已经完成了 Stata 入门知识的学习；
* 在第二部分中，我们将学习如何使用 Stata 分析和估计各种计量模型；
* 在第三部分中，我们将进一步探讨编程的更多技巧，以及模拟分析
*==============================================================



          ****** 人大网络课堂：STATA 专题 ******
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *         第一讲  普通最小二乘法 
          *       ==========================


cd D:\stata9\ado\personal\Net_course\B1_OLS

*------------------------
* 简介：图解最小二乘法

    do B1_ols_gr1.do     
    

*--------
* 估计
  * H1: 二者之间存在线性关系（解释变量 X 是非随机的，被解释变量 y 是随机的）
  *    y = a0 + a1*x1 + a2*x2 + ... + ak*xk + u
  *    y = Xb + u 
  * H2: X 是满秩的，i.e. rank(X) = k
  * H3: 干扰项的条件期望为零（模型的设定是正确的）  
  *    E[Xu] = 0  or   E[u|X] = 0   
       
  * OLS 估计式的推导仅需要上述三个假设即可：  
  *    E[X'(y - Xb)] = 0
  *       X'y - X'Xb = 0
  *   ==>       X'Xb = X'y
  *   ==>          b = inv(X'X)*X'y
  * E[b] = E[inv(X'X)X'*(Xb0+u)] 
  *      = b0 + inv(X'X)X'E[u] 
  *      = b0                     /*OLS 估计量是真实值的无偏估计*/
  * y_hat = X*b             /* 被解释变量的拟合值*/
  * e = y - y_hat = y - Xb  /* 残差 */
  
   do B1_ols_gr1a.do 

  * Stata 估计命令
      use B1_consume, clear
      regress consume income      /*常数项是stata自动加入的*/
       reg consume income if income>300
       reg consume income in 5/11
      regress consume income 
      predict y, xb
      predict e, residual
      list 
  
  *--------------估计结果的解释--------------------
  * 估计式的矩阵解析
     local N = _N
     gen cons = 1
     mkmat consume, mat(y)
     mkmat income cons, mat(X)
     mat b = inv(X'*X)*X'*y   
     mat list b
     mat list y
     mat list X
     
  * 常数项的作用和含义(也是一个解释变量，条件期望)
    use B1_consume, clear
    regress consume income
     egen avg_c = mean(consume)
     egen avg_i = mean(income)
     gen  d_c = consume - avg_c
     gen  d_i = income  - avg_i
    regress d_c d_i, nocons 
    reg consum income
  

*----------------------------
* 统计推断: 回归系数的显著性
  * b 是一个随机数  b = inv(X'X)X'y, 因为y是随机的
     do B1_ols_gr3.do
     do B1_ols_gr2.do      /*实证样本与母体的关系*/
  
  * H4: Var[ui|X] = sigma^2   /*同方差假设*/
    * 结合 H3 可知， ui -- (0, sigma^2)
  * Var[b] = inv(X'X)sigma^2      /* Var(Ax) = AVar(x)A'*/ 
    * Var[b] = inv(X'X)X'*sigma^2*X*inv(X'X) = inv(X'X)sigma^2

   * 假设 ui -- i.i.d N(0, sigma^2)   /*干扰项服从正态分布*/
   *       b -- N(b0, Var(b))         /*因为 b 是 y 的线性组合*/
   * (bj - bj0)/s.e.(bj) -- t(n-k) 
     * H0: bj0 = 0   
     * bj/s.e.(bj) --- t(n-k)
     
  * sigma^2 的估计值 --- s^2 
      local N = _N   
      local K = colsof(X) 
      mat e = y - X*b                 /*残差*/                      
      mat s2 = (1/(`N'-`K'))*(e'*e)     
  * 系数的标准误 --- s.e.(bj)
      mat Var_b = s2*inv(X'*X)    
      mat list Var_b  
      dis sqrt(0.06187781)
      dis sqrt(6535.7483)   
      * 矩阵解析          
      mat se_b = cholesky(diag(vecdiag(Var_b))) 
       mat list se_b  
      reg consume income

  * t 值的计算  t = 系数/标准误
    use B1_consume, clear
    regress consume income
    dis %4.2f 0.6848014/0.2487525   /*income 的 t 值*/
    dis %4.2f 51.89511/80.84397     /*常数项 的 t 值*/  
    * 矩阵解析
    mat b0 = diag(b) 
     mat list b0
    mat inv_se_b = inv(se_b)
     mat list inv_se_b
    mat t  = hadamard(b0, inv_se_b)
     mat list t             
    mat t  = vecdiag(t)
    reg consume income
  
  * p 值
    * H0 : bj = 0  即，系数估计值是否显著不等于零
    * 由于 t值 服从 t 分布，所以我们很容易计算其 p 值
    help density functions
    mat list t
    local p_income = ttail(11-2, 2.75)*2  /*双尾*/
    local p_cons   = ttail(11-2, 0.64)*2
    mat pvalue = (`p_income' \ `p_cons') 
    mat list pvalue
 
  * 置信区间 
   * (bj - bj0)/s.e.(bj) -- t(n-k) 
    mat se_b = vecdiag(se_b)'
    local t_c = invttail(11-2, 0.025)
    mat CI95_low  = b - `t_c'*se_b         
    mat CI95_high = b + `t_c'*se_b             
     mat list CI95_low
     mat list CI95_high
    reg consume income
 
  * 结果汇总      
    mat Result = (b, se_b, t', pvalue, CI95_low, CI95_high)
    mat colnames Result = b  se  t  p-value CI95_low  CI95_high
    mat list Result
    reg consume income

  * 检验系数显著性的新方法：自体抽样法（Bootstrap）
    bootstrap           : reg consume income
    bootstrap, reps(300): reg consume income
    sysuse auto, clear
    bootstrap, reps(300): reg price weight mpg foreign turn,noheader
    reg price weight mpg foreign turn 
    * 基本思想：
    * 假设样本是母体中随机抽取的；
    * 通过反复从样本中抽取样本来模拟母体的分布；
    *  1. 从样本中可重复地抽取 N 个样本，执行OLS，记录系数估计值；
    *  2. 将第一步重复进行 300 次，得到系数估计值的 300 个记录；
    *  3. 统计这300个估计值的标准误 se_bs，将其视为实际估计值的标准误；
    *  4. 计算 t 值和相应的 p 值
    use B1_consume, clear
    scatter consume income
     
  * 计算残差和拟合值
  sysuse auto, clear
    reg price weight length foreign
    predict y_hat 
    predict e, res
    reg price weight length if foreign==1
    eret list
    predict y_hat1 if e(sample)
    predict e1     if e(sample), res


*------------
* 方差分析
  * Total sum of square = Model sum of square + Residual sum of square
  * y 的总波动 = 模型能够解释的波动 + 残差的波动
    sysuse auto, clear
    reg price weight length
    predict yhat     /*price的拟合值*/
    predict e, res   /*残差*/
    
    foreach v of varlist price weight length{
      egen avg_`v' = mean(`v')
      gen dif_`v' = `v' - avg_`v'
    }
    qui reg dif_price dif_wei dif_len, nocons
    predict yhatd

    * TSS = MSS + RSS
    * TSS = sum of yd^2    yd = y - mean(y)
      gen dprice2 = dif_price^2
      qui sum dprice2
      dis "TSS = "  %12.0f r(sum)
        scalar TSS = r(sum)
    * MSS = sum of yhatd^2  yhatd = Xd'b
      gen yhatd2 = yhatd^2
      qui sum yhatd2
      dis "MSS = "  %12.0f r(sum)
        scalar MSS = r(sum)
    * RSS = sum of e^2     e = y-yhat = y-X'b = yd - Xd'b 
      gen e2 = e^2
      qui sum e2
      dis "RSS = " %12.0f r(sum)
        scalar RSS = r(sum)
      reg price weight length
      
     * MMS = MSS / (k-1)  MS: mean of square
       dis "MMS = " %12.0f MSS/2
     * RMS = RSS / (N-k)
       dis "RMS ="  RSS/71
     * TMS = TSS / (N-1)
       dis "TMS ="  TSS/73 
      reg price weight length 
     
     * Root MSE(mean square error): sqrt(s2)
       qui sum e2
       scalar Root_MSE = sqrt(r(sum)/(74-3)) 
       dis "Root MSE = " Root_MSE
      
  * R^2 与 adj-R^2
    * R^2 的基本定义
      scalar R2a = MSS / TSS    /*模型能够解释的波动占总波动的比例*/
        dis R2a
      scalar R2b = 1 - RSS/TSS
        dis R2b
    * 对 R^2 的第二种理解
      reg price weight length
     * predict price_hat
      corr price price_hat
      local R2 = r(rho)^2
      dis "R2 = ' `R2'
    * 调整后的 R2
      local adj_R2 = `R2' - (3-1)/(74-3)*(1-`R2') 
      dis "adj-R2 = " `adj_R2'


*-------------
* 标准化系数
  sysuse auto, clear
  reg price w l, beta
  
  * 处理过程的解析
  foreach v of varlist price weight length{
    egen `v'_s = std(`v')     /* (v-m_v)/sd_v */
  }
  sum price_s weight_s length_s
  reg price_s weight_s length_s,noheader
  * 评论：
  * 1. 标准化系数的含义；
  * 2. 我们可以按照这一方法估计出任何模型的标准化系数


*------------
* 边际效果 
  help mfx
    regress price length weight
    mfx, dydx      /* dy/dx */
    mfx, eyex      /* d(lny)/d(lnx) */
    mfx, dyex      /* d(y)/d(lnx)   */
    sum weight length, detail
    mfx, at(weight=3190, length=192.5)
      mat A = (3190, 192.5)
      mfx, at(A)
    mfx replay, level(90)


*-----------
* 假设检验  
  * 单变量检验
    use B1_production.dta,clear
    reg lnY lnL lnK
     test lnL = 0
     test lnL = 0.7
  * 线性约束检验
    reg lnY lnL lnK
     lincom lnL + lnK 
     lincom lnL + lnK - 1
  * 包含线性约束的估计
     constraint define 1 lnL+lnK = 1
     cnsreg lnY lnL lnK, constraints(1)
    preserve
    sysuse auto,clear
     constraint def 1  price = weight
     constraint def 2  displ = weight
     constraint def 3  gear_ratio = -foreign
    cnsreg mpg price weight displ gear_ratio foreign length, c(1-3)
    restore
  * 联合检验
    reg lnY lnL lnK
    test lnL lnK
    test (lnL=0.8) (lnK=0.2)
   * 模型的整体拟合程度
   * F 检验：检验除常数项外其他所有解释变量的联合解释能力是否显著
   * X= [X1 X2]   X1=常数 | X2=lnL lnK
    test lnL lnK
    reg lnY lnL lnK
  * 非线性约束检验
    testnl _b[lnL] * _b[lnK] = 0.25
    testnl _b[lnL] * _b[lnK] = 0.5
      






          ****** 人大网络课堂：STATA 专题 ******

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 
          
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *         第一讲  普通最小二乘法 
          *       ==========================

             
cd D:\stata9\ado\personal\Net_course\B1_OLS  
*-------------------
* 模型的设定和筛选
*-------------------

*-------------
* 残差分析
   * acprplot           augmented component-plus-residual plot
   * avplot             added-variable plot
   * avplots            all added-variable plots in a single image
   * cprplot            component-plus-residual plot
   * lvr2plot           leverage-versus-squared-residual plot
   * rvfplot            residual-versus-fitted plot
   * rvpplot            residual-versus-predictor plot
   
* 残差的正态性
  sysuse auto, clear
  reg price weight mpg turn foreign
  predict e, res
  kdensity e, normal
  pnorm  e   /*P-P，对中间部位敏感*/
  qnorm  e   /*e的分位值与正态分布的分位值关系图，对尾部敏感*/
  sktest e
  swilk  e
  * Doornik and Hansen (1994) test, more powerful
  omninorm e 

   
  
* 残差-拟合值图  rvfplot
  rvfplot, yline(0)    
     
* 对特殊样本点的检验和处理
  do B1_ols_lev.do
  
  * 几个基本概念：
    * 离群样本点：残差值较大的样本点
    * 杠杆样本点：与样本整体(X'X)很不相同的少数样本点
    * 关键样本点: 对回归结果有重要影响的少数样本点
  * 杠杆统计量：hj = x_j*inv(X'X)*x_j'
    reg y x
    predict lev, leverage
    lvr2plot
      drop if x==30
      reg y x
      predict lev2, lev
      list
      lvr2plot
    sysuse auto, clear
    reg price weight mpg turn foreign
    lvr2plot
    lvr2plot, mlabel(make) mlabsize(vsmall)
    * 更直接的分析
    predict lev, leverage
    predict e,   res
    gen e2 = e^2
    gsort -lev
    list make price weight mpg foreign lev e2 in 1/10
    gsort -e2
    list make price weight mpg foreign lev e2 in 1/10    
    * 杠杆样本点不必然是离群值，反之亦然
  * 关键样本点：对回归结果有重要影响的少数观察值,通常既是杠杆样本点，又是离群值
    * DFITS 统计量 DFITSj = rj*sqrt[hj/(1-hj)]
    *                  rj = ej/[s(j)*sqrt(1-hj)]  标准化残差
    predict dfits, dfits
    dis 2*sqrt(5/74)      /*经验临界值： 2*sqrt(k/N)*/
    list make price weight mpg foreign dfits if abs(dfits)>0.51987524  
    sum price weight
     preserve
      reg price weight mpg turn foreign
       drop  if abs(dfits)>0.51987524 
      reg price weight mpg turn foreign
     restore
    * DFBETA 统计量
    qui reg price weight mpg turn foreign
    dfbeta weight
    dis 2/sqrt(e(N))
    list make price weight mpg foreign DFweight if abs(DFweight)>2/sqrt(e(N))  
    sum price weight
  * 处理方法：删除？ Tobit模型
  
  
*-----------------------------  
* 部分回归图  avplot avplots
  reg price weight mpg turn foreign
  avplot weight
  avplot weight,mlabel(make) xscale(r(-500 1400)) /* 标出样本标签 */
  * ---------------------解释-----------------------------
  * 纵轴：price 对除weight以外的所有变量回归得到的残差
  * 横轴：weight 对所有其他解释变量回归得到的残差
    qui reg price mpg turn foreign
     predict e_y , res
    qui reg weight mpg turn foreign
     predict e_x , res
     reg e_y e_x
    twoway (scatter e_y e_x) (lfit e_y e_x)
    twoway (scatter e_y e_x, mlabel(make)) (lfit e_y e_x), xscale(r(1400))
  * -------------------------------------------------------
  * 绘制所有变量的部分回归图
    reg price weight mpg turn foreign
    avplots 


*-------------
* 虚拟变量

* 变截距
do B1_ols_dummy1.do

reg price weight
reg price weight if foreign==0
reg price weight if foreign==1

 gen dum = 0
 replace dum = 1 if foreign==1

 reg price dum weight
 * model: price = a0 + a1*dum + b*weight + u 
   * price = a0      + b*weight + u  /*dum=0 国产车*/
   * price = (a0+a1) + b*weight + u  /*dum=1 进口车*/
   
* 斜率和截距同时变
do B1_ols_dummy2.do

gen dum = foreign==1
gen dum_weight = dum*weight
reg price dum weight dum_weight
* model：price = a0 + a1*dum + b0*weight + b1*dum_weight + u
  * price = a0      +  b0*weight     + u   /*dum=0 国产车*/
  * price = (a0+a1) + (b0+b1)*weight + u   /*dum=1 进口车*/
reg price weight

* 交乘项
* y = b0+ b1*x1 + b2*x2 + b3(x2*x3)
* dy/dx2 = b2 + b3*x3   i.e., x2 的边际效果依赖于 x3
sysuse auto, clear
gen weiXlen = weight*length
reg price weight mpg foreign weiXlen
* 汽车越长，重量对价格的边际影响就越小

*---------------------------
* 结构突变检验：Chow test

  * 基本思想
  *  y = a1 + b1*x1 + c1*x2 + u         for group == 1
  *  y = a2 + b2*x1 + c2*x2 + u         for group == 2
  *  y = a  + b*x1  + c*x2 + u          for both groups
  * H0: a1=a2 ; b1=b2 ; c1=c2
   do B1_ols_chow1.do      /*图示*/
  * 检验方法
    gen foreign_wei = foreign*weight
    gen foreign_len = foreign*length
    reg price wei len foreign foreign_wei foreign_len
    * 模型的含义
    *  price = c1 + a1*wei + b1*len + c2*foreign + a2*foreign_wei + b2*foreign_len
    *  price =  c1     +  a1*wei     +  b1*len      /*foreign==0*/ 
    *  price = (c1+c2) + (a1+a2)*wei + (b1+b2)*len  /*foreign==1*/ 
   test foreign foreign_wei foreign_len    /* c2=0; a2=0; b2=0 */
    * 另一种检验方法
    test foreign
    test foreign_wei, accum
    test foreign_len, accum
    * chow 命令  findit chow


* -------------
* 逐步回归法
   sysuse auto, clear
   * 逐个剔除(Backward selection)
     stepwise, pr(0.2): reg price mpg weight displ
     stepwise, pr(0.2): reg price mpg weight displ foreign 
     stepwise, pr(0.05): reg price mpg weight displ foreign   

   * 逐个分层剔除(Backward hierarchical selection)
     stepwise, pr(0.2) hier: reg price mpg weight displ 
     stepwise, pr(0.2) hier: reg price mpg (weight displ) 
     qui reg price mpg weight displ
     test weight displ 
        
   * 逐个加入(Forward selection)
     stepwise, pe(.2): reg price mpg weight displ
     stepwise, pe(.2): reg price mpg weight displ foreign
  
   * 逐个分层加入(Forward hierarchical selection)
     stepwise, pe(.2) hier: reg price mpg weight displ
     stepwise, pe(.2) hier: reg price mpg weight displ foreign
     

*--------------     
* 多重共线性
  * H2: X 是满秩的，i.e. rank(X) = k  ==> X'X 是满秩的
  * 完全共线性
    sysuse auto, clear
    gen domestic = 1 - foreign
    reg price wei len foreign domestic
  * 严重多重共线性：检验方法
    * VIF 膨胀因子  VIF_j = 1/(1-R2_j)
      reg price weight length headroom trunk turn gear_ratio
      estat vif
      qui reg length   weight headroom trunk turn gear_ratio
       dis 1/(1-e(r2))  
      qui reg weight   length headroom trunk turn gear_ratio
       dis 1/(1-e(r2))
      * 经验准则：(1) VIF 的均值 > 1
      *           (2) VIF 的最大值 >10 
      pwcorr weight length, star(0.01)
      pwcorr weight length headroom trunk turn gear_ratio, star(0.01)
      gen wlr = weight/length   /*汽车长度和重量高度相关*/
      reg price wlr headroom trunk turn gear_ratio 
      estat vif 
      pwcorr wlr headroom trunk turn gear_ratio, star(0.01)
    * CN(X'X) >20 共线性问题比较严重   
     coldiag2  weight length headroom trunk turn gear_ratio
     collin    weight length headroom trunk turn gear_ratio
    * 其他命令：perturb  ranktest
  * 图形方式：
    graph matrix price weight length headroom trunk turn gear_ratio,half 
  * --------------------------
  * 共线性的征兆：一个模拟分析
  * --------------------------
    * (1)虽然模型的R2非常高，但多数解释变量都不显著，甚至系数符号都不对
    * (2)观察值的微小变动都会导致估计结果的大幅变动   
    * 生成数据
      clear 
      set obs 100
      set seed 23459
      gen n = _n
      gen e  = invnorm(uniform())      /*干扰项：标准正态分布*/
      gen d  = 0.01*invnorm(uniform())
      gen x1 = 3*invnorm(uniform())
      gen x2 = x1 + d
      gen y  = 10 + x1 + 5*x2 + e
    * 检验征兆1：严重共线性
      reg y x1 x2
      reg y x1    /*y = 10 + x1   + 5*x2 + e 
                      = 10 + 6*x1 + 5*d  + e */
      reg y x2    /*y = 10 + 6*x2 - d    + e */
      pwcorr y x1 x2 , star(0.01)
      * 对于不存在共线性问题的变量，其估计系数不受影响
       gen z  = 2*invnorm(uniform())
       gen yz = 10 + x1 + 5*x2 + 0.6*z + e
       reg yz x1 x2 z 
       reg yz x1 z
       reg yz x2 z  
    * 检验征兆2：观察值的微小变动
      list in 1/5
      reg y x1 x2
      replace x2 = 10 in 1/1
      reg y x1 x2
      pwcorr y x1 x2 , star(0.01)


*-------------------------------------------
* 嵌套(nested)模型与非嵌套(nonnested)模型

    * 嵌套模型
     sysuse auto, clear
      reg price weight length foreign
      reg price weight length foreign gear_ratio rep78 turn
      test (gear_ratio=0) (rep78=0) (turn=0)
     sysuse nlsw88, clear
      reg wage age race married ttl_exp
      reg wage age race married ttl_exp industry occupation collgrad
      test industry occupation collgrad
      
    * 非嵌套模型
      * 特征：
      *   H0: y = Xb + u1
      *   H1: y = Zg + u2
      *     X 和 Z 中有一些公共的解释变量，但也有各自独特的解释变量
      *     我们无法通过比较两个模型的 R2 来区分二者的优劣。
      *= 检验：应用 nnest 命令
      sysuse auto, clear
      reg price weight foreign  length headroom  /*H0*/
      reg price weight foreign  turn             /*H1*/
      local X  "weight foreign length headroom"
      local Z  "weight foreign turn"
      nnest price `X' (`Z')
      *= 检验：手动计算
        * 检验 H0
        qui reg price `Z'
        *qui predict yZ_hat 
        reg  price  `X' yZ_hat
        * 检验 H1 
              local X  "weight foreign length headroom"
     
        qui reg price `X'
        qui predict yX_hat
         local Z  "weight foreign turn"
        reg price `Z' yX_hat
      *= 一个问题：相互拒绝
        sysuse nlsw88, clear
        drop if grade==.|industry==.|occupation==.
        local X  "age race married  grade collgrad" 
        local Z  "age race married  industry occupation ttl_exp"
        sum wage `X' `Z'
        nnest wage `X' (`Z')  /*意味着包含所有变量的模型可能更好一些*/ 
        reg wage `X' `Z'  


*------------------------------------ 
* 模型的形式：是否遗漏了重要的变量？
*= link 检验
  * 如果模型的设定是正确的，那么y的拟合值的平方项将不应具有解释能力
  sysuse auto, clear
   regress mpg weight displ foreign
   linktest
   * 或许是遗漏了重要的解释变量
   gen wei2 = weight^2
   reg mpg weight wei2 displ foreign
   linktest
   * 或许被解释变量的设定也有问题
   gen gpm = 1/mpg   /*每公里耗油数*/
   reg gpm  weight displ foreign
   linktest
*= Ramsey 检验
  * 基本思想：如果模型设定无误，那么拟合值和解释变量的高阶项都不应再有解释能力
  regress mpg weight displ foreign
  estat ovtest
  estat ovtest, rhs
  reg mpg weight wei2 displ foreign
  estat ovtest



*------------------
*  实证结果的呈现
*------------------

*--------------------
* 变量的基本统计量
sysuse auto, clear
sum price weight length gear turn
tabstat price weight length gear turn ,             ///
           stat(mean sd p5 p25 med p75 p95 min max) ///
           format(%6.2f) c(s) 

*-----------------
* 变量的相关矩阵
* 相关命令：pwcorr, pwcorr_a, pwcorrs, matpwcorr, pwcorrw
use educ3, clear
 pwcorr  crimes empgovt osigind popcol perhspls
 pwcorr  crimes empgovt osigind popcol perhspls, sig
 pwcorr  crimes empgovt osigind popcol perhspls, star(.01)
 pwcorr  crimes empgovt osigind popcol perhspls, star(.05)
 help pwcorr_a  
 pwcorr_a crimes empgovt osigind popcol perhspls, star1(0.01) star5(0.05) star10(0.1)


*--------------------
* 引用Stata的返回值
sysuse auto, clear
reg price weight length turn
eret list

*----------------
* 回归结果的呈现
  help estimates
  * estimate store / est table
  sysuse nlsw88, clear
  reg wage age race married grade
   est store m_1
  reg wage age race married grade collgrad smsa industry
   est store m_2
  reg wage age race married grade collgrad smsa industry occupation ttl_exp tenure
   est store m_3
  * 方法1：est table 命令
  est table m_1 m_2 m_3
  est table m_1 m_2 m_3, stat(r2 r2_a N F) b(%6.3f) star  
  est table m_1 m_2 m_3, stat(r2 r2_a N F) b(%6.3f) star(0.1 0.05 0.01) 
  est table m_1 m_2 m_3, stat(r2 r2_a N F) b(%6.3f) se(%6.2f) star(0.1 0.05 0.01) 
  est table m_1 m_2 m_3, stat(r2 r2_a N F) b(%6.3f) se(%6.2f)
  est table m_1 m_2 m_3, stat(r2 r2_a N F) b(%6.3f) t(%6.2f)
  * 处理成Word表格
  * 方法2：esttab 命令，需要下载：findit esttab
  esttab m_1 m_2 m_3 
  esttab m_1 m_2 m_3, scalar(r2 r2_a N F) star(* 0.1 ** 0.05 *** 0.01) compress 
  esttab m_1 m_2 m_3, scalar(r2 r2_a N F) compress  ///
                      star(* 0.1 ** 0.05 *** 0.01)  ///
                      b(%6.3f) t(%6.3f)             ///
                      mtitles(模型(1) 模型(2) 模型(3))
                     
 


          ****** 人大网络课堂：STATA 专题 ******
            *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第二讲  广义最小二乘法 
          *       ==========================


cd D:\stata9\ado\personal\Net_course\B2_GLS

*------------
*   简  介
*------------
* 经典回归模型：
  * H4: Var[ui|X] = sigma^2   /*同方差假设*/
  *     Var[U] = sigma^2*I(n)
sysuse auto, clear
keep in 1/8
qui reg price wei mpg foreign
predict res, res
mkmat res, mat(e)
mat cv = e*e'
mat list cv  
* 一般化回归模型：
  *     Var[U] = Q 
  *     e.g. Var[ui] = sigma_i^2
  
  
*-------------
*   估计方法
*-------------
 * 稳健型估计
   * 基本思想：参数的OLS估计仍然是无偏的，只是标准误不够有效
   * 真实的 Var(b) = sigma^2*inv(X'X)*X'QX*inv(X'X)
   * White 估计量      处理异方差问题
   * Newey-West 估计量 同时处理异方差和序列相关 
 * GLS估计量
 * y = c + a*x + b*z + u          (1)
 * 假设：Var(u_i) = sigma^2*z_i^2   != sigma^2
 * y/z = c/z + a*(x/z) + b + u/z  (2)
 *  y* = c*  +  ...        + u*
 * Var(u*) = Var(u)/z_i^2 = sigma^2
 *  模型(2)符合经典回归模型的假设条件，OLS估计讲是 BLUE 的。
 * GLS 估计量
 * Q^(-1) = P'*P
 * Py = PXb + Pu
 * Var(Pu) = P*Var(u)*P' = In
 * reg Py on PX will be ok!
    * 设 X# = PX  y# = Py ，则
    * b_GLS = inv(X#'X#)*(X#'y#)
    *       = inv(X'*Q(-1)*X)*X'*Q(-1)*Y
    * Var(b_GLS) = sigma^2*inv(X#'X#)
    *            = sigma^2*inv(X'Q(-1)*X)


*------------------
*      异方差
*------------------

*--------------
* 简  介
   sysuse nlsw88, clear
   qui reg wage hours ttl_exp industry age race
   rvfplot, yline(0) ms(d) msize(small)
   rvpplot ttl_exp, ms(d) msize(small)
  * 异方差假设 Q 矩阵非对角线上元素为 0，
  *  即， Var[U] = diag[sigma_i^2]
  * 产生的原因
    * 模型设定不合理：如，遗漏了重要的解释变量
    * 本身就存在异方差问题
    * 数据问题
  * 对估计结果的影响
    * OLS 估计仍然是无偏且一致的， b = inv(X'X)X'Y 
    * 不是最有效的： Var[b] = inv(X'X)*(X'QX)*inv(X'X)
  * 检 验
  * 估 计
    * 稳健性估计(OLS估计系数，White公式估计标准误)
    * GLS/FGLS 
    * 稳健性和有效性的权衡


*--------------
* 检  验

* 图形分析

* B-P test (Breusch-Pagan,1979)
*  sigma_i^2 = sigma^2*(a0 + a1*z1 + a2*z2 + ...) 
*  H0: a1=a2=...=0
*  检验思路：用 ei^2/avg(ei^2) 对一系列可能导致异方差的变量作回归
*    LM= 0.5*MSS -- chi2(k)  (k 为解释变量的个数，不包括常数项)
   sysuse auto, clear
   reg price weight mpg turn foreign
   estat hettest, normal   /*B-P检验的原意，同方差假设*/
      * 手动计算
      qui predict yhat
      qui predict e, res
      qui gen e2 = e^2
      qui sum e2
      qui gen e2_nor = e2/r(mean)
      qui reg e2_nor yhat
      dis 0.5*e(mss) 
   reg price weight mpg turn foreign
   estat hettest, iid      /*N*R2, 无需同方差假设*/
      qui reg e2 yhat
      dis e(N)*e(r2)
   reg price weight mpg turn foreign
   estat hettest, rhs
   estat hettest length trunk
   estat hettest length trunk, rhs
   
* Szroeter's 秩检验(Szreter,1978)
  * D = (sum of h*e2) / (sum of e2)
   reg price weight mpg turn foreign
   estat szroeter, rhs
   
* G-Q test (Goldfeld-Quandt,1965)
  * 思路：
  * 1. 根据某一变量对样本排序；
  * 2. 去掉中间的 r 个观察值
  * 3. 分别对前后 n1 和 n2 个样本进行回归；
  * 4. 计算 R = (S2/n1-k)/(S1/n2-k)   S 为残差平方和
  * 5. 在原假设下, R--F(N1-K, N2-K)
  help gqhet
  sysuse auto, clear
   gqhet price mpg weight turn, sort(wei) drop(4)  
     * 手动计算
     sysuse auto, clear
       sort weight
     qui reg price mpg weight turn in 1/28
       scalar RSS1 = e(rss)
       local k1   = e(N) - 4
     qui reg price mpg weight turn in 46/74
       scalar RSS2 = e(rss)
       local k2   = e(N) - 4 
     local F = (RSS2/`k2') / (RSS1/`k1')
       dis in g "F = " in y `F'
       dis in g "P = " in y Ftail(`k1', `k2', `F')

* white 检验
  * 真实的Var(b) = sigma^2*inv(X'X)*X'QX*inv(X'X)
  * 同方差：Q = I 
  * reg e2 on 所有的解释变量和它们的交乘项即平方项
  * W = N*R2 -- chi2(K-1)  K 为解释变量的个数，包含常数项
    sysuse auto, clear
    reg price mpg weight turn
    estat imtest, white        /*方法1：stata内部命令*/
    whitetst                   /*方法2：外部命令*/
      * 手动计算
        predict e, res
        gen e2 = e^2
         gen mpg2 = mpg^2
         gen weight2 = weight^2
         gen turn2 = turn^2
         gen mpgXwei = mpg*weight
         gen mpgXturn = mpg*turn
         gen weiXturn = weight*turn
        reg e2 mpg weight turn mpg2 weight2 turn2 mpgXwei mpgXturn weiXturn
        dis "W = " e(N)*e(r2)
        dis "p-value = " chi2tail(e(df_m), e(N)*e(r2)) 
 
* Glesjer's test
  * 三种可能的异方差形式：
    * (a) Var[ei] = sigma^2*[b0 + b1*z1 + b2*z2 + ...]
    * (b) Var[ei] = sigma^2*[b0 + b1*z1 + b2*z2 + ...]^2
    * (c) Var[ei] = sigma^2*exp[b0 + b1*z1 + b2*z2 + ...]
sysuse auto, clear
  qui reg price mpg weight turn
  predict ei , res
  gen ei2    = ei^2
  qui sum ei2 
gen e2     = ei2/r(mean)
gen abs_ei = sqrt(e2)
gen ln_ei  =  ln(e2)
  local Z  "foreign  gear  trunk"
  local k = 3 + 1
  local n = e(N)
 * (a) reg e2 on foreign  gear  trunk 
    qui reg e2 `Z'
    dis "F = " e(F)   " p_value = "  Ftail(`= `k'-1', `=`n'-`k'' , `e(F)') 
 * (b) reg abs_ei on foreign  gear  trunk 
    qui reg abs_ei `Z'
    dis "F = " e(F)   " p_value = "  Ftail(`= `k'-1', `=`n'-`k'' , `e(F)') 
 * (c) reg ln_ei on foreign  gear  trunk  
    reg ln_ei `Z'
    dis "F = " e(F)   " p_value = "  Ftail(`= `k'-1', `=`n'-`k'' , `e(F)') 
        
 * 检验组间异方差
   sysuse nlsw88, clear
   reg wage ttl_exp race age industry hours
   predict e, res
   robvar e, by(occupation) /*stata内部命令*/
   gwhet e, i(occupation)   /*findit gwhet, plus文件夹*/
   gwhet e, i(race)

   
*------------
* 估  计 
  * White 稳健型估计
  * 思路：OLS 是无偏、一致估计量，但方差估计量需要修正
  *  真实的 Var(b) = inv(X'X)*(X'QX)*inv(X'X)
  *  困难： Q = diag[sigma_i^2] 共有N个未知参数，加上模型中的 K 个参数，无法估计
  *  然而： 我们只需要估计出 X'QX 即可，而不是 Q
  *  sigma_i^2 -- e_i^2
   sysuse nlsw88, clear
   reg wage ttl_exp race age industry hours
   est store ols0
   reg wage ttl_exp race age industry hours, robust
   est store ols_robust
   esttab ols0 ols_robust, mtitle(OLS_0 OLS_robust)
   
  * GLS: Q 已知
  * y = c + a*x + b*z + u          (1)
  * 假设：Var(u_i) = sigma^2*z_i^2 != sigma^2
  * y/z = c/z + a*(x/z) + b + u/z  (2)
  *     = ...               + u*
  * Var(u*) = Var(u)/z_i^2 = sigma^2
  sysuse auto, clear
  gen wei2 = weight^2
  reg price mpg weight turn foreign [aw=1/wei2]
  rvpplot weight
  
  * FGLS: Q 未知
   *== 手动计算
    * step1：利用残差估计出 Q 中的参数，得到 Q_hat；
    * step2: 利用 Q_hat 执行 GLS 估计 
    use B2_Greene_Tab5_1.dta, clear   /*参见Greene(2000,4th,p.515)*/
    
    * 假设：sigma_i^2 = sigma^2*(a1*income + a2*income2)
    qui reg expend age ownrent income income2
    predict e , res
    gen e2 = e^2
    qui reg e2 income income2, noconstant
    qui predict p1
    reg expend age ownrent income income2 [aweight=1/p1]        

    * 假设：sigma_i^2 = sigma^2*exp(a0 + a1*ln_income)   
      gen ln_e2 = ln(e^2)
      gen ln_income = ln(income)
    qui reg ln_e2 ln_income
      predict p2
      replace p2 = exp(p2)
    reg expend age ownrent income income2 [aweight=1/p2]       
    
   *== 使用 wls0 命令 findit wls0, plus 文件夹 
   *  参见Greene(2000,4th,p.515) Table 12.3
    * sigma_i^2 = sigma^2*income
     wls0 exp age ownrent income income2 , wvar(income) type(abse) noconst          
      est store Tab12_3a              /* 12.3a */
    * sigma_i^2 = sigma^2*income2
     wls0 exp age ownrent income income2 , wvar(income2) type(abse) noconst
      est store Tab12_3b              /* 12.3b */
    * sigma_i^2 = sigma^2*(a1*income + a2*income2)
     wls0 exp age ownrent income income2 , wvar(income income2) type(e2) noconst
      est store Tab12_3c              /* 12.3c */
    * sigma_i^2 = sigma^2*(a1*income + a2*income2)^2
     wls0 exp age ownrent income income2 , wvar(income income2) type(abse) noconst
      est store Tab12_3d              /* 12.3d */
    * simg_i^2 = sigma^2*exp(a1*income + a2*income2)
    wls0 exp age ownrent income income2 , wvar(income income2) type(loge2)
      est store Tab12_3e              /* 12.3e */

    est table Tab*, stats(r2) b(%8.3f) se(%8.3f) 
   
   * 组间异方差
    sysuse nlsw88, clear
    reg wage ttl_exp race age industry hours   
    predict e, res
    egen sd_e = sd(e), by(industry)
    gen gw_wt = 1/sd_e^2
    tabstat sd_e gw_wt, by(industry)
    reg wage ttl_exp race age industry hours [aw=gw_wt] 
   
   


          ****** 人大网络课堂：STATA 专题 ******

           *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第二讲  广义最小二乘法 
          *       ==========================


cd D:\stata9\ado\personal\Net_course\B2_GLS   
     
*------------------
*     序列相关
*------------------
*--------------
*  简  介
* 经典回归模型： ui -- i.i.d N(0, sigma^2)
* 在时间序列中，i.i.d 往往不成立，如政策的滞后效应
* 如，AR(1):  u_t = rho*u_t-1 + v_t,   v_t --i.i.d N(0,sigma^2) 
* 此时，Q = Var[U] 会有新的形式
* 截面分析与时序分析对比
   * 截面资料
   use B2_consume_cs.dta, clear
   reg consume income
   predict e, res
   twoway (scatter e id) (line e id), yline(0,lp(dash) lc(blue)) ///
         legend(off) xtitle(截面资料) ysize(3) xsize(4)
   graph save cs.gph, replace
   * 时序资料
   use B2_consum_ts.dta, clear
   reg lconsumption lincome
   predict e, res
   twoway (scatter e t) (line e t), yline(0,lp(dash) lc(blue)) ///
         legend(off) xtitle(时间序列) ysize(3) xsize(4)
   graph save ts.gph, replace
   graph combine cs.gph ts.gph,ysize(3) xsize(5)

*--------------
* 产生原因
* 时间序列的特征
* 数据本身的问题：取对数和差分能够从一定程度上降低序列相关
* 遗漏变量


*--------------
*  检  验

* 图形法:自相关系数图和偏自相关系数图
  use B2_lutkepohl.dta, clear
  tsset year
  reg ln_consum ln_income
  predict e1, res
   * ac (auto-correlation cofficient) 
   *  rho_j = Cov(y_t, y_t-j)/Var(y_t)
   * pac (partial auto-correlation cofficient)
   *  phi_j = Cov(y_t|E(...t-j-1), y_t-j)
   *     reg y_t on y_t-1 y_t-2 ... y_t-j 
  ac  e1            /*Auto-correlation*/
  pac e1
  corrgram e1,lags(8) 
    preserve  /*white noise 的自相关和偏自相关函数*/
     clear 
     set obs 100
     gen x = invnorm(uniform())
     gen t = _n
     tsset t
     ac  x
    restore
  
  
  
* 视解释变量是否严格外生，相应的有两种检验方法
* PartI：解释变量严格外生
        
  * t 检验(Wooldridge)
    reg e1 L.e1                     /*AR(1)  假设解释变量严格外生*/
    reg e1 L.e1 ln_income           /*AR(1)  假设解释变量非严格外生*/
     * 看来此模型中，ln_income 可以视为严格外生的变量。

  * F 检验                   /* 适用于高阶自相关的情形*/
    reg e1 L(1/2).e1         /*AR(2)  假设解释变量均为严格外生变量*/
    test L.e1 L2.e1
    
  * D-W 检验　该方法仅能用于检验 AR(1) 形式的序列相关　
    qui reg consum income
    dwstat
    qui reg ln_consum ln_income
    dwstat                        
    qui reg D.ln_consum D.ln_income
    dwstat
    
  * Q 检验（Ljung and Box, 1979）
    wntestq e1
    wntestq e1,lag(3)  
  
  * Bartlett's periodogram-based test for white noise
    wntestb e1 
      preserve  /*截面资料的残差*/
         use B2_consume_cs.dta, clear
         tsset id
         reg consume income
         predict e, res
         wntestb e
      restore 
      preserve  /*white noise*/
         clear
         set obs 100
         gen w = invnorm(uniform())
         gen t = _n
         tsset t
         wntestb w
      restore 


* PartII：解释变量非严格外生
   * 模型
    qui reg ln_consum L.ln_consum ln_income  /*解释变量中包含内生变量 yt-1*/
    qui predict e2 if e(sample), res
    
   * t 检验，参考 Wooldridge(2004)
    qui reg e2  L.e2 L.ln_consum L.ln_income
    test L.e2 
    
   * D-W's h 检验
   qui reg ln_consum L.ln_consum ln_income
    estat durbinalt   /* h = (1-0.5d)*sqrt[T/(1-T*sc2)]*/

  * Breusch-Godfrey 检验       /*该检验适合于高阶自相关的检验*/

          * 采用stata自带命令 bgodfrey
    qui reg ln_consum ln_income
    bgodfrey,lag(2)
    bgodfrey,lag(2) small            /*检验统计量针对小样本进行了调整*/
     * 手动计算   
      gen L1e1 = L.e1
      gen L2e1 = L2.e1
      replace L1e1 = 0 if L1e1 == .
      replace L2e1 = 0 if L2e1 == .
      qui reg e1 L1e1 L2e1 ln_income
      local LM  = e(N)*e(r2)           /*see Greene(2000,E,4th) chp13 */
      local p   = 1 - chi2(2,`LM') 
      dis "LM = " `LM' "   p-value= " `p'
   * Bootstrap 检验
   


*-------------
*   估  计 
*-------------

 * 一些常用的处理方法: 取对数和差分
   use B2_lutkepohl.dta, clear
   tsset year
   reg ln_consum ln_income 
    dwstat
   reg D.consum D.income
    dwstat
   qui reg D.ln_consum D.ln_income
    dwstat  
    
 * Newey 稳健型估计(White1980估计的扩展)
   reg ln_consum ln_income 
    est store ols
   newey ln_consum ln_income , lag(1)
    est store newey1
   newey ln_consum ln_income , lag(2)
    est store newey2
   esttab ols newey1 newey2, b(%6.3f) se(%6.3f) mtitle(ols newey1 newey2)
   
 * GLS/FGLS 估计
   *--------
   * AR(1)
   *--------
   * 基本思路(pdf) 一阶准差分
   * Cochrane-Orcutt(1949) 估计(舍弃第一期观察值)
     prais ln_consum ln_income , corc  /*no converge*/
     prais ln_consum ln_income , rho(dw) corc two       
     est store Coch
   * Prais-Winsten(1954) 估计(对第一期观察值进行处理 sqrt(1-rho^2)*y1)
     prais ln_consum ln_income  
     prais ln_consum ln_income , rho(dw) two  
     est store Prais
   * 手动计算
     * step1: 计算相关系数
      qui reg ln_consum ln_income 
      qui dwstat
      local rho = 1 - r(dw)*0.5
     * step2: 转换数据  y* = y - rho*y(-1)
      gen cons = 1
      global indv "cons ln_consum ln_income "
      foreach var of varlist $indv{
          gen `var'_1 = `var' - `rho'*L.`var'
      }
     * Cochrane-Orcutt(1949) 估计
        reg ln_consum_1 ln_income_1 cons_1, nocons   /*常数项也要转换*/       
        est store Coch_hand
     * Prais estimation
       * Transform the first observation 
             qui reg ln_consum ln_income 
      qui dwstat
      local rho = 1 - r(dw)*0.5
         foreach var of varlist $indv{
           replace `var'_1 = sqrt(1-`rho'^2)*`var' in 1/1
         }
         reg ln_consum_1 ln_income_1 cons_1, nocons         
         est store Prais_hand
   * 结果对比
       esttab Coch Coch_hand Prais Prais_hand,  ///
                         mtitles(Coch Coch_hand Prais Prais_hand)
   * 更为合适的处理方式
     prais D.ln_consum D.ln_income 
     
   *--------  
   * AR(2)
   *--------
   * 处理思路：二阶准差分（pdf）
   use B2_consum2, clear
   tsset qtr
   qui reg lconsum lincome
   qui predict e, res
   pac e          /*检验二阶自相关*/   
   reg e L(1/2).e
   
   * 获得一阶和二阶相关系数：rho1, rho2
    qui reg e L1.e L2.e, nocons  /* qui reg e L(1/2).e, nocons */ 
    local rho1 = _b[L1.e]
    local rho2 = _b[L2.e]
     * 其他方法
      corrgram e, lags(10)  
      
   * 对所有变量进行二阶准差分转换
    gen const = 1              /*常数项也要转换*/
    foreach var of varlist const lconsum lincome{
       gen `var'_2 = `var' - `rho1'*L.`var' - `rho2'*L2.`var' 
    }
   * 估计方法1：Corch （舍弃前两期观察值）
     reg lconsum_2 lincome_2 const_2, nocons     
     dwstat
     est store Corch2
   * 估计方法2：Prais （对前两期观察值进行特殊处理）
     * 转换前两期观察值
       global indv "const lconsum lincome"
       local rr = sqrt(1-`rho2'^2)
       foreach var of varlist $indv{  
         local tempz1 = (1+`rho2')*(`rr'^4-`rho1'^2)/(1-`rho2')
         replace `var'_2 = -sqrt(`tempz1')*`var' in 1/1
         local tempz2 = `rho1'*`rr'/(1-`rho2')*`var'[1]
         replace `var'_2 = `rr'*`var' - `tempz2' in 2/2
       }
       reg lconsum_2 lincome_2 const_2, nocons 
       dwstat  
       est store Prais2

  * 比较结果
    esttab Corch2 Prais2, mtitles(Corch2 Prais2)
        
   
*---------------------
*  似无相关模型(SUE)
*---------------------

*----------
* 简 介
  sysuse auto,clear
* model1: price  = a0 + a1*foreign + a2*length + u1
* model2: weight = b0 + b1*foreign + b2*length + u2
  sureg (price foreign length) (weight foreign length)
  reg price  foreign length
  reg weight foreign length
  * 评论：若SUE模型中各方程有相同的解释变量，则系数估计等同于分别执行OLS
  * ？ 为何标准误不同？
* 小样本
  sureg (price weight = foreign length), small dfk 

*-------------------
* 三个以上的方程
  * 使用全局暂元定义方程
   global eq_price  price foreign weight length
   global eq_mpg    mpg   foreign weight
   global eq_displ  displ foreign weight turn
  * SUR 估计
   sureg ($eq_price) ($eq_mpg) ($eq_displ)
   
*---------------
* 检 验
  * 干扰项的相关性
    sureg ($eq_price) ($eq_mpg) ($eq_displ), corr
    * 另一个例子
     preserve
     use invest2.dta, clear
     sureg (invest1 market1 stock1)  ///
           (invest2 market2 stock2)  ///
           (invest3 market3 stock3)  ///
           (invest4 market4 stock4)  ///
           (invest5 market5 stock5), corr  
     restore
  * 系数检验
    sureg ($eq_price) ($eq_mpg) ($eq_displ)
    test foreign    
    test [price]weight = [displacement]weight
    test [#1]weight = [#2]weight, accum

*---------------
* 残差
sureg ($eq_price) ($eq_mpg) ($eq_displ)
predict res_price, equation(#1)           res
predict res_mpg  , equation(mpg)          res
predict res_disp , equation(displacement) res

*--------------
* 有限制的SUE
  constraint define 1 [price]foreign = [mpg]foreign
  constraint define 2 [price]foreign = [displacement]foreign
  sureg (price foreign length) (mpg displ = foreign weight), const(1 2)

*----------------
* 应用：一些检验

*-- Example 1: A Hausman test

    mlogit travmode age gender income
    est store ALL, title(analysis all means of transp.)
    mlogit travmode age gender income if travmode!=2
    est store B, title(analysis excluding travmode==2)

    suest ALL B
    test [ALL1=B1] [ALL3=B3], common

  *-If the observations are clustered on hhid
    suest All B, cluster(hhid)
    test [ALL1=B1] [ALL3=B3], common


*-- Example 2: Do coefficients vary between groups? ("Chow test")
    
    sysuse auto, clear
    reg price wei mpg length if foreign==1
    est store F
    reg price wei mpg length if foreign==0
    est store D
    suest F D
  *-联合检验 
    test [F_mean = D_mean], cons
  *-检验单个系数   [方程名称]变量名称
    test [F_mean]weight = [D_mean]weight

*-- Example 3: A non-linear Hausman-like test

    probit promotion edu exp ...
    est store Promo
    regress income edu exp ...
    est store Inc
    suest Promo Inc
    testnl [Promo]edu/[Promo]exp = [Inc]edu/[Inc]exp



* ---------- Over ------------------





* 一些相关的命令
* suest
* bitobit

          
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ===========================
          *         第三讲  非线性最小二乘法 
          *       ===========================
 

cd D:\stata9\ado\personal\Net_course\B3_NLS                   
          
*----------
* 简 介
* 非线性模型
* 估计方法：非线性最小二乘法、最大似然法(第四讲)
* NLS：转化为线性模型(泰勒展开等),数值算法逼近
     do B3_intro.do
     
* 参考资料：
* Davidson, R. and J.G. MacKinnon, 
*     Eoconometric Theory and Methods, 
*     Oxford University Press, 2004, Chp6.
* Greene, W.H., 
*     Econometric Analysis,
*     Prentice Hall International, Inc, 2000, Chp10.



*------------------------------
*    PartI：Stata8 用户
*------------------------------

*-----------------------
* 简介：程序的基本架构

* model： y = B0*(1 - e^(-B1*x))
  
  doedit nlexpgr.ado
  adopath + D:\stata9\ado\personal\Net_course\B3_NLS
  
  use B3_production.dta, clear
  gen x = capital
  nl expgr lnout  
  nl expgr lnout, init(B0=0, B1=2)
  nl expgr lnout, init(B0=3.4182, B1=6.8062)

  doedit nlexpgr2.ado   /*设定模型的标题*/
  nl expgr2 lnout

*-----------------    
* 模型的基本架构
*    program define nlfcn
*      version 8.0  
*      if "`1'" == "?"{
*          global S_1 "参数名称"
*          (global... 设定参数的初始值)
*          exit
*      }
*      replace `1' = ...定义模型的形式
*    end
* 执行：
*   nl 程序名称 被解释变量

*----------------------
* 范例2：CES 生产函数
* 模型: lny = B0 + A*ln{D*L^rho + (1-D)*K^rho}
*    参   数： B0, A, D, rho
* 被解释变量：lny；解释变量：L(劳动力投入), K(资本存量)
 
    doedit nlces1.ado
    
    nl ces1 lnoutput


*--------------------------------        
* 范例3：一般化部分调整模型
* 连玉君,钟经樊. 中国上市公司资本结构动态调整机制研究.南方经济,2007,(01):23-38.
* 模型：Y_t - Y_t-1 = A(Yo_t - Y_t-1)  0<A<1
*       Yo_t = Xb 
*            = b0 + b1*x1 + b2*x2 + ... 
*       A    = Zr 
*            = r0 + r1*z1 + r2*z2 + ...
* 变形：Y_t = A*Yo_t + (1-A)*Y_t-1

  doedit nldycs3.ado

  use B3_dycs.dta, clear
    gen tl_star = 0
    gen alpha  = 0
  nl dycs3 tl


*---------------------
* Stata 内设函数
/* (1) Exponential regression with one asymptote:
         exp3     y = b0 + b1*b2^x
         exp2     y =      b1*b2^x
         exp2a    y =      b1*(1-b2^x)
           twoway (function y= 5 + 2*3^x, range(0 3))    ///
                  (function y=     2*3^x, range(0 3))    ///
                  (function y=     2*(1-3^x), range(0 3)) 
   (2) Logistic function (symmetric sigmoid shape 对称S形)(*):
         log4     y = b0 + b1/(1 + exp(-b2*(x-b3)))
         log3     y =      b1/(1 + exp(-b2*(x-b3)))
           twoway (function y=1.5 + 1/(1+exp(-2*(x-3))), range(-5 10)) ///
                  (function y=      1/(1+exp(-2*(x-3))), range(-5 10))
   (3) Gompertz function (asymmetric sigmoid shape 非对称S形):
         gom4     y = b0 + b1*exp(-exp(-b2*(x-b3)))
         gom3     y =      b1*exp(-exp(-b2*(x-b3))
           twoway (function y=1.5 + 0.5*exp(-exp(-2*(x-3))), range(-3 10))  ///
                  (function y=      0.5*exp(-exp(-2*(x-3))), range(-3 10))
*/
  * 调用方式
    use B3_production.dta, clear
      nl exp3 lnoutput lnk
      nl gom4 lnoutput lnl


*--------------------------
*     需要注意的问题
*--------------------------

* 缺漏值
   use B3_production.dta, clear
   replace capital = . in 1/2
     nl ces1 lnoutput
   drop if capital == .
     nl ces1 lnoutput
   * 缺漏值的处理  
   sysuse nlsw88,clear
   sum
    egen mis = rowmiss(_all)
    drop if mis
   sum
     

*------------------------------
*    PartII：Stata9 用户
*------------------------------

*----------------
* Stata内设函数
  use B3_production.dta, clear
    nl exp3: lnoutput lnk
    nl gom4: lnoutput lnl
    
    
*--------------------------
* 使用命令定义非线性函数
  * 命令格式：nl (y = ... ...)
  *   参数放在 {} 中
  
  * model1：y = B0*(1-e^(-B1*x))
     use B3_production.dta, clear
     nl (lnoutput = {b0}*(1- exp(-1*{b1}*lnk)))        /*Stata自行设定初始值*/
     nl (lnoutput = {b0=10}*(1- exp(-1*{b1=1.5}*lnk))) /*人为设定初始值*/
     nl (lnoutput = {b0=1}*(1- exp(-1*{b1=0.5}*lnk)))  /*初始值不合适可能导致无法收敛*/
     
  * model2：y = B0*(1-e^(-B1*(c1*x1 + c2*x2 + ...)))  
     sysuse nlsw88, clear
     egen mis = rowmiss(_all)
     drop if mis
     nl (wage = {b0}*(1- exp(-1*{b1}*({c1}*ttl_exp+{c2}*tenure+{c3}*hours)))),  ///
              initial(b0 10  b1 0.2  c1 1.4  c2 5  c3 2)  

   
     
*----------------------
* 定义程序

 * CES 生产函数   
   doedit nlces9a.ado     /*stata9.0 版CES生产函数*/
      doedit nlces1.ado   /*stata8.0 版CES生产函数*/
   use B3_production.dta, clear
   nl ces9a @ lnout capital labor,  ///
         parameters(b0 rho delta) initial(b0 1 rho 1 delta 0.5) 
 /* 程序结构
     program define nl程序名称
       version 9
         syntax varlist[选项] if, at(name)
           从 `varlist' 分离出被解释变量和解释变量
           从 at 选项中分离出参数
           定义非线性函数
         replace `y' = ... `if'
     end   
 */         
  
 * 使用暂时性物件
   doedit nlces9b.ado 
     use B3_production.dta, clear
     nl ces9b @ lnout capital labor,  ///
         parameters(b0 rho delta) initial(rho 1 delta 0.5)
     est store m_full

 * if 选项的作用
     sum lnoutput 
     nl ces9b @ lnout capital labor if lnoutput>r(mean),  ///
         parameters(b0 rho delta) initial(rho 1 delta 0.5)      
     est store m_sub
     est table m_full m_sub, stat(N r2 r2_a) b(%6.3f)
     
 * 稳健型估计
     nl ces9b @ lnout capital labor,   ///
         parameters(b0 rho delta) initial(rho 1 delta 0.5) ///
         robust     
     est store m_robust
     est table m_full  m_robust, stat(N r2 r2_a) b(%6.3f) se(%6.3f)
 
 * 返回值
     eret list    
             
 * 拟合值和残差         
     nl ces9b @ lnout capital labor,   ///
        parameters(b0 rho delta) initial(rho 1 delta 0.5)
     predict y_hat
     predict e, res
     
     qui sum labor
     nl ces9b @ lnout capital labor if labor>r(mean),   ///
        parameters(b0 rho delta) initial(rho 1 delta 0.5)   
     predict y_hat2
     predict y_hat3 if e(sample)  
     list lnout y_hat2 y_hat3
     


*--------------------------
*   错误信息与程序的调试
*--------------------------

* 初始值
     use B3_production.dta, clear
     nl ces9b @ lnout capital labor,  ///
         parameters(b0 rho delta) initial(rho 1 delta 0.5)
     nl ces9b @ lnout capital labor,  ///   /*不当的初始值会产生问题*/
         parameters(b0 rho delta) initial(rho 0 delta 0.5)  
     nl ces9b @ lnout capital labor,  ///
         parameters(b0 rho delta) initial(rho 0.1 delta 0.9)    
        
* 无法收敛？
     use B3_production.dta, clear 
     nl exp2a: lnoutput lnl
     nl exp2a: lnoutput labor
         
* 局域最小还是全局最小？
  do B3_min.do
  

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *         第五讲  工具变量法与GMM 
          *       ==========================
          *               5.1  2SLS

cd D:\stata10\ado\personal\Net_course\B4_IV_GMM


*------------------------
* 简介：为什么使用IV/GMM？
*------------------------

*    y = x1*b1 + x2*b2 + ... + x_k*b_k + u    
* 
* 矩阵形式：
*
*    y = X*beta + u                           
*
* OLS 的基本假设： Cov[X,u] = 0


* 违反该假设的三种常见情况：

* (1) 内生性问题  Cov[X,u] != 0
*     b = inv(X'X)*X'y
*     E[b] = E[inv(X'X)*X'(X*beta+u)]
*          = E[inv(X'X)*X'X*beta] + E[inv(X'X)*X'u]
*          = beta + E[inv(X'X)*X'u]
*         != beta  

* (2) 遗漏变量(omitted-variable bias)
*     假设 y = a + x1*b1 + x2*b2 + e1
*            Corr(x1,x2) != 0
*     若估计中遗漏了 x2, 则估计模型为：
*          y = a + x1*b1 + e2   （e2=e1+x2*b2）
*     显然，Corr(x1,e2) != 0

* (3) 衡量偏误(measurement error in the regressor)
*     对于模型 y = x0*b + e
*     假设 x = x0 + me  (x 是 x0 的样本观测值)
*     即   x0 = x - me
*     模型的正确形式应为：
*          y = a + x0*b + e 
*            = a + (x - me)*b + e
*            = a + x*b + (e - me*b)
*            = a + x*b + e2
*     显然，
*          Corr(x,e2) != 0


*== 处理方法：IV 估计

  *- 基本思想：
  *     
  *     y = X*b + e
  *
  *   找到一个变量 Z,使得 Corr(Z,e)=0, Corr(X,Z) -> 1
  *
  *-- IV 视角
  *      Z'*y = Z'*X*b + Z'*e
  * =>   Z'*y = Z'*X*b_IV
  * =>   b_IV = inv(Z'X)*Z'y
  *
  *-- MM 视角
  *      Z'e = 0
  * =>   Z'(y - X*b) = 0
  * =>   Z'X*b = Z'y
  * =>   b_MM = inv(Z'X)*Z'y
   
  *-- 说明：
  *
  * (1) 在大样本下，IV 估计是一致的，即，Plim (1/N)X'e = 0
  *                                    N->oo   
  *
  * (2) 在小样本下，IV 估计并非无偏估计量，有些情况下偏误可能很严重。




*------------------------
* 两阶段最小二乘法（2SLS）
*------------------------

   * 对于模型:
   *
   *    y = x1*b1 + x2*b2 + e  假设 Corr(x2,e)!=0
   *
   *  若存在两个工具变量 z1 和 z2，我们我将得到两个 IV 估计量，
   *  问题：如何将这两个IV估计量合并起来？
   
   *-- 解决方法：两阶段最小二乘法——2SLS
   *   第一步：
   *     reg x2 on z1 z2, 得到 x2 的拟合值 x_2，x_2 可视为 x2 的工具变量
   *   第二步：
   *     reg y  on x1 x_2, 即执行 IV 估计。
   *
   *   特别说明：
   *     虽然基本思想是这样的，但我们不能如此操作，因为这种方法是错误的！
   
   *-- 理论推导： 
   *   
   *    y = X*b + u                 (1)
   *
   *-1   X = Z*b1 + u               (2)
   *  
   *     X_hat = Z*b1_OLS           (3)
   *           = Z*[inv(Z'Z)*Z'X] 
   *           = P_z*X  (其中，P_z = Z*inv(Z'Z)*Z')
   *
   *-2   y = X*b + u         
   *     b_2SLS = inv(X_hat'*X)*X_hat'*y     (4)
   *            = inv(X'*P_z*X)*X'*P_z*y
   *
   *    Var(b_2SLS) = sigma^2*inv(X'*P_z*X)  (5)
   *
   *    sigma^2 = e'*e/N   (e 表示残差向量)   (6) 
   *
   *    e = y - X*b_2SLS                     (7)
   
   * 特别注意：
   *     虽然从名称上来看，2SLS 似乎应该执行“两步法”，但这种做法是错误的；
   *     正确的估计式是 (4) 和 (5) 
   *  如果采用两步法，得到的残差序列是错误的：
   *     e = y - X_hat*b_2SLS
   *  而正确的估计式应该是 (7) 式！
   
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *         第五讲  工具变量法与GMM 
          *       ==========================
          *          5.2  2SLS的STATA实现   
          
          
 *----------------------------
 *-- stata实现：ivergress 命令
 *----------------------------  
   
     use hsng2.dta, clear
     des rent pcturban hsngval faminc reg2-reg4
     sum rent pcturban hsngval faminc reg2-reg4
   
   *-基本命令格式
     ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4)
        est store r2sls_0
     
   *-稳健型标准误
     ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4),vce(robust)
        est store r2sls_rb
        
   *-Bootstrap标准误    
     ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4), ///
                     vce(bs,reps(200))
        est store r2sls_bs
        
     local mm "r2sls_0 r2sls_rb r2sls_bs"
     esttab `mm', mtitle(`mm')  
     

   *-多个内生变量
   *
       ivregress 2sls rent (hsngval pcturban = faminc reg2-reg4)
   *
   * 说明：(1) 不可能单独为每个内生变量指定一组特定的工具变量；
   *       (2) 所有外生变变量都作为自己的工具变量；
 

*------------------------
*  识别问题和过度约束检验
*------------------------

* 识别：当有足够的工具变量使得模型的2SLS估计量唯一时，称为可以“识别”
   *
   * 对于 2SLS 估计量
   *      
   *     b_2SLS = inv(X_hat'*X)*X_hat'*y     (4)
   *            = inv(X'*P_z*X)*X'*P_z*y
   *    (其中，P_z = Z*inv(Z'Z)*Z') 
   * 参数能够唯一识别的条件是：
   *  (1) Z'Z 是非奇异矩阵；
   *  (2) rank(Z'X) = K （rank condition）
   * 注意： Z 是 NxL 矩阵， X 是 N*K 矩阵
   
   *- 识别不足、恰足识别和过度识别
   *                                    -粗略理解-           
   * 识别不足： rank(Z'X) < K   （工具变量的个数“少于”内生变量）
   * 恰足识别： rank(Z'X) = K   （工具变量的个数“等于”内生变量）
   * 过度识别： rank(Z'X) > K   （工具变量的个数“多于”内生变量）

   *- 说明：
   * (1) 虽然表面上看起来，过度识别似乎不好，但在大样本下，它比恰足识别更加有效；
   
     
   *--------------    
   *- 过度约束检验
   *
   * 基本思想：由于我们加入的工具变量多于内生变量，
   *          需要检验这些工具变量是否与干扰项相关，即工具变量是否合理
   *
   *  H0: 所有的工具变量均与干扰项不相关,即，Corr(Z,u)=0
   *       LM = N*R2 -- Chi2(r)
   *     其中，r 表示多余的工具变量的个数
   *
   * 拒绝原假设的两层含义：
   *  (1) 工具变量与干扰项相关；
   *  (2) 模型设定不合理，部分外生变量事实上可能是内生变量；
   * 因此，若拒绝原假设，则表明可能是工具变量选择不合理，也可能是模型设定有误。
   
   *                   表 4.1  estat overid 说明
   * -------------------------------------------------------------------
   *  Estimator   VEC          estat overid    
   * -------------------------------------------------------------------     
   *     2SLS     nonrobust   Sargan(1958), Basmann(1960)  chi2
   *     2SLS     robust      Wooldridge(1995)
   *     LIML     —          Anderson-Rubin(1950), Basmann(1960)            
   *     GMM      —          Hansen(1982) J-统计量
   * -------------------------------------------------------------------   
   
   *-例：
      use hsng2.dta, clear   
        ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4)
        estat overid
   *
   * 可能是模型中存在异方差所致，
   * 因为 Sargan 和 Basmann 统计量都要求满足同方差假设，
   * 当模型中存在异方差时，这两个统计量并不合理
   *
        ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4), robust
        estat overid 
            
            
   *----------------                                           
   *-- 弱工具变量问题
   *
   * 基本思想：
   *     虽然工具变量满足要求，即与干扰项不相关，与内生变量相关，
   *     但当 Z 和 X 的相关性较低时，2SLS 估计量存在严重偏误，
   *     Z 称为“弱工具变量”
   
       ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4),first  
       estat firststage
       
    * 结果释义：
    * (1) R2 越高表明内生变量与工具变量之间的相关性越高，
    *     此时，IV 估计的偏误就越小；
    * (2) 只看 R2 和 adj-R2 并不合理，
    *     因为,一阶段回归不仅包含我们设定的工具变量，还包含模型中的外生变量；     
    *     此时，应该看 partial-R2，
    *     含义：在控制 pcturvan 影响的前提下，看其它变量对 hsngval 的解释力 
      preserve
        use hsng2.dta, clear
        *从 hsngval 中剔除 pcturban 的影响
        qui reg hsngval pcturban  
        predict e, res
        *从各工具变量中剔除 pcturnban 的影响
        foreach v of varlist faminc reg2-reg4{ 
          qui reg  `v' pcturban
          predict ex_`v', res
        }
        reg e ex_* 
      restore  
     *
     * F(4,44) 的含义: 四个工具变量的联合显著性
     *
     *  说明：(1) 传统意义上的 5% 甚至 1% 显著，
     *            并不足以表明工具变量与内生变量之间的相关性足够强；     
     *        (2) Stock,Wright and Yogo(2002) 采用MC研究表明,
     *            使用 2SLS 时，若只有一个内生变量，F>10 方可。    
       
       
     *- 例：弱工具变量问题
   
     use griliches.dta, clear
     des lw s expr tenure rns smsa iq med kww age mrt
     sum lw s expr tenure rns smsa iq med kww age mrt, sep(0)
      
     ivregress 2sls  lw s expr tenure rns smsa _I* (iq=med kww age mrt), first             
     estat firststage


          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *         第五讲  工具变量法与GMM 
          *       ==========================
          *               5.3  GMM


* 安装相关命令：
  ssc install overid, replace
  ssc install ivreset, replace
  ssc install ivhettest, replace
  ssc install ivendog, replace
  ssc install ivreg2, replace
  ssc install ranktest, replace
  ssc install ivactest, replace
  
  
  
*------------------------
*   广义矩估计法（GMM）
*------------------------

*-- GMM 的基本思想

  * 模型： 
  *
  *   y_i = x_i*b + u_i
  
  * 矩条件为(针对每个观察值)：
  *   E[Z*u] = 0
  *
  *   g_i(b) = Z_i'*u_i = Z_i'*(y_i - x_i*b)
  
  * 对应的样本矩条件为：
  *                  N                  N
  *   g(b) = (1/N)* SUM g_i(b) = (1/N)*SUM z_i'(y_i-x_i*b) 
  *                 i=1                i=1  
  * GMM 的基本思想便是：
  *   求解 g(b)=0, 得到 b_GMM 估计量。
  
  * 若模型是“恰足识别”的，则可直接求解上述矩条件，此时
  *     b_GMM = b_2
  * 但多数情况下，我们面对的都是“过度识别”问题，
  * 此时可寻找 b_GMM, 使得 g(b_GMM) 尽量接近于零，
  * 通常，我们求解如下一般化目标函数,使之最小化：
  *
  *   J(b_GMM) = N*g(b_GMM)'*W*g(b_GMM)
  * 
  * 其中，W 为权重矩阵
  
  * 由一阶条件可得：
  *
  *    b_GMM = inv(X'ZWZ'X)*X'ZWZ'Y
  *
  * 其中，X 是解释变量构成的矩阵；
  *       Z 是工具变量构成的矩阵；
  *       W 是权重矩阵；
  *       Y 是被解释变量构成的列向量；
  
  * Hansen(1982) 提出如下最优权重矩阵：
  *
  *    W = inv(S)   S = E[Z'*B*Z]    B = u*u'(残差的方差-协方差矩阵)    
  
  
  *== 不同情况下，最优权重的设定 
  *  
  *-1- 同方差假设：
  *  
  *   B = u*u' = sigma^2 * I_N
  *   
  *  此时，b_GMM = b_IV
  
  *-2- 异方差假设：
  *               N
  *   B = (1/N)* SUM u_i^2 * Z_i'*Z_i  (类似于 White_1980 估计量)
  *              i=1
  
  *-3- 组内相关(within cluster correlation)
  *        M
  *   B = SUM u_j'*u_j  (j 表示样本中的第 j 个小组)
  *       j=1 
  *
  *  u_j = (y_i-x_i*b)X'Z*inv(Z'Z)*z_j
  
  *-4- 同时考虑异方差和序列相关—— HAC 标准误
  *
  *  采用 Newey-West(1987) 估计量计算 B 矩阵
   
   
   
*-------------   
*-- STATA 实现
*-------------
   
   use hsng2.dta, clear  
 
 *-------------------------------------  
 *= 权重矩阵 W 的设定——wmatrix() 选项
    
   *- 同方差假设
     ivregress gmm rent pcturban (hsngval = faminc reg2-reg4),wmatrix(unadjusted)
       est store gmm_homo
     ivregress 2sls  rent pcturban (hsngval = faminc reg2-reg4)
       est store r2sls
     local mm "gmm_homo r2sls"
     esttab `mm', mtitle(`mm')

   *- 异方差假设（默认设定,真正意义的GMM）
     ivregress gmm rent pcturban (hsngval = faminc reg2-reg4),wmatrix(robust)
       est store gmm_het
     
   *- 考虑组内相关性（假设各个人口分区内的州存在相关性）
     ivregress gmm rent pcturban (hsngval = faminc reg2-reg4),  ///
                                  wmatrix(cluster division)
       est store gmm_cluster

     local mm "gmm_homo gmm_het gmm_cluster"
     esttab `mm', mtitle(`mm')
       
    
 *--------------------------  
 *= 标准误的计算——vce()选项
 
    * 基本规则：
    *   (1) 采用 GMM 进行估计时，即 ivregress gmm 命令，
    *       vce() 选项中的内容会自从与 wmatrix() 中一致；
    *   (2) 若希望采用 Bootstrap 获得标准误，则可填写 vce(bs,rep(50))，如
    *
      ivregress gmm rent pcturban (hsngval = faminc reg2-reg4), ///
                  wmatrix(robust) vce(bs,reps(200))
         est store gmm_bs
         
     local mm "gmm_het gmm_bs"
     esttab `mm', mtitle(`mm')       
          
                
 *--------------------------  
 *= 迭代GMM估计量——igmm选项
 
      ivregress gmm rent pcturban (hsngval = faminc reg2-reg4), ///
                  wmatrix(robust) igmm 
         est store gmm_igmm

     local mm "gmm_het gmm_igmm"
     esttab `mm', mtitle(`mm')   
      

 *---------------------------  
 *= t 值和 F 值—— small选项

      ivregress gmm rent pcturban (hsngval = faminc reg2-reg4), ///
                  wmatrix(robust) small 
         est store gmm_small

     local mm "gmm_het gmm_small"
     esttab `mm', mtitle(`mm')  



*------------------------
*    GMM 中的相关检验
*------------------------

*-- 检验 GMM 的过度约束条件
   * 
   * 基本思想：类似于2SLS中的过度识别检验，检验工具变量的设定是否合理
   *
   * H0: 模型设定是正确的，过度约束是合理的
   
   * 统计量：
   *  
   *   J(b_GMM) = N*g(b_GMM)'*inv(S)*g(b_GMM) -- Chi2(r)
   * 
   *  其中，r 为过度约束的个数，
   *        S = E[Z'*B*Z]    B = u*u'(残差的方差-协方差矩阵) 
   
   * stata 实现：
     use hsng2.dta, clear  
     ivregress gmm rent pcturban (hsngval = faminc reg2-reg4), ///
                  wmatrix(robust) small 
     estat overid             


*-- 检验部分工具变量的合理性
   * 
   * 问题所在：当工具变量的个数较多时，Hansen 检验的Power较低，
   *           因为任何一个多几个工具变量不合理都可能导致原假设被拒绝。
   * 因此，我们有必要进一步检验部分工具变量是否合理
   
   * 检验统计量：C test, 或 difference-in-Sargan test
   *
   *   C_J = J(FULL) - J(SUB)
   *
   *  其中，J(FULL) 为使用所有工具变量时得到的 Hansen-J 统计量 
   *        J(SUB) 为剔除一部分可疑工具变量后得到的 Hansen-J 统计量
   * 
   * H0: 被剔除的工具变量是合理的
   *   C_J -- Chi2(s)   s 为被剔除工具变量的个数  
   
   *- STATA 实现：
     use griliches.dta, clear
     des
     sum 
     ivreg2 lw s expr tenure rns smsa _I* (iq = med kww age mrt), ///
                   gmm2s robust orthog(s)  
     *--结果释义：
     *   (1) C_J 拒绝了原假设， Hansen-J 也拒绝了原假设
     *       表明：s 并非一个合理的工具变量，但此时模型设定是不是很合理
     *   (2) Underidentification test
     *       H0: 模型存在识别不足问题，即 rank(Z'X) < K
     *   (3) Weak identification test 
     *       H0: 内生变量与工具变量之间的相关性较低(此时GMM估计量可能存在严重的偏误)    
     
     
     * 检验多个工具变量是否合理
     ivreg2 lw s expr tenure rns smsa _I* (iq = med kww age mrt), ///
                   gmm2s robust orthog(age mrt)  
                            
     ivreg2 lw s expr tenure rns smsa _I* (iq = med kww), ///
                   gmm2s robust    
     * 此时，Hansen-J 统计量无法拒绝原假设，iq 变量也是显著的

     
     
*-- 检验是否存在内生性问题

   *= Durbin-Wu-Hausman 检验
   
   * H0：模型不存在内生性问题
   *
   *- 基本思想：
   *  若 H0 为真，则 b_OLS 和 b_GMM 都是一致的，但 b_OLS 更加有效；
   *  若 H0 为假，则 b_GMM 仍然是一致的，而 b_OLS 则是有偏的；
   
   *- 统计量：
   *
        H = (b_GMM - b_OLS)'*D*(b_GMM - b_OLS)
   *
   *      其中，D = inv(Var[b_GMM]-Var[b_OLS]) 
       
   *  H -- Chi2(k)  k 表示内生变量的个数；
   
     use hsng2.dta, clear  
     ivregress gmm rent pcturban (hsngval = faminc reg2-reg4), small
        est store gmm 
     regress rent pcturban hsngval              
        est store ols
        
     hausman gmm ols      
     hausman gmm ols, sigmamore       
     hausman gmm ols, sigmaless       
        
        
   * 方法二：使用 ivreg 和 ivendog 命令  
     ivreg  rent pcturban (hsngval = faminc reg2-reg4)
     ivendog
     
 
     


*------------------------------ OVER ---------------------------------

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第五讲 最大似然法 MLE 
          *       ==========================
          
cd D:\stata10\ado\personal\Net_course\B5_mle
adopath + D:\stata10\ado\personal\Net_course 


*================
* MLE 的基本原理
*================
* 参见pdf文档


*================
* MLE 的基本步骤
*================
* 1. 推导最大似然函数
* 2. 编写似然函数的stata程序(可选：似然函数的一阶和二阶导数)
* 3. 设定解释变量和被解释变量，完整设定：ml model 命令
* 4. 估计最大似然函数：ml maximize 命令


*==================================
*  一个简单的实例：多元线性回归模型
*==================================

* 变量的 均值-方差
* Assumption：x_i -- i.i.d. N(u, sigma^2)
* 待估参数 [u, sigma^2]

* 对数似然函数(简单设定)：
*     lnL = Sum{ln Normal[(x_i-u)/s]} - ln(sigma)
* 对数似然函数(完整设定)：
*     lnL = -0.5*N*ln(2*pi) - 0.5*N*ln(sigma^2) - (1/(2*sigma^2))*Sum(x_i-u)^2  
  
  doedit mymean_lf.ado
*---------------------------------------------------------------*
  cap program drop mymean_lf
  program define mymean_lf

     version 9.1        /*声明Stata版本*/
     args  lnf mu sigma /*输入项：似然函数，参数1，参数2，……*/
	
     quietly replace `lnf' = ln(normalden($ML_y1, `mu', `sigma')) 
                        /*$ML_y1 默认写法，表示被解释变量*/
   end
*---------------------------------------------------------------*
  * 说明：normalden(x,m,s) = normalden((x-m)/s)/s   if s>0
  * 参见：help density functions
  sysuse auto, clear
  gen cons = 1
  ml model lf mymean_lf (Mean: price = cons) (Sigma: )
  ml maximize
  sum price
  
* 另一种设定方法：
  doedit mynormal0_lf.ado
*----------------------------------------------------------------*
  cap program drop mynormal0_lf
  program define mynormal0_lf
     version 9.1        
     args  lnf mu sigma 
     quietly replace `lnf' = ln(normalden(($ML_y1 - `mu')/`sigma')) - ln(`sigma')
   end
*----------------------------------------------------------------*
  ml model lf mynormal0_lf (Mean: price=cons) (Sigma: )
  ml check
  ml maximize
  
  
  
*-- 线性回归模型

*  基本思想：y_i -- N(u_i, sigma^2)
*  将 y_i 的期望设定为某些变量的线性函数，即
*   E[y_i] = u_i = x_i*b，可以得到：
*   y -- N(xb, sigma^2)   
  
  sysuse auto, clear
  ml model lf mymean_lf (price=mpg wei len) (sigma: )
  ml maximize
  est store mle_reg
  
  * 与 OLS 结果的对比
  reg price mpg wei len
  est store ols_reg
  esttab mle_reg ols_reg, mtitle(mle_reg ols_reg) 


*-- 异方差

*  基本思想：y_i -- N(u_i, sigma_i^2)
*  将 y_i 的方差也设定为某些变量的线性函数，
*     E[y_i] = u_i       = x_i*b，
*   Var[y_i] = sigma_i^2 = z_i*h, 可以得到：
*   y_i -- N(x_i*b, z_i*h)
    
  ml model lf mymean_lf (price=mpg wei len) (sigma: wei) 
  ml maximize
  
  

*================
*  ml 命令的选项
*================

* -- 选取部分样本 -- [if] 副指令
  ml model lf mymean_lf (price=mpg wei len) (sigma:) if foreign==1 
  ml maximize
  est store mle_foreign
  ml model lf mymean_lf (price=mpg wei len) (sigma:) if foreign==0
  ml maximize
  est store mle_domestic
  * 结果对比
  local model "mle_foreign mle_domestic mle_reg"
  esttab `model', mtitle(`model')
  
  
* -- 稳健型标准误 -- [vce(robust)] 选项
  ml model lf mymean_lf (price=mpg wei len) (sigma:), vce(robust) 
  ml maximize
  est store mle_reg_rob
  * OLS 稳健型估计
  reg price mpg wei len, robust
  est store ols_reg_rob
  * 结果对比
  local model "mle_reg mle_reg_rob ols_reg_rob"
  esttab `model', mtitle(`model')
   
   
* -- 附件约束条件 -- constraint 命令
  sysuse auto, clear
  constraint 1 weight = -displacement   /*定义约束条件*/
  ml model lf mymean_lf (price = weight displacement len) (sigma:), constraint(1)
  ml maximize

  * 估计 C-D 生产函数
  use B5_production, clear
  constraint 2 lnk + lnl = 1
  ml model lf mymean_lf (lnoutput = lnk lnl) (sigma:), constraint(2)
  ml max
  
  reg lnoutput lnk lnl /*对比：不施加任何约束的结果*/
  
  
* -- 截面相关或组间相关 --
  sysuse nlsw88, clear

  ml model lf mymean_lf (wage = race married occupation ttl_exp) (sigma:), ///
                        cluster(industry)
  ml max
  est store cluster
  
  ml model lf mymean_lf (wage = race married occupation ttl_exp) (sigma:)
  ml max
  est store nocluster
  
  local model  "nocluster cluster"
  esttab `model', mtitle(`model')
  
 
* -- 选择合适的最大化方法 --  technique()选项
  * technique(nr)   Newton-Raphson (default)
  * technique(bhhh) Berndt,Hall,Hall,Hausman(1974)      
  * technique(dfp)  Davidon,Fletcher,Powell
  * technique(bfgs) Broyen,Fletcher,Goldfarb,Shanno
  
  sysuse auto, clear
  ml model lf mymean_lf (price = wei len) (sigma:)
  ml max  
  est store nr
  
  ml model lf mymean_lf (price = wei len) (sigma:), technique(bhhh)
  ml max  
  est store bhhh
  
  ml model lf mymean_lf (price = wei len) (sigma:), technique(dfp)
  ml max  
  est store dfp
  
  local model nr bhhh dfp
  esttab `model', mtitle(`model') scalar(N ic)
  * 评论：(1)采用不同的算法，迭代次数和结果会存在很大的差异
  *       (2)采用不同的数值算法便于我们找到全局最大值(尤其是对于较难收敛的问题)
  *       (3)默认情况下，stata会将每种算法迭代5次，以便找出最佳的迭代方式。
  
  * 不同数值算法的组合使用
  ml model lf mymean_lf (price = wei len) (sigma:), tech(bhhh 3 nr 6)
  ml max    
  
  
  
*===================
*  暂时性变量的使用
*===================
* Weibull模型(参见 pdf 文档)

  * 使用暂时性变量的重要性：
  * (1) 使得似然函数简单明了，便于程序的勘误和调试；
  * (2) 暂时性变量要使用`double'(双精度型变量)，可以提高计算的精度，便于收敛
  * (3) 在执行MLE之前，设定 set type double 是一个不错的习惯
*------------------------------------------*
program myweibull_lf
    version 9.2
    args lnf leta lgam
    tempvar p M R
    quietly {
        gen double `p' = exp(`lgam')
        gen double `M' = ($ML_y1*exp(-`leta'))^`p'
        gen double `R' = ln($ML_y1)-`leta'
        replace `lnf' = -`M' + $ML_y2*(`lgam'-`leta'+(`p'-1)*`R')
    }
end
*------------------------------------------*
sysuse cancer, clear
gen drug2 = drug==2
gen drug3 = drug==3
ml model lf myweibull_lf (lneta: studytime died = drug2 drug3 age) /lngamma
ml max

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第五讲 最大似然法 MLE 
          *       ==========================
          *              Part II
          
cd D:\stata10\ado\personal\Net_course\B5_mle
adopath + D:\stata10\ado\personal\Net_course 


*================
*  非线性设定
*================
*see MLE p.61
* 模型：y = b0 + b1*x1 + b2*x2 + b3*x3^{b4} + u

doedit mynonlin_lf.ado

sysuse nlsw88, clear
keep if race == 2
gen x3 = age
gen ln_wage = ln(wage)
gen ln_hour = ln(hours)
ml model lf mynonlin_lf (ln_wage=x3 ln_hour) /beta3 /beta4 /sigma
ml max

ml max, iterate(100)  /*一种无奈之举*/



*===================
*  实例：Logit模型
*===================
* 模型：参见 pdf 文档

doedit mylogit_lf.ado

*-------------------------------------------------
  cap program drop mylogit_lf
  program define mylogit_lf
    version 9
    args lnf xb
    qui replace `lnf' = ln(invlogit( `xb')) if $ML_y1 == 1
    qui replace `lnf' = ln(invlogit(-`xb')) if $ML_y1 == 0   
  end
*-------------------------------------------------
  
  sysuse auto, clear
  ml model lf mylogit_lf (foreign =price wei len)
  ml max    



*===================
*  实例：Probit模型
*===================
* 参见 pdf 文档

doedit myprobit_lf.ado

*---------------------------------------------------------
   cap program drop _all
   program define myprobit_lf
      version 9
      args lnf xb
   
      qui replace `lnf' = ln(normal( `xb')) if $ML_y1 == 1
      qui replace `lnf' = ln(normal(-`xb')) if $ML_y1 == 0
   end
*---------------------------------------------------------

  sysuse auto, clear
  ml model lf myprobit_lf (foreign =price wei len )
  ml max
  
  sysuse cancer, clear
  gen drug2 = drug==2
  gen drug3 = drug==3
  ml model lf myprobit_lf (lneta:  died = drug2 drug3 age) 
  ml max

 
 
*================
* 初始值的设定
*================
* (1) ml maximize 将初始值设定为 theta = (0,0,……,0)
* (2) 增加一个步长 (step),如 0.001,然后进行下一轮的计算和搜索。

* 搜索和设定初始值的途径： (see p.147)
* (1) ml search (Stata 自身提供了多种快速搜索初始值的方法)
* (2) ml plot (图示迭代次数和log-likelihood value)
* (3) ml init 认为设定初始值，可以根据理论或前期估计结果

  sysuse auto, clear
  ml model lf mymean_lf (price = wei len) (sigma:)
  ml search
  ml max
  
  * 我们可以先设定初始值，再让Stata以该初始值为基础进行搜索
  ml model lf mymean_lf (price = wei len) /sigma
  ml init /sigma = 3   /*这里的 /sigma 与此前的 (sigma:) 等价*/
  ml search
  ml max  
  
  * 将所有初始值预先放在一个向量中
  use B5_production, clear
  ml model lf mymean_lf (lnoutput = lnk lnl) (sigma:)
  ml max
  
  ml model lf mymean_lf (lnoutput = lnk lnl) (sigma:)
  mat b = (0.3, 0.7, 0, 1)
  ml init  b , copy
  ml query
  ml max
 


*==================
* 程序的勘误和调试
*==================
  set trace on
* see p.144

*-- 使用 ml check 命令
  
   sysuse auto, clear
   ml model lf myprobit_bad_lf (foreign = mpg weight)
   ml check
   doedit myprobit_bad_lf.ado

*-- 使用 set trace on 命令
   ml model lf myprobit_bad_lf (foreign = mpg weight)
   set trace on 
   ml max
   set trace off

*-- 使用 ml trace on 命令
   ml model lf myprobit_bad_lf (foreign = mpg weight)
   ml trace on 
   ml max



*======================
* 似然比检验 (LR test)
*======================

  * 统计量：
  *    LR = -2(LL_full - LL_part) -- Chi2(r)
  *   r 表示约束的个数 
  
  
  sysuse auto, clear
  ml model lf mymean_lf (price = wei len) (sigma:)
  ml max  
  est store r0
  
  ml model lf mymean_lf (price = wei len mpg foreign) (sigma:)
  ml max  
  est store r1
  
  lrtest r0 r1
  
  
  * regress 命令完成后也可以采用 lrtest 命令进行 LR test
  reg price wei leng
  est store r0
  reg price wei leng turn gear mpg
  est store r1
  lrtest r0 r1


  * 检验异方差
  ml model lf mymean_lf (price=mpg wei len) (sigma:) 
  ml maximize
     est store homo
  ml model lf mymean_lf (price=mpg wei len) (sigma: wei) 
  ml maximize
     est store het
  lrtest homo het
  
           
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================

*---- 目录 -----
*
*-- 简介
*   6.1  时间序列数据的处理
*-- 平稳时间序列模型
*   6.2  ARIMA 模型
*   6.3  VAR 模型
*-- 非平稳时间序列模型
*   6.4  非平稳时间序列简介
*   6.5  单位根检验
*   6.6  协整分析
*-- 自回归条件异方差模型
*   6.7  GARCH 模型 

cd d:\stata10\ado\personal\Net_Course\B6_TimeS


*=======================
*  时间序列数据的处理      help time
*=======================

* 声明时间序列：tsset 命令
  use gnp96.dta, clear
  list in 1/20
  gen Lgnp = L.gnp

  tsset date
  list in 1/20
  gen Lgnp = L.gnp

* 检查是否有断点
  use gnp96.dta, clear
  tsset date
  tsreport, report
  drop in 10/10
  list in 1/12
  tsreport, report
  tsreport, report list  /*列出存在断点的样本信息*/

* 填充缺漏值
  tsfill
  tsreport, report list
  list in 1/12

* 追加样本
  use gnp96.dta, clear
  tsset date
  list in -10/-1
  sum
  tsappend , add(5)   /*追加5个观察值*/
  list in -10/-1
  sum

  * 应用：样本外预测
  reg gnp96 L.gnp96
  predict gnp_hat
  list in -10/-1

* 清除时间标识
  tsset, clear



*---------------------
*  变量的生成与处理
*---------------------

*--- 滞后项、超前项和差分项  help tsvarlist
  use gnp96.dta, clear
  tsset date
  gen Lgnp  = L.gnp96   /*一阶滞后*/
  gen L2gnp = L2.gnp96  /*二阶滞后*/
  gen Fgnp  = F.gnp96
  gen F2gnp = F2.gnp96
  gen Dgnp  = D.gnp96
  gen D2gnp = D2.gnp96
  list in 1/10
  list in -10/-1


*--- 产生增长率变量: 对数差分
  gen lngnp = ln(gnp96)
  gen growth = D.lngnp 
  gen growth2 = (gnp96-L.gnp96)/L.gnp96
  gen diff = growth - growth2
  list date gnp96 lngnp growth* diff in 1/10



*---------------------
*      日期的处理
*--------------------- 
 
*--- 日期的格式  help tsfmt
* 
* 基本时点：整数数值，如 -3, -2, -1, 0, 1, 2, 3 ....
*           1960年1月1日，取值为 0；
* 显示格式：
*      -------------------------------
*        定义     含义     默认格式
*      -------------------------------
*        %td       日      %tdDlCY
*        %tw       周      %twCY!ww
*        %tm       月      %tmCY!mn
*        %tq       季度    %tqCY!qq
*        %th       半年    %thCY!hh
*        %ty       年      %tyCY
*      ------------------------------- 


* 使用 tsset 命令指定显示格式
  
  use B6_tsset.dta, clear
  tsset t, daily 
  list
  
  use B6_tsset.dta, clear
  tsset t, weekly
  list 
  
 
* 相同的基本时点，采用不同的方式显示会有不同的效果
  clear
  set obs 100 
  gen t = _n
  replace t = t-3 
  local format "td tw tm tq th ty"
  foreach f of local format{
    gen t_`f' = t
    format t_`f' %`f'
  }
  list in 1/20
* 说明：同样的数值，采用不同的显示方式，会有完全不同的含义


* 指定起始时点
  cap drop month
  generate month = m(1990-1) + _n - 1
  format month %tm
  list t month in 1/20
  
  cap drop year
  gen year = y(1952) + _n - 1
  format year %ty
  list t year in 1/20

* 设定不同的显示格式  help dfmt
*
*   日期的显示格式 %d (%td) 定义如下：
*    %[-][t]d<描述特定的显示格式>
* 
* 具体项目释义：
*   “<描述特定的显示格式>”中可包含如下字母或字符
*       c y m l n d j h q w _ . , : - / ' !c
*       C Y M L N D J     W
* 定义如下：
/*
   c and C   世纪值(个位数不附加/附加0)   
   y and Y   不含世纪值的年份(个位数不附加/附加0)
   m         三个英文字母的月份简写(第一个字母大写) 
   M         英文字母拼写的月份(第一个字母大写)
   n and N   数字月份(个位数不附加/附加0)
   d and D   一个月中的第几日(个位数不附加/附加0)
   j and J   一年中的第几日(个位数不附加/附加0)
   h         一年中的第几半年 (1 or 2)
   q         一年中的第几季度 (1, 2, 3, or 4)
   w and W   一年中的第几周(个位数不附加/附加0)
   _         display a blank (下划线)
   .         display a period(句号)
   ,         display a comma(逗号)
   :         display a colon(冒号)
   -         display a dash (短线)
   /         display a slash(斜线)
   '         display a close single quote(右引号)
   !c        display character c (code !! to display an exclamation point)
*/
*
* 例如：
*       Format        Sample date in format
*       -----------------------------------
*       %td           07jul1948            
*       %tdM_d,_CY    July 7, 1948         
*       %tdY/M/D      48/07/11             
*       %tdM-D-CY     07-11-1948           
*       %tqCY.q       1999.2               
*       %tqCY:q       1992:2               
*       %twCY,_w      2010, 48  
*       -----------------------------------  
* 又如：
*       Format       Sample date in format
*       ----------------------------------
*       %d           11jul1948            
*       %dDlCY       11jul1948            
*       %dDlY        11jul48              
*       %dM_d,_CY    July 11, 1948        
*       %dd_M_CY     11 July 1948         
*       %dN/D/Y      07/11/48             
*       %dD/N/Y      11/07/48             
*       %dY/N/D      48/07/11             
*       %dN-D-CY     07-11-1948  
*       ----------------------------------
   clear
   set obs 100
   gen t = _n + d(13feb1978)
   list t in 1/5
   
   format t %dCY-N-D  /*1978-02-14*/
   list t in 1/5
   
   format t %dcy_n_d  /*1978 2 14*/
   list t in 1/5

   use B6_tsset, clear
   list
   tsset t, format(%twCY-m)
   list
   
  * 一个实例：生成连续的时间变量
    use e1920.dta, clear
    list year month in 1/30
    sort year month
    gen time = _n
    tsset time
    list year month time in 1/30
    
    generate newmonth = m(1920-1) + time - 1
    tsset newmonth, monthly
    list year month time newmonth in 1/30
    
    
    
*--- 处理日期的函数      

   help dates_and_times

   help time-series functions
   
  * 以下适用于 STATA9.2 版本
  *-- 时间序列日期概览          help tdates
  *-- 将文字变量转换为日期      help dlyfcns
  *-- 利用年、月、季度转换日期  help dlyfcns
  *-- 日期转换函数              help dcfcns


*-----------------------
*      图解时间序列      
*-----------------------
* help  tsline
* 例1：
  clear
  set seed 13579113
  sim_arma ar2, ar(0.7 0.2) nobs(200)
  sim_arma ma2, ma(0.7 0.2) 
  tsset _t
  tsline ar2 ma2
  * 亦可采用 twoway line 命令绘制，但较为繁琐
  twoway line ar2 ma2 _t

* 例2：增加文字标注
   sysuse tsline2, clear
   tsset day
   #delimit ;
   tsline calories, ttick(28nov2002 25dec2002, tpos(in))
              ttext(3470 28nov2002 "thanks"
                    3470 25dec2002 "x-mas", orient(vert));
   #delimit cr

* 例3：增加两条纵向的标示线
   sysuse tsline2, clear
   tsset day
   tsline calories, tline(28nov2002 25dec2002)
   * 或采用 twoway line 命令
   local d1 = d(28nov2002)
   local d2 = d(25dec2002)
   line calories day, xline(`d1' `d2')

* 例4：改变标签
   tsline calories, tlabel(, format(%tdmd)) ttitle("Date (2002)")
   tsline calories, tlabel(, format(%td))
      
   
   
   


         
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *            6.2  ARIMA 模型
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS           
             
*=======================
*   平稳时间序列模型     
*=======================

*-----------------
*   ARIMA 模型       help arima
*-----------------
*-- AR 过程与 MA 过程
*-- 自相关系数与偏自相关系数
*-- 滞后阶数的筛选
*-- 估计
*-- 预测


* -- 简介 --

* AR 过程(自回归过程)
* AR(1): y_t = rho*y_{t-1} + u_t 
* AR(p): y_t = r_1*y_{t-1} + r_2*y_{t-2} + ... + r_p*y_{t-p} + u_t

  clear
  sim_arma y_ar, ar(0.9) nobs(300)
  line y_ar _t, yline(0)
  
  *-----------------------------------------------------------
  * 自相关系数(ACF)
  *                 Cov[y_t, y_{t+s}]
  *          r_s = -------------------
  *                      Var[y_t]  
  * 偏自相关系数(PACF)
  *   y_t = a11*y_{t-1} + u_t
  *   y_t = a21*y_{t-1} + a22*y_{t-2} + u_t
  *     ...
  *   y_t = ak1*y_{t-1} + ak2*y_{t-2} + ... + akk*y_{t-k} + u_t
  *
  * PACF 为 {a11, a22, a33, ... , akk}
  * 相当于控制其它滞后项的影响后，得到的“净”相关系数
  *-----------------------------------------------------------  
  
  ac  y_ar       /*AR过程的  ACF 具有“拖尾”特征，长期记忆*/
  pac y_ar       /*AR过程的 PACF 具有“截尾”特征*/
  
  * 评论：根据AC和PAC图形可以初步判断某个序列是否为AR过程
  *       具体表现为：
  *       (1) AC  图“拖尾”  
  *       (2) PAC 图“截断”(截断处对应的阶数就是AR的滞后阶数P)
  
  
* MA 过程(移动平均过程)
* MA(1): y_t = theta*u_{t-1} + u_t 
* MA(q): y_t = theta1*u_{t-1} + theta2*u_{t-2} + ... + thetaq*u_{t-q} + u_t
  sim_arma y_ma, ma(0.8)
  line y_ma _t, yline(0)
  
  ac  y_ma       /*MA过程的  ACF 具有“截尾”特征，短期记忆*/      
  pac y_ma       /*MA过程的 PACF 具有锯齿型“拖尾”特征*/
  
  
* 稳定性与可逆性
* 定义：协方差稳定(Covariance Stationary)
*       a. E[y_t] 独立于 t；
*       b. Var[y_t] 是一个有限的正常数，且独立于 t；
*       c. Cov[y_t,y_{t+s}] 是 s 的有限函数，但与 t 无关。
* 稳定的AR过程和MA过程可以相互转换


* ARIMA 模型
*      y_t = x_t*b + u_t                         结构方程
*      u_t = rho*u_{t-1} + theta*v_{t-1} + v_t   干扰项，ARMA(1,1)
*            一阶自相关     一阶移动平均   白噪声
*
* 很多情况下，模型设定中并不包含解释变量,此时ARMA(1,1)模型可表示为：
*      y_t = a + rho*y_{t-1} + theta*v_{t-1} + v_t
* 实例：固定资产投资行为   


* -- 估计 --
  use wpi1.dta, clear
  d
  dfuller wpi
  gen d_wpi = D.wpi
  dfuller d_wpi
  * ARMA(1,1,1) 模型 由于原始序列包含单位根，所以要采用ARIMA模型
  arima wpi, arima(1,1,1)
  * 另一种设定方式,更加灵活
  arima d_wpi, ar(1) ma(1)
  
* -- 滞后阶数的确定 --
* LL值，AIC准则，BIC准则
* LL 越大越好, AIC 和 BIC 越小越好
*  AIC = -2*ln(L) + 2*k      /*ln(L) 对数似然值；k 参数个数； N 样本数*/
*  BIC = -2*ln(L) + k*ln(N)
*  BIC 更倾向于筛选出“精简的”模型

  * 产生模拟数据：ARMA(2,1)过程
    clear
    set seed 1357
    sim_arma y_arma21, ar(0.8) ma(0.2) nobs(300)
  * 估计 ARMA(1,1) 模型，MLE
    arima y_arma21, ar(1) ma(1)
  * 列示信息准则
    estat ic
  
  * 估计 ARMA(2,1) 模型
    arima y_arma21, ar(1 2) ma(1)
    estat ic
    ret list
    
    mat list r(S)
    mat s = r(S)
    dis "AIC = " s[1,5]
  
  * 根据信息准则筛选模型 
  * 例1：模拟数据
    tsset _t
    mat b = J(6,4,0)
    local p = 1
    forvalues i = 1(1)3{
         forvalues j = 1(1)2{
              mat b[`p',1] = `i'
              mat b[`p',2] = `j'
              qui arima y_arma21 , ar(1/`i') ma(1/`j')
              est store arma`i'`j'
              qui estat ic
              mat S = r(S)
              mat b[`p',3] = (S[1,5], S[1,6])
              local p = `p' + 1
        }
    }

    mat colnames b = AR MA AIC BIC
    mat list b
    local mm arma11 arma12 arma21 arma22 arma31 arma32
    esttab `mm', mtitle(`mm') compress nogap scalar(ll aic bic)
    

   * 例2：真实数据——美国零售价格指数
   use wpi1.dta, clear
   tsset t
   line wpi t
   line D.wpi t
   line D.ln_wpi t
   ac  D.ln_wpi  /*包含AR过程*/
   pac D.ln_wpi  /*基本上可以判断是AR(1)，或ARMA(1,1)过程*/
   
   * 采用信息准则筛选滞后阶数
     local y "D.ln_wpi"
     local a = 3   /*AR(a)*/
     local b = 1   /*MA(b)*/
     forvalues i = 1(1)`a'{
          forvalues j = 0(1)`b'{
               if `j' == 0{
                 local ma ""
               }
               else{
                 local ma "ma(1/`j')"
               }
               qui arima `y' , ar(1/`i') `ma'  /*填写变量名称*/
               est store arma`i'`j'
               *qui estat ic
         }
     }
     local mm arma10 arma11 arma20 arma21 arma30 arma31
     esttab `mm', mtitle(`mm') compress nogap scalar(ll aic bic)   
    
     * 评论：
     *  (1) 本例中，AIC和BIC判断的结论一致，都是选择 ARMA(1,1) 模型；
     *  (2) 多数情况下，ARMA(1,1) 模型都有较好的表现。
     

* -- 季节效应 --
  use wpi1.dta, clear
  set scheme s2color
  tsset t
  line wpi t
  line d.wpi t, yline(0)
  ac  D.ln_wpi, ylabels(-0.4(0.2)0.6)  /*注意前四阶*/
  pac D.ln_wpi, ylabels(-0.4(0.2)0.6)  
  
  arima D.ln_wpi, ar(1) ma(1)
  est store arma11
  arima D.ln_wpi, ar(1) ma(1 4)
  est store arma114
  arima D.ln_wpi, ar(1) ma(1/4)
  est store arma11234
  
  local mm "arma11 arma114 arma11234"
  esttab `mm', mtitle(`mm') scalar(ll aic bic) 
  
  * 此时，我们发现，选择 ARMA(1,(1,4)) 模型更加合理
  * 注意资料的特性: 季节资料通常会呈现出“季节效应”
  *                月度资料有时也会呈现出“月度效应”
  
  
* -- 预测 --
  use wpi1.dta, clear
  arima D.ln_wpi, ar(1) ma(1 4)
  cap drop y_hat0
  cap drop y_hat1
  cap drop y_hat_dy
  
  * 样本内预测
    predict y_hat0     /* y 的拟合值 */
  
  * 样本外预测
    list in -15/-1
    tsappend, add(8)
    list in -15/-1
    predict y_hat1     /* y 的样本外一步预测值 */
    list in -15/-1
  
    gen Dln_wpi = D.ln_wpi
    sum
    predict y_hat_dy0, dynamic(124)  /*动态预测*/
    * 解释：
    *   当 t<123  时，采用 y_t 的真实值进行预测；
    *   当 t>=123 时，采用 y_t 的预测值进行进一步的预测
  
    predict y_hat_dy5, dynamic(120)
  
    list in -20/-1


          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *            6.3  VAR 模型(I)
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS    


*=======================
*  向量自回归(VAR)模型     
*=======================

*-----------------
*     简  介
*-----------------

*== 结构型 VAR 模型与缩减型 VAR 模型

*- 结构型 VAR
*                p
*   S*Y_t = C + SUM S_i*Y_t-p + R*X_t + E_t    (1)
*               i=1
*
* 其中，
*   Y_t = [y1_t  y2_t  ...  yM_t]' ，是一个 MxT 维列向量, M 个内生变量
*   X_t = [x1_t  x2_t  ...  xK_t]  ，是一个 MTxK 维矩阵，表示外生变量
*   E_t = [u1_t  u2_t  ...  uM_t]' ，是一个 MxT 维列向量(干扰项)

*- 缩减型 VAR
*
* 若 S 矩阵可逆，则 (1) 式可表示为：
*
*               p
*    Y_t = C + SUM A_i*Y_t-p + B*X_t + U_t    (2)
*              i=1
*
* 其中，
*    A_i = inv(S)*S_i
*    B   = inv(S)*R

*- 评论：
*   (1) SVAR 重点关注变量之间的同期相关性；
*   (2) VAR  重点关注变量之间的跨期相关性，注重因果关系的分析；



*-----------------
*    缩减型VAR
*-----------------  

*-- 模型：
*               p
*    Y_t = C + SUM A_i*Y_t-p + B*X_t + U_t    (1)
*              i=1
* 其中，
*  Y_t = [y1_t  y2_t  ...  yM_t]' ，是一个 MxT 维列向量, M 个内生变量
*  X_t = [x1_t  x2_t  ...  xK_t]  ，是一个 MTxK 维矩阵，表示外生变量
*  U_t = [u1_t  u2_t  ...  uM_t]' ，是一个 MxT 维列向量(干扰项)
 
* 模型 (1) 可表示为：
*
*  Y_t = C + A_1*Y_t-1 + ... + A_p*Y_t-p + B*X_t + U_t
*
* 具体书写如下：
*
* y1_t = c10 + a1*Y_t-1 + ... + ap*Y_t-p + b11*x1_t + ... + b1k*xk_t + u1_t
* y2_t = c20 + a1*Y_t-1 + ... + ap*Y_t-p + b21*x1_t + ... + b2k*xk_t + u1_t
* ...  =     ... ...
* yM_t = cM0 + a1*Y_t-1 + ... + ap*Y_t-p + bM1*x1_t + ... + bMk*xk_t + uM_t
* 
*-- 假设：  
*         E(U_t) = 0
*         E(U_t*U_t') = S          各个干扰项之间^存在^_同期_相关性
*         E(U_t*U_s') = 0 (t != s) 各个干扰项之间以及自身^不存在^_跨期_相关性
*-- 参数个数：
*
*      系数   n1 = M^2*p + M*(K+1) 个
*      S      n2 = [M*(M+1)]/2 个
*
*   若 T < n1 + n2，模型将无法估计，因此要施加限制条件

                 

*== 估计VAR ==

* step1: 选择滞后阶数

  use lutkepohl.dta, clear
  tsset qtr
  d
  varsoc dlinvest dlincome dlconsumption 

  
* stpe2: 估计模型

  varbasic dlinvest dlincome dlconsumption , nograph
  est store varbasic
  * 说明: 
  *   varbasic 默认滞后阶数为 2，即自动附加 lags(1/2) 选项

  
  * 等价于估计联立方程组模型
  reg3 (dlinv  L(1/2).dlinv  L(1/2).dlinco L(1/2).dlconsu) ///
       (dlinco L(1/2).dlinco L(1/2).dlinv  L(1/2).dlconsu) ///
       (dlcons L(1/2).dlcons L(1/2).dlinv  L(1/2).dlinco)
  est store reg3
  * 注意：内生变量和外生变量的区别
  
  * 亦可使用 var 命令
  var dlinvest dlincome dlconsumption ,lag(1/2)     
  est store var
  
  esttab reg3 var*     
  
  * -- 正交脉冲响应图形
  * 含义：控制其它因素不变的情况下，对某个内生变量的外部冲击，
  *       对其自身和其它内生变量的影响
  varbasic dlinvest dlincome dlconsumption
  
  * -- 脉冲响应图形（未正交化）
  varbasic dlinvest dlincome dlconsumption , irf
  * 或
  irf graph irf, lstep(1)

  * -- 其它选项说明
    * F 值和 t 统计量
      var dlinvest dlincome dlconsumption,lag(1/2) small   
    * 小样本下自由度的调整
      * 默认设定下，在估计方差-协方差矩阵时，采用大样本下的 1/T 进行自由度调整
      * 使用 dfk 选项后，采用 1/(T-m) 调整自由度，m 为各个方程中参数个数的平均值
      var dlinvest dlincome dlconsumption, dfk 
      est store var_dfk   /*多数t 值变小了，即标准误变大了 */
      esttab var var_dfk,mtitle(var var_dfk)  
      
  * -- 包含外生变量的VAR模型
    * 假设消费(dlconsumption)是外生的
    var dlinvest dlincome, exog(dlconsumption) lag(1/2) small 
    
    * Blanchard(1989) 模型
    * y--GDP；u--失业率；p--物价指数；w--工资；m--货币供给量
    * s1-s3 季节虚拟变量
    use Blanchard.dta, clear
    tsset quarter
    d
    var d.y u d.p d.w d.m, exog(t s1 s2 s3) lags(1 2 3)
    
                      
*== VAR 模型相关检验 == 

* 平稳性检验
  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption ,lag(1/2) dfk small
  varstable
  varstable, graph       /*图示模的分布*/
  varstable, graph dlabel 
  varstable, graph modlabel 
  
  
* 检验滞后阶数的显著性
  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption ,lag(1/2) dfk small
  est store var0
  varwle         /*检验特定滞后阶数的联合显著性*/
  
  * 评论：dlinvest 和 dlincome 方程仅设定一阶制后即可
  * 处理方法：附加约束条件
  constraint define 1 [dlinvestment]L2.dlinvest = 0
  constraint define 2 [dlinvestment]L2.dlincome = 0 
  constraint define 3 [dlinvestment]L2.dlconsumption = 0
  constraint define 4 [dlincome]L2.dlinvest = 0 
  constraint define 5 [dlincome]L2.dlincome = 0 
  constraint define 6 [dlincome]L2.dlconsumption = 0 
  var dlinvest dlincome dlconsumption ,lag(1/2) dfk small constraints(1/6)
  est store varC
  
  esttab var0 varC, mtitle(var0 varC) scalar(ll aic hqic sbic) 
  eret list  

    
* 残差正态分布检验
  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption if qtr<=q(1978q4),lag(1/2) dfk small
  varnorm
  * 三个统计量均无法拒绝残差服从正态分布的原假设
  var dlinvest dlincome dlconsumption,lag(1/2) dfk small
  varnorm  
  * 此时可能需要考虑增加滞后阶数或近一步修正模型的设定
  
  
* 残差序列相关检验
* VAR 假设干扰项不存在序列相关，因此如果模型设定是正确的，则残差不存在序列相关
  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption if qtr<=q(1978q4),lag(1/2) dfk small
  varlmar
  varlmar, mlag(5)
  
  
*== 格兰杰因果检验 == 

* 基本思想：若 x 是 y 的 Granger 因，则 x 的滞后项有助于解释 y 的变动
  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption,lag(1/2) dfk small
  vargranger
  * 等价于：
  test [dlinvestment]L.dlincome [dlinvestment]L2.dlincome
  test [#2]L.dlconsumption [#2]L2.dlconsumption
  * 使用 [accumatlate] 选项，可实现约束条件的累加
  test [#2]L.dlinvestment [#2]L2.dlinvestment, accumulate 
  

  
*== 预测 ==   

  use lutkepohl.dta, clear
  var dlinvest dlincome dlconsumption,lag(1/2) dfk small
  
  *-- 样本外一步(one step)预测
    * y_f    预测值；
    * y_f_L  预测值下限；
    * y_f_U  预测值上限；
    * y_f_se 预测标准误；
    varfcast compute 
    list dlinvestment dlinvestment_f dlinvestment_f_L   ///
         dlinvestment_f_U dlinvestment_f_se in 91/93
       
  *-- 样本内一步预测: dynamic()选项
    use lutkepohl.dta, clear
    var dlinvest dlincome dlconsumption,lag(1/2) dfk small
  varfcast compute, dynamic(5)  
  list dlinvestment dlinvestment_f dlincome dlincome_f ///
       dlconsumption dlconsumption_f in 4/7
  
  *-- 多步预测: dynamic()选项+step()选项
    use lutkepohl.dta, clear
    var dlinvest dlincome dlconsumption,lag(1/2) dfk small
  varfcast compute, dynamic(85) step(10) 
  list  dlinvestment dlinvestment_f dlincome dlincome_f ///
        dlconsumption dlconsumption_f in 83/95
       
       
*== 脉冲响应 ==
 
 * Basic idea (p.127)
 /* 
   The following types of impulse-response functions are stored:
    stat     description                       models fitting
    ------------------------------------------------------------------------
    irf      simple IRFs                       following svar, var, or vec
    oirf     orthogonalized IRFs               following svar, var, or vec
    dm       dynamic multipliers               following var
    cirf     cumulative IRFs                   following svar, var, or vec
    coirf    cumulative, orthogonalized IRFs   following svar, var, or vec
    cdm      cumulative, dynamic multipliers   following var
    sirf     structural IRFs                   following svar only
    ------------------------------------------------------------------------
    
    The following types of forecast-error variance decompositions are stored:
    stat     description                       models fitting
    ------------------------------------------------------------------------
    fevd     Cholesky FEVDs                    following svar, var, or vec
    sfevd    structural FEVDs                  following svar only
    ------------------------------------------------------------------------
  */
  
  * -- Basic steps
   * step1: estimate VAR model 
     use lutkepohl.dta, clear
     var dlinvest dlincome dlconsumption,lag(1/2) dfk small
   * step2: create IRF file
     irf create order1, step(10) set(myirf1) replace
   * step3: graphing
     irf graph oirf, impulse(dlincome) response(dlconsumption) irf(order1)
  * Intereption:
  *  (1) "irf create" created file myirf1.irf, save results "order1"
  *  (2) "order1" (see p.110)
  
  *-- change order of Cholesky decomposition
    irf create order2, step(10) order(dlincome dlinvest dlconsumption) replace
    irf graph oirf, irf(order1 order2) impulse(dlincome) response(dlconsumption) 
      
  *-- show results in table format
    irf table oirf, irf(order1 order2) impulse(dlincome) response(dlconsumption) 
    * cumulative, orthogonalized IRFs
    irf table coirf, irf(order1 order2) impulse(dlincome) response(dlconsumption)

                 
  *-- Boostrap Standard Error
    var dlinvest dlincome dlconsumption,lag(1/2) dfk small
    irf create asymp, step(8) set(result1) replace
    irf create bs, step(8) bs reps(200) replace
    * Confidence Intervals
    irf ctable (asymp dlincome dlconsumption oirf)  ///
               (bs    dlincome dlconsumption oirf)
    * Standard Errors
    irf ctable (asymp dlincome dlconsumption oirf)  ///
               (bs    dlincome dlconsumption oirf), noci stderror
    * Combine graphs
    irf cgraph (asymp dlincome dlconsumption oirf) ///
               (bs    dlincome dlconsumption oirf) ///
               (asymp dlincome dlconsumption fevd) ///  
               (bs    dlincome dlconsumption fevd)    
                                          
    
   
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *           6.3  VAR 模型(II)
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS   
                                                             
*-----------------
*  结构型VAR模型
*-----------------    

* -- 简介

* 缩减型VAR模型只能描述各个内生变量 y_t 的动态形成过程；
* 着重的是内生变量的“跨期”相关性，
* 并不考虑内生变量的“同期”相关性，
* 因此无法呈现内生变量之间的“因果关系”
* 而采用结构型VAR模型(SVAR)，则可以根据相关理论设定变量之间的因果关系


  * 模型设定：
  *               p
  *      A*y_t = SUM A_j*y[t-j] + e_t                 (1)
  *              j=1 
  *
  *       Var(e_t) = Sigma = B*B'  (正交分解，B 是一个下三角矩阵)
  * 
  *   设     e_t = B*u_t  （u_t 称为“正交单位创元”)  (2)       
  *
  *       Var(u_t) = I_t(单位矩阵)，u_t 是一个向量
  *
  *  (1) 式可改写为：
  * 
  *               p
  *      A*y_t = SUM A_j*y[t-j] + B*u_t              (3)
  *              j=1   
  *
  *  设 Var(v_t) = S, 即，v_t -- N(0, S), 
  
  *    其中，v_t = A^{-1}*e_t, 即(1)式对应的缩减型VAR模型的干扰项；
  *
  *  由于 S 为正定矩阵，所以可进行裘氏分解如下： S = P*P'
  *  由 (3) 式可得：P = A^{-1}*B  
  *  因此，根据 VAR 估计得到的残差的方差-协方差矩阵 S，我们可以进而得到 A 和 B  
  
  *-- 为了使模型能够确认：
  *  (1) A 是一个下三角矩阵，B 是一个对角矩阵 
  *  (2) 通常将 A 矩阵的对角元素设定为 1,
  *  (3) A 矩阵的非对角元素反映了变量间的“同期”因果关系  
  
  *-- 对 SVAR 的解释：
  *   (1) A 的系数反映了各个内生变量的同期关系，即因果关系；
  *   (2) B 的系数反映了来自不同内生变量的随机干扰对系统的影响，
  *       因此，我们事实上对干扰项 e_t 进行了正交分解，得到了“单位正交创元”u_t，
  *       这使得我们可以分析 u_t 变化一单位对系统的动态影响。


  
* 例1-- 短期恰足确认结构型VAR模型(short-run just-identified SVAR model)

   * 所谓“短期”，是指通过对 A 矩阵施加约束条件，来反映变量间的“同期”因果关系
   * 所谓“长期”，是指通过对 C = A^{-1}*B 施加约束，来反映变量间的长期交互影响
   
   * 模型 y_t = (dlinvestment, dlincome, dlcosumption)'
   * 设
   *      | 1  0  0 |        | .  0  0 |
   *  A = | .  1  0 |    B = | 0  .  0 |
   *      | .  .  1 |        | 0  0  . |
   * 含义：
   *  (1) 当期投资(invest)不受收入(income)和消费(consumption)的影响
   *  (2) 收入(income)受当期投资(invest)的影响，但不受当期消费(consumption)的影响
   *  (3) 消费(consumption)同时受到当期投资(invest)和收入(income)的影响
   
   use lutkepohl.dta, clear
     mat A = (1,0,0 \ .,1,0 \ .,.,1)
     mat B = (.,0,0 \ 0,.,0 \ 0,0,.)
     mat list A
     mat list B
     svar dlinvestment dlincome dlconsumption, aeq(A) beq(B)
     est store svar01
     mat list e(A)
     mat list e(B)
     
   * 结果释义：
   *  (1) “Exactly identified model”
   *      下三角矩阵 A 中恰好有 3 个未知参数
   *  (2)  a_2_1 表示 A 矩阵中第2行第1列上的元素 
   *  (3) A_j 的系数可以通过 var 选项列印出来
     svar dlinvestment dlincome dlconsumption, aeq(A) beq(B) var
     
   * 冲击反应分析
    irf create sv01, step(10) set(myirf01) replace
    irf graph oirf, irf(sv01) impulse(dlincome) response(dlconsumption)    
    irf graph coirf, irf(sv01) impulse(dlincome) response(dlconsumption) 
   
   
* 例2-- 短期过度确认结构型VAR模型(short-run over-identified SVAR model)

   * 模型 y_t = (dlinvestment, dlincome, dlcosumption)'
   * 设
   *      | 1  0  0 |        | .  0  0 |
   *  A = | 0  1  0 |    B = | 0  .  0 |
   *      | .  .  1 |        | 0  0  . |
   * 含义：
   *  (1) 当期投资(invest)不受当期收入(income)和消费(consumption)的影响
   *  (2) 当期收入(income)不受当期投资(invest)和消费(consumption)的影响
   *  (3) 当期消费(consumption)同时受到当期投资(invest)和收入(income)的影响
   
   use lutkepohl.dta, clear
     mat A = (1,0,0 \ 0,1,0 \ .,.,1)
     mat B = (.,0,0 \ 0,.,0 \ 0,0,.)
     mat list A
     mat list B
     svar dlinvestment dlincome dlconsumption, aeq(A) beq(B) 
     est store svar02
     mat list e(A)
     mat list e(B)
   
   * 结果释义：
   * LR test of identifying restrictions: 
   * LR = 2(LL_var - LL_svar) -- chi2(q)
   * where, q is the number of voeridendifying restrictions
   
   
   
* 例3-- 带有约束条件的短期结构型VAR模型(Short-run SVAR model with constraints)
   use lutkepohl.dta, clear
   var dlinvest dlincome dlconsumption, lag(1/2) 
   * Review: (1) most coefficients in eq1 are insignificant
   *         (2) some of coefficients in eq2 are insignificant
   * we can restrict these coefficients to be zero
     constraint define 1 [#1]L2.dlinvestment = 0
     constraint define 2 [#1]L1.dlincome = 0
     constraint define 3 [#1]L2.dlincome = 0   
     constraint define 4 [#1]L1.dlconsumption = 0
     constraint define 5 [#1]L2.dlconsumption = 0
     constraint define 6 [#2]L1.dlincome = 0
     constraint define 7 [#2]L2.dlincome = 0
     constraint define 8 [#2]L2.dlconsumption = 0
     constraint define 9 [#3]L2.dlconsumption = 0
   
   svar dlinvestment dlincome dlconsumption, aeq(A) beq(B) varconstraints(1/9)
   est store svar03
   svar dlinvestment dlincome dlconsumption, aeq(A) beq(B) varconstraints(1/9) var
   
   * 比较
      local mm svar01 svar02 svar03
      esttab `mm', mtitle(`mm')
   
   
   
   
* 例4-- 长期结构型VAR模型(Long-run SVAR model)
  *           p  
  * A*y_t = SUM A_i*y_t-i + e_t
  *          i=1
  *
  * 可表示为：
  *   A(I_k - A1*L - A2*L^2 - ... - Ap*L^p)y_t = e_t            (2)
  *
  * 设： e_t = B*u_t                                       (3) 
  *   (I_k - A1*L - A2*L^2 - ... - Ap*L^p)y_t = inv(A)*e_t 
  *                                           = inv(A)*B*u_t
  *                                           = C*u_t
  * C 称为长期约束
  
  * A1: unexpected changes in money supply have no long-run effects 
        on changes in output;
  * A2: unexpected changes in output have no long-run effects 
        on changes in money supply;
  * Which implies: 
  *       | .  0 |
  *   C = |      |
  *       | 0  . |2X2
  
      use m1gdp.dta, clear
      mat C = (.,0 \ 0,.)
      svar d.ln_m1 d.ln_gdp, lreq(C)  
      
      mat C = (.,0 \ .,.)     /*assume gdp has effect on m1*/
      svar d.ln_m1 d.ln_gdp, lreq(C)  
      
      mat C = (.,. \ 0,.)     /*assume m1 has effect on gdp*/
      svar d.ln_m1 d.ln_gdp, lreq(C)  

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *         6.4  非平稳时间序列简介
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS    


*================================
*      非平稳时间序列模型     
*================================

*---------------
*    简  介
*---------------

*------目 录------
*
*- 白噪声过程(White Noise，WN)
*- 随机游走过程(Random Walk，RW)
*- 趋势平稳过程
*- 伪回归问题



*=== 白噪声 (White Noise)
* y_t = e_t   e_t -- IID(0,1)
* E(y_t)   = 0
* Var(y_t) = 1
* 因此,WN序列是平稳的
* 平稳序列的特征: 均值和自协方差均不随时间改变
 
 clear 
 set obs 100
 gen y1 = invnorm(uniform())
 gen y2 = invnorm(uniform()) + sin(2*_pi*(_n-1)/10)
 gen t = _n
 tsset t
 line y1 t, yline(0)
 line y2 t, yline(0)
 line y1 y2 t, yline(0)
 
 
 *-- 检验白噪声
 * wntestb  (Bartlett's periodogram-based test for white noise)
   wntestb y1         /*图示*/
   wntestb y1, table  /*列表*/
   wntestb y2
 
 * wntestq  (Portmanteau (Q) test for white noise, Ljung and Box, 1978)
   wntestq y1
   wntestq y2
   wntestq y1, lags(20)
   * 统计量为 chi2(m)  m 为滞后阶数
   * Ljung and Box Q 统计量也可以采用图示的方法
   corrgram y1           /*没有明确的序列相关特征*/
   corrgram y1, lags(20)  
   corrgram y2           /*有明显的序列相关特征*/


*=== 随机游走过程

* 标准化随机游走过程(standardized random walk process)
*  w_t = w_t-1 + e_t,   w_0 = 0,   e_t -- IID(0,1)
*  w_t = w_t-2 + e_t-1 + e_t
*  w_t = w_t-3 + e_t-2 + e_t-1 + e_t
*  ... ...
*  w_t = w_0   + (e_1 + e_2 + ... + e_t) 
*  即，w_t 的当期观察值是以往所有干扰因素的累积
*  Var(w_t) = t; 非平稳， 且 t —> 无穷，则Var(w_t) —> 无穷 

 *---------------------------------------------
  clear
  *set seed 93456789            
  set obs 300
  gen t = _n
  tsset t
  gen y0 = invnorm(uniform())   /* W.N. */
  sim_arma y1, ar(0.9)          /* AR(1) */
  sim_arma y2, ar(1)            /* R.W. */
  
  twoway (line y0 t) (line y1 t) (line y2 t), ///
         legend(label(1 "WN") lab(2 "AR(0.9)") lab(3 "RW") row(1)) 
 *---------请反复执行上述程序--------------------         
  
  
* 随机游走过程
* y_t = y_t-1 + e_t,  y_0 = 0, e_t -- IID(0,sigma^2)
* Var(y_t) = T*sigma^2
  
  cap drop y3
  sim_arma y3, ar(1) sigma(3)
    twoway (line y0 t) (line y1 t) (line y2 t) (line y3 t), ///
         legend(label(1 "WN") lab(2 "AR(0.9)") lab(3 "RW") lab(4 "RW3") row(1)) 
         

* 带有飘移项的随机游走过程
* y_t = c0 + y_t-1 + e_t
*
* y_t = c0           + y_t-1                 + e_t
* y_t = c0 + c0      + y_t-2 + e_t-1         + e_t
* y_t = c0 + c0 + c0 + y_t-3 + e_t-2 + e_t-1 + e_t
*          ... ...
*
*                      m-1 
* y_t = m*c0 + y_t-m + SUM e_t-s
*                      s=1
*
* 漂移项的存在具有累加效果！

  clear
  set obs 100
  gen t = _n
  tsset t
  
  * y_t = 0.1 + y_t-1 + u_t
  gen u = invnorm(uniform())
  gen y = 0
  forvalues i = 2(1)100{
    qui replace y = 0.1+ y[`i'-1] + u  if t == `i' 
  }
  
  * 含有时间趋势项的平稳序列
  *   x_t = 0.1*t + u_t
    gen x = 0.1*t + u 
  
  label var y  RW_drift
  label var x  WN_trend   
  twoway (line y t) (line x t)
  
  tsset t 
  reg y L.y
   est store ylag
  reg y t 
   est store yt
  reg y L.y t
   est store ytlag
  
  reg x L.x
   est store xlag
  reg x t
   est store xt
  reg x L.x t
   est store xtlag
   
  local mm "ylag yt ytlag  xlag xt xtlag"
  esttab `mm', mtitle(`mm') compress
  
  * 评论：
  *  (1) reg z L.z 中，都表现出序列相关特征
  *  (2) 含有漂移项的 RW 中，t 不显著；
  *  (3) 而在 包含时间趋势的 平稳序列中，t 显著；

  *=== RW 的时序特征
    *-- 平稳序列具有均值回复的特征，而RW则没有
    *-- 趋势平稳序列和非平稳序列的时序图非常相似


*=== 对估计结果的影响： 伪回归问题
  adopath + d:\stata10\ado\personal\Net_Course\B6_TimeS
    
  *--- 一个简单的实例 ---------------
    clear
    set obs 1000
    sim_arma y , ar(1)
    sim_arma x , ar(1)
    reg y x
    dwstat
    twoway line y _t || line x _t
  *------请反复执行------------------
  *
  *- 评论：
  * (1) 二者“似乎”存在很强的相关性；
  * (2) 但 D-W 统计量的值非常低；
  
  
  *--- 一个模拟分析 --- Granger and Newbold(1974)  [T]p.356
  *   --思路--
  *   随机产生两个序列 y 和 x，然后reg y x，记录 b,t,R2 和 DW 值
  *   重复上述过程 300 次
  
  *- 模拟A：两个"平稳"序列   y - N(0,1);  x - N(0,1)
    doedit B6_simreg_r.ado
    
    simulate "B6_simreg_r"       ///
         b_s = r(b) t_s=r(t) r2_s = r(r2) dw_s = r(dw),  ///
         rep(300) dots
    gen id = _n
    qui sort id
    save B6_simreg_r.dta, replace
    sum

  *- 模拟B：两个"非平稳"序列 
    doedit B6_simreg_u.ado
    simulate "B6_simreg_u"       ///
         b_u = r(b) t_u=r(t) r2_u = r(r2) dw_u = r(dw),  ///
         rep(300) dots
    save B6_simreg_u.dta, replace
    use B6_simreg_u.dta,clear
    gen id = _n
    qui sort id
    merge id using B6_simreg_r.dta
    drop _merge id
    sum
    
  *- 对比分析：
    * 两个独立的非平稳序列可能高度相关：伪回归
      twoway (kdensity b_s,lwid(thick)) (kdensity b_u,lwid(thick)) , ///
           legend(lab(1 "b — 稳定序列") lab(2 "b — 非稳定序列"))
  
    * t 值可能很大
      twoway (kdensity t_s,lwid(thick)) (kdensity t_u,lwid(thick)) , ///
           legend(lab(1 "t — 稳定序列") lab(2 "t — 非稳定序列"))
    
    * R2 可能很高       
      twoway (kdensity r2_s,lwid(thick)) (kdensity r2_u,lwid(thick)) , ///
           legend(lab(1 "R2 — 稳定序列") lab(2 "R2 — 非稳定序列")) 
          
    * D-W 值通常都非常接近于0：残差显示出高度的自相关       
      twoway (kdensity dw_s,lwid(thick)) (kdensity dw_u,lwid(thick)) , ///
           legend(lab(1 "D-W — 稳定序列") lab(2 "D-W — 非稳定序列"))      
           
                                       
*--- 伪回归问题
    * 若两个时序变量回归得到的 R2 较高，系数也显著，
    * 但D-W值接近于0，则很可能是“伪回归”
    *   此时，要检验时序变量的平稳性
    
    
    
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *            6.5  单位根检验
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS    
    
    
*-----------------------
*       单位根检验
*-----------------------
*
* 单位根过程（随机游走）
*
*    y_t = y_t-1 + e_t,    e_t -- IID(0,sigma^2)
*    y_t = c0 + y_t-1 + e_t,
*
* ------ 目录 ------
*
* 一般检验方法：
*  - D-F 检验（Dickey-Fuller t-test）
*  - ADF 检验（Augmented Dickey-Fuller test）
*  - DF-GLS （modified Dickey-Fuller）
*  - PP 检验
*  - KPSS 检验
* 
* 离群值与结构突变
*  - 考虑离群值的单位根检验 
*  - 允许一个结构突变的单位根检验 
*  - 允许两个结构突变的单位根检验



* -- 一般检验方法

*== D-F 检验
* y_t = a0 + rho*y_t-1 + deta*t + u_t  (1)
* 
* OLS 估计，但往往存在严重的序列相关
  
  
*== Augmented Dickey-Fuller unit-root test

* H0: y_t 为单位根过程
* H1：y_t 是平稳序列

* (1) 式两边同时减去 y_t-1 可得：
*
*  D.y_t = a     + b*y_t-1 +  deta*t     + (c1*D.y_t-1 + c2*D.y_t-2 + ... + ck*D.y_t-k)
*         漂移项            时间趋势项            为了控制序列相关
*  注意：b = rho-1

* 四种形式：对应不同的真实数据生成过程(DGP)，影响临界值
*-------------------------------------------------------------
*  形式   process under H0     参数限制       dfuller 选项           
* ------------------------------------------------------------
*    1    RW,无漂移项         a=0, deta=0     noconcstant
*    2    RW,无漂移项              deta=0     (默认设置)
*    3    RW,有漂移项              deta=0     drift
*    4    RW,有或无漂移项         无          trend
* ------------------------------------------------------------
* 说明：
*   (1) 在 Case2 和 Case3 中，回归时都会加入常数项，但临界值的计算不同；
*       在 Case1 和 Case2 中，计算临界值时，原假设都是 a=0；
*       而在 Case3 中，计算临界值时，原假设是 a!=0 。

   use lutkepohl.dta, clear
   dfuller lconsumption           /*ln(消费) 为单位根过程*/
   dfuller lconsumption, regress               /* Case2 */
   dfuller lconsumption, regress lag(3)        /*控制序列相关*/ 
   dfuller lconsumption, regress lag(3) trend  /* Case4 */     
   dfuller lconsumption, regress nocon        /* Case1 */
   dfuller lconsumption, regress drift        /* Case3 */
   dfuller lconsumption, regress /*case2,请与Case3的临界值对比*/
   
   * 结论：无论采用哪种方式，都无法拒绝H0,在不同的形式下，临界值是不同的
   *       同时，根据理论，消费通常是含有趋势项的，
   *       因为消费水平随着时间的增加而提高
   *       所以，Case4 在本例中比较合适
   
   * ln(消费)的一阶差分是平稳的
   dfuller D.lconsumption 
   dfuller D.lconsumption , trend
   
   
   
   
*---  modified Dickey-Fuller t-test (Elliot,et al., 1996,Econometrica)
*     DF-GLS
* Ho：y_t 为单位根过程
* H1：y_t 是一个平稳过程
*     形式1：趋势平稳（即，包含一个时间趋势项）defult
*     形式2：一般平稳（不包含时间趋势项）加入 notrend 选项即可
* 先对数据做一定的转换(GLS)，进而估计上述差分形式的模型

    dfgls lconsumption
    dfgls D.lconsumption
    
    
*--- Phillips-Perron unit-root test (Phillips-Perron, 1987)

* 模型： 
*      y_t = a + b*t + rho*y_t-1 + e_t 
*
* 特点：采用 Newey-West (1987) 稳健型标准误来控制序列相关问题
*       而 dfuller 命令则通过放入多个差分滞后项来控制序列相关问题
* 只有三种形式：
*-------------------------------------------------------------
*  形式   process under H0     参数限制       pprron 选项           
* ------------------------------------------------------------
*    1    RW,无漂移项         a=0, deta=0     noconcstant
*    2    RW,无漂移项              deta=0     (默认设置)
*    4    RW,有或无漂移项         无          trend
* ------------------------------------------------------------ 
* 事实上，Case3 是 Case4 的特例。

    pperron lconsumption
    pperron lconsumption , lag(4) trend 
    pperron lconsumption , lag(4) trend regress
    
    pperron linvest, lag(4) trend regress
    pperron D.linvest, lag(4) regress
    
    
   

*-- 考虑离群值的单位根检验 Vogelsang (1999)

  * Vogelsang, T.J. 1999. 
  *   Two Simple Procedures for Testing for a Unit Root 
  *   When There are Additive Outliers. 
  * Journal of Time Series Analysis 20: 237-52.


* 如果序列中有结构断点，如石油危机等，会导致传统的单根检定过度接受H0
* dfao 处理方法：自动寻找断点，加入虚拟变量

   use pervog92.dta, clear
   line lfiuscpi year
   
   dfuller lfiuscpi  /*拒绝单位根*/
   dfgls   lfiuscpi  /*无法拒绝单位根，两个结果差别很大*/
   dfao lfiuscpi     /*拒绝单位根，看细表*/
    
   dfao lfiuscpi, notr lev(90)
   dfao lfiuscpi, notr lev(90) reg




*-- 允许一个结构突变的单位根检验 

  *- Zivot-Andrews(1992)检验
  *
  * Andrews, D., Zivot, E. 1992. 
  *   Further evidence on the Great Crash, the oil price shock, and 
  *   the unit-root hypothesis. 
  *   Journal of Business and Economic Statistics 10, 251-70.
  
  * 基本思想：
  *   Ho:  y_t = y_t-1     + d1*DTB_1t + u_t
  *
  *   H1:  y_t = c0 + c1*t + d1*DTB_1t + u_t
  *
  * 模型：
  *    
  *   y_t = c0 + rho*y_t-1 + d1*DTB_1t + u_t
  * 
  *
     use wpi1.dta, clear
     line wpi t
     line ln_wpi t
     dfuller ln_wpi
     dfgls   ln_wpi
     zandrews ln_wpi  /*无法拒绝原假设：存在单根*/
     zandrews ln_wpi, graph
     zandrews ln_wpi, lagmethod(BIC)
     zandrews ln_wpi, break(trend)
     zandrews ln_wpi, break(trend) graph
       
       
  *- Clemente,Montanes,and Reyes(1998)检验
  * 基本思想：对 Perron and Vogelsang(1992) 方法进行扩展
  *
  *   Ho:  y_t = y_t-1 + d1*DTB_1t + u_t
  *
  *   H1:  y_t = c0 + d1*DTB_1t + u_t
  *
  * 模型：
  *    
  *   y_t = c0 + rho*y_t-1 + d1*DTB_1t + u_t
  *
     use wpi1.dta, clear
     line wpi t
      clemao1 wpi, graph
      clemio1 D.wpi    /* 不平稳 */
      dfuller D.wpi    /* 平稳 */
      dfgls D.wpi      /* 不平稳 */
      
      
      
*-- 允许两个结构突变的单位根检验  Clemente,Montanes,and Reyes(1998) 
*
   * Clemente, J., Montanes, A., Reyes, M., 1998. 
   * Testing for a unit root in variables with a double change in the mean. 
   * Economics Letters 59, 175-182.

   * 基本思想：对 Perron and Vogelsang(1992) 方法进行扩展
   *
   *   Ho:  y_t = y_t-1 + d1*DTB_1t + d2*DTB_2t + u_t
   *
   *   H1: y_t = c0 + d1*DTB_1t + d2*DTB_2t + u_t
   *
   * 模型：
   *    
   *   y_t = c0 + rho*y_t-1 + d1*DTB_1t + d2*DTB_2t + u_t
   *
     use wpi1.dta, clear
      clemao2 wpi, graph
      clemao2 D.wpi, graph
      dfuller D.wpi  /* 平稳 */
      dfgls D.wpi    /* 不平稳 */
      
   * 评论：   
   *   (1) 在允许两个结构突变的情况下，D.wpi 是平稳的；
   *   (2) dfuller 检验结果似乎比较稳健，相对于 dfgls

   
   
   
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================  
          *             6.6  协整分析
          
cd d:\stata10\ado\personal\Net_Course\B6_TimeS   

*-----------------------
*       协整分析
*-----------------------

*------------
*--- 简介 ---
*
* 协整的定义：若 y_t, x_t 均为 I(1) 过程，对于如下模型：
*    
*     y_t = a + b*x_t + e_t
*
* (1) 若 e_t 是 I(1) 过程，则“伪回归”； 
* (2) 若二者的线性组合 (z_t = y_t - a - b*x_t) 是 I(0) 过程，
*     则称 y_t 和 x_t 存在协整关系，协整向量为 (1,-b)


* 例：Hamilton(1994,p.572)
*
*      y_t = b*x_t + u_t     |  corr(u_t,v_t) = 0     (1a)
*      x_t = x_t-1 + v_t     |  u_t, v_t are W.N.     (1b)
*
* 显然，x_t 和 y_t 都是 I(1) 过程，
* 但 z_t = y_t - b*x_t = u_t 却是 I(0) 过程，
* 因此，y_t 和 x_t 存在协整关系，协整向量为 (1,-b)
*
* 式 (1) 可进一步表示为(VECM)：
*
*   D.y_t = -1*(y_t-1 - b*x_t-1) + (b*v_t + u_t)
*         = -z_t + e_t     (z_t = y_t-1 - b*x_t-1 称为协整方程)
*   D.x_t = v_t


* VECM 的一般化形式：
*
*   D.y_t = alpha*z_t-1 + e_t 
*   
*   z_t-1 = (y_t-1 - b*x_t-1) + (c0 + rho*t)
*           ----------------    ------------
*             长期均衡关系        时间趋势
*
* 完整形式：
*                                               p-1 
*   D.y_t = alpha*(y_t-1 - b*x_t-1 + c1+r1*t) + SUM (g_i*D.y_t-i) + c2+r2*t  
*           ------  --------------   --------   i=1 -------------   --------                                                    
*           调整速度  长期均衡关系    时间趋势         短期动态关系    时间趋势
*
*   含义解释：
*   (1) 当 z_t = 0 时，整个系统处于均衡态；z_t！=0 表示系统偏离均衡态的程度；
*   (2) alpha 表示 y_t 和 x_t 向均衡态调整的快慢和方向；
*   (3) g_i 反映了 y_t 和 x_t 之间的短期调整行为；

  
* 二者的时序图如下：

*- sigma=1
   clear
   set seed 1357911
   set obs 100
   sim_arma x , ar(1) time(t)
   gen y = 0.6*x + 1*invnorm(uniform())

   twoway line y t || line x t
   save B6_simcoin.dta, replace

   *- 评论： 
   *  y 和 0.6x 亦步亦趋，二者的间距决定于 u_t 的标准差

*- sigma=3
   clear
   set seed 1357911
   set obs 100
   sim_arma x , ar(1) time(t)
   gen y = 0.6*x + 3*invnorm(uniform())

   twoway line y t || line x t

   * 进一步的解释：
   *   虽然许多因素（如持续的经济增长）会导致某些经济指标发生持续的变化，
   *   但这些具有共同趋势的经济指标之间可能存在长期的均衡关系。
   *   如收入(y_t)和消费(z_t)，
   *   虽然二者通常都为I(1)过程，但消费占收入的比例却是一个非常稳定的数值，
   *   因此，ln(y_t/z_t) = ln(y_t)-ln(z_t) 通常为 I(0)，即平稳过程。 


* 例：美国四州的房价
      use txhprice.dta, clear
      des
      sum
      *-四个州房价的时序特征
      tsset t 
      line austin dallas houston sa  t
      
* 例：中国三省的人均GDP
      use gdpChinaTS.dta, clear
      d  
      line shandong anhui henan year,sort




*----------------
*--- 协整分析 ---
*----------------

*-1- Johans 检验
  
  * 基本思路：
  * 把待分析的 N 个序列构成一个VAR(K)模型 
  *
  *          k
  *  x_t =  SUM{ B_i*x_t-i } + f*D_t  + m_0  + m_1*t  + e_t
  *         i=1
  *
  *  (t = 1,...,T )
  *
  * 我们可以把这个VAR模型表示成如下差分形式(VECM)：
  * 
  *           k-1
  *  d.x_t =  SUM{ G_i*d.x_t-i } + P*x_t-1  + f*D_t  + m_0  + m_1*t  + e_t
  *           i=1
  *
  *      P = A*B'
  *        B' 表示 (r) 个协整向量构成的矩阵
  *        A  表示相应的权重矩阵
  *
  * Johans 检验的依据: rank(A*B') 
  * 
  * 如果 rank(A*B') = r, 表明存在 r 个协整关系
  * rank 决定于矩阵 A*B' 中非零特征根的个数

  *-- 例1：模拟数据——二变量协整分析
    use B6_simcoin.dta, clear
    
  *=第一步: 确定滞后阶数
    varsoc y x
    
  *=第二步：确定协整关系的个数
    vecrank y x, lags(1)  /*stata官方命令*/
       
  *=第三步：估计VEC模型（长期关系和短期关系）
    *                                                 p
    * D.y_t = alpha * (c_0 + y_t-1 + beta*x_t-1)  +  SUM (D.y_t-j + D.x_t-j)
    *                                                j=1 
    * ----    ------   -------------------------    ----------------------
    * y GR   调整速度      协整方程：长期均衡关系      短期关系
    
    vec y x
    
* D.y = -1.023*(0.079 + y -0.58*x) + [0.0086 -0.121*D.y_t-1 -0.102*D.x_t-1] 
* D.x = -0.078*(0.079 + y -0.58*x) + [-0.113 -0.087*D.y_t-1 + 0.201*D.x_t-1]
* 含义：当 y 的数值过高时(偏离长期均衡态)，它会迅速朝着 x 的均值下调；
*       当 x 的数值过高时，它会朝着 y 的均值下调，但调整速度很低，且不显著。
*       因此，由 x 和 y 构成的协整关系中，x 居主导地位。
*
* 数据的真实生成过程：
* 
*      y_t = 0.6*x_t + u_t   |  corr(u_t,v_t) = 0 
*      x_t = x_t-1 + v_t     |  u_t, v_t are W.N.    
*
*   D.y_t = -(y_t-1 - b*x_t-1) + (b*v_t + u_t)
*   D.x_t = v_t
    
    * 协整方程： y -0.58x + 0.079 是一个平稳序列
      predict ce, ce
      line ce t, yline(0,lcol(blue))
       wntestb ce
      dfuller ce
   
  *=第五步：冲击反应函数
    vec y x
    irf create vec1, set(vec01, replace) step(20)
    irf graph oirf, impulse(x) response(y) 
    irf graph oirf, impulse(y) response(x) 
   
     
*-- 说明：vec 命令中 trend() 选项的设定：
*                                               p-1 
*   D.y_t = alpha*(y_t-1 - b*x_t-1 + c1+r1*t) + SUM (g_i*D.y_t-i) + c2+r2*t  
*           ------ ----------------  --------   i=1 --------------  --------                                                    
*          调整速度   长期均衡关系    时间趋势        短期动态关系     时间趋势

* --------------------------------------------------------
*  trend()中的选项        参数限制             备注
* --------------------------------------------------------
*     trend              无
*     rtrend              r2 = 0        
*     constant          r1=r2=0           (default)
*     rconstant         r1=r2=c2=0
*     none              c1=c2=r1=r2=0 
* --------------------------------------------------------

     vec y x, trend(rtrend)
  
        
     
*-------------------------
*-- 例2: 美国四州的房价变动
*-------------------------

    use txhprice.dta, clear
    des
    sum
    *-四个州房价的基本时序特征
    tsset t 
    line austin dallas houston sa  t
    
   *------------------------------- 
   *--Part I--  Dallas v.s. Houston
   *------------------------------- 
   * 二变量协整分析
   
    line dallas houston t
    
    * 一个直觉的解释：
    * 若两地的房价差异过大，居民和相关资源会在两地迁移，从而使两地价格趋同，
    * 因此，可以认为达拉斯和休斯敦的房价存在协整关系
    
    *-0 检验序列的平稳性
      dfuller dallas
      dfuller houston 
      * 直觉解释：在完全竞争市场中，当前的房价包含了所有信息，
      *           因此，我们无法预测明日房价的走势
    
    *-1  检验滞后阶数
      varsoc dallas houston
    
    *-2 检验协整关系的个数
      vecrank dallas houston, lag(2)
     
    *-4 建立 VECM(向量误差修正模型)
      vec dallas houston, lag(2)
      
      * 经济含义：
      * (1) 调整速度
      *    [D_dallas]L._ce1  = -0.304***
      *      若 Dallas 的房价过高，它会向着 Houston 的房价下调，
      *    [D_houston]L._ce1 = +0.503***  
      *      若 Dallas 的房价过高，Houston 的房价会追随之
      *      提示：若 [D_houston]L._ce1 = -0.503***
      *            则表明，若Houston的房价过高，它会向着 Dalla 的房价下调
      * (2) 长期均衡关系
      *     (P_dallas -1.69 - 0.868*P_houston)
         predict ce, ce
         list t dallas houston ce 
         * ce > 0: 表明 dallas 的房价高于均衡水平；
         * ce < 0: 标明 dallas 的房价低于均衡化水平
         twoway (line dallas houston t,yaxis(1)) ///
                (line ce t, yaxis(2))            ///
                , yline(0,axis(2) lp(dash) lc(black*0.4))    
                                       
    *-5 冲击反应分析（脉冲响应分析）
      irf create vec2, set(vec02, replace) step(24)
      * 正交冲击反应
        irf graph oirf, impulse(dallas)  response(houston)
        irf graph oirf, impulse(houston) response(dallas)
      * 累积正交冲击反应
        irf graph coirf, impulse(dallas)  response(houston)
        irf graph coirf, impulse(houston) response(dallas)    
    


   *------------------------------------ 
   *--Part II  austin dallas houston sa
   *------------------------------------ 
   * 多变量协整分析
     
     use txhprice.dta, clear
     tsset t 
     line austin dallas houston sa  t 
     
    *-0  检验平稳性
      dfuller austin 
      dfuller sa
       
    *-1  检验滞后阶数
      varsoc dallas houston austin sa
            
    *-2 检验协整关系的个数
      vecrank dallas houston austin sa, lag(2)
      vecrank dallas houston austin sa, lag(3)  /*为了稳妥起见*/
    
    *-3 检验那些序列之间存在协整关系
      johans dallas houston austin sa, lag(3)
      * lrjtest 和 wjtest 原假设：
      *    H0: 被检验变量无法进入协整关系
      *
      * LR test
        lrjtest dallas
        lrjtest houston
        lrjtest austin
        lrjtest sa
      *
      * Wald test
        wjtest dallas 
        wjtest houston
        wjtest austin
        wjtest sa
       * 因此，达拉斯、休斯敦和奥斯汀三个州的房价
       * 在协整关系中非常显著，而sa州则不显著。
     
    *-4 建立 VECM(向量误差修正模型)
      vec austin dallas houston, rank(2) lag(3)
      vec dallas houston austin, rank(2) lag(3) noetable
      
      
    *-5 冲击反因分析（脉冲响应分析）
      irf create vec3, set(vec03, replace) step(24)
      irf graph oirf, impulse(dallas houston) response(austin)
      irf graph oirf, impulse(dallas austin) response(houston)
      irf graph oirf, impulse(houston) response(austin dallas)
      
       
    *-6 一些相关的检验
      *--s6.1 协整方程的稳定性检验 --- 基于协整关系的拟合值
      *   因为调整系数的统计推断非常依赖于协整关系的稳定性
        vec austin dallas houston, rank(2) lag(5)
        predict ce1, ce eq(#1)
        predict ce2, ce eq(#2)
        twoway line ce1 t
        twoway line ce2 t
        line ce1 ce2 t
        line dallas houston austin t   /*1991年前后，三州的房价较为“混乱”*/
        wntestb ce1   /*第一个协整关系的设定似乎并不好*/
        wntestb ce2
        dfuller ce1
        dfuller ce2
        
        
      *--s6.2 检验协整个数的设定是否正确
      *   VECM 中参数的统计推断的合理性依赖于两个条件：
      *    1. 协整方程(关系)是稳定的；
      *    2. 协整个数的确定是正确的；这可以通过 vecrank 来决定
      * vecstable 同时对这两个问题进行检验
      * 思路：如果 VECM 中有 K 个内生变量，r 个协整关系，
      *       如果剩余的 K-r 个特征根的模非常接近于 1，就表明
      *       协整方程不稳定，或其中还有另一个共同趋势
     *                    即，rank() 选项设定的数值过高
      vec austin dallas houston, rank(2) lag(5)
      vecstable, graph
     
      
      *--s6.3 检验残差是否服从正态分布
      * Johansen(1995,p.141) 由于 VECM 采用 MLE 估计，
      * 假设干扰项为 i.i.d，且服从正态分布
      * 虽然在大样本下，无须正态分布假设，但考虑到多数时间序列都较短，
      * 因此，多数学者还是会检验残差是否服从正态分布
      vec austin dallas houston, rank(2) lag(5) 
      vecnorm
      
        * 采用模拟数据看看检验的效果
          preserve
            use B6_simcoin.dta, clear
            vec y x
            vecnorm
          restore
          
          
      *--s6.4 检验残差序列是否存在序列相关
      * VECM 的估计，统计推断和预测都假设干扰项不存在序列相关
        qui vec austin dallas houston, rank(2) lag(3)
        veclmar, mlag(5)
        
        preserve
          use B6_simcoin.dta, clear
          vec y x
          veclmar,mlag(3)
        restore
        
        
        
    *-- 例3: 中国区域增长—河南、安徽、山东
    
      use gdpChinaTS.dta, clear
      d  
      line shandong anhui henan year,sort
      
      varsoc shandong anhui henan
      
      vecrank shandong anhui henan, lag(2)
      
      vec shandong anhui henan, rank(2)
      * 在第一个协整关系中，三个省份  呈现出彼此“追赶”的效果；
      * 在第二个协整关系中，三个省份又呈现出彼此“牵制”的效果；

      irf create vec4, set(vec04, replace) step(20)
      irf graph oirf, impulse(henan) response(shandong anhui)
      irf graph oirf, impulse(shandong anhui ) response(henan)


          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================
          *          6.7  GARCH 模型 (I)

*=======================
*      ARCH 模型            help arch
*=======================
*
* 金融时间序列的基本特征
* ARCH 模型的基本设定
* ARCH 效应的检验
* ARCH 模型的估计
* 模型优劣的评估

cd d:\stata10\ado\personal\Net_Course\B6_TimeS

*---------
*  简 介
*---------
* 金融时序的基本特征：尖峰厚尾、波动丛聚性
*   大幅波动跟随着大幅波动，平静跟随着平静


* 例1：沪市大盘指数时序图
  use B6_hs_index.dta, clear
  global xd  "xlabel(,valuelabel)"
  cap drop t
   tostring date, gen(tt)
   encode tt, gen(t)
  tsset t

  * 2001-2008
  line index_hu t, $xd  ///  
     ytitle("ShangHai Stock Makket Index") ///
     xti("") xlabel(1(250)1800)

  * 2007-2008
  line index_hu t if date>20070101, $xd  ///
     ytitle("ShangHai Stock Makket Index") ///
     xti("") 
  
  
  * 收益波动
  
    * 上证综指收益率时序图 
      line rr_hu t, $xd xtitle("Returns of Shanghai stock market Index") ///
                    yline(0,lw(thick)) ytitle("") xlabel(1(330)1800)  
      graph save rhu, replace
    * 深证成指收益率时序图
      line rr_shen t, $xd xtitle("Returns of Shenzheng sotck market Index") ///
                      yline(0,lw(thick)) ytitle("") xlabel(1(330)1800)
      graph save rshen, replace
    * 沪深300指数收益率时序图
      line rr_hs300 t, $xd xtitle("Returns of Shen-Hu300 Index")  ///
                       yline(0,lw(thick)) ytitle("") xlabel(1(330)1800)
      graph save hs300, replace

      graph combine rhu.gph rshen.gph hs300.gph, col(1)   ///
        caption("Data Source: CCER, 20010101-20080430") 
        
        
    * 上证综指及其绝对值的时序图
      gen abs_rr_hu = abs(rr_hu)
      line rr_hu t, $xd ytitle(Returns) xlabel(1(330)1800) xtitle("") 
      graph save rr_hu.gph, replace
      line abs_rr_hu t, $xd ytitle(|Returns|) xlabel(1(330)1800) xtitle("") 
      graph save rr_hu_abs.gph, replace
      
      graph combine rr_hu.gph rr_hu_abs.gph, row(2) 

    * 分布特征： t 分布，尖峰厚尾
      sum rr_hu, detail
      histogram rr_hu, normal
      kdensity rr_hu, normal lw(thick)
      histogram rr_shen, normal
      histogram rr_hs300, normal
      
      * 正态分布检验
      qnorm rr_hu, grid   /*Q-Q图，对尾部特征比较敏感*/
      pnorm rr_hu, grid  /*对中间部位比较敏感*/ 
      
      * 综合处理
      * ssc install archqq
      archqq rr_hu   /*需要下载*/
     
     
     
*-------------
*== ARCH 模型   Engle (1982)
*-------------

  
    *-- 基本思想：采用自回归过程(AR(p))来描述干扰项的方差序列
    
    *-- 模型设定：
    *
    *   y_t = x_t*b + e_t   e_t -- N(0,s2_t)
    *
    *   Var(e_t) = sigma2_t 
    *            = h_t
    *            = c + a_1*e2_t-1 + a_2*e2_t-2 + ... + a_p*e2_t-p
    *              -----------------------------------------------
    *                              AR(p)  条件方差
    *
    *   其中，sigma2 = sigma^2 ；  e2 = e^2
    
    *-- 估计： MLE
    
    *-- 检验ARCH效应： Engle(1982)
    * 
    *   Step1: reg y x (OLS), 得到残差序列 e_t ；
    *   Step2: reg e2_t e2_t-1 ... e2_t-p (OLS)，得到 R2 ；
    *   Step3: 构造统计量 LM = T*R2 -- Chi2(p) ；
    
    
  *== 例2：上证综指收益率的 ARCH(p) 模型
      use B6_hs_index.dta, clear
      
   *- 检验 ARCH 效应是否存在：archlm 命令
      regress rr_hu 
      archlm, lag(1/20) 
      
      regress rr_hu L(1/3).rr_hu
      archlm, lag(1/20) 

      * 计算过程解析
        cap drop e
        cap drop e2
        reg rr_hu 
        predict e, res
        gen e2 = e^2 
        reg e2 L(1/10).e2
        local LM = e(N)*e(r2)
        dis in g "chi2(" in y "`e(df_m)'"  in g ") = " in y %6.3f `LM'  ///
            in g "     p-value = " in y %6.4f chi2(`LM', e(df_m))


   *- 估计： arch 命令
      arch rr_hu, arch(1/6)
      arch rr_hu, arch(1/10)
      archqq
      * 评论: (1) ARCH 模型通常需要设定较多的滞后阶数 
      *       (2) 通过加入常数项，我们基本上控制了偏度，
      *           但峰度问题仍然没有得到很好的控制  
      
      
   *- 确定最佳滞后阶数 
      * 信息准则 AIC BIC
      *    AIC = -2*ln(likelihood) + 2*k
      *    BIC = -2*ln(likelihood) + ln(N)*k
      *  where
      *      k = model degrees of freedom
      *      N = number of observations
        
        forvalues i = 1(1)10{
          qui arch rr_hu, arch(1/`i')
          est store Lag_`i'
        }
        estimates stats Lag*
        * 若根据AIC准则，选择ARCH(10) ；
        * 若根据BIC准则，选择ARCH(5) ；
      
      * 图形法——自相关函数图 (ac)
        ac e2, lag(40)
        gen rr_hu2 = rr_hu^2
        ac rr_hu2, lag(40)
        * 精简模型：ARCH(5)
        * 保守模型：ARCH(14)
   
   *- 预测值
      arch rr_hu, arch(1/5) 
      predict ht, variance   /*条件方差*/
      * ht = c + a_1*e2_t-1 + a_2*e2_t-2 + ... + a_5*e2_t-5
      line ht t
      predict et, residual   /*均值方程的残差*/
      sum et, detail
    
   *- 模型的评估    
      * 基本思想：
      *     若模型设定是合适的，那么标准化残差 
      *           z_t = e_t/sqrt(h_t)
      *     应为一个 i.i.d 的随机序列，即不存在序列相关和ARCH效应； 
      
      gen zt = et / sqrt(ht) /*标准化残差*/
      gen zt2 = zt^2         /*标准化残差的平方*/
      
      * 序列相关检验  
        pac zt
        corrgram zt    /*Ljung-Box 统计量*/
        * Q(10)=18.49  p-value=0.0472
        pac zt2
        corrgram zt2
        * Q(10)=8.874  p-value=0.5441 
      
      * 正态分布检验
        histogram zt, normal
        wntestb zt
        wntestb zt2
        
      * 评论：均值方程的设定可能需要改进，因为 zt 仍然表现出明显的序列相关。
      *       条件方差方程的设定基本满足要求，zt2 不存在明显的序列相关。
           
                    
  *== ARCH 模型的扩展        
  
    *- 在均值方程中加入滞后项
       arch rr_hu L(1/7).rr_hu, arch(1/5)
       * 多数滞后项在5%水平上都不显著
       * 练习：评估该模型的设定是否合理
       
    *- 在均值方程中加入 ARMA 过程: ARMA(1,1)-ARCH(5) 模型
       arch rr_hu , ar(1) ma(1) arch(1/5)
       
    *- 考虑“星期效应”，加入虚拟变量    
     
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第六讲  时间序列分析 
          *       ==========================
          *          6.7  GARCH 模型 (II)
      
      
cd d:\stata10\ado\personal\Net_Course\B6_TimeS 
    
*---------------
*== GARCH 模型     Bollerslev(1986)
*---------------
 

    *== 基本思想： 相当于把 AR(p) 模型扩展为 ARMA(p,q) 模型
    *             只是，我们研究的是干扰项的条件方差
   
    *== 模型设定：GARCH(p,q)
    *
    *   y_t = x_t*b + e_t ；   e_t -- N(0,s2_t)
    *
    *   Var(e_t) = sigma2_t 
    *            = h_t 
    *            = c + a_1*e2_t-1 + a_2*e2_t-2 + ... + a_p*e2_t-p
    *                + b_1*h_t-1  + b_2*h_t-2  + ... + b_q*h_t-q
    *
    *   GARCH(1,1):
    *
    *   Var(e_t) = h_t = c + c1*e2_t-1 + c2*h_t-1
    
    *== 特点：
    *     (1) 任何平稳的 GARCH(p,q) 可以转换为 ARCH(oo) 过程，
    *         任何高阶的 ARCH 过程都可以表示为低阶的 GARCH 过程；
    *     (2) 经验研究表明，
    *         最简单的 GARCH(1,1) 模型通常就可以达到很好的拟合效果。
    *
    *== 估计： MLE
    *
    *== 检验： 类似于ARCH LM 检验
    
    
    *== 例3：沪市综指 GARCH(1,1) 模型
      use B6_hs_index.dta, clear 
       arch rr_hu , arch(1) garch(1)
         est store GARCH11
       arch rr_hu , arch(1/5)
         est store ARCH5
       arch rr_hu , arch(1/10)
         est store ARCH10
       
       local mm "GARCH11 ARCH5 ARCH10"
       esttab `mm', mtitle(`mm') nogap scalar(ll aic bic)
       
       * 评论：简单的GARCH(1,1) 模型  -优于- 
       *       ARCH(5) 和 ARCH(10) 模型
       
     *- 模型的评估：同 ARCH 模型
        
     
  *== 一个简单的模拟分析：ARCH(1) 过程
  
      help sim_arch    /*Given by Lian Yujun*/
      
      * 使用方法
      clear
      set seed 135799191
      sim_arch z1 , arch(0.4)            nobs(1000)
      line z1 _t, yline(0)
      sim_arch z2 , arch(0.7) garch(0.2) nobs(1000)
      line z2 _t, yline(0)
      
      * 丛聚程度决定于 ARCH(1) 的系数
      sim_arch x1, rho(0) ar(0) nobs(1000) plot xtitle("(a)  a1=0")  yti(" ")  
         graph save gr1.gph, replace
      sim_arch x2, rho(0) ar(0.4) nobs(1000) plot xtitle("(b)  a1=0.2")  yti(" ")
         graph save gr2.gph, replace
      sim_arch x3, rho(0) ar(0.9) nobs(1000) plot xtitle("(c)  a1=0.9")  yti(" ")  
         graph save gr3.gph, replace

      graph combine gr1.gph gr2.gph gr3.gph, col(1) 

      * 序列的方差：放大丛聚特征
      gen x1sq = x1^2
      gen x2sq = x2^2
      gen x3sq = x3^2

      line x1sq _t, yline(0) xtitle(a1=0) ytitl("")
         graph save gr21.gph, replace
      line x2sq _t, yline(0) xtitle(a1=0.2) ytitl("")
         graph save gr22.gph, replace
      line x3sq _t, yline(0) xtitle(a1=0.9) ytitl("")
         graph save gr23.gph, replace

      graph combine gr21.gph gr22.gph gr23.gph, col(1)  
      
      * 练习：使用 sim_arch 命令，
      *       模拟分析不同参数取值下 GARCH(1,1) 的特征  
      
          
                                  
*--------------------
*== GARCH 模型的扩展     
*--------------------        

   *== ARMA(1,5)-GARCH(1,1) 设定
       use B6_hs_index.dta, clear
       arch rr_hu, ar(1) ma(1/5) arch(1) garch(1) 
         est store ARMA15_GARCH11 

     *-模型比较：LR test （还可以采用 AIC 和 BIC）
       qui arch rr_hu, arch(1) garch(1) 
         est store GARCH11
       lrtest GARCH11  ARMA15_GARCH11                
        
        
   *== GARCH(1,1)-t分布    Obllerslev(1986)
   *
   *   y_t = x_t*b + e_t ；   e_t -- t(k)
   
     arch rr_hu, nolog arch(1) garch(1) distribution(t)
        est store GARCH11_t
     arch rr_hu, arch(1) garch(1) distribution(t 5)
        est store GARCH11_t5

     lrtest GARCH11 GARCH11_t
     lrtest GARCH11_t GARCH11_t5
     
     local mm "GARCH11 GARCH11_t"
     esttab `mm', mtitle(`mm') nogap scalar(ll aic bic)


   *== GARCH(1,1)-GED分布    Nelson (1991) 对尖峰厚尾特征的表述更加灵活
   *
   *   y_t = x_t*b + e_t ；   e_t -- 广义指数分布(Generalized Exponential Distribution))

     arch rr_hu, arch(1) garch(1) distribution(ged)
        est store GARCH11_GED
    *- 解释：
    * 当shape < 2 时，广义指数分布具有较厚的尾部；
    * 当shape > 2 时则尾部较薄，
    * 当shape = 2 广义指数分布转化为正态分布。
  
    * 与 GARCH(1,1)-Normal 正态分布的对比
      lrtest GARCH11 GARCH11_GED
    * 与 GARCH(1,1)-t  t分布的对比
      lrtest GARCH11_t5 GARCH11_GED
   
     local mm "GARCH11 GARCH11_t GARCH11_GED"
     esttab `mm', mtitle(`mm') nogap scalar(ll aic bic)




*----------
* GARCH-M    Engle, Lillien and Robins (1987)
*----------

    * 基本思想：
    *     通常而言，多数金融资产都具有-高风险高回报-的特征。
    *     因此，资产回报也会受到其波动情况的影响：
    *
    * ARCH-M 模型
    *
    *   y_t = x_t*b1 + b2*h_t +  e_t,   e_t -- N(0,sigma2_t)
    *
    *   h_t = Var(e_t)  
    *       = c + a_1*e2_t-1 + a_2*e2_t-2 + ... + a_p*e2_t-p
    *
    * GARCH-M 模型
    *
    *   y_t = x_t*b1 + b2*h_t +  e_t,   e_t -- N(0,sigma2_t)
    *
    *   h_t = Var(e_t)  
    *       = c + a_1*e2_t-1 + a_2*e2_t-2 + ... + a_p*e2_t-p
    *           + b_1*h_t-1  + b_2*h_t-2  + ... + b_q*h_t-q

    * 估计 GARCH(1,1)-M 模型
    *
      use B6_hs_index.dta, clear
      arch rr_hu, nolog arch(1) garch(1) archm
      
    * 估计 GARCH(1,1)-M 模型，但 h_t 以平方根形式出现：
    *
    *   y_t = x_t*b1 + b2*sqrt(h_t) +  e_t
    *
      arch rr_hu, nolog arch(1) garch(1) archm archmexp(sqrt(X))
    
    * 估计 GARCH(1,1)-M 模型，但 h_t 以 log(h_t) 形式出现：
    *
    *   y_t = x_t*b1 + b2*log(h_t) +  e_t
    *       
      arch rr_hu, nolog arch(1) garch(1) archm archmexp(log(X))



*==================
*  非对称 GARCH
*==================

* 基本思想：
* 
*    股价的变化趋势往往与波动的变化趋势负相关。
*    具体而言，“坏消息”引起的波动明显大于“好消息”引起的波动，
*    通常称之为“非对称效应” (asymmetric effect) 
*            或“杠杆效应”(leverage effect)。

* ARCH 和 GARCH 的局限：
*
*    二者都无法捕捉非对称，
*    因为在二者条件方差的设定中，
*    干扰项的滞后项都是以平方的形式出现的，
*    致使正干扰和负干扰对条件方差具有完全相同的影响。 

*------------
*   E-GARCH
*------------

*-- 基本思想：
*     对“正干扰”和“负干扰”区别对待，二者有不同的系数估计值

*-- 模型设定：
*
*  log(h_t) = a0 + a1*[|e_t-1| - E|e_t-1| + delta*e_t-1] 
*                + a2*[|e_t-2| - E|e_t-2| + delta*e_t-2]
*                + ...
*
*             { Co + (1+delta)*(a1*|e_t-1| + a2*|e_t-2| + ...)   若 e[t-j] >= 0
*           = {
*             { Co + (1-delta)*(a1*|e_t-1| + a2*|e_t-2| + ...)   若 e[t-j] < 0

*-- 参数 -delta- 的含义：
*
*     1<delta : 正干扰会增加波动，而负干扰则会降低波动
*  0<delta<=1 : 正干扰引起的波动比负干扰要大
*     delta=0 : 正负干扰对波动的影响具有相同的效果
* -1<=delta<0 : 正干扰引起的波动比负干扰要小       (最为常见)
*    delta<-1 : 正干扰会降低波动，而负干扰会增波动
 
* 例：E-GARCH(1,1) 模型：
*
*    log(h_t) = c1 + b1*log(h_t-1) + b2*|e_t-1| + delta*e_t-1 
*
* 其中，c1 = a0 - a1*E|e_t-1| 是一个常数项。

  
*-- 估计 E-GARCH(1,1) 模型

    use B6_hs_index.dta, clear                               
    arch rr_hu, earch(1) egarch(1)
    
  * 得到的方差方程为：
  *
  *  log(h_t) = -0.165 + 0.979*log(h_t-1) + 0．224|e_t-1|
  *             -0.045*e_t-1
  *
  * 可见，存在显著的非对称效应
   
  *-- 信息冲击曲线(News Impact Curve)  Engle and Ng (1993)
    * 含义：标准化残差(z_t)变动一个单位引起的条件方差(h_t)的变动情况
    newsimpact, range(4) 

  * e_t -- t distribution
    arch rr_hu, nolog earch(1) egarch(1) distribution(t)
    newsimpact, range(4) 
    
  * e_t -- GED distribution
    arch rr_hu, nolog earch(1) egarch(1) distribution(ged)
    newsimpact, range(4) 

        
*== ARMA(p,q)-EGARCH(1,1) 模型

    *- ARMA(1,1)-EGARCH-t(1,1)
       arch rr_hu, nolog ar(1) ma(1) earch(1) egarch(1) distribution(t)

    *- ARMA(0,3)-EGARCH(1,1)
       arch rr_shen, ma(1/3) earch(1)egarch(1)
       newsimpact
    
    *- ARMA(1,5)-EGARCH(1,1)
       arch rr_hs300, ar(1) ma(1/5) earch(1) egarch(1)
       newsimpact


* 例: positive leverage effect
*
      use wpi1.dta, clear
      d
      arch D.ln_wpi, ar(1) ma(1 4) earch(1) egarch(1)
      newsimpact, range(4)



*--------------------------
*  GJR-GARCH v.s. T-GARCH  
*--------------------------
*  Glosten, Jagannathan, and Runkle (1993, GJR)；
*  Zakoian (1994, Threshold GARCH)

* 基本思想：
*   在传统的 GARCH 模型中进一步区分“正干扰”和“负干扰”
*   主要通过虚拟变量来实现

* 模型设定：
* 
*   h_t = a0 + a1*e2_t-1 + b1*h_t-1 + g1*e2_t-1*I_t-1
*
*   其中, I_t-1 = 1  (若 e_t-1>=0)
*         I_t-1 = 0  (若 e_t-1<0)
*
* 含义：若 g1 < 0，表明“坏消息”引起的波动显著大于“好消息”引起的波动，
*       即，存在“杠杆效应”。
*       若 g1 = 0, 则 T-GARCH 模型便转化为一般的 GARCH 模型。 

      use B6_hs_index.dta, clear  
      arch rr_hu, nolog arch(1) garch(1) tarch(1)
      newsimpact, range(4)

      use wpi1.dta, clear
      arch D.ln_wpi, arch(1) garch(1) tarch(1)
      newsimpact, range(4)


*------------
* I-GARCH
*------------
*- 基本思想：
*    在多数情况下，
*    我们会发现 GARCH 模型中 ARCH 部分和 GARCH 部分的系数之和非常接近于 1.
*    因此，可附加约束条件 a1 + b1 = 1, 
*    该模型便称为 I-GARCH 模型，具有长期记忆特征，
*    类似于时间序列中的单位根过程。

      use B6_hs_index.dta, clear  
      arch rr_hu, nolog arch(1) garch(1)
      dis  [ARCH]l1.arch + [ARCH]l1.garch 
      
   *- 估计 IGARCH(1,1) 模型
      constraint define 1 [ARCH]l1.arch + [ARCH]l1.garch = 1
      arch rr_hu, arch(1) garch(1) constraint(1)
   
   *- 估计 IGARCH(2,2) 模型
      arch rr_hu, arch(1/2) garch(1/2) 
      dis [ARCH]l1.arch  + [ARCH]l2.arch + [ARCH]l1.garch + [ARCH]l2.garch
      constraint define 2   [ARCH]l1.arch  + [ARCH]l2.arch  ///
                          + [ARCH]l1.garch + [ARCH]l2.garch = 1
      arch rr_hu, nolog arch(1/2) garch(1/2) constraint(2)  


*--------------------
* arch 命令选项的设定
*--------------------

*    Common term                            Options to specify           
*   ------------------------------------------------------------------
*    ARCH  (Engle,1982)                     arch()                       
*    GARCH (Bollerslev,1986)                arch() garch()               
*    ARCH-in-mean                           archm arch() [garch()]  
*      (Engle,Lilien,Robins，1987)     
*    GARCH with ARMA terms                  arch() garch() ar() ma() 
*    EGARCH (Nelson,1991)                   earch() egarch()             
*    TARCH, threshold ARCH (Zakoian,1990)   abarch() atarch() sdgarch()  
*    GJR, form of threshold ARCH            arch() tarch() [garch()]   
*      (Glosten,Jagannathan,Runkle,1993)  
*    SAARCH, simple asymmetric ARCH         arch() saarch() [garch()]  
*      (Engle,1990)  
*    PARCH, power ARCH (Higgins,Bera,1992)  parch() [pgarch()]           
*    NARCH, nonlinear ARCH                  narch() [garch()]            
*    NARCHK, NARCH with a single shift      narchk() [garch()]           
*    A-PARCH, asymmetric power ARCH         aparch() [pgarch()]          
*    NPARCH, nonlinear power ARCH           nparch() [pgarch()]          
*   -------------------------------------------------------------------        

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          
          
cd D:\stata10\ado\personal\Net_course\B7_Panel

*----------
* 7.1  静态面板模型：固定效应模型 v.s. 随机效应模型
* 7.2  时间效应、模型的筛选和常见问题
* 7.3  异方差、序列相关和截面相关
* 7.4  多方程模型
* 7.5  内生性问题与 IV-GMM 估计
* 7.6  面板随机系数模型
* 7.7  面板随机边界分析 
* 7.8  动态面板模型
* 7.9  面板单位根检验
* 7.10 面板协整分析
*
* 下面的内容将在 Panel Data 专题讲座视频中发布
* A.1  门槛面板模型（Panel Threshold Model）
* A.2  面板VAR模型(Panel VAR 模型)
* A.3  面板联立方程组模型


*-----------
* 参考资料
* 连玉君计量笔记第8章，重点介绍stata操作，可在我的博客中下载
* Greene(2000), chp14 较为清晰的介绍了静态面板模型
* Baltagi(2001), 一本专门介绍Panel的书，人大论坛可下载
* Arrllano(2003), 重点关注动态面板和GMM估计，人大论坛可下载
* Stata Longitudinal/Panel data Reference Manual(9) 
*     详细介绍了stata中有关Panel的各种命令
*
* 以上书籍我这里都有原版教材，可为大家提供复印版本


*-----------------
*  静态面板模型
*-----------------

*--------- 简介 -----------

* 面板数据的结构(兼具截面资料和时间序列资料的特征)
  use xtlabor.dta, clear
  browse
  tsset id year
  xtdes
  use invest2.dta, clear
  browse
  tsset id t
  xtdes

* ---------------------------------
* -------- 固定效应模型 -----------
* ---------------------------------
* 实质上就是在传统的线性回归模型中加入 N-1 个虚拟变量，
* 使得每个截面都有自己的截距项，
* 截距项的不同反映了个体的某些不随时间改变的特征
* 
* 例如： lny = a_i + b1*lnK + b2*lnL + e_it
* 考虑中国28个省份的C-D生产函数


* OLS 估计的偏误
 * 一份模拟数据
 do B7_introFe.do
 save B7_introFe, replace
 tsset id t
 xtdes

 twoway (scatter y x) (lfit y x)
 reg y x

 twoway (scatter y x) (lfit y x)   ///
           (lfit y x if id==1)     ///
           (lfit y x if id==2)     ///
           (lfit y x if id==3),    ///
           legend(off)    
 tab id, gen(dum)
 list
 reg y x dum1 dum2 dum3, nocons

 * 回归分析
   reg y x
     est store m_ols
   tsset id t
   xtreg y x, fe  
     est store m_fe
   est table m_ols m_fe, b(%6.3f) star(0.1 0.05 0.01) 
 
 * 真实的数据生成过程
   doedit B7_introFe.do
 
* 如何估计固定效应模型
 * 放入三个虚拟变量，即每家公司都有一个自己的截距项
   use B7_introFe, clear
   tab id , gen(dum)
   reg y x dum1 dum2 dum3, nocons
   est store m_pooldum3
 * 放入两个虚拟变量，三家公司有一个公共的截距项
   reg y x dum2 dum3
   est store m_pooldum2
 * 面板固定效应模型（stata的估计方法）
   tsset id t
   xtreg y x, fe  
   est store m_fe
  est table m_*, b(%6.3f) star(0.1 0.05 0.01)
  
    
 * stata的估计方法解析  
   * 目的：如果截面的个数非常多，那么采用虚拟变量的方式运算量过大
   *       因此，要寻求合理的方式去除掉个体效应
   *       因为，我们关注的是 x 的系数，而非每个截面的截距项
   * 处理方法：
   * 
   * y_it = u_i + x_it*b + e_it  (1)
   * ym_i = u_i + xm_i*b + em_i  (2)  组内平均
   * ym  = um + xm*b + em     (3) 样本平均
   * (1) - (2), 可得：
   * (y_it - ym_i) = (x_it - xm_i)*b + (e_it - em_i)  （4） /*within estimator*/
   * (4)+(3), 可得：
   * (y_it-ym_i+ym) = um + (x_it-xm_i+xm)*b + (e_it-em_i+em)    
   * 可重新表示为： 
   * Y_it = a_0 + X_it*b + E_it
   * 对该模型执行 OLS 估计，即可得到 b 的无偏估计量
                                                                          
   egen y_meanw = mean(y), by(id)  /*公司内部平均*/
   egen y_mean  = mean(y)          /*样本平均*/ 
   egen x_meanw = mean(x), by(id)
   egen x_mean  = mean(x)
   gen dy = y - y_meanw + y_mean
   gen dx = x - x_meanw + x_mean 
   reg dy dx 
   est store m_stata

   est table m_*, b(%6.3f) star(0.1 0.05 0.01) 


* 解读 xtreg,fe 的估计结果
  use invest2.dta, clear
  tsset id t
  edit
  xtreg market invest stock, fe
  
  *-- R^2
  * y_it = a_0 + x_it*b_o + e_it   (1)  pooled OLS        
  * y_it = u_i + x_it*b_w + e_it   (2)  within  estimator 
  * ym_i = a_0 + xm_i*b_b + em_i   (3)  between estimator 
  *
  * --> R-sq: within   模型(2)对应的R2，是一个真正意义上的R2
  * --> R-sq: between  corr{xm_i*b_w,ym_i}^2
  * --> R-sq: overall  corr{x_it*b_w,y_it}^2
  *
  *-- F(2,93) = 33.23 检验除常数项外其他解释变量的联合显著性
  *       93 = 100-2-5
  *
  *-- corr(u_i, Xb)  = 0.5256 
  *
  *-- sigma_u, sigma_e, rho 
  *   rho = sigma_u^2 / (sigma_u^2 + sigma_e^2)
    dis e(sigma_u)^2 / (e(sigma_u)^2 + e(sigma_e)^2)
    dis 1023.5914^2 / (1023.5914^2 + 370.9569^2)
  *
  * 个体效应是否显著？
  * F(4, 93) = 97.68  H0: a1 = a2 = a3 = a4 = 0
  * Prob > F = 0.0000  表明，固定效应高度显著
  
  *---如何得到调整后的 R2,即 adj-R2 ？
   use invest2.dta, clear
   qui tab id, gen(dum)
   cap drop dum1
   reg market invest stock dum*
   
   areg market invest stock, a(id)  /*更为简洁*/
  
  
  *---如何得到每家公司的截距项？ 
 
  * 方法一：加入 (N-1) 个虚拟变量，采用 OLS 估计
    use invest2.dta, clear
    tab id, gen(dum)
    reg market invest stock dum*, nocons
    xtreg market invest stock , fe
    * 优点：可以同时获得每个截距项的标准误、t值和p值
    * 适用于 大 T 小 N 型数据
  
  * 方法二：xi 前缀
    xi: reg market invest stock i.id
    xi: reg market invest stock i.id, robust
  
  * 方法三：采用predict命令
    qui xtreg market invest stock, fe
    predict a , u
    replace a = _b[_cons] + a
    duplicates example id a
    order id t a
    browse
    reg market invest stock dum*, nocons nohead       
  
  * 方法四：areg 命令
    areg market invest stock, absorb(id)         
    predict ai, d
    gen a_i = ai + _b[_cons]
    order id t a_i ai
    browse
    
  * 方法五：fese 命令
    * 采用areg估计模型，将截距项的标准误存于一个新的变量中
    * ssc install fese, replace
    use invest2.dta, clear
    fese market invest stock, s(o) oonly

        
  *---拟合值和残差
    * y_it = u_i + x_it*b + e_it
    * predict newvar, [option]                      
                                                     /*
       xb           xb, fitted values; the default
       stdp         calculate standard error of the fitted values
       ue           u_i + e_it, the combined residual
       xbu          xb + u_i, prediction including effect
       u            u_i, the fixed- or random-error component
       e            e_it, the overall error component */
 
    xtreg market invest stock, fe
    predict y_hat 
    predict a   , u
    predict res , e
    predict cres, ue
    gen ares = a + res
    list ares cres in 1/10

  

* ---------------------------------
* ---------- 随机效应模型 --------- 
* ---------------------------------

*  y_it = x_it*b + (a_i + u_it)
*       = x_it*b +  v_it 
* 基本思想：将随机干扰项分成两种
*           一种是不随时间改变的，即个体效应 a_i
*           另一种是随时间改变的，即通常意义上的干扰项 u_it 
* 估计方法：FGLS
*           Var(v_it) = sigma_a^2 + sigma_u^2
*           Cov(v_it,v_is) = sigma_a^2
*           Cov(v_it,v_js) = 0 
* 利用Pooled OLS，Within Estimator, Between Estimator
* 可以估计出sigma_a^2和sigma_u^2,进而采用GLS或FGLS
* Re估计量是Fe估计量和Be估计量的加权平均
*  yr_it = y_it - theta*ym_i
*  xr_it = x_it - theta*xm_i
*  theta = 1 - sigma_u / sqrt[(T*sigma_a^2 + sigma_u^2)]  


* 解读 xtreg,re 的估计结果
  use invest2.dta, clear
  xtreg market invest stock, re

  *-- R2 
  * --> R-sq: within   corr{(x_it-xm_i)*b_r, y_it-ym_i}^2
  * --> R-sq: between  corr{xm_i*b_r,ym_i}^2
  * --> R-sq: overall  corr{x_it*b_r,y_it}^2
  * 上述R2都不是真正意义上的R2，因为Re模型采用的是GLS估计。
  *
  *   rho = sigma_u^2 / (sigma_u^2 + sigma_e^2)
    dis e(sigma_u)^2 / (e(sigma_u)^2 + e(sigma_e)^2)
  *
  * corr(u_i, X) = 0 (assumed)  
  * 这是随机效应模型的一个最重要，也限制该模型应用的一个重要假设
  * 然而，采用固定效应模型，我们可以粗略估计出corr(u_i, X)
    xtreg market invest stock, fe
  *
  *  Wald chi2(2) = 95.98   Prob> chi2 = 0.0000

    






          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *    7.2 时间效应、模型的筛选和常见问题          
          
cd D:\stata10\ado\personal\Net_course\B7_Panel

*---------目录--------

* 7.2.1  时间效应（双向固定(随机)效应模型）
* 7.2.2  模型的筛选
* 7.2.3  面板数据常见问题
* 7.2.4  面板数据的转换  

* ----------------------------------
* ------------时间效应--------------
* ----------------------------------
  * 单向固定效应模型
  * y_it = u_i       + x_it*b + e_it
  * 双向固定效应模型
  * y_it = u_i + f_t + x_it*b + e_it
   
    use xtcs, clear
    qui tab year, gen(yr)
    drop yr1
    xtreg tl size ndts tang tobin npr  yr*, fe
    
  * 随机效应模型中的时间效应
    
    xtreg tl size ndts tang tobin npr  yr*, re
    
  * 检验时间效应是否显著
  
    * Wald 检验
    xtreg tl size ndts tang tobin npr  yr*, fe  
    test yr2 = yr3 = yr4 = yr5 = yr6 = yr7
    test yr2 = yr3 = yr4 = yr5 = yr6 = yr7 = 0
    
    * LR 检验
    xtreg tl size ndts tang tobin npr    , fe  
    est store fe
    xtreg tl size ndts tang tobin npr yr*, fe  
    est store fe_dumt
    lrtest fe fe_dumt



* ---------------------------------
* ----------- 模型的筛选 ---------- 
* ---------------------------------

  * 固定效应模型还是Pooled OLS？
    use invest2.dta, clear
    xtreg market invest stock, fe   /*Wald 检验*/
    
    qui tab id, gen(dum)            /*LR检验*/
    reg market invest stock
    est store m_ols
    reg market invest stock dum*, nocons  
    est store m_fe
    lrtest m_ols m_fe
    
    
  * 随机效应模型还是Pooled OLS？
  * H0: Var(u) = 0
    * 方法一：B-P 检验
      xtreg market invest stock, re
      xttest0
    * 方法二：LR test（似然比检验）
      xtreg market invest stock, re mle    
  
  
  * 固定效应模型还是随机效应模型？ 
  * y_it = u_i + x_it*b + e_it
  
    *--- Hausman 检验 ---
    
    * 基本思想：如果 Corr(u_i,x_it) = 0, Fe 和 Re 都是一致的，但Re更有效
    *           如果 Corr(u_i,x_it)!= 0, Fe 仍然有效，但Re是有偏的
    
    * 基本步骤
      use xtcs.dta, clear
      xtreg tl size ndts tang tobin npr, fe
        est store fe
      xtreg tl size ndts tang tobin npr, re
        est store re
      hausman fe re
      
    * Hausman 检验值为负怎么办？
    * 通常是因为RE模型的基本假设 Corr(x,u_i)=0 无法得到满足
     use invest2.dta, clear
     xtreg market invest stock, fe
       est store m_fe
     xtreg market invest stock, re
       est store m_re
     hausman m_fe m_re
     
    * 检验过程中两个模型的方差-协方差矩阵都采用Fe模型的 
     hausman m_fe m_re, sigmaless 
    * 两个模型的方差-协方差矩阵都采用Re模型的   
     hausman m_fe m_re, sigmamore  
  
   * 如果Hausman检验拒绝Re模型，怎么办？
   * (1) Fe  (2) IV 估计

   *--- xtoverid 命令 ---
   * 基本思想：如果二者都是一致的，那么系数估计值应当不存在显著差异
   xtreg market invest stock, re
   xtoverid



* ---------------------------------
* ---------- 一些常见问题 --------- 
* ---------------------------------

  *== 为何tsset命令总是报告错误信息？
    use invest3.dta, clear
    tsset id t             /*错误*/
    xtdes
    duplicates report id t
    duplicates example id t
    list if id == 1
    duplicates drop id t, force
    tsset id t

    
  *== 数据的结构 xtdes xtpattern 
    xtdes
    xtpattern, gen(pat)  /*findit xtpattern*/
    tab pat
    keep if pat == "11111111111111111111"  /*20个1*/
    xtdes
    
    
  *== 为何有些变量会被drop掉？
    use nlswork.dta, clear
    tsset idcode year
    xtreg ln_wage hours tenure ttl_exp, fe  /*正常执行*/
  * 产生种族虚拟变量
    tab race, gen(dum_race)
    xtreg ln_wage hours tenure ttl_exp dum_race2 dum_race3, fe
  * 为何 dum_race2 和 dum_race3 会被 dropped ?
  * 固定效应模型的设定：y_it = u_i + x_it*b + e_it  (1)
    * 由于个体效应 u_i 不随时间改变，
    * 因此若 x_it 包含了任何不随时间改变的变量，
    * 都会与 u_i 构成多重共线性，Stata会自动删除之。
    
        
  *== unbalance —> balance 
    use invest3.dta, clear
    duplicates drop id t,force
    xtdes
    
    xtbalance, range(3 19)                    /*written by arlion*/

    use abond91.dta, clear 
    tsset id year
    xtdes         /*unbalanced*/
    sum           /*many missing values*/
    xtbalance , rang(1978 1982) miss(_all)    /*written by arlion*/
    xtdes
    sum
  
  
  *== 得到时间连续的样本
  *- 样本
    use grunfeld.dta, clear
    drop  in 28
    drop  in 55
    drop  in 87
    drop  in 94
    xtdes
  *- 转换
  *- 主要目的：去除 varlist 中的缺漏值，把时间不连续的部分删除
    cap erase grun1.dta
    onespell invest mvalue kstock, saving(grun1) replace
    use grun1.dta, clear
    xtdes
    
  
  *== 得到连续的公司编号
  *- 问题：在使用循环命令(如forvalues)时，需要公司编号是连续的，
  *        此时可采用 egen 命令提供的 group() 函数。
  *        
     use xtcs.dta, clear
     tsset code year
     list code year tl if code<20 
    egen code_new = group(code)
     list code code_new year tl if code<20 
     tsset code_new year
     xtdes
     
     * 启示：采用同样的方法，可以针对任何类别变量生成连续编号
  
  
  *== 长条形数据与扁平型数据的转换
    use reshape.dta, clear
    browse
    * 扁平 —> 长条
      reshape long r c, i(id) j(year)
      tsset id year
      list in 1/20, sep(4)
    * 长条 —> 扁平
      reshape wide r c, i(id) j(year)
      browse 
   
   
  *== 绘图
    * xtline
     use invest2.dta, clear
     xtline invest
     xtline invest, overlay
     xtline market invest stock
    * xtgraph
     xtgraph invest, av(mean)
     
  *== 统计类别变量
    use xtlabor, clear
    xtab age        /*按截面个数统计*/
    tabulate age    /*按样本数统计*/
    
    xttab   south
    xttrans south

  *== 统计个体的数目
    use xtcs.dta, clear
    count   if tl > 0.6
    xtcount if tl > 0.6
    

* ----------------------------------
* ----------面板数据的转换----------
* ----------------------------------

  *== FE 转换 == 
  * y[it]  = x[it]*b + u_i + v[it]
  * ym[it] = y[it] - ym[it]
  
  use invest2.dta, clear
  xtset
  list if id == 1
  xtreg invest market stock, fe
  
  xtdata invest market stock, fe
  list if id == 1
  reg invest market stock   
  
  * 用途：
  * (1) 当截面数目较大时(如N=10000),采用这种方法运算速度较快；
  * (2) 我们可以得到调整后的 R2；


  *== RE 转换 ==
  * y[it]  = x[it]*b + u_i + v[it]
  * ym[it] = y[it] - rho*ym[it]  
  * rho = sigma_u / sigma_v
  use invest2.dta, clear
  xtreg invest market stock, fe
  local rho = `e(sigma_u)' / `e(sigma_e)'
  
  xtdata invest market stock, re ratio(`rho')
  reg invest market stock 
  xtreg invest market stock, re 
  
  
* ----------------------------------
* ------------几点评论--------------
* ----------------------------------   
* (1) 多数实证研究都采用固定效应模型或双向固定效应模型
* (2) 随机效应模型有两个突出的优点：
*         一是比较有效；
*         二是可以分析不随时间改变的变量的影响，如性别、种族、教育程度等



          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *      7.3 异方差、序列相关和截面相关          
          
cd D:\stata10\ado\personal\Net_course\B7_Panel

 
*-------------------------------
*  异方差、序列相关和截面相关
*-------------------------------
* 7.3.1  简介
* 7.3.2  假设检验
* 7.3.3  估计方法



* ---------------- 简  介 -------------

*  y_it = x_it*b + u_i + e_it 
*  
*  由于面板数据同时兼顾了截面数据和时间序列的特征，
*  所以异方差和序列相关必然会存在于面板数据中；
*  同时，由于面板数据中每个截面（公司、个人、国家、地区）之间还可能存在内在的联系，
*  所以，截面相关性也是一个需要考虑的问题。
*
*  此前的分析依赖三个假设条件：
* （1） Var[e_it] = sigma^2     同方差假设
*  (2)  Corr[e_it, e_it-s] = 0 序列无关假设
*  (3)  Corr[e_it, e_jt] = 0   截面不相关假设
*  
*  当这三个假设无法得到满足时，便分别出现 异方差、序列相关和截面相关问题；
*  我们一方面要采用各种方法来检验这些假设是否得到了满足；
*      另一方面，也要在这些假设无法满足时寻求合理的估计方法。


* ---------------- 假设检验 -------------

  *== 组间异方差检验（截面数据的特征）
  *  Var(e_i) = sigma_i^2
    * Fe 模型
    use xtcs.dta, clear
    xtreg tl size ndts tang tobin npr, fe
    xttest3
    
    use invest2.dta, clear
    xtreg market invest stock, fe
    xttest3
    
    * Re 模型
    * Re本身已经较大程度的考虑了异方差问题，主要体现在sigma_u^2上   
    
  *== 序列相关检验
    * Fe 模型
      * xtserial  Wooldridge(2002)，若无序列相关，则一阶差分后残差相关系数应为-0.5
        use invest2.dta, clear
        xtserial market invest stock
        xtserial market invest stock, output
        * 解释
        reg D.market D.invest D.stock, nocons robust cluster(id)
        predict e, res
        reg e L.e, nocons cluster(id)
        test L.e = -0.5
    
      * abar  Arellano-Bond (1991)检验
        qui tab id, gen(dum)
        reg market invest stock, cluster(id)
        abar
        reg market invest stock dum*, nocons 
        abar
     
     * Re 模型   
        xtreg market stock invest, re
        xttest1     /*提供多个统计检验量*/
        
               
  *== 截面相关检验
     * xttest2命令  H0: 所有截面残差的相关系数都相等
     *              chi2(p)  p = n(n-1)/2  see Greene(2000, p.601)
        use invest2.dta, clear
        xtreg market invest stock, fe
        xttest2
        * 由于检验过程中执行了SUE估计，所以要求T>N
        use xtcs.dta, clear  /*失败*/
        xtreg tl size ndts tang tobin npr, fe
        xttest2
     
     * xtcsd 命令（提供了三种检验方法）
        use invest2.dta, clear
        xtreg market invest stock, fe
        xtcsd , pesaran     /*Pesaran(2004)*/
        xtcsd , friedman    /*Friedman(1937)*/
        xtcsd , frees       /*Frees(1995)*/
        xtcsd , pesaran show   
        
        xtreg market invest stock, re
        xtcsd , pesaran
        xtcsd , pesaran show   
        
        use xtcs.dta, clear  /*耗时很长*/
        xtreg tl size ndts tang tobin npr, fe
        xtcsd , pesaran    
        
        
        
* ----------------- 估计方法 ---------------------

  *== 异方差稳健型估计
      use xtcs.dta, clear  
      xtreg tl size ndts tang tobin npr, fe robust  
      est store fe_rb
  
  *== 采用Bootstrap标准误（优点：统计推断并不依赖具体的分布假设）
      xtreg tl size ndts tang tobin npr, fe vce(bootstrap, reps(50)) 
      est store fe_bs50
      *xtreg tl size ndts tang tobin npr, fe vce(bootstrap, reps(1000))
      *est store fe_bs1000    
      * 原理：
      *      y_it = u_i + x_it*b + v_it        (1)
      * 估计完毕后，将得到b和u_i的估计值，设为 b0 和 u0_i,则
      *      ybs_it = u0_i + x_it*b0 + vbs_it  (2)  Bootstrap样本
      * 估计（2），得到 b_bs1, b_bs2,......b_bs300
      * 计算这300个系数的标准差，便可以得到系数 b 的标准误
      
    * 结果对比
      xtreg tl size ndts tang tobin npr, fe
      est store fe
      *local models "fe fe_rb fe_bs300 fe_bs1000"
      local models "fe fe_rb fe_bs50"      
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models')   
 
           
  *== 序列相关估计
    * 一阶自相关 xtregar, fe/re 
      * 模型：  y_it = u_i + x_it*b + v_it        (1)
      *         v_it = rho*v_it-1 + z_it          (2)
    
      xtregar tl size ndts tang tobin npr, fe 
      est store fe_ar1
      xtregar tl size ndts tang tobin npr, fe lbi /*Baltagi-Wu LBI test*/
      * 说明：
      * (1) 这里的Durbin-Watson = .95223622 具有较为复杂的分布，
      *     不同于时间序列中的D-W统计量。
      * (2) 其临界值见Bhargava et al. (1982, The Review of Economic Studies 49:553-549)
      * (3) Baltagi-Wu LBI = 1.3890829 基本上没有太大的参考价值，
      *     因为他们并未提供临界值表，而该统计量的分布又相当复杂
      
      xtregar tl size ndts tang tobin npr, re    
      est store re_ar1             
      
      * 两阶段估计
        xtregar tl size ndts tang tobin npr, fe twostep
        est store fe_ar1_two    
    
      * 选择一阶相关系数的计算方法
        xtregar tl size ndts tang tobin npr, fe rhotype(tscorr)
        est store fe_ar1_tscorr  
      
      * 结果对比
        xtreg tl size ndts tang tobin npr, fe
        est store fe
        local models "fe fe_ar1 re_ar1 fe_ar1_two fe_ar1_tscorr"
        esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w corr)    
                      
      * 关于D-W值
      * (1) 在Panel Data分析中，除非T很大，通常没有必要列出DW
      * (2) 虽然能按照上述方法列出DW值，但一定要给出临界值，
      *     否则没有参考意义，因为其分布与传统的DW迥异；
      
    
   * 高阶自相关
     * newey2 命令
     use invest2.dta, clear
     newey2 market invest stock, lag(2)   
     neweyvif 
     * 利用newey2命令得到膨胀因子(VIF)
     use xtcs.dta, clear
     newey2 tl size ndts tang tobin npr, lag(0)
     neweyvif
   
   * xtreg,fe估计,但采用Newey-West估计调整标准误.
     use invest2.dta, clear
     *gthacker market invest stock, lag(1)
     xtivreg2 market invest stock, fe bw(2) robust small
     est store fe_gtha
       * 结果对比
         xtreg market invest stock, fe
         est store fe
         local models "fe fe_gtha"
         esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') 
         

                     
  *== 组间相关（截面相关）
    * cluster 选项
      use xtcs.dta, clear 
      xtreg tl size ndts tang tobin npr, fe cluster(code)  
      est store fe_cluster  
      xtreg tl size ndts tang tobin npr, re cluster(code)  
      est store re_cluster   
   
         
  *== 一个综合的处理方法：xtscc 命令 （推荐使用） 
  * 详见 Stata Journal，2007(3): 281-312.
  * 当异方差、序列相关以及截面相关性质未知时
  * xtscc相当于White/Newey估计扩展到Panel的情形
  * Driscoll and Kraay (1998) 
      use xtcs.dta, clear 
      xtscc tl size ndts tang tobin npr, fe     
      est store fe_scc
      xtscc tl size ndts tang tobin npr, fe lag(1)    
      est store fe_scc_lag1      
      xtreg tl size ndts tang tobin npr, fe     
      * 结果对比
        xtreg tl size ndts tang tobin npr, fe
        est store fe
        local models "fe fe_scc fe_scc_lag1"
        esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w)  


          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.4 多方程模型 
          *         
          
cd D:\stata10\ado\personal\Net_course\B7_Panel

*----------------------------------------------
*  多方程模型(Systems of Regression Equations)
*----------------------------------------------
* 7.4.1  简介
* 7.4.2  xtgls 命令
* 7.4.3  xtpcse 命令


*--- 简介（Greene, 2000, chp15）
 
  * 例1：公司投资行为
  *     I[i,t] = a0 + a1*Q[i,t] + a2*CFLOW[i,t] + e[i,t] 
  *  
  * 例2：CAPM 模型
  *     r[i,t] - r[f,t] = a[i] + b[i]*(r[m,t]-r[f,t]) + e[i,t]  
  * 
  * 模型
  *    y = X*b + U
  *    重点在于考虑干扰项 U 的结构，包括
  *    (1) 异方差 (2) 序列相关 (3) 截面相关性
  * 应用范围：多用于“大T，小N”型面板数据，
  *           因为，此时截面的异质性并不是重点关注的，而时序特征则较为明显
  *           因此，模型设定中未考虑个体效果
  
  * | y_1 |   | X_1 |       | e_1 |
  * | y_2 |   | X_2 |       | e_2 |   
  * |  .  |   |  .  |       |  .  |
  * |  .  | = |  .  | * b + |  .  |
  * |  .  |   |  .  |       |  .  | 
  * | y_n |   | X_n |       | e_n |
  
  
  *-- 截面异方差
  
  *     E[e_i*e_i'] = s_i^2 
  *     
  *         | s1^2    0   ...   0   |
  *         |   0   s2^2  ...   0   |       
  *         |         .             |
  *     V = |         .             |       
  *         |         .             |
  *         |   0     0   ...  sn^2 | 
  
  
  *-- 截面相关
  
  *     E[e_i*e_i'] = s_ij^2 
  *     
  *         | s_11  s_12   ...  s_1n  |
  *         | s_21  s_22   ...  s_2n  |       
  *         |         .               |
  *     V = |         .               | * sigma^2       
  *         |         .               |
  *         | s_n1  s_n2   ...  s_nn  | 
  
  
  *-- 序列相关
  
  *     E[e_i*e_i'] = s_i^2 * M_i 
  *     
  *         | s1^2*M_1      0      ...     0     |
  *         |     0      s2^2*M_2  ...     0     |       
  *         |               .                    |
  *     V = |               .                    |       
  *         |               .                    |
  *         |     0         0      ...  sn^2*M_n |   
  
  
  * GLS 估计 
  
  *       b   = [X'V^{-1}*X]^{-1}[X'V^{-1}y]
  *     Var[b] = [X'V^{-1}*X]^{-1}
          
  
*--- 估计和检验 -------------
 
  *=== xtgls 命令 
    use invest2.dta, clear
    xtgls market invest stock, panels(iid)   /*iid, 等同于Pooled OLS*/
      est store g_0
    reg market invest stock
      est store g_ols
    xtgls market invest stock, panel(het)    /*截面异方差*/
      est store g_phet
    xtgls market invest stock, corr(ar1)     /*所有截面具有相同的自相关系数*/
      est store g_par1
    xtgls market invest stock, corr(psar1)   /*每个截面有自己的自相关系数*/
      est store g_psar1
    xtgls market invest stock, panel(corr)   /*截面间相关且异方差*/
      est store g_pcorr
    xtgls market invest stock, p(c) corr(ar1)
      est store g_all
      
    * 检验异方差
      xtgls market invest stock, panel(het)    /*截面异方差*/
      xttest3  
    
    * 检验序列相关
      xtserial market invest stock
     
    * 检验截面相关
      xtgls market invest stock, panel(het)
      xttest2
      
    
    * 结果对比
      xtreg market invest stock, fe
      est store fe
      local models "fe g_0 g_ols"
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w)       
      local models "fe g_phet g_par1 g_psar1 g_pcorr g_all"
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w) compress      
   
    * 说明：
    *  为何 xtgls 不汇报 R2 ?  
    *    因为此时的R2未必介于0和1之间，不具有传统线性回归模型中R2的含义     
      
      
  *=== xtpcse 命令
    * 默认假设：存在截面异方差和截面相关
    * 估计方法：OLS 或 Prais-Winsten 回归
    * 有别于xtgls(采用FGLS估计)
    * 更适于方块面板 N不大(10-20),T不大(10-40) 
    * 与 xtgls 的区别：估计方法不同
    *    xtgls 采用GLS进行估计，而xtpsce采用OLS。
    
    use invest2.dta, clear
    xtpcse invest market stock
    est store pcse_full     /*OLS估计，调整异方差和截面相关后的标准误*/
    
    xtgls invest market stock, panels(correlated)
    est store m_xtgls           /*FGLS估计，异方差和截面相关*/
    
    xtpcse invest market stock, correlation(ar1)
    est store pcse_ar1      /*Prais_Winsten估计，共同的自相关系数*/
    
    xtpcse invest market stock, correlation(ar1) rhotype(tscorr)
    est store pcse_tscorr   /*指定自相关系数的计算方法*/
    
    xtpcse invest market stock, correlation(ar1) hetonly  
    est store pcse_ar1      /*不考虑截面相关*/      
      
      * 结果对比
      xtreg invest market stock, fe
      est store fe
      local models "fe pcse_full m_xtgls pcse_ar1 pcse_tscorr pcse_ar1"
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w)    
      * xtpcse 的结果与 xtgls 非常相似，但前者可以汇报R2    
 
     
    * 当N较大时，采用该方法会非常费时，
    * 因为方差协方差矩阵是采用OLS估计的残差计算的
    use xtcs.dta, clear
    xtdes
    xtpcse tl size ndts tang tobin npr  /*大约5-8分钟*/
    est store xtpcse
    xtreg tl size ndts tang tobin npr, fe
    est store fe
    
      * 结果对比
      local models "fe xtpcse"
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') r2 sca(r2_w)    
      * 系数估计值有较大差别，但符号和显著性是一致的。
            
      
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *      7.5 内生性问题与 IV-GMM 估计
          
cd D:\stata10\ado\personal\Net_course\B7_Panel
                          
*-------------------------------
*    内生性问题与 IV 估计
*-------------------------------
* 7.5.1  一般意义的内生性问题 Corr(x_it,e_it) != 0
* 7.5.2  面板特有的内生性问题 Corr(x_it,a_i) != 0
  


* 模型： y_it = a_i + z_it*b1 + x_it*b2 + e_it
*    z_it  严格外生
*    x_it  可能存在内生问题


*=== 第一种情况：Corr(x_it,e_it) != 0  
*------------------------------------
* 此时，Fe 和 Re 估计量都是非一致的，一般情形下的内生性问题
* 主题：
*    (1) 是否存在内生性问题？
*    (2) 工具变量的选择是否合适？过度识别、识别不足与弱工具变量问题
*    (3) 估计

   *== 例1：资本结构影响因素分析 
   
     *-- 估计
     use xtcs.dta, clear
     xtreg   tl size ndts tang tobin npr, fe
       est store fe
     xtivreg tl size ndts tang (npr=tobin L1.npr), fe
       est store fe_iv
       * 结果对比
         local models "fe fe_iv"
         esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') sca(r2 r2_w)  
          
     *-- 检验内生性是否存在
       * Davidson-MacKinnon (1993) 检验
       * H0：OLS 和 xtivreg 都是一致的，即内生性问题对OLS的估计结果影响不大
         xtivreg tl size ndts tang (npr=tobin L1.npr), fe
         dmexogxt

       * Hausman-Wu 检验
         hausman fe fe_iv
         hausman fe fe_iv, sigmamore
         hausman fe fe_iv, sigmaless
         * 说明：相对于 D-M 检验，
         *       Hausman检验的主要局限就在于可能产生小于零的统计量。
     
     *-- 过度识别检验
     * 基本思想：
     *     检验工具变量的合理性，即与内生变量相关，而与干扰项不相关
         xtivreg tl size ndts tang (npr=tobin L1.npr), fe
         xtoverid
         
         
     *-- 过度识别、识别不足与工具变量弱相关问题
         
         xtivreg2 tl size ndts tang (npr=tobin L1.npr), fe
      
      *-- 识别不足检验
      * (underidentification test) Anderson canon. corr. LR statistic:   
      * 原假设：存在识别不足问题，即工具变量与内生性变量不相关
      * 说明：即使不存在识别不足问题，但仍然可能存在弱工具变量问题
      
      *-- 弱工具变量检验：
      * (weak identification test) Cragg-Donald F statistic：
      *  原假设：工具变量与内生变量有较强的相关性
         xtivreg2 tl size ndts tang (npr=L(1/2).tobin L(1/2).npr), fe
         
      *-- 过度识别检验：
      * (overidentification test of all instruments) Sargan statistic:
      * 基本思想：类似于Sargan-Hansen statistic
      *     检验工具变量的合理性，即与内生变量相关，而与干扰项不相关
      
      * 参考文献：连玉君,苏治,丁志国. 
      *           现金-现金流敏感性能检验融资约束假说吗？
      *           《统计研究》,2008,10.
      
      
      
   *== 例2：美国妇女工资的决定因素 
   
     *-- 估计
     use nlswork.dta, clear
     tsset idcode year
     xtdes
     
     gen age2 = age^2
     xtreg ln_w age* tenure not_smsa union south, fe  
       est store fe
     xtivreg ln_w age* not_smsa (tenure = union south), fe  /*within estimation*/
       est store fe_iv          
     xtivreg ln_w age* not_smsa (tenure = union south), re  /*random effects*/
       est store re_iv    
       
       * 结果对比
         local models "fe fe_iv re_iv"
         esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') sca(r2 r2_w) 
     
     * 评论：虽然tenure是显著的，但age却不显著，
     *       而age是理论上认为对工资产生重要影响的一个因素
     * 由于研究的是个体的工资决定因素，而样本可视为有一个很大的母体随机抽取而来，
     * 因此，采用随机效应模型可能更为合适
     * 重新设定模型如下：
     
       gen black = (race==2)
      xtivreg ln_w age* not_smsa black (tenure = union south birth), re 
              
     
       
  * ------------一些需要说明的问题------------------
  * ==工具变量的选择
  *  (1) 理论为基础
  *  (2) 滞后项经常被用作工具变量
  *  (3) 经验和上述统计量
  
  * == 关于 t 值和 z 值；Wald统计量与F统计量
     use xtcs.dta, clear
     * 大样本，z值
     xtivreg tl size ndts tang (npr=L(1/2).tobin L(1/2).npr), fe        
     * 小样本，t值
     xtivreg tl size ndts tang (npr=L(1/2).tobin L(1/2).npr), fe small  
     
  * == Bootstrap 标准误
     xtivreg tl size ndts tang (npr=L(1/2).tobin L(1/2).npr),  ///
                                   fe vce(bootstrap, rep(50))
     * 通常 rep(300),即抽样次数在300次以上即可达到较好的效果
     
  * == 异方差稳健型估计(仅适用于xtivreg2命令)
     xtivreg2 tl size ndts tang (npr=L(1/2).tobin L(1/2).npr), fe robust
     
  * == 存在序列相关的IV估计
     use invest2.dta, clear
     qui tsset id t
     gen Lag1_invest = L.invest
     gen Lag2_invest = L2.invest
     newey2 market (invest = Lag1_invest Lag2_invest) stock, lag(2) 


* y_it = a_i + z_it*b1 + x_it*b2 + v_it
*=== 第二种情况：Corr(x_it,a_i) != 0 
*------------------------------------
* 此时，Fe 是一致的，而 Re 则不是
* 因此，只有在考虑随机效应时才会存在这个问题
* 例如，通过Hausman检验，我们发现RE模型的原假设无法满足；
*      但我们又想分析不随时间改变的因素，如性别、种族、行业特征等。

*--- Hausman-Taylor (1981) Estimation ---
  
  * -模型： 
  *
  *  y_it = X1_it*b1 + X2_it*b2 + Z1_i*b3 + Z2_i*b4 + u_i + v_it
  *
  *    X1_it, Z1_i 均为严格外生变量,前者随时间改变，后者不随时间改变，如性别、种族等。
  *    X2_it, Z2_i 为内生变量
  *
  * -优点：可以估计出 c1 和 c2，这是 Fixed effects 模型无法做到的。
  *
  * -估计方法：
  * (1) whithin estimation  得到 b1 和 b2 的估计值，以及残差 e_it
  * (2) reg e_it on Z1i 和 Z2i(用 X1_it 和 Z1_it做工具变量), 
  *     得到 b3 和 b4 的估计值
  * (3) 利用上述 b1-b4 的估计值，得到相应的残差向量，
  *     进而计算出方差-协方差矩阵，进行统计推断。
     
  *== 例3 == 妇女工资的影响因素（重新审视）
  *
  * 参见 Baltagi and Khanti_Akom(1990,JAE,TabII, column HT)
     use psidextract.dta, clear
     des 
     
     * 下述变量可能和不可观测的个体随机效应相关
     xtsum exp exp2 wks ms union
     * 组内标准差非常小，表明这些变量随时间的变化非常缓慢
     
     * fem blk occ south smsa ind 可以作为不随时间改变的变量 ed 的工具变量
     correlate fem blk occ south smsa ind ed 
  
     * 估计
       xthtaylor lwage occ south smsa ind exp exp2 wks ms union fem blk ed, ///
                 endog(exp exp2 wks ms union ed)
       est store re_htaylor
       *-- 结果说明：
       * (1) rho = 0.97  表明 u_i 在残差的波动中占有很大的比例
       * (2) 各种类型的变量分开列示
       xtreg lwage occ south smsa ind exp exp2 wks ms union fem blk ed,re
       est store re
       
       * 结果对比
         local models "re re_htaylor"
         esttab `models', b(%6.3f) se(%6.3f) mtitle(`models')         
     
     * 检验
       xthtaylor lwage occ south smsa ind exp exp2 wks ms union fem blk ed, ///
                 endog(exp exp2 wks ms union ed)
       xtoverid  /*检验工具变量的合理性*/
       xtoverid, robust
       xtoverid, cluster(id)                
       
       
  *== 例2 == 一份模拟数据
    * 基本结论：
    *     如果选择的工具变量过弱,则会导致严重的后果 
    *     因为此时没有足够的信息来识别内生变量的参数
   
     *==模型： y = 3 + 3x1_a + 3x1_b + 3x2 + 3z_1 + 3z_2 + u_i + v_it
     * 内生变量：z2 x2       
     
     use xthtaylor1.dta, clear
     corr ui z1 z2 x1a x1b x2 eit    
     
     *  弱工具变量问题 
     xthtaylor yit x1a x1b x2 z1 z2, endog(x2 z2) i(id)  
     *-- x1a x1b z1 作为 x2 和 z2 的工具变量，但都弱相关 
     *-- z2 的系数是真实值的 3 倍
     xtoverid  
                   
     *==结论：corr 很重要               
                     
                      
*--- Amemiya_MaCurdy(1990) estimation
   use psidextract.dta, clear
     xthtaylor lwage occ south smsa ind exp exp2 wks ms union fem blk ed, ///
               endog(exp exp2 wks ms union ed) amacurdy t(t) 
       est store re_amac
     xthtaylor lwage occ south smsa ind exp exp2 wks ms union fem blk ed, ///
               endog(exp exp2 wks ms union ed)
       est store re_htaylor
       
       * 结果对比
         local models "re_htaylor re_amac"
         esttab `models', b(%6.4f) se(%6.4f) mtitle(`models')  
         
       * 结论：并无大异！  
 
         





      
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *          7.6 面板随机系数模型
          *          7.7 面板随机边界分析
          
cd D:\stata10\ado\personal\Net_course\B7_Panel
                          
                       
*-------------------------------
*        面板随机系数模型
*-------------------------------
 
* --- 模型 ---  Swamy(1970) random-coefficients linear regression model.

*  (1)  y_i = X_i*b_i + u_i
*  (2)  b_i = b + v_i       E(v_i) = 0     E(v_i*v_i') = Sigma (矩阵)
*  y_i = X_i*b_i + u_i 
*       = X_i*(b + v_i) + u_i
*       = X_i*b + (X_i*v_i + u_i)
*       = X_i*b + w_i
*   其中，E(w_i) = 0   E(w_i*w_i') = Pi(矩阵)

* --- 估计方法 ---
* GLS   y = Xb + W
* b_hat = \sum{W_i*b_i}
* 其中，W_i 是一个权重矩阵
*       b_i 是对单个截面执行OLS得到的估计值
* 因此，随机系数模型的估计值事实上是单个截面OLS估计的加权平均

   * 估计 SUR 模型，事实上是单个截面的OLS估计，只是考虑了截面相关性
   use invest2.dta, clear
   rename invest i
   rename market mv
   rename stock  k
   reshape wide i mv k, i(t) j(id)
   
   sureg (i1 mv1 k1) (i2 mv2 k2) (i3 mv3 k3) (i4 mv4 k4) (i5 mv5 k5)
       
   * 估计随机系数模型
     use invest2.dta, clear
     xtrc invest market stock , i(id)
     est store xt_rc
     * 基本结论：截面间存在显著的系数差异，即系数并非固定不变的。
     
     
   * 对比分析
     reg   invest market stock, robust cluster(id)  /*robust Pooled OLS*/
     est store OLS
     xtreg invest market stock, fe robust
     est store xt_Fe
     xtreg invest market stock, re robust
     est store xt_Re     
     local models "xt_rc OLS xt_Fe xt_Re"
     esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') star(* 0.1 ** 0.05 *** 0.01) 
 
 
   * 所有截面的系数估计值
     xtrc invest market stock , i(id) betas
        



*-------------------------------
*        面板随机边界分析
*-------------------------------

* ---- 简介 -------

  do B7_xtSFA.do
  
* ---- 截面模型 -------

 * y_i = b_0 + x_i*b1 + v_i - u_i
 *   v_i -- N(0, sigma_v^2)   一般意义上的随机干扰项
 *   u_i -- N+(Eu, sigma_u^2) 反应无效率的干扰项，具有半正态分布  
  
 * 半正态分布解析
  clear
  set obs 1000
  gen u = invnorm(uniform())
  histogram u , normal       /*标准正态分布*/
  histogram u if u>0         /*半正态分布*/
  sum u
  sum u if u>0


* ----面板模型 -------

*== 面板模型1--：无效率成分不随时间改变
  
 * y_it = b_0 + x_it*b1 + v_it - u_it
 *   v_it -- N(0, sigma_v^2)   
 *   u_it = u_i
 *   u_i -- N+(mu, sigma_u^2)    mu = E[u_it]
    
  use xtfrontier1.dta, clear
  xtfrontier lnY lnK lnL, ti
  est store xtsfa_ti
  
  * -- 结果分析 --
  * sigma_u2 = sigma_u^2 
  * sigma_v2 = sigma_v^2
  * sigma2   = sigma_u^2 + sigma_v^2
  * gamma = sigma_u2 / sigma2   即，无效率的波动占总波动的比例
  * /ilgtgamma = 1/logit(gamma)  and logit(gamma) = gamma/(1-gamma)
  * /lnsigma2, /ilgtgamma 之所以做转换，都是为了方便求解
  

*== 面板模型2--：无效率成分随时间改变
* Battese and Coelli (1992,JPA, 3: 153-169.)

 * y_it = b_0 + x_it*b1 + v_it - u_it
 *   v_it -- N(0, sigma_v^2)   
 *   u_it = exp{-eta(t-Ti)}*u_i  / t 表示观察年份，Ti表示每家公司的观察期数 /
 *   u_i -- N+(mu, sigma_u^2)    mu = E[u_it]

  xtfrontier lnY lnK lnL, tvd
  est store xtsfa_tvd
  
  * --- 结果分析 ---
  * 由于 eta 的估计值非常接近于0，所以可以施加约束条件
    constraint define 1 [eta]_cons = 0
    xtfrontier lnY lnK lnL, tvd constraints(1)
    est store xtsfa_tvd_eta0  

* === 对比分析 ===
      local models "xtsfa_ti xtsfa_tvd xtsfa_tvd_eta0"
      esttab `models', b(%6.3f) se(%6.3f) mtitle(`models') scalar(ll N) sfmt(%16.4f)


* ---- 技术效率的估算 -------

   * predict 命令的选项
                                  /*
      xb   y 的拟合值
      u    -ln{E(u_it|v_it)}
      m    -ln{M(u_it|v_it)}  M(u_it|v_it)=-u_i if u_i>=0, 0 otherwise
      te   E{exp(-u_it)|v_it}
                                  */
   use xtfrontier1.dta, clear
   xtfrontier lnY lnK lnL, ti
   predict yhat    
   predict eff_te, te   /*一般应用此项，因为eff_te介于0和1之间*/
   predict eff_u , u
   predict eff_m , m
   sum eff_*

   gen eff = 1 - eff_te
   histogram eff_te
   histogram eff
   
* ---- 说明 -----

* 似然函数：参见 Battese and Coelli (1992,JPA, 3: 153-169.)
* 同时可以查阅无效率成分的计算公式
          
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.8  动态面板模型
          *                 Part I

          
cd D:\stata10\ado\personal\Net_course\B7_Panel

*-------------------------------
*        动态面板模型
*-------------------------------
* 7.8.1  简介
* 7.8.2  一阶差分IV估计量(Anderson and Hisao, 1982)
* 7.8.3  一阶差分GMM估计量(Arellano and Bond, 1991)  
* 7.8.4  系统GMM估计量(AB,1995; BB,1998)
* 7.8.5  纠偏LSDV估计
* 7.8.6  各种估计方法的对比分析——一个模拟


* == 简介 ==
*
* 模型： y[it] = a0*y[it-1] + a1*x[it] + a2*w[it] + u_i + e[it]
*
* 特征：解释变量中包含了被解释变量的一阶滞后项
*       可以是非平行面板，但要保证时间连续
*       x[it]  —— 严格外生变量   E[x_it,e_is] =0  for all t and s
*                   即，所有干扰项与x都不相关
*       w[it]  —— 先决变量       E[w_it,e_is]!=0  for s<t, but E[x_it,v_is]=0 for all s>=t
*                   即，前期干扰项与当期x相关，但当期和未来期干扰项与x不相关。
*       y[it-1]—— 内生变量       E[x_it,e_is]!=0  for s<=t
*                   即，前期和当期，尤其是当期干扰项与x相关
*       u_i 随机效应，在截面间是 iid 的。u_i 与 e[it] 独立。
*
* 内生性问题：
*  (1) 若假设 u_i 为随机效应，则 Corr(y[i,t-1], u_i) !=0 
*  (2) 若假设 u_i 为个体效应，需要想办法去除之，因为数据为"大N小T"
*      一阶差分： D.y[i,t-1] = y[i,t-1] - y[i,t-2]
*                D.e[i,t] = e[i,t] - e[i,t-1]   
*         显然： Corr(D.y[i,t-1], D.e[i,t]) !=0, 差分方程存在内生问题；
*      组内去心： ym[i,t-1] = y[i,t-1] - 1/(T-1)*(y[i,t-1]+...+y[i,T])
*                em[i,t] = e[i,t] - 1/T*(e[i,t]+e[i,t-1]+...+e[i,T])
*         显然： Corr(ym[i,t-1], em[i,t]) !=0, 仍然存在内生性问题       
*
* 处理办法：IV估计或GMM估计，选择合适的工具变量
*
*    矩条件： E[e_it,z_it] = 0



*========================================
*========= 一阶差分 IV 估计量 ============
*========Anderson and Hisao(1982)========
*========================================
*
* 基本思想：采用一阶差分去除个体效应 u_i, 
*           y 的三阶及三阶以上滞后项都可以作为 D.y[it-1] 的工具变量
*           同时，D.y[it-2] 也可以作为 D.y[it-1] 的工具变量

use abdata.dta, clear
des  /*变量的定义*/
tsset id year

* 模型: n_it =  b1*n_it-1 + b2*n_it-2             
*             + b3*w_it   + b4*w_it-1               
*             + b5*k_it   + b6*k_it-1  + b7*k_it-2   
*             + b8*ys_it  + b9*ys_it-1 + b10*ys_it-2  
*
   xtivreg n L2.n  w L1.w  k L1.k L2.k  ys L1.ys L2.ys  yr1981-yr1984  ///
           (L.n = L3.n), fd
*
* 等价于
*
xtivreg n L2.n  L(0/1).w  L(0/2).(k ys)  yr1981-yr1984 (L.n = L3.n), fd




*====================================
*========= 一阶差分GMM估计量 =========
*==============AB91==================
*
* L.Hansen (1982) 提出 GMM
* 
* Arellano and Bond (1991)
*
* 模型： 
*  
*    y[it] = a0*y[it-1] + a1*x[it] + a2*w[it] + u_i + v[it]
*
* 假设条件：
*    干扰项 v[it] 不存在序列相关；
*
* 适用范围：
*    大N，小T
*    随后，我们会介绍“小N大T”型动态面板的估计方法
*
* 基本思想：
*
*    在 Anderson and Hisao(1982) 基础上增加了更多可用的工具变量
*
* 在 t=3 处，y_i1 可以作为所有滞后项的工具变量
* 在 t=4 处, y_i1, y_i2 可以作为所有滞后项的工具变量
*
*   D.y[it] = a1*D.y[it-1] + a2*D.X[it] + D.v[it]   X_it = [x_it, w_it]
*
* 因此，所有工具变量构成的矩阵如下：
*
*         |y_i1  0     0     0    0    0    ...  0   ...  0     D.x_i3 |
*         | 0   y_i1 y_i2    0    0    0    ...  0   ...  0     D.x_i4 |    
*         | 0    0     0    y_i1 y_i2 y_i3  ...  0   ...  0     D.x_i5 |
*   Z_i = | .    .     .     .    .    .     .    .   .   .       .    |
*         | .    .     .     .    .    .     .    .   .   .       .    |
*         | 0    0     0     0    0    0    ... y_i1 ... yiT-2  D.x_iT | 
* 
*  Z_i 的行数为 T-2
*  Z_i 的列数为 sum_(m=1)^(T-2){m} + K, K 为 X 的列数
*
*      以 T =7，K=3 为例，则 Z_i 的列数为 (1+2+3+4+5+6+7)+3 = 31
*
* 设定工具变量的基本原则： 
*
*  对-内生-变量的处理：与上述方法类似，
*         即滞后两阶以上的水平变量均可作为差分方程的工具变量 (GMM type)
*  对-先决-变量的处理：滞后一阶以上的水平变量均可作为工具变量 (GMM type)  
*  对-外生-变量的处理：自己作为自己的工具变量 (Standard IV)


*== 例1：一阶差分估计量的基本设定
*   解释变量仅包含 y_it 的一阶滞后项，默认设定
*   干扰项同方差，一阶段估计

  use abdata.dta, clear
  xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984 
  est store ab_0
  
  *- 结果释疑
  *
  * -1- 工具变量的个数是如何确定的？(xtdpd, p.74)
  *
    * 外生变量的工具变量等于外生变量的个数
    *   L(0/1).w  L(0/2).(k ys)  yr1980-yr1984   共 13个
    * 内生变量的工具变量：共 27个
    *
      list id year n L2.n DL2.n if id == 140    
    *  
    * 差分方程的可用工具变量
    *--------------------------------------------------------
    *        year of         Years of      Number of
    * difference equation  instruments   instruments
    *        1979              1976-1977           2 
    *        1980              1976-1978           3 
    *        1981              1976-1979           4 
    *        1982              1976-1980           5 
    *        1983              1976-1981           6 
    *        1984              1976-1982           7 
    *--------------------------------------------------------
    *                                             27个
    
    * 练习：如果进一步设定 y[i,t-2] 和 y[i,t-3] 为解释变量，
    *       那么工具变量共有多少个？
    *        
      xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984,lag(3)
    
                
  * -2- GMM-type 和 Standard 两种类型的工具变量有何差异？(xtabond,p.27)
  *  
  *    GMM-type 是针对内生变量或先决变量而言的工具变量，有多列
  *    Standard 是针对外生变量而言的工具变量，只有一列
  
  
  *- 过度识别检验（工具变量的使用是否合理）
  *
     estat sargan 
  *
  * 说明：
  *  H0: overidentifying restrictions are valid
  *  这里，我们拒绝了原假设，但AB91指出，当干扰项存在异方差时，
  *  Sargan检验倾向于过度拒绝原假设，因此此处得到的结论并不可信。
  *  采用两阶段估计，然后再执行Sargan检验较为稳妥：
  *
    xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984,twostep
    estat sargan
  * 
  * 说明：不过，AB91发现，
  *      若存在异方差，在两阶段估计后执行Sargan检验往往倾向于
  *       Underreject问题，即过度接受原假设。
  * 通常而言，这很可能是我们的模型设定不当，或是工具变量的选择不合理。
  * 随后，我们会采用-xtdpd-命令，将干扰项设定为 MA(1) 过程，
  * 此时，执行Sargan检验不再拒绝原假设。
  
  * - 干扰项序列相关检验
  *
  *  AB91 一阶差分估计量要求原始模型的干扰项不存在序列相关，
  *  显然，差分后的干扰项必然存在一阶序列相关，
  *  因此，我们需要检验差分方程的残差是否存在二阶(或更高阶)序列相关即可
  *
  * 默认，二阶序列相关检验
     xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984,vce(robust) 
     estat abond
     * 说明：若存在二阶相关，则意味着选取的工具变量不合理
  * 高阶序列相关检验
     xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984,vce(robust) artest(3)
     estat abond

  
  
*== 稳健型估计
  xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2) robust
  est store ab4_one_rb
    
  * 此时，无法 Sargan 统计量
  estat sargan


*== 联合检验：检验除常数项和时间虚拟变量外，其它变量整体上是否显著
   xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2) robust
   test  L.n L2.n  w L.w  k L.k L2.k  ys L.ys L2.ys


*== 两阶段估计 AB91(Tab4(a2)) 考虑异方差问题
  * 利用第一阶段估计得到的残差构造方差-协方差矩阵，进而重新估计模型
  *
   xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2) twostep
   est store ab4_twostep
   * 此时，Sargan 检验无法拒绝原假设
   *
     estat sargan
   
   * AB91重要建议：
   *   (1) 采用一阶段估计结果进行系数显著性的统计推断；
   *   (2) 采用两阶段估计给出的 Sargan统计量进行模型筛选
   *
   * 进一步的讨论：
   *    虽然AB91建议不要采用两阶段(非稳健)估计进行统计推断，
   *    但Windmeijer(2005,Journal of Econometrics)通过模拟分析表明，
   *    采用纠偏(bias-corrected,WC)后的稳健性VCE，可以更好地进行统计推断   
   xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2) twostep vce(robust) 
   est store ab_wc_rb 
   
   * 结果对比
     local mm "ab4_one_rb ab4_twostep ab_wc_rb"
     esttab `mm',mtitle(`mm')
   *
   * 结论：
   *   AB91_onestep_rb 的结果与 AB91_WC_rb 的参数估计相同，后者标准误较大
   *   建议采用 Windmeijer(2005) 两阶段-纠偏-稳健型 估计量。
   

*== 先决变量的设定
  * 由于当期干扰项显然会影响后续 w 和 k，所以把它们设定为先决变量更为合理
  * 注意: 此时逗号前就不能再出现这两个变量了
   xtabond n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
              pre(w k)
   est store ab4_pre 
   estat sargan
   * 从 Sargan p值来看，将 w 和 k 设为先决变量似乎更为合理
   
  * pre() 选项的设定 
   xtabond n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
       pre(w,lag(1,3)) pre(k,lag(2,.))
   *    
   * 解释：
   *  pre(w,lag(1,3))
   *   lag(1,3) 中的 1 表示 L.w 也会作为解释变量，
   *    lag(1,3) 中的 3 表示 L2.w 和 L3.w 可以作为 L.w 的工具变量，但 L4.w 不可以；
   *  pre(k,lag(2,.)) 
   *    lag(2,.) 中的 2 表示 L1.k, L2.k 都会作为解释变量；
   *    lag(2,.) 中的 . 表示 L3.k, L4.k ... 都可以作为 L2.k 的工具变量
   


*== 内生变量的设定
  * 假设 w 和 k 都与当期干扰项相关，即二者均为内生变量，则：
   xtabond n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
           endog(w,lag(1,.))  endog(k,lag(2,.))
   est store ab4_endog
   
*== 部分先决，部分内生
   xtabond n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
           pre(w,lag(1,.))  endog(k,lag(2,.))
   est store ab4_predog    

* 说明：上述设定都可附加 -vce(robust)- 选项以便获得稳健型标准误。


*== 工具变量过多导致的问题
  * 过多的工具变量往往导致过度约束假设无法满足
  * 估计结果的有效性降低，因为部分工具变量与内生或先决变量的相关性很弱
  * 对矩阵尺寸的要求增加
  * 解决办法：限制最大的滞后阶数
   xtabond n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
           pre(w,lag(1,3))  pre(k,lag(2,3))
   

*== 系数估计的上下限
* 虽然 Pooled OLS 和 Fixed Effects 估计都是有偏的，
* 但是二者却决定了 y_it-1 真是估计值的上界和下界
* 换言之， Pooled OLS 估计高估了真实值
*       而 Fixed effects 估计则低估了真实值
   use abdata.dta, clear
   reg n L.n L(0/1).w L(0/2).(k ys) yr1980-yr1984, robust
     est store OLS
   xtreg n L.n L(0/1).w L(0/2).(k ys) yr1980-yr1984, fe 
     est store FE
   xtabond n L(0/1).w L(0/2).(k ys) yr1980-yr1984
     est store DAbond  
   
   esttab OLS DAbond FE, b(%6.3f) t(%6.2f) mtitle(OLS DAbond FE)
   

*== 结果输出到Word
  local model "OLS DAbond FE ab4_pre ab4_endog"
  esttab `model', b(%6.3f) t(%6.2f)  mtitle(`model')   ///
                  star(* 0.1 ** 0.05 *** 0.01)         ///
                  scalar(arm2 sargan sar_df N N_g)     ///
                  compress


*== 使用 xtabond4 命令可进一步输出自相关和Sargan检验的 P 值
   use abdata,clear
   xtabond4 n L(0/1).w L(0/2).(k ys) yr1980-yr1984  /*modified by Arlion*/
      est store m_1
   xtabond4 n  L(0/1).ys yr1980-yr1984, lags(2) twostep ///
                        pre(w,lag(1,.)) pre(k,lag(2,.))
      est store m_2 
      
   local model "m_1 m_2"
   esttab `model', b(%6.3f) t(%6.2f)  mtitle(`model')  ///
                   star(* 0.1 ** 0.05 *** 0.01)         ///
                   scalar(arm1 p_arm1 arm2 p_arm2 sargan sar_p sar_df N N_g)
   * 或
   local model "m_1 m_2"
   esttab `model', b(%6.3f) t(%6.2f)  mtitle(`model')    ///
                   star(* 0.1 ** 0.05 *** 0.01)          ///
                   scalar(p_arm2 sargan sar_df sar_p N N_g)              
       
                 
    
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.8  动态面板模型
          *                 Part II
                          
cd D:\stata10\ado\personal\Net_course\B7_Panel 
          
*=======================================
*============= 系统GMM估计量 ===========
*==============AB95,BB98===============
*=======================================

* Arellano and Bover (1995), 
* Blundell and Bond(1998)
* Haha(1999), Judson and Owen(1999)
*
* 适用范围：
*    大N，小T
*
* AB91 的局限
*   (1) 当 y[i,t-1] 的系数较大，即 y[i,t] 表现出强烈的序列相关时；
*   (2) 当 Var[u_i]/Var[e_it] 较大时，即个体效应的波动远大于常规干扰项的波动；
* AB91 的表现欠佳。
*   原因在于，水平滞后项是差分方程中内生变量的-弱工具变量-；
*   因此，需要寻求更佳的工具变量
* 
*== 基本思想：
*
* --- 几个概念 ---
*
*    水平值 —— y   x 
*    差分值 —— D.y D.x
*    水平方程：y_it   = b1*y_it-1   + b2*x_it   + u_i + v_it
*        可用工具变量：D.y[i,t-2] 可以作为 y[i,t-1] 的工具变量
*    差分方程：D.y_it = b1*D.y_it-1 + b2*D.x_it       + D.v_it
*        可用工具变量：y[i,t-3],y[i,t-4]...都可以作为 D.y[i,t-1]的工具变量
*
* --- 差分GMM估计量与系统GMM估计量的区别 ---
*
*  (1) 差分GMM估计量采用水平值的滞后项作为差分变量的工具变量；
*      如 y_it-3 是 D.y_it-1 的工具变量
*  (2) 系统GMM估计量进一步采用差分变量的滞后项作为水平值的工具变量；
*      相当于进一步增加了可用的工具变量，
*      且估计过程中同时使用水平方程和差分方程
*  (3) 主要原因在于差分GMM的工具变量往往是弱工具变量，即 corr(X,Z) 过低
* 
* --- xtabond2 命令---Roodman(2005)
*
*     既可以估计差分 GMM 估计量，也可以估计系统 GMM 估计量；
*     同时可以估计一般化的回归模型
*     提供两阶自相关检验，Sargan检验，Hansen检验，以及工具变量外生性检验
*
* --- xtdpdsys 命令--- Stata官方命令，以 xtabond2命令 为基础


*------------------------------------
*---------- xtabond2 命令------------
*------------------------------------
* 适用于 Stata8-10 各个版本
* 既可以完成 -一阶差分GMM估计-
* 也可以完成 -系统GMM估计-
* 详细参考资料： 
*   Roodman, D. 2006. How to Do xtabond2: 
*       An Introduction to "Difference" and "System" GMM in Stata. 
*       Working Paper 103. Center for Global Development, Washington.


*== 使用 xtabond2 命令得到 -一阶差分估计量-
  *- 附加 -noleveleq- 选项即可
  
* 采用 xtabond2 估计 AB91 文中表4 的结果

* Arellano and Bond (1991), Table 4
* Column (a1)
  use abdata, clear
  xtabond2 n L(1/2).n L(0/1).w L(0/2).(k ys) yr1980-yr1984,     ///
             gmm(L.n) iv(L(0/1).w l(0/2).(k ys) yr1980-yr1984)  ///
             nomata noleveleq small
   * gmm(*) 填写内生变量的名称
   * iv(*) 填写所有外生变量以及自己设定的工具变量的名称
   * noleveleq 表示估计过程中不使用水平方程，即为差分GMM估计量
  est store aba1_ab2
  xtabond  n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2)
  est store aba1_ab
  esttab aba1_ab2  aba1_ab, mtitle(aba1_ab2 aba1_ab)


* Column (a2)
  * 两阶段估计
  xtabond2 n L(0/1).w L(0/2).(k ys) L(1/2).n yr1980-yr1984,     ///
             gmm(L.n) iv(L(0/1).w l(0/2).(k ys) yr1980-yr1984)  ///
             noleveleq  small twostep  
  est store aba2_ab2
  xtabond  n L(0/1).w L(0/2).(k ys) yr1980-yr1984, lags(2) twostep
  est store aba2_ab
  esttab aba2_ab2  aba2_ab, mtitle(aba2_ab2 aba2_ab)


*=== 一阶差分估计量 部分解释变量内生
  * 一阶段估计
  xtabond2 n L.n L(0/1).(w k) yr1980-yr1984,   ///
           gmm(L.(w k n)) iv(yr1980-yr1984)    ///
           noleveleq noconstant small robust
  est store fd_1s
  * 两阶段估计
  xtabond2 n L.n L(0/1).(w k) yr1980-yr1984,   ///
           gmm(L.(w k n)) iv(yr1980-yr1984)    ///
           noleveleq robust small twostep
  est store fd_2s
  esttab fd_1s fd_2s, mtitle(fd_1s fd_2s)



*== 系统 GMM 估计量
  xtabond2 n L.n L(0/1).(w k) yr1978-yr1984,     ///
        gmm(L.n) iv(L(0/1).(w k) yr1978-yr1984)  ///
        robust small
  *
  * 解释：
  *
  *-- gmm() 选项
  *  设定内生变量和先决变量，它们的工具变量将有多列，GMM
  *
  *-- iv() 选项
  *  设定严格外生变量，作为自己的工具变量，在工具变量矩阵中仅占一列
  *
  *-- 差分方程和水平方程
  *  默认情况下，差分方程和水平方程都参与估计
  *
  *-- robust 选项
  *  (1) 对于一阶段估计(不附加twostep选项)，
  *      采用传统异方差-序列相关稳健型估计量计算标准误；
  *  (2) 对于两阶段估计(附加twostep选项)，
  *      采用Windmeijer(2005)纠偏估计量计算标准误；
  *-- Sargan检验
  *  Sargan test of overid. restrictions: chi2(34)  
  *    34 = 47 - 13 （13是外生变量的个数，包含常数项）
  *  可见，无论采用Sargan检验还是Hansen J检验，都拒绝了工具变量合理的原假设


  * 指定工具变量应用于 水平方程 还是 差分方程
  * 例如，假设 w, k, 以及年度虚拟变量都是外生的(当然，这一假设可能并不合理)
  * 
  xtabond2 n L.n L(0/1).(w k) yr1978-yr1984, gmm(L.n)  ///
        iv(L(0/1).(w k) yr1978-yr1984, eq(level))      ///
        robust small twostep
  est store sys_wkexg
  
  * 将 w 和 k 都设定为内生变量
  * yr dummies 仅出现在水平方程中
  xtabond2 n L.n L(0/1).(w k) yr1978-yr1984,          ///
        gmm(L.(w k n)) iv(yr1978-yr1984, eq(level))  ///
        robust small twostep 
  est store sys_wkendog_lev
  
  * yr dummies 同时出现在水平方程和差分方程中    
  xtabond2 n L.n L(0/1).(w k) yr1978-yr1984,        ///
        gmm(L.(w k n)) iv(yr1978-yr1984, eq(both))  ///
        robust small twostep 
  est store sys_wkendog_both
  
  * 结果对比
  local mm "fd_1s fd_2s sys_wkexg sys_wkendog_lev sys_wkendog_both"
  esttab `mm', mtitle(`mm') compress



*-------------------------------------
*== 实例：中国上市公司资本结构动态调整
*-------------------------------------
   * 
   * y_it - y_it-1 = b*(yA_it - y_it-1)
   * y_it = (1-b)*y_it-1 + b*yA_it 
   *
   * 目标资本结构的设定 I ：采用年度虚拟变量的线性组合 
   * let yA_it = a1*dyr2001 + a2*dyr2002 + ...
    
     use xtcs.dta, clear
     
     * 一阶差分GMM估计量
       xi: xtabond2 tl L.tl i.year, gmm(L.tl) iv(i.year) robust noleveleq
       dis  ln(2) / (1 - _b[L1.tl])
       est store dycs_01DIFF
     * 系统GMM估计量
       xi: xtabond2 tl L.tl i.year, gmm(L.tl) iv(i.year) robust
       dis  ln(2) / (1 - _b[L1.tl])  
       est store dycs_01SYS
     * OLS 估计(调整系数的上限)
       xi: reg tl L.tl i.year, robust
       est store dycs_01OLS
     * FE  估计(调整系数的下限)
       xi: xtreg tl L.tl i.year, fe robust
      est store dycs_01FE  
      
    * 结果对比      
      local mm "dycs_01DIFF dycs_01SYS dycs_01OLS dycs_01FE"
      local ss "ar2 ar2p sargan sar_df sarganp" 
      esttab `mm',mtitle(`mm') scalar(`ss')
       
       
   * 目标资本结构的设定 II ：采用公司特征变量的线性组合        
   * let y*_it = a1*size + a2*tang + a3*ndts + ...
   
   * 假设其它变量都是外生变量
     use xtcs.dta, clear
     qui tab year, gen(yr)
     drop yr1
     local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
     xtabond2 tl L.tl `xx', gmm(L.tl) iv(`xx') robust two 
     dis  ln(2) / (1 - _b[L1.tl])  /*调整半周期*/
     
     * 检验年度虚拟变量是否显著
       test yr2 = yr3 = yr4 = yr5 = yr6 = 0
       test yr2 = yr3 = yr4 = yr5 = yr6
       
   * 假设 tobin 和 npr 是内生的
     local xx  "size tang ndts L(0/1).(tobin npr) yr*"
     local gmm "         L.tl  L(0/1).(tobin npr)    "
     local iv  "size tang ndts                    yr*"
     xtabond2 tl L.tl `xx', gmm(`gmm') iv(`iv') robust two 
     dis  ln(2) / (1 - _b[L1.tl])   
     * 工具变量的选择并不合理，因为Hansen J 统计量显著
   
   * 假设 tobin 和 npr 为先决变量
     local xx  "size tang ndts L(0/1).(tobin npr) yr*"
     local gmm "          L.tl L.tobin L.npr         "
     local iv  "size tang ndts tobin         npr  yr*"
     xtabond2 tl L.tl `xx', gmm(`gmm') iv(`iv') robust two 
     dis  ln(2) / (1 - _b[L1.tl])  
     
    * 练习：
    * (1) 请对比上述估计结果，并与OLS和FE的结果进行对比；
    * (2) 请根据Sargan统计量和AR(2)检验结果确定一个最佳的模型； 
     
      
     
*== xtabond2 命令的其他用途
* 由于 OLS 是 GMM 的特例，所以采用 xtabond2 命令同样可以执行 OLS 估计
* 
  use abdata.dta, clear
  regress n w k
  abar   /*检验自相关*/        
  xtabond2 n w k, iv(w k, eq(level)) 
  * 评论：OLS可以视为GMM的一个特例
  

          
*---------------------------
*------ xtdpdsys 命令------
*---------------------------
* 仅适用于 Stata10 版本

   * 中国上市公司资本结构动态调整
     use xtcs.dta, clear
     qui tab year, gen(yr)
     drop yr1
     
   * Case I：假设所有解释变量均为外生变量(L.tl除外) 
   * 
     local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
     xtdpdsys tl `xx', vce(robust) twostep 
     dis  ln(2) / (1 - _b[L1.tl])  /*调整半周期*/
     est store dycs_2sys
    * 设定说明：
    * (1) 无需设定 L.tl, 因为 xtdpdsys 默认设定被解释变量的滞后一期为解释变量，
    *     而且该变量被自动设定为内生变量；
    * (2) 稳健型估计采用 vce(robust) 选项加以设定； 
    * (3) 该命令不会自动进行 AR(2)序列相关检验和Sargan过度识别检验
    
    * 序列相关检验
      estat abond
    * 过度识别检验
      estat sargan  /*稳健型估计下无法获得Sargan统计量*/
    * 正确方法
      local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
      xtdpdsys tl `xx', twostep       
      estat sargan
    
    
   * Case II：假设Tobin和npr为先决变量
      local xx "size tang ndts yr*"  /*此处不应再包含 tobin和npr*/
      xtdpdsys tl `xx', pre(tobin npr,lag(1,.)) twostep  
      est store dycs_2pre
      estat abond
      estat sargan       
     
   * Case III：假设Tobin和npr为内生变量 
      local xx "size tang ndts yr*"  /*此处不应再包含 tobin和npr*/
      xtdpdsys tl `xx', endog(tobin npr,lag(1,.)) twostep  
      est store dycs_2endog
      estat abond
      estat sargan  
   
   * Case IV: 假设除了年度虚拟变量和公司规模外，所有解释变量均为先决变量
      local xx "size yr*"
      xtdpdsys tl `xx', pre(tobin npr,lag(1,.))  ///
                        pre(tang ndts) twostep  
      est store dycs_2preAll
      estat abond
      estat sargan   
      * 假设除 L.tl 外的所有解释变量外生最为合适。    
   
   *  OLS 估计(调整系数的上限)
      local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
      reg tl L.tl `xx', robust
      est store dycs_2OLS
     * FE  估计(调整系数的下限)
      local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
      xtreg tl L.tl `xx', robust fe
      est store dycs_2FE  
       
    * 结果对比      
      local mm "dycs_2sys dycs_2pre dycs_2endog dycs_2preAll dycs_2OLS dycs_2FE"
      local ss "ar2 ar2p sargan sar_df sarganp" 
      esttab `mm',mtitle(`mm') scalar(`ss') compress
     
     * 结论：
     *  (1) 估计出的调整系数介于合理的范围内，即OLS和FE之间；
     *  (2) 就模型设定而言，dycs_2sys 最为合理，即把所有解释变量均设定为外生变量。
     *
     * 调整半周期为：
       local xx "size tang ndts L(0/1).tobin L(0/1).npr yr*"
       xtdpdsys tl `xx', vce(robust) twostep 
       dis  ln(2) / (1 - _b[L1.tl])  /*调整半周期*/    







          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.8  动态面板模型
          *                 Part III
          
cd D:\stata10\ado\personal\Net_course\B7_Panel 
 
*-----------------------
*------ xtdpd 命令------
*-----------------------
* 仅适用于 Stata10 版本；
* 该命令由 xtabond2 命令修改而来，是 xtabond 和 xtdpdsys 命令的综合；
* 因此，即可估计-一阶差分GMM-，又可估计-系统GMM-
*       只是选项的设定相对复杂一些；
* 尚可对干扰项 v[i,t] 的结构做更加复杂的设定，如 v[i,t]--MA(1)，
*     这是该命令的主要有点所在；


* 选项释义：

    help xtdpd

* 一阶差分估计量，所有解释变量外生
    use abdata, clear
    xtdpd n L(1/2).n L(0/1).(w ys) k, dgmmiv(n) div(L(0/1).(w ys) k) 
    est store r1
    xtabond n L(0/1).(w ys) k, lag(2)
    est store r2
    esttab r1 r2

  * 语法对比：
  *  (1)   xtdpd 需要设定 L(1/2) 来标明解释变量中包含 y[i,t-1] 和 y[i,t-2]
  *     而xtabond 则通过选项 lag(2) 来进行这一设定；
  *  (2) xtdpd 需要明确指定内生变量：选项 dgmmiv()
  *                    以及外生变量：选项 div()，
  *     而 xtabond 命令则无需这些设定，在不附加endog()选项的情况下，
  *     只把 y[i,t-1] 和 y[i,t-2] 视为内生变量；
 

* 一阶差分估计量，所有解释变量-外生-，稳健型标准误
    use abdata, clear
    xtdpd n L(1/2).n L(0/1).(w ys) k, dgmmiv(n) div(L(0/1).(w ys) k) vce(robust)
    est store r1
    xtabond n L(0/1).(w ys) k, lag(2) vce(robust)
    est store r2
    esttab r1 r2    

* 一阶差分估计量，所有解释变量-内生-，稳健型标准误
    use abdata, clear
    xtdpd L(0/1).(n w k) year yr1979-yr1984,    ///
        dgmmiv(n w k) div(year yr1979-yr1984)   ///
        vce(robust)   
    * 评论：
    *   (1) 对于dgmmiv(x) 选项中的变量，L(2/.).x 均作为差分方程的工具变量；
    *   (2) 对于div(x) 选项中的变量,D.x 均作为差分方程的工具变量；
    * 练习：
    *   如何采用 -xtabond- 命令得到上述结果？


* 系统GMM估计量，所有解释变量外生
    use abdata, clear
    xtdpd n L(1/2).n L(0/1).(w ys) k, dgmmiv(n) lgmmiv(n) div(L(0/1).(w ys) k)
    est store r1
    xtdpdsys n L(0/1).(w ys) k, lag(2)
    est store r2
    esttab r1 r2   

  * 语法对比：
  *  (1)   xtdpd 需要设定 L(1/2) 来标明解释变量中包含 y[i,t-1] 和 y[i,t-2]
  *     而xtabond 则通过选项 lag(2) 来进行这一设定；
  *  (2) xtdpd 需要明确指定-差分方程-的内生变量：选项 dgmmiv()
  *                       -水平方程-的内生变量：选项 lgmmiv()
  *                             以及-外生变量-：选项 div()，
  *     而 -xtdpdsys- 命令则无需这些设定，在不附加endog()选项的情况下，
  *     只把 y[i,t-1] 和 y[i,t-2] 视为内生变量；    
    
    
* 系统GMM估计量，所有解释变量-内生-，两阶段估计
    use abdata, clear
    xtdpd L(0/1).(n w k) yr1979-yr1984,    ///
          dgmmiv(n w k) lgmmiv(n w k)      ///
          div(yr1979-yr1984) twostep
    est store r1
    estat abond
    estat sargan
    

* 关于Sargan 检验和干扰项的设定
*  有些情况下，Sargan检验拒绝原假设有可能是干扰项 e[i,t] 不满足 i.i.d 假设；
   xtdpd n L.n L(0/2).(w k) yr1980-yr1984 year, ///
         div(L(0/1).(w k) yr1980-yr1984 year)   ///
         dgmmiv(n) hascons 
   estat sargan
   
   * 假设 e[i,t]--MA(1)，即 
   *
   * y[i,t] = a0*y[i,t-1] + a1*x[i,t] + u_i + e[i,t] + b*e[i,t-1]
   *  
   * 一阶差分可得： 
   * 
   * D.y[i,t] = a0*D.y[i,t-1] + a1*D.x[i,t] + D.e[i,t] + b*D.e[i,t-1]
   *
   * 由于 D.e[i,t-1] = e[i,t-1] - e[i,t-2]
   * 所以滞后三阶的变量是合理的工具变量
   *
    xtdpd n L.n L(0/2).(w k) yr1980-yr1984 year, ///
          div(L(0/1).(w k) yr1980-yr1984 year)   ///
          dgmmiv(n,lag(3 .)) hascons   /*注意此处的变化*/
    estat sargan

           
           
           
*--------------------------
*------ xtlsdvc 命令------
*--------------------------
*- 纠偏LSDV估计（SJ 5-4）
*- 适用范围：大 T 小 N

*-- 简介 
*
*   y[i,t] =  y[i,t-1]a + x[i,t]b + u[i] + e[i,t]   i={1,...,N}； t={1,...,T_i},
*
*    x[i,t]  是严格外生变量(这是该方法的一个重要假设，也是一个主要的限制)
*    u[i]    是个体效应
*    e[i,t]  i.i.d 干扰项
*    假设 u[i] 和 e[i,t] 相互独立
*
* 当 N 较小时，采用 GMM 往往效果欠佳，因为 GMM 是基于大样本的；
*
* 此时，bias-corrected LSDV estimator (LSDVC) 是个不错的选择： 
*   (1) Kiviet (1999) 通过 MC 模拟分析表明，
*       在N较小的情况下，采用纠偏LSDV可以纠正90%以上的偏误；
*   (2) Bruno (2005,EL) 进一步给出了非平行面板的纠偏方法；
*   (3) Bruno(2005,SJ-5-4)的模拟分析标明，只有在所有解释变量严格外生的情况下，
*       纠偏LSDV才有较好的表现，否则还是要采用 GMM。
    
*-- 选项
*
*- initial(estimator) 
*
*  estimator  description
* ---------------------------------------------------------------------------------------
*  ah               Anderson and Hsiao (1982)
*             -AH82- estimator, with the dependent variable lagged two times, used as an
*             instrument for the first-differenced model with no intercept (ivreg)
*  ab               Arellano and Bond (1991)
*             -AB91- estimator with no intercept (xtabond)
*  bb               Blundell and Bond (1998)
*             -BB98- estimator with no intercept, as implemented by the user-written
*             Stata routine xtabond2 by Roodman (2003)
*  my         a row vector of initial values supplied directly by the user
* ---------------------------------------------------------------------------------------

*- bias(#) 
*
* determines the accuracy of the approximation:  
* #=1 (default) forces an approximation up to O(1/T); 
* #=2 forces an approximation up to O(1/NT); 
* #=3 forces an approximation up to O(N^{-1}T^{-2}).

* vcov(#) 
*
* 采用 Bootstrap 获得标准误，# 表示BS的次数。

   use abdata, clear
   xtlsdvc n w k ys yr1980-yr1984, initial(ah)
     est store r_AH82
   xtlsdvc n w k ys yr1980-yr1984, initial(ah) first lsdv
   * 选项 first 呈现 IV 估计的结果
   * 选项 lsdv 呈现 FE 的估计结果
   * 若想呈现标准误，需附加 vcov() 选项，以便获得 BS 标准误：
   xtlsdvc n w k ys yr1980-yr1984, initial(ah) vcov(10) 
     
   xtlsdvc n w k ys yr1980-yr1984, initial(ab) 
     est store r_AB91
   xtlsdvc n w k ys yr1980-yr1984, initial(bb) 
     est store r_BB98   
   xtreg n L.n w k ys yr1980-yr1984, fe
     est store r_FE
   xtlsdvc n w k ys yr1980-yr1984, initial(ab) bias(3) vcov(10)
      est store r_AB_bs
   
   * 对比结果
   local mm "r_AH82 r_AB91 r_BB98 r_FE r_AB_bs"
   esttab `mm', mtitle(`mm')

          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.8  动态面板模型
          *                 Part IV
          
cd D:\stata10\ado\personal\Net_course\B7_Panel 

*-----------------------------
*           模拟分析
*-----------------------------       
*
* 主要目的：
*   (1) 采用模拟的方法比较不同估计方法的小样本性质；
*   (2) 对比不同样本设定下，各种方法的优劣；
*
* 命令：
*   -xtarsim-
*
* 参考文献：
*   Bruno, G.S.F. 2005.  
*        Approximating the bias of the LSDV estimator 
*        for dynamic unbalanced panel data models.  
*    Economics Letters, 87, 361-366:  
*
* 数据产生过程：
*
*  y[i,t] =  y[i,t-1]gamma + x[i,t]beta + u[i] + u[t] + e[i,t]
*
*  x[i,t] =  x[i,t-1]rho + v[i,t]      i={1,...,N};     t={1,...,T},
*
* 主要选项：
* 
* nid(), time()           分别设定 N 和 T 
* gamma(), beta(), rho()  设定模型中的相应参数
* sigma()                 设定 e[i,t] 的标准差，默认为 1
* oneway(rand 1)   Corr(x,u[i]) =  0    
* oneway(corr 1)   Corr(x,u[i]) != 0   此时 RE 有偏，不一致
* twoway(rand 1)   Corr(x,u[t]) =  0
* twoway(corr 1)   Corr(x,u[t]) != 0   此时 RE 有偏，不一致
* seed(12345)   设定种子值，保证模拟结果可重复，可以是任意数值


* 一个简单的例子：
*
* 静态面板，Corr(u_i,X) !=0 

   xtarsim y x eta, n(200) t(10) gamma(0) beta(0.8) rho(0.2) ///
                    one(corr 1) sn(9) seed(1234)  
   xtdes
   xtsum y x
   
  * OLS，FE 与 RE 的参数估计
   reg y x
     est store ols
   xtreg y x, fe
     est store fe
   xtreg y x, re
     est store re
   
   local mm ols fe re
   esttab `mm', mtitle(`mm')
  
  * Hausman 检验
    hausman fe re
    hausman fe re, sigmaless
    hausman fe re, sigmamore
       
   * 结论：
   *  (1) 当 Corr(x,u_i)!=0 时，OLS 和 RE 估计都是有偏的；
   *  (2) 此时，Hausman检验倾向与得出负值。
   
   * 练习：
   *  (1) 将上述数据生成过程中的 one(corr 1) 更改为 one(rand 1)，
   *      结论有何变化？
   *  (2) 将 beta(0.8) 更改为 beta(0.95)，结论有何变化？
   *  (3) 将 gamma(0) 更改为 gamma(0.6)，结论有何变化？ 
   
   
   
*== 大N小T型动态面板, Corr(X,u_i) = 0

   xtarsim y x eta, n(200) t(10) gamma(0.4) beta(0.8) rho(0.2) ///
                    one(rand 1) sn(9) seed(1234)  
   
 *-- AB91 估计量的性质
   *-- 系数估计值
   xtabond y x
     est store ab_0
   xtabond y x L.x
     est store ab_lag1
   xtabond y x L.x, lag(2)
     est store ab_lag2
   xtabond y x L.x, lag(2) twostep
     est store ab_lag2_two
   xtabond y, pre(x,lag(1,.))
     est store ab_pre
   xtabond y, endog(x,lag(2,.))  
     est store ab_endog
   
   local mm "ab_0 ab_lag1 ab_lag2 ab_lag2_two ab_pre ab_endog"
   esttab `mm', mtitle(`mm') compress

   *-- 结论：
   *
   * (1) 在真实DPG设定下，AB91 估计量无偏；
   * (2) 若 L2.y 或 L.x 不显著，则删除之，否则会影响真实系数估计值；
   * (3) 多数情况下，外生变量 X 的系数估计值很少受到影响；
   * (4) 采用一阶段标准误进行统计推断比较合理；
   * (5) 若将外生变量设定为先决变量，问题不大；
   *     若将外生变量设定为内生变量，则会导致严重的-下偏偏误-，即低估真实值
 
   *-- 序列相关检验和Sargan检验
   qui xtabond y x, vce(robust)
     estat abond
   qui xtabond y x L.x, vce(robust)
     estat abond
   qui xtabond y x L.x, lag(2) vce(robust)
     estat abond
   qui xtabond y x L.x, lag(2) twostep vce(robust)
     estat abond
     
   qui xtabond y x
     estat sargan
   qui xtabond y x L.x
     estat sargan
   qui xtabond y x L.x, lag(2) 
     estat sargan
   qui xtabond y x L.x, lag(2) twostep 
     estat sargan  
  
   * 结论： 
   *      模型设定中加入多余的解释变量，
   *      并不影响AR(2)检验和Sargan检验结果。


 *-- BB98 估计量的性质
 *
 *-- gamma=0.4, 理论上，BB98与AB91不存在显著差异
 * 
   xtdpdsys y x
     est store bb_0
   xtdpdsys y x L.x
     est store bb_lag1
   xtdpdsys y x L.x, lag(2)
     est store bb_lag2
   xtdpdsys y, pre(x,lag(1,.))
     est store bb_pre
   xtdpdsys y, endog(x,lag(2,.))
     est store bb_endog
          
   local mm "bb_0 bb_lag1 bb_lag2 bb_pre bb_endog"
   esttab `mm', mtitle(`mm') compress
 
 
 *-- gamma=0.8,0.9,0.95,0.97,0.98, snratio=30  
 *   理论上，BB98 优于 AB91
   
   local g = 0.98     /*请改变这里的取值*/
   xtarsim y x eta, n(200) t(10) gamma(`g') beta(0.8) rho(0.2) ///
                    one(rand 1) sn(30) seed(1234)  
   
   xtabond y x
    est store ab91
   xtdpdsys y x
     est store bb98

   local mm "ab91 bb98"
   esttab `mm', mtitle(`mm') compress
   
   * 结论：随着 gamma 值趋近于 1，BB98 的确明显优于 AB91.
   
   
   
*== 小N大T型动态面板, 
*
* 比较 AB91, BB98, 与 LSDVC(Bruno,2005)的优劣

* N=10，T=60, 
 
   local g = 0.4   /*请改变此值*/
   *local one "rand 1"  /*Corr(X,u_i)=0*/
   local one "corr 1"  /*Corr(X,u_i)!=0*/
   xtarsim y x eta, n(10) t(60) gamma(`g') beta(0.8) rho(0.2) ///
                    one(`one') sn(9) seed(1234)  
                    
   xtabond y x
     est store AB91
   xtdpdsys y x
     est store BB98
   xtlsdvc y x,initial(ah) 
     est store BR05_ah 
   *xtlsdvc y x,initial(ab) 
   *  est store BR05_ab
   *xtlsdvc y x,initial(bb) 
   *  est store BR05_bb                        

   *local mm "AB91 BB98 BR05_ah BR05_ab BR05_bb"
   local mm "AB91 BB98 BR05_ah" /*BR05_ab *_bb的结果与 *_ah相似*/
   esttab `mm', mtitle(`mm') compress                             
 
   * 结论： 
   *  (1) 当 gamma=0.4 时，
   *      XTLSDVC 的优势非常有限，而 BB98 的表现通常较好；
   *  (2) 当 gamma=0.9 时，
   *      XTLSDVC 的优势比较明显,即使Corr(x,u_i)!=0该结论仍然成立
   
   
   
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *           7.9  面板单位根检验

          
cd D:\stata10\ado\personal\Net_course\B7_Panel

*-------------------------------
*        面板单位根检验
*-------------------------------
* 主要优势：
*   (1) 克服传统单个时序单根检验的小样本偏误；
*   (2) 利用面板从一定程度上控制不可观测的个体效应和截面相关性；
* 局限：
*   (1) 由于面板中包含多个时序，各自的平稳性不同，
*       因此在拒绝原假设的情况下，并不能得出所有序列均平稳的结论； 
*   (2) 理论上不断有新的成果出现，目前仍然存在诸多争议；


*-- 参考资料 --
*
* Banerjee, A., 1999. (综述)
*    Panel data unit roots and cointegration: an overview. 
*    Oxford Bulletin of Economics & Statistics 61, pp. 607–629.

* Breitung, Jorg and Pesaran, M. Hashem,(综述)
*    Unit Roots and Cointegration in Panels(October 2005). 
*    IEPR Working Paper No. 05.32
*    Available at SSRN: http://ssrn.com/abstract=796190
*
* Hlouskova J, M Wagner. 
*    The Performance of Panel Unit Root and Stationarity Tests: 
*    Results from a Large Scale Simulation. Econometric Reviews, 2006 
*    
* Wagner M, J Hlouskova. 
*    The Performance of Panel Cointegration Methods: 
*    Results from a Large Scale Simulation Study. 
*    Institute for Advanced Studies Economics Series, 2007. 
*
* Baltagi. Econometric Analysis of Panel Data, 2001 (Book) 




*== Multivariate ADF based test 

 *--- madfuller 命令 ---   Sarno and Taylor (1998)
 *
 * Taylor, Mark P. and Lucio Sarno. 
 *   The behavior of real exchange rates during the post-Bretton Woods period. 
 *   Journal of International Economics, 46, 1998, 281-312.
 
 * 应用：T > N , 因为其估计过程采用“似无相关模型(SURE)”
 *
 * MADF ：multivariate augmented Dickey-Fuller
 *
 * H0：面板中的所有截面对应的序列都是非平稳的，即I(1)过程
 *     允许每个截面有不同的滞后阶数，而这些滞后项的系数之和在原假设下等于1.
 *
 * 注意：面板中任何一个序列是平稳的都可能导致H0被拒绝，
 *       因此，拒绝H0，并不表明所有序列都是平稳的。
 *       只能保守地说：至少一个序列是平稳的。
 
    use sheston91.dta, clear  /*世界125个国家*/
    tsset
    xtdes
    list if country<11
    madfuller rgdppc if country<11, lags(2(2)8)
    madfuller D.rgdppc if country<11, lags(4)
    
    use gdp_china.dta, clear
    d
    tsset
    xtdes
    madfuller lny, lags(2) 
    madfuller D.lny, lags(2) 
    madfuller yr , lags(4)



*== individual ADF based tests 

 *--- pescadf 命令 ---    Pesaran (2003)
 * Pesaran, H., (2003), 
 *   A Simple Panel Unit Root Test in the Presence of Cross Section Dependence, 
 *   Cambridge Working Papers in Economics 0346,  University of Cambridge
 * (update to:)
 *  Pesaran, H., (2007), 
 *      A simple panel unit root test in the presence of cross-section dependence.  
 *       Journal of Applied Econometrics, 22(2): 265-312.
 
 * H0：面板中的所有截面对应的序列都是非平稳的，即I(1)过程
 * 统计量：单个截面DF或ADF检验得到的t值的平均值
 * 特点：考虑截面异质性和截面相关
 
    use sheston91.dta, clear
        pescadf rgdppc if country>116 & country<140, lags(2)
        dis normal(2.595)  /*标准正态分布的累计分布函数*/
      * t-bar: 各个截面ADF检验得到的t值的平均值
      * z[t-bar]: 标准化处理后的 t-bar，在H0下服从 N(0,1) 分布
        pescadf rgdppc if country>116 & country<140, lags(2) trend
      * trend: 包含时间趋势
        pescadf rgdppc if country>116 & country<140, lags(2) trend trunoff
      * trunoff: 对个别截面得到的统计量的离群值进行处理
        pescadf D.rgdppc if country>116 & country<140, lags(1)


 *--- ipshin 命令 ---    Im, Pesaran and Shin (IPS, 2003)
 
 * Im K.S., M.H. Pesaran, Y. Shin, (1997,working paper)
 *    Testing for Unit Roots in Heterogeneous Panels. 
 *    Journal of Econometrics, 2003, 115, 53-74. 
 
 * （目前已被Google Scholar引用1555次）
 * H0：面板中的所有截面对应的序列都是非平稳的，即I(1)过程
 * 特点：考虑截面异质性(heterogeneous panels)和干扰项的序列相关问题
 * 统计量：对单个截面执行ADF检验后得到的t值的平均值
 * 局限：要求面板是平行的(balanced)
 
   use sheston91.dta, clear
      ipshin rgdppc   if country<11, lag(2)
    * t-bar 截面ADF检验t值的平均值；
    * w[t-bar] 经过标准化后的 t-bar 值，在H0下服从标准正态分布；
      ipshin rgdppc   if country<11, lag(2 2 2 3 3 3 4 4 4 4) nodemean
    * nodemean omits the elimination of common time effects.
      ipshin D.rgdppc if country<11, lag(2) trend


 
 *--- xtfisher 命令 ---
 
 * Maddala, G.S. and Wu, Shaowen. (1999). 
 *   A Comparative Study of Unit Root Tests With Panel Data and A New Simple Test,  
 *   Oxford Bulletin of Economics and Statistics 61, 631-652.

 * 基本思想：以个体单位根检验的 p 值为基础构造统计量（以 Fisher 检验为基础）
 * H0: 所有序列都是非平稳的
 * H1: 至少有一个序列是平稳的
 * 优点：适用于非平行面板
 
    use invest2.dta, clear
    xtfisher invest, trend lag(1)
    xtfisher market, lag(2) pp
    
    use sheston91.dta, clear 
    xtfisher rgdppc   if country<11, lag(2)
    qui tsset
    xtfisher D.rgdppc if country<11, lag(2)
    xtfisher rgdppc   if country<11, lag(2) display
    xtfisher rgdppc   if country<11, lag(2) display pp
 
 
 
 *--- levinlin 命令 ---     Levin, Lin and Chu (LLC, 2002)
 
 * Levin, Andrew, Lin, Chien-Fu and Chia-Shang James Chu. 
 *    Unit Root Tests in Panel Data: Asymptotic and Finite Sample Properties. 
 *    Journal of Econometrics, 108, 1-24, 2002.

 * 应用：大N，小T （目前已被Google Scholar引用1252次）
 *      模型的估计采用 xtreg,fe 命令，因此允许个体效应；
 *
 * H0：面板中的所有截面对应的序列都是非平稳的，即I(1)过程
 *
 * 特点：考虑截面异质性(heterogeneous panels)和干扰项的序列相关问题
 *
 * 假设：所有序列均服从AR(1),且相关系数相同，但允许个体固定效应
 *
 * 统计量：对单个截面执行ADF检验后得到的t值的平均值，并作相应调整
 *         该统计量在H0下服从正态分布
 *
 * 若H0被拒绝，则认为所有序列均平稳，这是与其他几个检验方法不同之处。
 
    use sheston91.dta, clear
     levinlin rgdppc if country<11, lag(2)
     levinlin rgdppc if country<11, lag(2 2 2 3 3 3 4 4 4 4)
     levinlin D.rgdppc if country<11, lag(2) trend



 *--- hadrilm 命令 ---   Hadri (2000)
 
 * Hadri, Kaddour. (Google Scholar 引用 332 次)
 *   Testing for stationarity in heterogeneous panel data.
 *   The Econometrics Journal, 3, 2000, 148-161.

 * H0: 所有序列均平稳(***)，LM test，统计量在H0下服从正态分布
 * 特点：考虑截面异质性(heterogeneous panels)和干扰项的序列相关问题
 * 参考：赵梦楠,周德群.面板单位根Hadri检验的有偏性及其修正,-数量经济技术经济研究,2008
 
  use sheston91.dta, clear
  hadrilm rgdppc if country<11
  hadrilm D.rgdppc if country<11

  use gdp_china.dta, clear
  hadrilm lny 
  hadrilm yr
  
  
 * 最新进展：
 * 
 * Chang Y. Bootstrap unit root tests in panels with cross-sectional dependency.
 *    Journal of Econometrics, 2004.
 *
 * Pesaran M.H., Simth V., and Yamagata T.  
 *    Panel Unit Root Tests in the Presence of a Multifactor Error Structure 
 *    working paper, papers.ssrn.com, 2008.
 * 
 * Baltagi BH, G Bresson, A Pirotte. 
 *    Panel unit root tests and spatial dependence 
 *    JOURNAL OF APPLIED ECONOMETRICS, 2007 
 *
 * Moon HR, Perron B. 2004. 
 *    Testing for a unit root in panels with dynamic factors. 
 *    Journal of Econometrics 122: 81–126.
 *
 * Kapetanios G. 2007. 
 *    Dynamic factor extraction of cross-sectional dependence In panel unit root tests. 
 *    Journal of Applied Econometrics, 2007(22).
   
   
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第七讲  面板数据模型 
          *       ==========================
          *            7.10 面板协整分析  
          
cd D:\stata10\ado\personal\Net_course\B7_Panel  
        
*-------------------------------
*        面板协整分析
*------------------------------- 
*
*    目 录
*
* 面板协整检验
* 面板误差修正模型 


* 协整关系的本质：
*
*            ~~~~~ - 醉汉与狗 - ~~~~~
*
*  (1) 单独看他们的行进轨迹，似乎没有什么规律可言；I(1)
*  (2) 同时看他们的行进轨迹，二者的距离介于 0 和 L 之间(L为绳长)；长期关系
*  (3) 当绳子拉紧时，狗靠近人，或人靠近狗； 短期调整
*      当狗靠紧人时，人会不舒服，会踢狗；   短期调整



* -------------- 面板协整检验 ------------

*----------------
*  -nharvey-命令
*----------------
*
* 基于残差的检验   Nyblom and Harvey (NH, 2000)
 
 * Nyblom, Jukka and Andrew Harvey. 
 *    Tests of common stochastic trends. 
 *    Econometric Theory, 16, 2000, 176-199.
 
 * 基本思想：检验残差序列构成的矩阵的Rank(秩)是否为零
 *          该矩阵的Rank即为协整向量的个数
 * 临界值的渐进分布特征决定于截面的个数N和预先假设的协整向量的个数。
 * 允许序列相关
 
   use sheston91.dta, clear
   nharvey rgdppc if country<11
   nharvey rgdppc if country<3
   nharvey rgdppc if country<11, vlag(2(2)6)
   nharvey D.rgdppc if country<11, trend
   
   use jasa2.dta ,clear
   tsset id year
   xtbalance, range(1962 1992)  /*处理为平行面板*/
   d
   xtdes
   nharvey y 
   nharvey c
   nharvey q 


*----------------
*  -xtwest-命令
*----------------
*
* 基于误差修正模型的检验

* 参见：
*
* Westerlund, J. 2007. 
*   Testing for error correction in panel data. 
*   Oxford Bulletin of Economics and Statistics 69: 709–748. 
*
* Persyn, D. and J. Westerlund. 2008. 
*   Error Correction Based Cointegration Tests for Panel Data. 
*   Stata Journal, 8(2):232-241.

* 基本思想：
*   以误差修正模型为基础进行面板协整检验
*   若存在协整关系，则误差修正部分的系数应显著异于零。
*
* 优点：
*   此前基于残差的面板协整检验统计量隐含着一个重要的假设条件：
*     长期误差修正系数(变量的水平值) = 短期动态调整系数(变量的差分值)
*     称之为“同要素限制”(common factor restriction)
*   但Banerjee et al.(1998)研究表明，当这一假设无法满足时，
*   以残差为基础的面板协整检验统计量的检定力会大幅降低。
*   因此，以误差修正模型为基础进行协整检验可避免这一限制。
*
* 特点：
*   考虑截面异质性(长期误差修关系和短期动态关系)；
*   考虑截面内的序列相关和截面间的相关性
*
* 检验统计量：4个
*   H0：不存在协整关系
*   H1：面板整体上存在协整关系（2个） 
*   H1：至少存在一对协整关系
 
* 模型设定：  模型(1)
*  
* D.y_it =   s_i*d_t                    /*时间趋势项*/
*          + a_i*(y_it-1 - b_i*x_it-1)  /*长期误差修正项*/       
*          + a_i1*D.y_it-1 + a_i2*D.y_it-2 ... + a_ip*D.y_it-p_i /*短期动态关系*/   
*          + b_i0*D.x_it   + b_i1*D.x_it-1 ... + b_ip*D.x_it-p   /*短期动态关系*/
*          + e_it
* 
* 含义: 若存在误差修正机制，则 a_i<0 且显著，
*       此时也就表明 y_it 和 x_it 之间存在协整关系；
*       否则，就表明二者之间不存在协整关系。
*
* 整理得：    模型(2)
* 
* D.y_it =   s_i*d_t                
*          + a_i*y_it-1 + c_i*x_it-1    /*c_i = -a_i*b_i*/      
*          + a_i1*D.y_it-1 + a_i2*D.y_it-2 ... + a_ip*D.y_it-p_i /*短期动态关系*/   
*          + b_i0*D.x_it   + b_i1*D.x_it-1 ... + b_ip*D.x_it-p   /*短期动态关系*/
*          + e_it

*== 第一组统计量：
*
*-- 假设：a_i != a_j 
*   不同的截面有-不同-的 a_i, 即各个截面的误差修正速度-不同-
*
*-- 构造方法：
*   针对每个截面，采用 OLS 估计模型(2)，
*    得到 a_1, a_2, ... a_N 的估计值和标准误； /*即 y_it-1 的系数*/ 
*
*-- Gt 统计量，不考虑序列相关
*
*   Gt = (1/N)*(a_1/se_1 + a_2/se_2 + ... + a_N/se_N)
*             (其中，se_i 是 OLS 估计得到的标准误)
*
*-- Ga 统计量，考虑序列相关，采用 Newey and West(1994) 方法计算标准误
*
*   Ga = (1/N)*(T*a_1/SE_1 + T*a_2/SE_2 + ... + T*a_N/SE_N)
*     (其中，SE_i 是采用 Newey and West(1994) 考虑序列相关后的标准误)
* 
* H0：不存在协整关系      Gt 和 Ga 统计量均服从 N(0,1)
* H1: 至少存在一组协整关系


*== 第二组统计量：
*
*-- 假设：a_i = a_j = a
*   各个截面有-相同-的 a_i=a, 即各个截面的误差修正速度-相同-
*
*-- 构造方法：
*   利用第一阶段的OLS残差计算 a 的估计值和标准误 se_a
*
*-- Pt 统计量，不考虑序列相关
*
*   Pt = a / se_a
*
*-- Pa 统计量，考虑序列相关
*
*   Pa = T*a
*
* H0：不存在协整关系      Pt 和 Pa 统计量均服从 N(0,1)
* H1: Panel 整体上存在协整关系


*== 截面相关性和Bootstrap
*
* 以 Gt 为例：
*   Step1: 按上述方法计算 Gt_0, 即 Gt 统计量的真实值；
*   Step2: BS 100 次，得到 Gt_s: Gt_1, Gt_2, ..., Gt_100,
*   Step3: 统计推断，若 Gt_0 小于 Gt_s 的第 5 百分位值，
*                   或 Gt_0 大于 Gt_s 的第 95 百分位值，则拒绝原假设；
*
* 说明：该方法相当耗时，但可以保证检验结果的稳健性。


*== 例：健康支出与人均GDP之间存在协整关系吗？
* Ref: Stata Journal 2008(2): 232-241.
  
     use xtwest_data.dta, clear
     tsset country year
     des

    xtwest loghex loggdp, westerlund constant trend ///
                   lags(1 3) leads(0 3) lrwindow(3) noisily
                   
 * 选项释义：
 *
 * westerlund:  呈现 Westerlund(2007)文中的结果
 * constant:    附加常数项
 * trend:       附加时间趋势项
 * lags(1 3):   加入 D.y_it-1 D.y_it-2 D.y_it-3  /*相当于 lag(1/3)*/
 * leads(0 3):  加入 D.x_it+3 D.x_it+2 D.x_it+1 D.x_it D.x_it-1 D.x_it-2 D.x_it-3
 *                相当于 leads(-3/3)
 * lrwindow(3): 采用半参数方法计算 a_i 的标准误，指定Bartlett核函数的窗口大小
 * noisily:     显示所有截面的回归结果(针对每个截面做误差修正模型)
  
* D.y_it =   s_i*d_t                
*          + a_i*y_it-1 + c_i*x_it-1    /*c_i = -a_i*b_i*/      
*          + a_i1*D.y_it-1 + a_i2*D.y_it-2 ... + a_ip*D.y_it-p_i /*短期动态关系*/   
*          + b_i0*D.x_it   + b_i1*D.x_it-1 ... + b_ip*D.x_it-p   /*短期动态关系*/
*          + e_it
 
    xtwest loghex loggdp, constant trend      ///
             lags(1 3) leads(0 3) lrwindow(3)   
             
    xtwest loghex loggdp, constant trend      ///
             lags(1 2) leads(0 1) lrwindow(3)  
                    
    xtwest loghex loggdp, constant trend ///
           lags(1) leads(1) lrwindow(3) bootstrap(50)


* BS 500 次的结果：
*------------------------------------------------------------		
* Statistic   Value	Z-value    P-value  Robust P-value	
*------------------------------------------------------------					
*     Gt     -2.681	-1.731	 0.042	 0.036	 
*     Ga     -10.927     0.713	 0.762	 0.110	 
*     Pt     -12.035    -2.959	 0.002	 0.028	 
*     Pa     -10.524    -1.160	 0.123	 0.046	 
*------------------------------------------------------------					

					                 

* -----------面板误差修正模型  xtpmg 命令-------------
*
* Stata Journal 7(2): 197-208.（提供了理论和实证方面的参考文献）
*
* 简介：大N小T面板 v.s. 大N大T面板
*  
*  (1) 对于动态面板而言，两种类型的面板资料的大样本性质存在显著差异：
*      a. 大N小T面板重点关注截面特征，因此通常采用FE，RE或GMM，
*         只允许截距发生变化，而各个截面的斜率则是相同的；
*      b. 大N大T面板则需同时关注截面和时序特征，因此斜率相等的假设可能并不合理。
*
*  (2) 对于大N大T型面板而言，由于每个截面内部的时序都较长，
*      所以稳定性也是一个需要重点关注的问题

* 适用于：大 N，大 T；考虑个体固定效应；非稳定序列
*
* 模型简介：
*
* (1) 长期消费函数
*        C[it] = a0 + a1*Y[it] + a2*PI[it] + u_i + v[it]
*           C — ln(人均消费支出)
*           Y — ln(人均收入)
*          PI — 通货膨胀率
* (2) 相应的分布滞后自回归模型(ARDL(1,1,1))为：
*     C[it] =   ko*C[it-1]                /*消费的一阶滞后*/
*             + b1*Y[it]  + b2*Y[it-1]    /*收入的当期和一阶滞后项*/
*             + b3*PI[it] + b4*PI[it-1]   /*通胀率的当期和一阶滞后项*/
*             + u_i + v[it]
* (3) 误差修正模型
*     D.c[it] =   b_0i*(c[it-1] - a1*y[it] - a2*pi[it])   
*               + b_1i*D.y[it] + b_2i*D.pi[it] + v[it] 
*     b0 — 误差修正速度，
*           若 b0 = 0, 表明不存在长期关系；
*           若 b0 < 0, 则表明存在误差修正机制
*     a1, a2 反映了 Y, Q 与 C 之间的长期关系,本例中表示产出和通胀率弹性系数
*     b1, b2 反映了 Y, Q 与 C 之间的短期关系


*== 三种估计量：
*
* -1-  MG 估计量
*
*  假设：各个截面的长期和短期系数均不同，即完全的截面异质性
*  估计方法：OLS 获得每个截面的估计系数
*  汇报结果：
*     b0 = (1/N)*(b0_i + b0_2 + ... + b0_N)
*     Var(b0) = 1/sqrt(N-1)*Var(b0_i) 

* -2-  FE 估计量
*
*  假设：各个截面具有相同的短期和长期系数，但有不同的截距项(个体效应)
*  估计方法：FE (xtreg, fe cluster(id)) 考虑截面相关性
* 
* -3- PMG 估计量
*  假设：a1i=a1j, a2i=a2j, 即各个截面的长期系数都相等；
*        误差修正速度(b_0i)和短期动态系数(b_1i,b_2i)具有截面异质性 
*  估计方法：MLE

 
   use jasa2.dta ,clear  
   tsset id year
   xtbalance, range(1962 1992)  /*处理为平行面板*/
   

* 面板单位根检验
  ipshin q, lags(3)
  ipshin D.q, lags(3)
  ipshin y , lags(3)
  ipshin D.y, lags(3)
  ipshin c , lags(3)
  ipshin D.c, lags(3)

* 建立误差修正模型

  *== 采用 -PMG(Pooled Mean-Group)- 估计量  (pmg 选项)
  *   参见 Pesaran, Shin, and Smith(1997, 1999)
  *   同时利用各个序列单独估计和整体混合估计的系数
  *
  *  假设：
  *    (1) 所有个体的长期弹性系数相等误差修正系数均相等，但短期系数则可随个体改变
  * 估计
    xtpmg D.c D.q D.y , lr(L.c q y) ec(ec) pmg
    est store pmg
    xtpmg D.c D.q D.y , lr(L.c q y) ec(ErrorC)  pmg
    xtpmg D.c D.q D.y , lr(L.c q y) ec(ec) full replace pmg
    
  * 检验收入-消费的长期弹性系数是否为 1
    xtpmg D.c D.q D.y , lr(L.c q y) ec(ec) replace pmg
    test [ec]y = 1

  * 预测某个国家之消费的一阶差分
    xtpmg D.c D.q D.y , lr(L.c q y) ec(ec) full replace pmg
    gen dc = D.c
    predict dc111 if id==111, eq(id_111)
    list c dc dc111 if id==111
    
  * 联合检验多个国家是否存在误差修正机制
    test [id_111]ec = [id_112]ec = 0
    
    test [id_186]ec = [id_193]ec = [id_196]ec 
  

  *== 采用 -MG(Mean-Group)- 估计量  (mg 选项)
  *   参见 Pesaran and Smith(1995)
  *   分别估计N个时间序列，取它们的平均值
  *  假设：所有个体的长期误差修正系数和短期系数都随个体而改变
  xtpmg d.c d.q d.y , lr(l.c q y) ec(ec) replace mg
  est store mg
  
  *结果对比
  esttab pmg mg, mtitle(pmg mg)
  
  
  *== 采用固定效应动态面板估计量 (dfe 选项)
  *  假设：长期误差修正系数和短期系数均为常数，不随个体改变 
  xtpmg d.c d.q d.y , lr(l.c q y) ec(ec) replace dfe
  est store dfe
  
  xtpmg d.c d.q d.y , lr(l.c q y) ec(ec) replace dfe cluster(id)
  est store dfe_cluster                 /*允许截面间存在相关性*/
  
  * 结果对比
  esttab pmg mg dfe dfe_cluster, mtitle(pmg mg dfe dfe_cluster) 


  *== 模型的筛选 ==
  * pmg, mg 和 dfe 三者对模型参数的限制有所不同
  * mg  长短期系数均随个体变动
  * pmg 长期不变，短期可变
  * dfe 长短期均不可变
   
  hausman pmg mg 
  hausman pmg mg, sigmaless
  * 若 pmg 的约束条件是正确的，则 pmg 比较有效，因为使用了较少的参数；
  * 反之，pmg 将是不一致的，但 mg 在两种情况下都是一致的。
  
  hausman pmg dfe, sigmamore
  
  hausman mg dfe, sigmamore
  
  
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================


*-------------目录----------------
* 8.1 简介
* 8.2 暂元进阶功能
*   8.2.1 自动分解暂元的内容
*   8.2.2 暂元的文字处理和读讯功能
* 8.3 输入项
*   8.3.1 简单输入项  args 命令
*   8.3.2 复杂输入项  syntax 命令
*       变量名称
*       矩阵和单值
*       表达式
*       条件语句的设定
*       选项的设定
*       样本适用范围的设定
* 8.4 输出项
*   8.4.1 简介
*   8.4.2 r-class 程序
*   8.4.3 e-class  程序
* 8.5 可分组执行的程序
* 8.6 可重新显示结果的程序
* 8.7 子程序
* 8.8 程序的调试
* 8.9 帮助文件的编写
*   8.9.1 简介 
*   8.9.2 Stata 中的 smcl 语句
*   8.9.3 具有可链接目录的帮助文件
*   8.9.4 具有可运行实例的帮助文件
*--------------------------------


* 在学习本讲内容前，请先学习A5_Prog(Stata程序初步)一讲中的内容
help program

cd D:\stata10\ado\personal\Net_Course\B8_Prog2
adopath + "D:\stata10\ado\personal\Net_Course\B8_Prog2"


*==================
*  一个简单的实例
*==================

* 目的：计算给定变量的取值范围
  sysuse auto, clear
  sum price 
  local range = r(max) - r(min)
  dis "range = " `range'
  
* 改进 summarize 命令，使之可以呈现变量的取值范围
  
  doedit mysum0.ado
  
  sysuse auto, clear
  mysum0 price mpg weight length
        
* 小结：一个完整的程序应当包含如下几个部分
*    (1) 输入项，如变量名称、条件语句、样本范围、选项等
*         如：regress price weight length if foreign==1
*             sum price weight length in 1/50, detail
*    (2) 程序主体：计算、产生新变量、估计等
*    (3) 输出项
*    (4) 存储返回值 
*         如：return list, ereturn list
*    (5) 列示结果
*    (6) 有些时候，我们还需要编写程序的说明文件，如 help regress
*        对应文件为 regress.hlp         


*==================
*  暂元的进阶功能
*==================

*-- 自动分解暂元的内容

 *-- gettoken 命令：逐一提取单词
 
   * 提取 a 中的第一个单词至 y 中
   local a "price weight length"
   gettoken y: a
   dis "`y'"
   
   * 将 a 中的第一个单词放在 y 中，剩下的放在 x 中
   local a "price weight length"
   gettoken y x: a
   dis "`y'"
   dis "`x'"
   
   * 将 a 中的第一个单词移出至 y 中
   local a "price weight length"
   gettoken y a: a
   dis "`y'"
   dis "`a'" 
   
   
 *-- tokenize 命令：切割单词
   
   * 默认分割点为：空格                  
   local a "price weight length"
   tokenize "`a'"
   dis "`1'"
   dis "`2'"
   dis "`3'"
   
   * 指定分割点
   local b "price=3*weight/length"
   tokenize "`b'", parse("=*/")
   dis "`1'"
   dis "`2'"
   dis "`3'"  
   dis "`4'" 
   dis "`5'"
   dis "`6'"
   dis "`7'"
   * 练习：将选项修改为 parse("=*/")，结果有何差异？



*-- 暂元的文字处理和读讯功能  help extended_fcn

  *-- 暂元文字的处理
  
    *-- 文字结构：
      local m "I love Stata"
      local a: length local m  /*字母的个数*/
      local b: list sizeof m   /*单词的个数*/
      local c: word count `m'  /*单词的个数*/
      local d: word 3 of `m'   /*m 中的第三个单词*/
      local e: list posof "love" in m
      dis `a'
      dis `b'
      dis `c'
      dis "`d'"
      dis `e'
  
    *-- 文字替代：
      local m "I love Stata"
      local a: subinstr local m "love" "really love"
      local b: subinstr local m "a" "A"
      local c: subinstr local m "a" "A", all
      dis "`a'"
      dis "`b'"
      dis "`c'" 
      
    *-- 分隔字符清理：
      local m  " I   love     Stata " 
      local a: list retokenize m
      dis "`m'"
      dis "`a'"
      
    *-- 集合运算：
      local m "I love Stata!" 
      local n "She love stata too!"
      local a: list m | n
      local b: list m & n
      local c: list m - n
      dis "`a'"
      dis "`b'"
      dis "`c'"
      
    *-- 文字比较：
      local m "I love Stata" 
      local n "Stata I love"
      local q "She said: I love Stata"
      local a: list m == n   /*单词和排序均相同*/
      local b: list m === n  /*单词相同*/
      local c: list m in q   /*m是否包含于q？*/
      dis `a'
      dis `b'
      dis `c'      
    
    *-- display 命令呈现的结果：
      display %6.4f ln(10)
      local a: display %6.4f ln(10)
      dis `a'
    
    
  *-- 暂元的信息读取功能     
    
    *-- 变量信息：
    sysuse auto, clear
    describe
    local a: type   price
    local b: format price
    local c: variable label rep78   /*变量rep78的标签*/
    local d: value label foreign    /*foreign变量的数字-文字对应表*/
    local e: data label             /*样本标签*/
    local f: sortedby               /*样本排序变量*/
      dis "`a'"
      dis "`b'"
      dis "`c'"
      dis "`d'"
      dis "`e'"
      dis "`f'"  
      
    *-- 矩阵信息：
     mkmat price rep78 turn foreign in 1/10, mat(B)
     mat list B
     local a: rownames B
     local b: colnames B
      dis "`a'"
      dis "`b'"
    
    *-- 内存中的对象：
    scalar m = ln(100)
     local a: all globals
     local b: all scalars
     local c: all matrices
       dis "`a'"
       dis "`b'"
       dis "`c'"
    
    *-- 程序的返回值：
    sum price wei rep78 foreign
    return list
     local a1: r(scalars)
     local b1: r(macros)
     local c1: r(matrices)
     local d1: r(functions) 
       dis "`a1'"
       dis "`b1'"
       dis "`c1'"
       dis "`d1'"        
    reg price wei rep78 foreign
    ereturn list
     local a2: e(scalars)
     local b2: e(macros)
     local c2: e(matrices)
     local d2: e(functions)
       dis "`a2'"
       dis "`b2'"
       dis "`c2'"
       dis "`d2'"
           
    *-- 尚未使用的变量名称、暂时变量、或暂时性文件的名称：
    sysuse auto, clear
     local a: permname price   /*a中存储一个与price最为接近的变量名称*/
     local b: permname price, length(8) /*新变量名称最多可包含8个字母*/
     * 说明：length() 只能填写 8-32 之间的数值
       dis "`a'"
       dis "`b'"
           
    *-- 子目录信息：
     local a: dir . files "*"
     local b: dir "D:\stata10\ado\personal\_Myado\x" files "xt*"
     local c: dir . dirs "*"
       dis `"`a'"'
       dis `"`b'"'
       dis `"`c'"'     
     * 注意： `" "' 的使用方法

          
          *              ::高级部分::
          *          计量分析与Stata应用
          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================
          *              8.3  输入项  
          
cd D:\stata10\ado\personal\Net_Course\B8_Prog2

*==================
*     输入项
*==================
* 8.3 输入项
*   8.3.1 简单输入项  args 命令
*   8.3.2 复杂输入项  syntax 命令
*       变量名称
*       矩阵和单值
*       表达式
*       条件语句的设定
*       选项的设定
*       样本适用范围的设定


*-- 简介

   sysuse auto,clear
   reg price wei len 
   reg price wei len if foreign==1
   reg price wei len in 1/50
   sum price wei len, detail 
   bysort foreign: sum price wei len


*-- 简单输入项  args 命令
  *--------------------------------------------------------
  cap program drop mysin
  program define mysin
  version 9.2
    args v1 v2
    local y = sin(`v1')^2 + cos(`v2')^2
    dis in g "sin(`v1')^2+cos(`v2')^2= " in yellow `y' 
  end
  *--------------------------------------------------------

  mysin 30 60
  mysin 45 45
  

*-- 复杂输入项  syntax 命令

  * 基本结构： syntax varlist  [if] [in] [,opt1() opt2()]
  *            syntax namelist [if] [in] [,opt1() opt2()]
  *            syntax anything [if] [in] [,opt1() opt2()]
  
  *-- 变量名称
  
  * syntax varlist     输入暂元 varlist 中存储一个或多个变量名称
  * syntax varname     输入暂元 varlist 中仅存储一个变量名称
  * syntax newvarlist  输入暂元 varlist 中存储一个或多个新变量名称
  * syntax newvarname  输入暂元 varlist 中存储一个新变量名称
  
  *！ 注意：无论采用哪种定义方式，在程序中引用的输入暂元均为 varlist
  
  *=例1：针对每个变量进行回归
  *--------------------------------------------------------
  cap program drop mysepreg
  program define mysepreg
  version 9.2
    syntax varlist
    gettoken y x: varlist  /*分离出被解释变量和解释变量*/
    tokenize "`x'"         /*分隔解释变量为单个变量*/
    local i = 1
    while "``i''" != ""{   /*注意 ``i'' 的引用方式*/
      dis _n _n in y "Regression for " in w "``i''"
      reg `y' ``i++''
    }
  end
  *--------------------------------------------------------
  sysuse auto, clear
  mysepreg price wei len foreign
  mysepreg price mpg-turn
  
  
  * 改进该程序
  *--------------------------------------------------------
  cap program drop mysepreg2
  program define mysepreg2
  version 9.2
    syntax varlist
    gettoken y x: varlist  
    tokenize "`x'"         
    local i = 1
    while "``i''" != ""{   
      dis _n _n in y "Regression for " in w "``i''"
      reg `y' ``i''
      est store r_``i++''  /*存储各个回归结果*/
    }
    dis _n _n in w "Summary of the Results: "
    est table r_*, stat(r2 r2_a) star(0.01 0.05 0.1)  /*结果比较*/
  end
  *--------------------------------------------------------
  sysuse auto, clear
  mysepreg2 price wei len turn foreign
  
  
  *=例2：逐步回归法
 *--------------------------------------------------------
  cap program drop myrollreg
  program define myrollreg
  version 9.2
    syntax varlist
    gettoken y x: varlist
    local j = 1
    while "`x'" != "" {
      reg `y' `x'
      est store s_`j++'
      gettoken z x: x   /*每次剔除x中的一个变量*/
    }
    dis _n _n in w "Summary of the Results: "
    est table s_*, stat(r2) star(0.01 0.05 0.1)  /*结果比较*/
  end    
 *--------------------------------------------------------
  
  sysuse auto, clear
  myrollreg price wei len turn rep78 foreign
  

  * 一些相关的设定：
  * syntax [varlist]       /*变量名称可选，如sum命令*/
  * syntax varlist (min=2) /*至少要输入量两个变量，如corr y x*/       
  * syntax varlist (min=2 max=5 string) /*变量个数必须介于2和5之间，且必须为字符型*/
  * syntax varlist [varlist(default=none)] /*默认情况下，不需输入变量名称*/
  * syntax newvarlist  /*必须为一组新变量的名称*/
  * syntax newvarname  /*必须为一个新变量名称,如 gen xx = ...*/
  *
  * 实例：
  *--------------------------------------------------------
  cap program drop mylog
  program define mylog
  version 9.2
    syntax varlist (min=2 max=4 numeric) 
    tokenize "`varlist'"
    local i = 1
    while "``i''" != ""{
      gen ln_``i'' = ln(``i++'')
    }
  end
  *--------------------------------------------------------
  sysuse auto, clear
  mylog  price                   /*变量个数太少*/
  mylog  price wei
  mylog  price wei len turn mpg  /*变量个数太多*/
  mylog  price make   /*make是文字型变量，不允许*/
  des
 
  
  *-- 矩阵及单值名称
  
  * syntax namelist 
  * syntax [namelist]
  * syntax namelist (max=2)  /*至多包含两个矩阵或单值*/
  * syntax name              /*只包含一个矩阵或单值*/
  
  *！ 注意：无论采用哪种定义方式，程序中调用的输入暂元均为 namelist
  
  *--------------------------------------------------------
  cap program drop myinvt
  program define myinvt
  version 9.2
    syntax namelist (max=3) 
    local j: word count `namelist'
    tokenize "`namelist'"
    forvalues i = 1(1)`j'{
      capture mat inv_``i'' = inv(``i'')
      if _rc{
        dis in error "Matrix ``i'' can not be inversed!"
      }
      else{
        mat list ``i''
        mat list inv_``i''
      }
    }   
  end
  *--------------------------------------------------------
  
  mat a = J(3,3,9)
  myinvt a
  matrix accum XX =  mpg wei length turn
  myinvt XX
  
  
  *-- 表达式
  
  * syntax anything
  * syntax anything (name=rr min=2)
  * syntax [anything (name==rr min=2 max=6)]
 *-------------------------------------------------------- 
  cap program drop mydis
  program define mydis
  version 9.2
    syntax anything
    local j : word count `anything'
    forvalues i = 1/`j'{
       dis _n in w "``i'' = "   in y `=``i''' _n  /*注意 `=`*'' 的使用方法*/
    }
  end
 *-------------------------------------------------------- 
  mydis 3+5/2  ln(3)*5^3
  mydis 3+5/2  ln(3)*5^3  sin(3)+cos(2) log(10)
  
  
          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================
          *              8.3  输入项    
          *                第二部分
          
  
  *-- 条件语句的设定
  
  * syntax varlist if in
  * syntax varlist [if] [in]
  
  * 如：reg price wei len if foreign==1
  *     reg price wei len in 1/50
  
  * 基本思路：`if' 和 `in' 两个暂元中存储了相关的限制条件
 
 * 例1：if 和 in 暂元中包含的内容 
 *-------------------------------------- 
  cap program drop myif
  program define myif
  version 9.2
    syntax varlist [if] [in]
    dis "varlist 中包含： |`varlist'|"
    dis "     if 中包含:  |`if'|" 
    dis "     in 中包含:  |`in'|"
  end
 *-------------------------------------- 
  sysuse auto, clear
  myif price wei len 
  myif price wei len if foreign == 1
  myif price wei len in 1/10
  myif price wei len if foreign==0 in 1/50
  
  
 * 例2：mysepreg 命令的进一步改进
 *--------------------------------------------------------
  cap program drop mysepreg3
  program define mysepreg3
  version 9.2
    syntax varlist [if] [in]
    gettoken y x: varlist  
    tokenize "`x'"         
    local i = 1
    while "``i''" != ""{   
      dis _n _n in y "Regression for " in w "``i''"
      reg `y' ``i'' `if' `in'    /*！！注意此处的变化*/
      est store r_``i++'' 
    }
    dis _n _n in w "Summary of the Results: "
    est table r_*, stat(r2) star(0.01 0.05 0.1)  
  end
 *--------------------------------------------------------
  
  sysuse auto, clear
  mysepreg3 price wei len turn foreign if price<10000 
  mysepreg3 price wei len in 20/60
  
  
  *-- 选项的设定
  * 基本结构： syntax varlist [, Opt1() Opt2() ....]
  * 例如： syntax ... , ... VALues(numlist max=10 sort) 
  *        syntax ... , ... Title(string) ...
  * 基本规则：选项标签的前几个大写字母表示该选项可被缩写的程度
  * help syntax
  *--------------------------------------------------------
  *！ 该程序是此前 mylog.ado 程序的扩展
  cap program drop mygen
  program define mygen
  version 9.2
    syntax varlist [, Math(string) ] 
    tokenize "`varlist'"
    local i = 1
    while "``i''" != ""{
      gen `math'_``i'' = `math'(``i++'')  /*注意选项 `math' 的引用，必须小写*/
    }
  end
  *--------------------------------------------------------
  help math functions
  sysuse auto, clear
  mygen price, math(sum)
  list price sum_price in 1/10
  mygen price wei len, math(ln)
  list price ln_price wei ln_wei len ln_len in 1/10
  
  
  * 多个选项的设定
  *--------------------------------------------------------
   *！此程序是此前 myinvt.ado 程序的扩展
   cap program drop myinvt2
   program define myinvt2
   version 9.2
    syntax namelist [,Title(string) DISplay ]  /*此处设定了两个选项*/
    if "`title'" != ""{
      dis _n in w "`title'"
    }
    local j: word count `namelist'
    tokenize "`namelist'"
    forvalues i = 1(1)`j'{
      cap mat inv_``i'' = inv(``i'')  /*检查矩阵是否可逆*/
      if _rc{                         /*若可逆，则_rc=0,否则_rc!=0*/
        dis in error "Matrix ``i'' can not be inversed!"
        exit  /*跳出程序*/
      }
      else {
        if "`display'" != ""{      /*此处，通过选项display来控制结果显示与否*/
          mat list ``i''
          mat list inv_``i''
        }
      }
    }   
   end
  *--------------------------------------------------------
  
  mat a = J(3,3,9)
  myinvt2 a
  sysuse auto, clear
  matrix accum XX =  mpg wei length turn
  myinvt2 XX  
  myinvt2 XX, t("Inverse a Matrix") di  /*错误！*/
  myinvt2 XX, t("Inverse a Matrix") dis   
  
  
  * 例：选取时间序列的一部分样本
   * 问题：按照开始时间和结束时间截取时间序列的一部分
     sysuse gdp.dta
     tsset year
     keep if  year>=1950 & year<=2004
  *--------------------------------------------------------
  cap program drop mycut
  program define mycut
  version 9.2
    syntax  [, range(numlist min=2 max=2 ascending) ]
    gettoken begin end: range   /*将 range 中的两个数字分贝存于暂元 begin 和 end 中*/
    capture tsset
    if _rc{
      dis as error "You must" in g " tsset " ///
          in red   "your data before using "  ///
          in g     "mycut"
      exit
    }
    else{
      local t  `r(timevar)'  /*将时间标识变量存储于暂元 t 中*/
    }
    keep if  `t'>=`begin' & `t'<=`end'
  end
  *--------------------------------------------------------
    use gdp.dta, clear
    tsset, clear
    mycut , range(1950 2004)  /*错误！*/
    tsset year 
    mycut , range(1950 2004)
    mycut , range(2006 1938)  /*选项中 ascending 的作用*/
  
  * 一些可能的改进途径：
    * 当用户输入的数值超出样本的始末时间时，提示错误信息
    * 对于 1990q1, 7jul1990 等格式的数据进行自动处理
    

*-- 样本适用范围的设定  help marksample ; help mark; help markout
  
  * 问题：多数stata命令可以自动忽略缺漏值，
  *       并针对用户设定的 [if] 或 [in] 条件来决定计算或估计中使用的样本
  * 这些功能主要通过 markt* 命令来实现
  * 基本思想：产生一个新变量(0/1)，由于记录符合条件的样本值
  *--------------------------------------------------------
  cap program drop myreg3
  program define myreg3
  version 9.2
    syntax varlist [if] [in] [, Title(string) Option(string)]
    marksample touse
    reg `varlist' if `touse'
  end
  *--------------------------------------------------------
  sysuse auto, clear
  myreg3 price wei len if rep78>2
   count if rep78>2
  myreg3 price wei len rep78 if rep78>2
   sum rep78
   count if  rep78>2 & rep78!=.    
  * 评论：相对于 reg `varlist' `if' `in'
  *       使用 marksample 命令更为简洁、安全。
  *       我们尚可使用如下程序获得相同的效果
  *       基本思路：
  *         先定义一个暂时性变量 touse，然后使用 mark 和 markout 命令标记之
  *--------------------------------------------------------
  cap program drop myreg4
  program define myreg3
  version 9.2
    syntax varlist [if] [in] [, Title(string) Option(string)]
    tempvar touse
    mark `touse' `if' `in'    /*标记 if 和 in 中的样本*/
    markout `touse' `varlist' /*标记 varlist 中包含缺漏值的样本*/ 
    reg `varlist' if `touse'
  end
  *--------------------------------------------------------  
  
  * 进一步的说明：
  * 1. marksample touse, novarlist /*不考虑varlist中的缺漏值*/
  * 2. marksample touse, strok     /*样本适用范围不受文字值的影响*/
  *    因此，我们可以在程序中设定多个样本标识，如
  *     syntax varlist [if] [in]
  *     marksample touse1
  *     marksample touse2, strok   
  * 3. 使用 markout 命令可以进一步将选项中的样本限制条件纳入分析,如：
  *--------------------------------------------------------
  cap program drop myreg5
  program define myreg5
  version 9.2
    syntax varlist [if] [in] [, option1(string) option2(string)]
    marksample touse
    markout `touse' `option1' `option2'  /*纳入option1和option2施加的约束*/
    reg `varlist' if `touse'
  end
  *--------------------------------------------------------     

          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================
          *              8.4  输出项  
          

*==================
*     输出项
*==================

* 8.4 输出项
*   8.4.1 简介
*   8.4.2 r-class 程序
*   8.4.3 e-class  程序


*-- 简介

  * Stata 程序分为四类: r-class、e-class、s-class 和 n-class
  *   前三种分别以 r(...)、e(...)、s(...)为名称存储结果；
  *   n-class 程序不会在内存中存储任何结果
  
  sysuse auto, clear
  sum price
  return list
  
  reg price wei len foreign
  ereturn list
  
  
*== r-class 程序 ==

  sysuse auto, clear
  sum price wei len foreign
  ret list
  
  *--------------------------------------------------------   
  *! 一个简单的 r-class 程序
  cap program drop mysum2
  program define mysum2, rclass
     version 9.2
     syntax varname     /*输入项*/
    * 存储单值
      qui sum `varlist' , detail
      local range = r(max)-r(min)
      local max_min = r(max) / r(min)
      return scalar range    = `range'
      return scalar max_min  = `max_min'
    * 存储暂元
      local a: variable label `varlist'
      local b: format `varlist'
      ret local vlabel  `a'
      ret local vformat `b'
    * 在屏幕上呈现输出结果
      dis in g "range = " in y %6.3f `range' 
     dis in g "max_min = " in y %6.3f `max_min'
  end   
  *-------------------------------------------------------- 
  
  sysuse nlsw88.dta, clear
  mysum2 wage
  ret list
  mysum2 occupation
  ret list
       
       
*== e-class 程序 ==
  
  sysuse nlsw88, clear
  reg wage age race married
  eret list

  *-------------------------------------------------------- 
  *! 一个简单的 e-class 程序
  cap program drop myreg6
  program define myreg6, eclass 
  version 9.2
  
    syntax varlist [if] [in]
    gettoken y x: varlist
    local df_m : word count `x'  /*模型的自由度*/
    marksample touse
    
    preserve
      qui keep if `touse'  /*注意该用法*/
      qui count if `touse'
      local N = r(N)       /*记录有效样本数*/
      tempname Y X b
      mkmat `y', mat(`Y')
      mkmat `x', mat(`X')
      mat `b' = inv(`X''*`X')*`X''*`Y'  /*b=inv(X'X)X'y*/
    restore
    
    * 显示结果
    dis _n in g "OLS regress for " in y "`y'" in g " on " in y "`x':" 
    mat list `b',noheader
    
    * 存储返回值：函数
      eret post, esample(`touse')
    * 存储返回值：单值
      ereturn scalar N    = `N'
      eret    scalar df_m = `df_m'
    * 存储返回值：暂元
      eret local cmd "myreg6"
      eret local dep_var   `y'
      eret local indep_var `x'
    * 存储返回值：矩阵
      eret matrix beta = `b'

  end
  *--------------------------------------------------------           
    
  sysuse auto, clear
  ereturn clear  /*清除内存中已有的返回值*/  
  myreg6 price wei len foreign
  eret list
  dis e(cmd)
  mat list e(beta)
  
  * 几点说明：
  * (1) 若程序中调用了stata现有命令，则这些程序的返回值也可以使用；
  * (2) 良好习惯：所有待返回的值先存储于暂元中，然后在程序结束前一并存储
  * (3) 使用细节参见: help ereturn 
 
 
  * ereturn post 命令：借用stata的格式显示结果
    * 问题：上面的结果显示方式不够美观
    * 解决：可以借用stata的结果显示方式

  *-------------------------------------------------------- 
  *! 一个较为完整的 e-class 程序
  cap program drop myreg7
  program define myreg7, eclass 
  version 9.2
  
    syntax varlist [if] [in] [, level(real 95) eform(string)]
    gettoken y x: varlist
    local df : word count `x'  /*模型的自由度*/
    marksample touse
      qui count if `touse'
      local nobs = r(N)      /*记录有效样本数*/
    preserve
      qui keep if `touse'    /*注意该用法*/
      tempname Y X b e t0 V 
      mkmat `y', mat(`Y')
      mkmat `x', mat(`X')
      mat `b' = inv(`X''*`X')*`X''*`Y'  /*b=inv(X'X)X'y*/
      mat `e' = `Y' - `X'*`b'
      mat `t0' = `e''*`e'    /*残差平方和*/
      local sigma2 = `t0'[1,1]/(`nobs'-`df')  /* s2=e'e/(N-K) */
      mat `V' = `sigma2'*inv(`X''*`X')  /*beta的方差-协方差矩阵 V=s2*inv(X'*X)*/
    restore

    * 显示结果
      mat `b' = `b''
      dis _n in g "OLS regress for " in y "`y'" in g " on " in y "`x':" 
      eret post `b' `V', esample(`touse') obs(`nobs') dof(`df') depname(`y')
      eret display, level(`level') eform(`eform')
    * 存储更多的返回值：暂元
      eret local cmd "myreg6"
      eret local dep_var   `y'
      eret local indep_var `x'
  end
  *--------------------------------------------------------              
  
    sysuse auto, clear
    ereturn clear  /*清除内存中已有的返回值*/  
    myreg7 price wei len foreign
  * 改变置信区间
    myreg7 price wei len foreign, level(99)
  * 以指数形式呈现估计系数
    myreg7 price wei len, eform(ecof)
    
  * =小结：
  *  (1) 在多数情况下，只要我们能计算出 b 和 V 矩阵，
  *      便可采用 ereturn post 命令列示结果，stata会自动完成相关的计算。
  *  (2) 在执行完 ereturn post 后，才能进一步采用 eret local 存储其它返回值，
  *      这是因为 eret post 会清除此前已经存储的所有返回值；
  *  (3) 至于结果的表头信息，如R2,F值等信息，则需要自行计算并列表呈现。
  
  
          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================
          *         8.5 可分组执行的程序
          *         8.6 可重新显示结果的程序
          *         8.7 子程序
          *         8.8 程序的调试 
          
          

*==================
* 可分组执行的程序
*==================

* 例如：
  sysuse nlsw88, clear
  bysort race : sum wage
  bysort married: reg wage race age hours

*-- 方式1：在程序首行附加 byable(recall) 选项即可

* 条件: 
*   a. 程序中包含 marksample 命令 (或功能相似的 mark 命令)，
*      此时必然定义了一个样本范围的指针变量 touse
*   b. 程序执行完毕后不会产生任何新变量；

* 例：
  *-------------------------------------------------------- 
  *! 一个可分组执行的 e-class 程序
  cap program drop myreg8
  program define myreg8, eclass byable(recall) /*注意：此处增加了 byable() 选项*/ 
  version 9.2
  
    syntax varlist [if] [in] [, level(real 95) eform(string)]
    gettoken y x: varlist
    local df : word count x  /*模型的自由度*/
    marksample touse
      qui count if `touse'
      local nobs = r(N)      /*记录有效样本数*/
    preserve
      qui keep if `touse'    /*注意该用法*/
      tempname Y X b e t0 V 
      mkmat `y', mat(`Y')
      mkmat `x', mat(`X')
      mat `b' = inv(`X''*`X')*`X''*`Y'  /*b=inv(X'X)X'y*/
      mat `e' = `Y' - `X'*`b'
      mat `t0' = `e''*`e'    /*残差平方和*/
      local sigma2 = `t0'[1,1]/(`nobs'-`df')  /* s2=e'e/(N-K) */
      mat `V' = `sigma2'*inv(`X''*`X')  /*beta的方差-协方差矩阵 V=s2*inv(X'*X)*/
    restore

    * 显示结果
      mat `b' = `b''
      dis _n in g "OLS regress for " in y "`y'" in g " on " in y "`x':" 
      eret post `b' `V', esample(`touse') obs(`nobs') dof(`df') depname(`y')
      eret display, level(`level') eform(`eform')
    * 存储更多的返回值：暂元
      eret local cmd "myreg6"
      eret local dep_var   `y'
      eret local indep_var `x'
  end
  *--------------------------------------------------------  
  
  sysuse nlsw88, clear
  bysort race : myreg8 wage hours ttl_exp


*-- 方式2：若程序中未包含 marksample 指令，但不会产生新变量

* 只需在程序中
* (1) 使用 tempvar 命令产生一个暂时性变量 touse,
* (2) 继而增加如下指令，以定义一个“分组样本使用范围指针”
*-----------------------------------------------------------
*  if _by(){
*    quietly replace `touse'=0 if `_byindex' != _byindex()
*  }
*-----------------------------------------------------------
* 释义：
*  _by() 和 _byindex() 都是函变量，_byindex 是暂时性变量，
*  定义如下：
*               { 1， 若程序被要求分组执行；
*       _by() = { 
*               { 0， otherwise。 
*  
*               { k， 若程序被要求对第 k 分组执行；
*  _byindex() = {
*               { 0， 若程序未被要求可分组执行。
*
*               { 1,2,3,...  若程序被要求可分组执行； 
*    _byindex = { 
*               { 空         otherwise

* 例：针对每个变量分别进行回归(可分组执行)
  *--------------------------------------------------------
  cap program drop mysepreg2
  program define mysepreg2, byable(recall)
  version 9.2
    syntax varlist
    gettoken y x: varlist  /*分离出被解释变量和解释变量*/
    tokenize "`x'"         /*分隔解释变量为单个变量*/
    *---------  
     tempvar touse     /*新增语句*/
     gen `touse' = 0   /*新增语句*/
     if _by(){         /*新增语句*/
       quietly replace `touse'=0 if `_byindex' != _byindex()
     }
    *---------
    local i = 1
    while "``i''" != ""{   /*注意 ``i'' 的引用方式*/
      dis _n _n in y "Regression for " in w "``i''"
      reg `y' ``i++''
    }
  end
  *--------------------------------------------------------
  
  sysuse nlsw88, clear
  bysort married : mysepreg2 wage hours race


*========================
*  可重新显示结果的程序
*========================  

* 多数stata程序都可以两种方式执行：
* 方式1：指定输入项；
* 方式2：不指定输入项，重新显示最近一次的结果。
* 如， 
  sysuse auto, clear
  reg price wei len 
  reg
    
* 处理方式：
*     在程序中附加 "if replay() ..." 函数的判断即可

* 例：
  *-------------------------------------------------------- 
  *! 一个可重新显示结果的程序
  cap program drop myreg9
  program define myreg9, eclass
  version 9.2
    if replay(){
       if "`e(cmd)'" != "myreg9"{  /*程序名称*/
             error 301
       }
	       `e(cmd)' `e(varlist)' `if' `in' 			
    }  
    else{  
       syntax varlist [if] [in] [, Title(string) Option(string)]
       marksample touse
       reg `varlist' if `touse'
       eret local varlist `varlist'
       eret local cmd "myreg9"     /*设定返回值：程序名称*/
    }
  end
  *--------------------------------------------------------

  sysuse auto, clear
  myreg9 price wei len mpg
  sum 
  d
  reg price wei

  myreg11  /*错误！*/
  
  

*==================
*     子程序
*==================  

* 问题：
*  (1) 复杂程序切割成多个模块，便于程序的编写和调试；
*  (2) 程序中的某些功能需要反复调用，这些功能应该制作成子程序；
*  (3) 子程序可内置于主程序中，亦可单独存放于相关目录下；

* 范例：
       viewsource xtreg.ado
         viewsource xtreg_fe.ado
         viewsource xtreg_re.ado
         viewsource xtreg_ml.ado 
 
* 例：不同风格的标题
  *--------------------------------------------------------            
   cap program drop mytitle
   program define mytitle
   version 9.2
      syntax , Title(string) [Scheme(string)]
      if "`scheme'" == ""{
         mydis0, ti("`title'")  /*默认风格*/
      }
      else if "`scheme'" == "m2"{
         mydis2, ti("`title'")  /*备选风格*/
      }
      else{
         dis in error "shceme() can only specifies as" in y " m2"
      }
   end
   
   * 第一个子程序
     cap program drop mydis0
     program define mydis0
     version 9.2
       syntax , ti(string)
       dis in g "--- " in y "`ti'" in g " ---"
     end  
     
   * 第二个子程序
     cap program drop mydis2
     program define mydis2
     version 9.2
       syntax , ti(string)
       dis _n in y "&&&&&&&& " in w "`ti'" in y " &&&&&&&&" _n
     end    
  *--------------------------------------------------------
  
  mytitle, title(I love stata!)            /*默认风格*/ 
  mytitle, title(I love stata!) scheme(m2) /*备选风格*/
  mytitle, ti(I love stata!) scheme(m3)    /*错误设定*/
  
  
  *== 练习：尝试编写一个程序，以便实现如下功能 
   tab_title, ti(I Love Stata!)
   tab_title, ti(I Love Stata!) tcolor(input) lcolor(error) 
   tab_title, ti(This is the firt program I wrote using Stata! I am very exciting now)  ///
              tcolor(result) lcolor(text)  
   tab_title, ti(I love stata!) tc(blue) /*错误信息*/
  *== 答案：
           viewsource tab_title.ado
      
      
      
*==================
*    程序的调试
*==================
   
  *== set trace on/off
   
  *--------------------------------------------------------
  cap program drop myinvt
  program define myinvt
  version 9.2
    syntax namelist (max=3) 
    local j: word count `namelist'
    tokenize "`namelist'"
    forvalues i = 1(1)`j'{
      cap mat inv_``i'' = inv(``i'')
      if _rc{
        dis in error "Matrix ``i'' can not be inversed!"
      }
      else{
        mat list ``i''
        mat list inv_``i''
      }
    }   
  end
  *--------------------------------------------------------
  
  set trace on 
  mat a = J(3,3,9)
  myinvt a
  
  set trace on
  matrix accum XX =  mpg wei length turn
  myinvt XX
   
  *== 一些经验：
  * (1) 检查暂元的引用是否正确？ 
  *     如，当使用 tokenize 命令时，需要采用 ``1'' 的方式加以引用；
  * (2) 是否存在拼写错误？
  * (3) {} 或 () 是否匹配? 尤其是 if，forvalues, while 等语句；
  * (4) 程序的架构和逻辑是否合理？
   
   
          *       ==========================
          *          第八讲  STATA编程进阶   
          *       ==========================
          *           8.9 帮助文件的编写  
          
          
cd D:\stata10\ado\personal\Net_Course\B8_Prog2
adopath + "D:\stata10\ado\personal\Net_Course\B8_Prog2"   
      
*==================
*  帮助文件的编写
*==================
* 8.9 帮助文件的编写
*   8.9.1 简介 
*   8.9.2 Stata 中的 smcl 语句
*   8.9.3 具有可链接目录的帮助文件
*   8.9.4 具有可运行实例的帮助文件


*== 简介 ==

help regress
viewsource regress.sthlp

help gqhet
viewsource gqhet.hlp


*== 简单方法：复制已有帮助文件，修改之 ==

  * 假设我们要为 myreg6.ado 命令编写帮助文件：
    * 第一步：打开一份风格相似的帮助文件，如 regress.sthlp(D:\stata10\ado\base\r)，
              另存至 D:\stata10\ado\personal\Net_Course\B8_Prog2 文件夹中，
              将文件名修改为 myreg6.sthlp;
    * 第二步：编辑 myreg6.sthlp 文件，修改其内容；
    * 第三步：保存 myreg6.sthlp 文件；
    * 第四步：在命令窗口中输入 help myreg6 即可查看该帮助文件的内容。
  * 说明：在stata9以下的版本中，stata的帮助文件以 .hlp 为后缀，其它设定相似。
    
                

*== Stata 中的 smcl 语句 ==  help smcl
  
  * smcl (Stata Markup and Control Language) 
  * 用途：以特定的格式显示文字
  
  *-- 格 式 --
  * 基本设定： {格式代码: 文字}
  
    * 标题
      dis "{title: I Love Stata!}"  
    * 带边框的子标题
      dis "{dlgtab:Main}"  
      dis "{dlgtab:Example}" 
    * 下划线(underline--ul)
      dis "see {ul:[xt]xtreg} for more details"  
    * 斜体
      dis "I {it:Love} stata!"
    * 粗体
      dis "I {bf:love} stata!"
    * 高亮显示
      dis "{hi}I love stata!"
      dis "{hilite}I love stata!"
    * 直线
      dis "{hline}"  
      dis "{hline 20}  {hline 40}" 
      dis "{.-}"          
      dis "{hline} {hi: help myreg3} {right: Version 1.1} {hline}" 
    * 字体颜色
      dis "{input:She} {error:Love} {result:Stata} {text:very much!}"
    * 帮助文件中的注释语句
      dis "{* this text will be ignored}"
    * 命令的显示：加粗
      dis "you can use {cmd:xtreg} command"     
    * 命令的显示：缩写
      dis "you can use {cmdab:xt:reg} command" 
    * 选项：
      dis "{opt option(a)}"
      dis "{opt option(a|b)}"
      dis "{opt option1: option2}"  
      dis "{opt option1: option2(a,b)}"
    * 重复显示
      dis "{dup 5: Stata }"
              
  *-- 位 置 --
      
    * 居中
      dis "{center: I Love Stata!}"
    * 右对齐
      dis "{right: version 1.0}"   
    * 占#个空格左(右)对齐：相当于一个隐形的文本框
      dis "{lalign 12:mpg}{ralign 15: 21.897}"
      dis "|{lalign 12:mpg}|{ralign 15: 21.897}|"
    * 一定长度的空格(较少使用)
      dis "while {...} You can {...}{...} specify another variable"
    * 指定在第几列显示
      dis "{col 20}Mean"
      dis "{hline 60}" _n "{col 3}Variable{col 18}Mean{col 30}Min{col 55}Max" _n "{hline 60}"
      dis "F{col 9}= 30.6"
      dis "p-value{col 9}= 0.000"
    * 指定空格数目
      dis "F = {space 10}12000"      
      dis "F =           12000"
    * -tab-键：相当于8个空格的间距
      dis "x1{tab}x2{tab}x3" 	

  *-- 超链接 --
  
    * 简单帮助链接
      dis "see {help regress} for details"
    * 带有文字标签的帮助链接  
      dis "see help {help xtreg: Panel Data}"  
    * 对话方式的帮助链接
      dis "see help {help_d: help system}"
    * 自动搜索的帮助链接
      dis "{search panel data: click here} for the latest information for panel data"  
    * Stata手册链接
      dis "{manhelp summarize XT}"
    * 对话方式的搜索链接
      dis "for details, using the {search_d: search system}"
    * 网址或E-mail超链接: 链接文字
      dis `"欢迎提出建议，请登陆：{browse "http://blog.cnfol.com/arlion":Arlion 的博客}"'
      dis `"you can {browse "http://www.stata.com":visit the Stata web site}"'
    * 网址或E-mail超链接: 链接网址  
      dis `"see {browse "http://www.stata.com/man/readme.smcl"}"'
      dis `"请登陆：{browse "http://blog.cnfol.com/arlion"}"'
    * 外部 ado 命令超链接  
      dis "you can see the user-written package by {ado dir: clicking here}"
    * 对话方式外部 ado 命令查询  
      dis "you can search user-written ado files by {ado_d: click here}"
    * 返回前页  
      dis "{back: go back to the previous page}"
    * 可执行的stata命令链接(以 stata 开头即可)
      dis "Example: {stata sysuse auto, clear}"
      dis "         {stata summarize price}"
     
  *-- 段 落 --
  
    * 段落标识： {p}
     * 完整设定格式： {p # # #}
     * 第一个 # : 首行缩进量
     * 第二个 # : 第二行和后续各行的缩进量
     * 第三个 # : 所有行的右侧缩进量
     * 示例：
     *  {p}
     *  {p 4}
     *  {p 0 4}
     *  {p 8 8 8}
     
    * 一些固定的段落格式
    
    *          SMCL directive ...   is equivalent to typing ...
    *          --------------------------------------------------
    *          {pstd}               {p 4 4 2}
    *          {psee}               {p 4 13 2}
    *          {phang}              {p 4 8 2}
    *          {pmore}              {p 8 8 2}
    *          {pin}                {p 8 8 2}
    *          {phang2}             {p 8 12 2}
    *          {pmore2}             {p 12 12 2}
    *          {pin2}               {p 12 12 2}
    *          {phang3}             {p 12 16 2}
    *          {pmore3}             {p 16 16 2}
    *          {pin3}               {p 16 16 2}
 
    
    * {p_end} 段落结束标志
    
    * {bind:txet} 强制性地将 text 文字显示在同一行 
      dis "Commonly, {ul:bind} is used {space 60}{bind:to keep words together} on a line"
      dis "Commonly, {ul:bind} is used {space 60}to keep words together on a line"
      
    * {break} 强制性地断行
      dis "{it:Example:}{break} Commonly, we can use ..."  
      
 
  *-- 特殊字符 --
  
    * 基本格式： {c #} 或 {c ...}
    
    * 一些常用的符号：
      * {c S|}  $ (美元符号)
      * {c 'g}  ` (左撇号)
      * {c -(}  { (左花括号)
      * {c )-}  } (右花括号)
        dis "I have 35$"       /*可正常显示*/
        dis "Shown in $US"     /*无法正常显示*/
        dis "Shown in {c S|}US"
        
        dis "list the following numbers: {1, 2, 4, 7}"
        dis "in the set {result}"  /*无法正常显示*/
        dis "in the set {c -(}result{c )-}" 
    
    * 特殊线型：主要用于制作表格
      * {c -}     a wide dash character  
        dis "  {c -}"
      * {c |}     a tall |
        dis "  {c |}"
      * {c +}     a wide dash on top of a tall |
        dis "  {c +}"
      * {c TT}    a top T 
        dis "  {c TT}"
      * {c BT}    a bottom T 
        dis "  {c BT}"
      * {c LT}    a left T 
        dis "  {c LT}"
      * {c RT}    a right T
        dis "  {c RT}"
      * {c TLC}   a top-left corner  
        dis "  {c TLC}"
      * {c TRC}   a top-right corner 
        dis "  {c TRC}"
      * {c BRC}   a bottom-right corner
        dis "  {c BRC}"
      * {c BLC}   a bottom-left corner
        dis "  {c BLC}"
  

      dis "{c -}"
      dis "{c -} {hline 20}"
      dis "{c |}"
      dis "{c +}"     
      dis "{hline 15}{c +}{hline 16}" 
      dis "{hline 30}" _n "{space 15}{c |}" _n "{hline 15}{c +}{hline 14}" 
      dis "{c TT}"
      dis "{c LT}"
      dis "{hline 30}{c RT}"

    *- 一个较为复杂的例子
      #delimit ;
        dis  "{c TLC}{hline 30}{c TRC}" _n  
             "{c |}  {space 28}{c |}"   _n 
             "{c BLC}{hline 30}{c BRC}" ;
      #delimit cr  
    *- 元素解析
      #delimit ;
        dis  "{c TLC} {hline 30} {c TRC}" _n  
             " {c |}  {space 28}{c |}"   _n 
             "{c BLC} {hline 30} {c BRC}" ;
      #delimit cr 
              
    * 特殊字符
      * set charset mac
      set charset latin1     
        dis "{c a'}"  
        dis "{c A'}"
        dis "{c a'g}"
        dis "{c A'g}"
        dis "{c a^}"
        dis "{c A^}"
        dis "{c a~}"
        dis "{c A~}"
        dis "{c a:}"
        dis "{c A:}"    
      
        dis "{c L-}"
        dis "{c ss}"
        dis "{c Y=}"
        dis "{c o/}"
        dis "{c O/}"  
 
           
*== 具有可链接目录的帮助文件 ==

  help ranktest
  viewsource ranktest.hlp
  
  * 第一步：设定段落标签
  * 第二部：引用此前设定的标签
  
  * {title:Contents}
  * {p 2}{help ranktest##s_description:Description}{p_end}

  * {marker s_description}{title:Description}
  
  help smcl
  viewsource smcl.sthlp


*== 具有可运行实例的帮助文件 ==

  help rbc
  viewsource rbc.hlp
  
  dis "{cmd: sysuse auto,clear}{stata sysuse auto, clear: click here to run}"
  dis "{hi:Example:}{break}{space 10}{cmd:.rbc,v(y c w)}{space 16}{stata rbc,v(y c w):click here to run}"
  
  * 说明：如果实例包含多行命令，则可以先将这些命令封装成一个简单的命令，另存。
  help scatter
  viewsource scatter.sthlp

  * 建议：在完成一个新程序的编写后，要尽快编写帮助文件，并尽可能详细，
  *       否则日后很可能连自己的不知道该程序的具体使用方法了。
  
  
                 *== 成为编程高手的密诀：？？

  
  
  
  
                  *  反复练习，多加总结！
                  
                  * (1) 从最简单的程序开始：素描；
                  * (2) Stata程序是很好的参考资料；
                  * (3) 对于复杂程序，要多花时间进行结构的分析和设计；
        
 
          *       =================================
          *           第九讲  模拟分析与自抽样   
          *       =================================
          
cd D:\stata10\ado\personal\Net_course\B9_BS_MC
set scheme s2color

*--------------------------------
*-------------- 目录 ------------
*--------------------------------
*  简介
*    随机数的产生
*    常用分布
*  Bootstrap(自抽样)
*    BS的基本原理
*    BS获得标准误
*    BS获得置信区间
*    BS检验组间差异
*    BS应用实例
*  Jackknife(刀切法)
*    JK 的基本思想
*    JK 应用实例
*    JK 与 BS 的差别
*  Permutation Tests(组合检验)
*    基本思想
*    应用实例
*    与 BS 的关系
*  Monte Carlo Simulation(蒙特卡罗模拟)
*    MC 的基本思想：圆周率的估算
*    MC 应用实例
*    检验统计量的Power和Size 
*  模拟数据的产生
*--------------------------------


*=============
*   简  介
*=============

 *-- 伪随机数的产生: 随机数发生器
 
   *- 问题的来源：无论是BS还是MC，都需要随机抽样，而抽样的基础是随机数
      clear
      set obs 1000 
      gen x1 = uniform()             /* 服从 [0,1) 均匀分布的随机数 */
      histogram x1
      gen z  = invnormal(uniform())  /* 服从标准正态分布的随机数 */
      histogram z, normal
      gen x2 = uniform()
      list x1 x2 in 1/20             /* 每次产生的数字都是随机的 */
      
      set seed 123
      gen x3 = uniform()
      set seed 123
      gen x4 = uniform()
      list x3 x4 in 1/20
      
      * Q1: 这些随机数是怎么产生的？
      * Q2: set seed 123 的含义是什么？
         
         
   *- 随机数发生器
   *                        
   * X_j = (a*X_{j-1} + c) mod m  (j = 1,2, ...)
   *          -------  
   *           种子 
   * 如：
   *     X_j = (9*X_{j-1} + 3) mod 2^9 (j = 1,2, ...)   
   
    *--------------------------------------------code-begin-------------- 
     clear 
     local N     = 100     /* 观察值的个数 */
     local seed  = 13579   /* 种子值 */
     local bound = 2^4     /* 上限 */
     set obs `N'
     gen id = _n
     gen z = `seed'
     forvalues i = 2/`N'{
       qui replace z = mod((9*z[`i'-1]+3), `bound') if id==`i'
       dis _c in y "."
     }
     drop in 1/1           /* 第一个观察值是种子 */
    *---------------------------------------------code-over--------------     
     tab z                 
     histogram z
     
     local bound = 2^9  
     gen zz = z/`bound'    /* [0,1)均匀分布的随机数 */
     sum zz
     histogram zz
     
     * 转换为服从正态分布的随机数
     gen x = invnormal(zz) /* 标准正态分布的随机数 */
     sum x
     ttest x=0
     histogram x, normal
     
  
   *- “伪”的含义 (请更改上述code中的参数，并执行之)
   * N = 100；   bound = 2^4
     tsset id 
     gen z_lag = L.z
     scatter z z_lag
   * N = 10000； bound = 2^9 
     tsset id 
     gen z_lag = L.z
     scatter z z_lag
     
     
   *- Stata中的随机数发生器：多个线性随机数发生器的组合
     * 参见 [D] Data Management Reference, p.213
     * George Marsaglia (1994) 32-bit pseudorandom number generator 
     * KISS (Keep It Simple Stupid)
     *
     * X_j = (69069 X_j-1 + 1234567) mod 2^32        (1)
     * y_j = y_j-1(I+L^13)(I+R^17)(I+L^5)            (2)
     * z_j = 65184(z_j-1 mod 2^16) + int(z_j-1/2^16) (3) 
     * w_j = 63663(w_j-1 mod 2^16) + int(w_j-1/2^16) (4)
     *
     * 随机数发生器：
     *
     *     R_j = (x_j + y_j + z_j + 2^16*w_j)  mod  2^32
     *
     * 初始值的设定：
     *   
     *  x_0 = 123456789  /*这就是所谓的“种子(seed)”,set seed # 改变的就是该值*/
     *  y_0 = 521288629
     *  z_0 = 362436069
     *  w_0 = 2262615
     *
     * 说明：
     *  (1) 每次使用set seed # 命令改变的是 x_0 的数值，而其他三个数值则不改变；
     *  (2) 为了保证随机数的质量，Stata会丢弃前100个随机数；
     *  (3) R_j/2^32 便可得到服从均匀分布[0,1)的随机数。
     
     
   *- 关于种子
     * stata 当前的种子值 seed(x,y,z,w) 存放于 c(seed) 中
       dis c(seed)  /*这一串代码相当于 123456789*/
     * 每次的种子值是不同的
       clear
       set obs 10
       gen y1 = uniform()
       dis c(seed)
       gen y2 = uniform()
       dis c(seed)
       list
     * 种子值的设定范围 [0, 2^{31}-1]，即 [0, 2147483647]
       dis %10.0f 2^(31)-1
     * 若将种子值设定为负值，则stata会自动将其转换为正数
       clear
       set obs 10
       set seed -123
       gen x = uniform()
       set seed 123
       gen y = uniform()
       list x y
     * 为何要设定种子？  see Gentle(2003, p.286)    
       (1) 保证 MC 或 BS 试验的可重复性，便于他人检验和分析；
       (2) 比较研究程序的表现；
       

     
 *- 均匀分布
   
     *- [0,1) 区间内的随机数，公式为：
     *   gen x = uniform()
     *- [a,b）区间内的随机数，公式为： 
     *   gen x = a + (b-a)*uniform()
     *- [a,b) 区间上的随机正整数，公式为：
     *   gen x = a + int((b-a)*uniform())
     * 例如：
       clear
       set obs 1000
       gen x1 = uniform()                 /* U[0,1)  */
       gen x2 = 5 + (12-5)*uniform()      /* U[5,12) */
       gen x3 = 5 + int((12-5)*uniform()) /* int U[5,12) */
       list in 1/10
       histogram x1
       histogram x2
       histogram x3
       
 *- 正态分布: N(mu,sigma2)
   
     *- 标准正态分布的随机数，即，X--N(0,1)，公式为：
     *   gen x = invnormal(uniform())
     *- 一般正态分布的随机数，即，X--N(mu,sigma^2)，公式为：
     *    mu + sigma*invnormal(uniform())
     * 例如：
       clear 
       set obs 10000
       gen x1 = invnormal(uniform())
       gen x2 = 10 + 5*invnormal(uniform())
       sum x1 x2, detail
       histogram x1, normal
       histogram x2, normal
     
     * 进一步的说明：
     *　事实上，多数复杂的分布(相对于均匀分布)
     *  都可以通过对均匀分布进行转换得到。
     * 下面说明如何采用均匀分布得到标准正态分布：Gentle(2003,p.172)
       clear 
       set obs 10000
       gen u1 = uniform()
       gen u2 = uniform()
       gen x1 = sqrt(-2*ln(u1))*cos(2*_pi*u2)
       gen x2 = sqrt(-2*ln(u1))*sin(2*_pi*u2) 
       
       * x1--N(0,1); x2--N(0,1); Corr(x1,x2)=0
       pwcorr x1 x2, star(0.05)
       sum x1 x2, detail
       histogram x1, normal
       histogram x2, normal  
       
 *- 其他分布：t(df)分布, F(k1,k2)分布，Chi2(df)分布，gamma分布, weibull分布等
    *
    * 常用分布的特征参见：Olive(2005)  Applied Robust Statistics, Chapter 3 
    * 常用分布的数值生成方法参见：
    *     Cameron(2005)  Microeoconometric: Methods and Applications, Appendix B
 
     help rnd
                 
     *     Student's t:   rndt obs df
     *      Chi-square:   rndchi obs df
     *               F:   rndf obs df_n df_d
     *      log normal:   rndlgn obs mean var
     *         Poisson:   rndpoi obs mean
     *                    rndpoix [ mu ]
     *        binomial:   rndbin obs prob numb
     *                    rndbinx [ prob ] den
     *           Gamma:   rndgam obs shape scale
     *                    rndgamx [mu], s(#)
     *inverse Gaussian:   rndivg obs mean sigma
     *                    rndivgx [mu], s(#)
     *     exponential:   rndexp obs shape
     *         Weibull:   rndwei obs shape scale
     *   Beta binomial:   rndbb obs denom prob k
     
     * 例如：
         
       *- chi2 分布  Chi2(k)
         *- 计算公式：Sum^{k} (invnormal(uniform()))^2 
         *-           Sum_1^{k} (N(0,1))^2 
         *- 即，k 个标准正态分布的平方和
         clear 
         rndchi 1000 5        /* Chi2(5) 分布 */
         histogram xc, normal
         rndchi 10000 20      /* Chi2(20)分布 */
         twoway (histogram xc) (kdensity xc)
         sum xc, detail
         * 结论：
         * 　相对于正态分布，略微向右拖尾
         * 　随着自由度的增大，越发接近正态分布
     
       *- t 分布  t(k)
         *                  N(0,1)
         *- 计算公式： -----------------
         *              sqrt[chi2(k)/k]
         * E[x]=0; Var[x]=k/(k-2) (for k>2)
         clear
         rndt 10000 5          /* t(5)  分布*/
         sum xt
         histogram xt, normal
         rndt 10000 30         /* t(30) 分布*/
         histogram xt, normal
         rndt 10000 120        /* t(120)分布*/
         histogram xt, normal
         * 结论：
         *   相对于正态分布，k<30 时，t(k) 分布具有“尖峰厚尾”的特征；
         *   当 k>30 时，t(k) 分布于正态分布非常接近；
         *   当 k—>无穷大时，t(k) 分布与正态分布相同。 
         
       *- 指数分布  Exp(lamda)
         *- 计算公式：-lamda*ln(uniform())
         clear
         rndexp 10000 3        /* Exp(3) 分布 */
         sum xe                /* E[xe] = Simga[xe] = lamda */
         twoway (histogram xe) (kdensity xe)
         rndexp 10000 120      /* Exp(120) 分布 */
         twoway (histogram xe) (kdensity xe)
         * 结论：
         * (1) 若 x 服从自由度为 lamda 的指数分布，即 Exp(lamda)，则
         *     E[x] = lamda, Var[x] = lamda^2
         * (2) 指数分布在 0 处截断，向右托尾，是典型的非对称截断型分布，
         *     如，在随机边界(SFA)模型中,常用于描述非效率成分的分布特征。 
         
       *- F(k1, k2) 分布
         *               Chi2(k1)/k1
         *- 计算公式： ---------------
         *               Chi2(k2)/k2
         clear
         rndf 1000 3 200   /* F(3,20) 分布 */
         histogram xf
         rndf 1000 20 20
         histogram xf
         
       *- 逻辑分布: Logistic(a,b)   
         *                         r
         *- 计算公式： a + b*ln -------   其中，r--U[0,1)
         *                       1 - r
         * E[x]=a  Var[x]=(b*_pi)^2/3
         clear 
         set obs 1000
         gen r = uniform()
         gen x = 3 + 5*ln(r/(1-r))
         sum x
         dis sqrt((5*_pi)^2/3)
         histogram x
         
       *- 泊松分布：Poisson(theta)
         *                     exp(-theta)*theta^x
         *- 概率函数： p(x) = ----------------------   for x = 0,1,2,……
         *                              x!
         clear
         rndpoi 100 40  
         histogram xp 
       
       *- 离散性分布的数值生成方法参见：
       *  Cameron(2005)  Microeoconometric: Methods and Applications     
       *     Appendix B, pp.959
             
             
  *-- 截断型半正态分布（truncated standard normal distribution）
     * help gentrun
     * 这在模拟分析随机边界模型(Stochastic Frontier Model)时非常有用
     * 相关性质参见 Olive(2005)  Applied Robust Statistics, Chapter 4
       
       clear                  
       set obs 1000
       gentrun x, left(0)
       sum x
       histogram x
       
       gentrun y, right(-0.5)
       sum y 
       histogram y
       
  *-- 多元正态分布(bivariate normal variables)
     * 变量 x1 和 x2 构成向量 [x1 x2] -- N(Mu, Sigma^2)
     * 或  (X1,X2) -- N( m1, m2, s1^2, s2^2, rho)
     * 即，二者服从联合正态分布

   *- drawnorm 命令
    * 彼此独立的两个正态分布序列 
      clear   
      matrix m = (2,3)
      matrix sd = (.5,2)
      drawnorm x y, n(2000) means(m) sds(sd)
      summarize
      corr y x
      scatter y x
    * 相关系数为 0.8 的两个正态分布序列  
      clear    
      matrix m = (0.3, 0.6)             
      matrix C = (1, 0.8 \ 0.8, 1)
      drawnorm x y, n(1000) means(m) corr(C)
      sum  x y
      corr x y
      scatter y x, msymbol(x)
    * 三元正态分布序列: 设定方差-协方差矩阵
      * X = (x1 x2 x3)' -- N(M,S)  (M 和 S 为矩阵)
      *
      * 则 Var[X] = E[X*X'] = E(x1 x2 x3)'*(x1 x2 x3)   
      *
      *           [ Var(x1)     Cov(x1,x2)  Cov(x1,x3) ]
      * Var[X] = E[ Cov(x2,x1)  Var(x2)     Cov(x2,x3) ]
      *           [ Cov(x3,x1)  Cov(x3,x2)  Var(x3)    ]
      *
        clear
        mat M = 5, -6, 0.5
        mat V = (9,5,2 \ 5,4,1 \ 2,1,1)
        mat list M
        mat list V
        drawnorm x1 x2 x3, n(1000) cov(V) means(M)
        sum 
        correlate x1 x2 x3, cov
        
   *- K 元正态分布的构造方法：
      * 给定均值向量为 M，方差-协方差矩阵为 V，
      * (1) 分解方差-协方差矩阵： V = A'A (cholesky 分解) 
      * (2) 产生K个N(0,1)序列，X -- N(0,1)，X=(x1,x2,...,xk)'
      * (3) Y = M + A'X，则 Y -- N(M, V) 
                         
   *- mkbilogn命令: ，产生 bivariate log-normal variables
     * findit mkbilogn(下载)
      clear
      set obs 1000
      mkbilogn x1 x2, r(0.8) m1(1) s1(2) m2(3) s2(4)
      gen ln_x1 = ln(x1)
      gen ln_x2 = ln(x2)
      sum ln_x1 ln_x2
      corr ln_x1 ln_x2
      histogram ln_x1,normal xline(1, lw(thick))
      scatter ln_x1 ln_x2, msymbol(x)
     
                                                             
*===========================
*  自抽样（Bootstrap，bs）
*===========================

* See Dekking(2005, p.269)  
*     Dividson and Mickinnon (2004, p.159)
*     Efron(1993)

*------------
*   简  介
*------------

*== Boostrap 的基本原理

  *-- 一个简单的例子
  
  * 假设变量 x 有 6 个观察值：
  *  1 2 3 4 5 9 
  * 他们的平均值为 x_m=4, 请问 x_m 的标准误，即se(x_m)是多少？  
  
  * 假设上述 6 个观察值是从母体中随机抽取的，
  * 我们可以采用重复抽样的方法得到一系列的经验样本(empirical sample),
  * 如,抽样 j=100 次，可能得到如下结果：
  *
  *  1 1 2 3 3 9     x1_m = 3.167 
  *  2 3 4 4 5 5     x2_m = 3.833
  *  1 2 2 4 4 9     x3_m = 3.667
  *      ...          ...
  *  3 4 3 5 9 2     xj_m = 4.333
  * 
  *  于是，我们便得到了 100 个经验样本，以及每个样本对应的平均值 xi_m
  *  计算出这 100 个 xi_m 的标准差即可得到 x_m 的标准误。
  *   
  *  以上便是 Bootstrap 的基本思想。
  *  如果我们把上例中的 x_m 替换为其他统计量，
  *   如 OLS 回归中的系数估计值 b，
  *   F 检验统计量，样本的中位数，样本的方差，等等，
  *  采用上述方法都可以得到这些统计量的标准误。
  *  
  *  在得到标准误后，我们可以根据大数定理(LLN)和中央极限定理(CLT)
  *  计算这些统计量的置信区间。
  * 
  *  虽然Bootstrap有很多变种，在具体问题的分析过程中可能会相对复杂，
  *  但其基本思想就是如此简单: 
  *    从“观测样本”中进行多次可重复抽样可以近似复制出“母体”，
  *    因此，我们可以通过分析这些“经验样本”的特征来考察“母体”的分布特征。  
  
    input x 
    1
    2
    3
    4
    5
    9
    end
    save B9_intro_x, replace
    
      use B9_intro_x, clear
      bsample
      list,sep(6)
    
   *- 50次抽样的结果
      use B9_intro_x, clear
      local r = 50      /*抽样次数*/
      mat B = J(`r',7,.)
      mat L = J(6,1,1)
      forvalues j = 1/`r'{
        preserve
         bsample
         mkmat x, mat(s)
         mat B[`j',1] = s'
         mat mean = s'*L/6
         mat B[`j',7] = mean
        restore 
      }
       
      mat list B
      
      svmat B, names(m)
      drop m1-m6
      rename m7 mean
      sum mean
      histogram mean
      
    * 可见，BS得到的mean值与4非常接近，
    * se(x_m) ~= 1
  
    *- 练习：将抽样次数更改为 500，结果有何差异？
    *- 问题：6 个观察值可重复抽样，可以得到多少组不同的样本？
    *  答案：462 组
   
   
   *- stata 中的实现方法：
      use B9_intro_x, clear
      bootstrap x_m = r(mean), reps(50): sum x
      bs x_m=r(mean), reps(500) nodots nowarn saving(bs_temp1,replace): sum x
     
     * 小结：
     * 1. bootstrap 命令可简写为 bs；
     * 2. reps() 选项可设定抽样次数；
     * 3. saving() 选项可将抽样数据保存至指定文件中；
     * 4. nodot 选项可不在屏幕上打点；
     * 5. nowarn 选项可不在屏幕上提示；
     * 6. 命令结构：
     *    bs newvarname = r(), bs选项 : 计算统计量的stata命令
      
      

  *-- 两种不同的抽样方法
    * 数据
      use bs_intro1.dta, clear
      list,sep(10)
      sum
    * 传统随机抽样：不重复
      use bs_intro1.dta, clear
      sample 8, count
      list,sep(10)
    * Bootstrap 抽样：可重复
      use bs_intro1.dta, clear    
      bsample 8
      list,sep(10)
      use bs_intro1.dta, clear  /*抽样具有随机性*/
      bsample 9
      list,sep(10)

  *-- 母体、观测样本与BS经验分布
    * 上例中，母体是未知的；
    * 观测样本：1 2 3 4 5 9
    * 经验分布：
    *
    *  1 1 2 3 3 9     x1_m = 3.167 
    *  2 3 4 4 5 5     x2_m = 3.833
    *  1 2 2 4 4 9     x3_m = 3.667
    *      ...          ...
    *  3 4 3 5 9 2     xj_m = 4.333  
    *
    
  *-- BS 的基本假设 
  
    * 观测样本是从母体中随机抽取的，能够很好地描述母体的分布特征
    * 因此，若反复对观测样本进行可重复抽样，
    * 得到的经验分布(empirical distribution) 将与母体分布非常接近。                   
  
  *-- BS 的精度
    
    * 决定于：
    *  (1) 原始观测样本中包含的样本数；
    *  (2) BS 抽样的次数。
    
  *-- BS 抽样的次数
      
    * 视研究的目的而定：
    *  (1) 若采用BS获得标准误，50-200 次即可；Efron(1993, p.52)
    *  (2) 若采用BS获得置信区间，500-1000次即可；
    *  (3) 若采用BS获得多个描述样本分布的统计量，1000 次以上；
    *  多数情况下，1000 次可重复抽样即可获得非常稳定的结果。  

                    
  *-- 对面板数据进行自抽样：不改变组内时序特征
      use bs_panel.dta, clear
      tsset id year
      list

      use bs_panel.dta, clear
      bsample 5, cluster(id)
      sort id year
      list
      tab id 

      use bs_panel.dta, clear  /*抽样具有随机性*/
      bsample 5, cluster(id)
      sort id year
      list
      tab id

      * 产生新的个体标识变量
        use bs_panel.dta, clear
        bsample 5, cluster(id) idcluster(id_bs)
        list
        tsset id    year  /*可能产生错误*/
        tsset id_bs year    
  
  
*-- BS 组合样本的个数：为什么采用BS可以近似模拟母体分布？

*   (   m  )       m!
*   (      ) = ----------  (其中，m=2n-1)   
*   (   n  )    n!(m-n)!

*------------------------------------
cap program drop bs_N
program define bs_N
args n 
   local m = 2*`n' - 1
   local N = comb(`m', `n')  /*help math functions*/
   dis in g "n = " in y `n' in g "  N = " in y %-20.0f `N' 
end 
*------------------------------------

   bs_N 20   /*运行程序*/

* 以 n=2 为例：X = (x1,x2)
* 则 BS 样本将有 3 个：
* (x1,x1); (x2,x2); (x1,x2)

* 以 n=3 为例，X = (x1,x2,x3)
* 则 BS 样本将有 10 个：  
* (x1,x1,x1); (x2,x2,x2); (x3,x3,x3)
* (x1,x2,x2); (x1,x3,x3);
* (x1,x1,x2); (x1,x1,x3);
* (x1,x2,x3);
* (x2,x3,x3); (x2,x2,x3)

*  表9.1  样本数与BS样本组合个数
*  -----------------------------
*    n             N
*  -----------------------------
*    2             3
*    3             10
*    4             35
*    5             126
*    10            92378  
*    20            68923264410               
*  -----------------------------


   
*-------------
*  BS 标准误
*------------- 
* The bootstrap standard error SEboot of a statistic is the standard deviation
* of its bootstrap distribution. It measures how much the statistic varies under
* random sampling.

*-- 简介
  
  *- 基本思想：
  * OLS 估计量 b = inv(X'X)*(X'y) 是一个随机变量；
  * 因此，我们可以通过自抽样得到实证样本 (B1,B2,...,B1000)；
  * 分别对这些实证样本进行 OLS 估计，可以得到一系列 OLS 估计值 (b1,b2,...,b1000)；
  * 使用这 1000 个估计值便可近似得到 b 的分布特征。
  * 其他统计量的抽样和标准误计算方法与此相似。
   
  *- 参数 BS 与 非参数 BS
  * 若在抽样过程中考虑干扰项(或y)的分布特征，如正态分布会有两个参数；
  *     则称为“参数 BS”；
  * 否则，称为“非参数 BS”
  *
  * 例：
  *     模型: y_i = xi*b + e_i  (i = 1,2,...,N)  (1)
  *             
  *  若假设 e_i -- N(0,s^2), 即，服从正态分布；
  *     则，我们可以从 N(0,s^2) 分布中抽取随机数，作为模型(1)的干扰项；
  *     此时，便是参数BS法，
  *     因为要生成服从 N(0,s^2) 的随机数，必须事先确定参数 s^2；
  *  若不对 e_i 的分布情况做任何假设，则我们可以直接对原始样本进行自抽样；
  *     此时，便是非参数BS法。
  
  
*-------------------------------------------------
*   非参数 Bootstrap (Non-pramatric Bootstrap) 
*-------------------------------------------------
* see Efron(1993, p.47)
* 基本思想：不对干扰项的分布做任何假设，由样本的特性出发

*-- 两种抽样方法：Efron(1993, p.113)
  
  * 模型: y_i = xi*b + e_i  (i = 1,2,...,N)
  *       Y = Xb + E
  
  *--------
  *- 方法1: Bootstrapping Pairs
  *--------
     * step1: BS (Y_bs1, X_bs1)
     * step2: reg Y_bs1 on X_bs1, 保存估计系数 b1
     * step3: 将 step1 和 step2 重复进行 K 次，比如，K=300，
     *        将得到 b1,b2,...,b300;
     * step3: 计算 s.d.(b1,b2,...,b300) 便可得到系数 b 的标准误(s.e.)
     
   *------------------------------------------------  
     local reps = 300    /*抽样次数*/
     mat B = J(`reps',1,.)
     forvalues i = 1(1)`reps'{
        qui sysuse auto, clear
        bsample          /*自抽样*/
        qui regress price weight
        mat B[`i',1] = _b[weight] 
     }   
     svmat B, names(b)
     sum b1
     local se_bs = r(sd)  /*自抽样标准误*/
      
     * 与 OLS 标准误对比
       sysuse auto,clear
       reg price weight
        
     * 求取 t 值或 z 值
       local b_ols = _b[weight]  /*OLS 估计系数*/ 
       local t_bs  = `b_ols' / `se_bs'
       dis "t_bs = " `t_bs'
       
     * 计算 p 值
       * 大样本，正态分布
         local p_z = 1 - normprob(`t_bs')
         dis "p-value = " %6.4f `p_z'
       * 小样本，t 分布    
         local p_t = 1 - tprob(74-2, `t_bs')
         dis "p-value = " %6.4f `p_z'
   *------------------------------------------------  
       
     * 练习：分别将 reps 设定为 50 和 1000, 看看结果有何差异？
     
     
  *--------       
  *- 方法2: Bootstrapping Residuals 
  *--------
  * 说明：这是 stata 中采用的方式，如
  *       reg price weight, vce(bootstrap, reps(300))
  
     * step1: reg Y on X, 得到估计系数b_ols，和残差序列 (e1,e2,...,eN)  /*采用真实数据*/
     * step2: BS (E_bs1),构造BS样本，Y_bs1 = X*b_ols + E_bs1；     /*X的观察值保持不变*/
     * step3: reg Y_bs1 on X, 保存估计系数 b1；
     * step4: 将step1-3重复进行 K 次(如，K=300),得到(b1,b2,...,b300) 
     * step5: 计算 s.d.(b1,b2,...,b300) 便可得到系数 b 的标准误(s.e.)
    
    *-------------------------------------------------
     * 将残差序列保存到一个单独的文件中，便于随后抽样
     sysuse auto, clear
     reg price wei
     predict res, residual
     keep res 
     save res_data, replace
      
     local reps = 300    /*抽样次数*/
     mat B = J(`reps',1,.)
     quietly{
      forvalues i = 1(1)`reps'{
        * 对残差进行自抽样
          use res_data, clear
          bsample          
          gen id = _n    /*便于与主数据合并*/
          sort id
          tempfile e_data
          save "`e_data'", replace
        * 构造BS样本
          sysuse auto, clear
          regress price weight
          predict y_hat 
          keep y_hat weight
          gen id = _n
          sort id
          merge id using "`e_data'"
          gen y_bs = y_hat + res
        * 对BS样本进行OLS估计，获得BS系数
          reg y_bs weight
          mat b = e(b)
          mat B[`i',1] = b[1,1] 
      } 
     }  
     svmat B, names(b)
     sum b1
     local se_bs = r(sd)  /*自抽样标准误*/     
    *------------------------------------------------- 
    * 至于 t_bs 和 p 值的计算与上例相同，这里不再赘述。
    
    * 说明：(1) 本例中，两种抽样方法得到的结果基本相同；
    *       (2) 若进行多次模拟，会发现第二种方法比较稳定；
    *       (3) quietly 命令的作用是让stata不在屏幕上显示计算的中间结果；
    *       (4) tempfile 命令的具体使用方法，参见“A5-编程初步” 
    
    
    * BS Residuals 在 Stata 中的实现方法：
      sysuse auto, clear
      bootstrap, reps(300) nodots noheader: reg price weight
      * 或
      reg price weight, vce(bootstrap, reps(300))
       
     
  *- 两种方法比较：
    * (1) 相对于 BS Residuals, BS Pairs 对模型的假设较不敏感；
    * (2) BS Residuals 依赖两个假设：
    *     a. 模型 y = xb + e 是线性的；
    *     b. 干扰项的条件期望为零，即 E(e|X)=0, 即模型的设定是正确的。
    * (3) 本质上讲，BS P 意味着 X_i 在抽样过程中是可变的，
    *               BS R 则意味着 X_i 在抽样过程中是固定不变的； 
    * (4) 当抽样次数足够大，如 B>1000, 两种方法得到的标准误会非常接近。   
    * (5) 文献中使用较多的是第二种方法：bootstrap residuals
    
    
*-----------------------------------------
*   参数 Bootstrap (Pramatric Bootstrap) 
*-----------------------------------------  
* Efron(1993, p.53)

   sysuse auto, clear
   reg price wei len mpg foreign
   predict e, residual  /*OLS 残差*/
   sum e, detail
   histogram e, normal   
   sktest e
   swilk e
   * 本例中，残差似乎并不服从正态分布，但非常接近
   
   * 我们可以仍然假设 e 服从正态分布，并采用BS获得参数的标准误
   
   * 基本步骤：
   * step1: reg y on x，由残差序列估计出其方差，即 s^2；
   * step2: 生成服从 N(0,s^2) 的随机数 e_n；
   * step3: 对 e_n 进行自抽样，得到残差序列 e_bs1；
   * step4: 构造BS样本，即，Y_bs1 = X*b + e_bs1；
   * step5: 采用OLS估计BS样本，得到 b_bs1；
   * step6: 将step3-step5重复进行K次(如k=300),
   *        得到 (b_bs1, b_bs2, ..., b_bs300)
   * step7: 计算 (b_bs1, b_bs2, ..., b_bs300) 的"标准差"(s.d.)，
   *        即为 b 的BS"标准误"(s.e.)

 
 *-------------------------------------------------   
   sysuse auto, clear
   qui reg price wei len mpg foreign
   eret list
   local s2 = e(rss)/(74-5)         /* s2=残差平方和/(N-k) */
   local s  = sqrt(`s2')
   gen e_n = `s'*invnorm(uniform()) /* 生成服从正态分布的残差序列 */
 
   * 下面的步骤与上例相似，这是把这里的 e_n 视为上例中的 res 即可。
 
     * 将残差序列保存到一个单独的文件中，便于随后抽样
     keep e_n 
     save res_data, replace
      
     local reps = 1000    /*抽样次数*/
     mat B = J(`reps',1,.)
     quietly{
      forvalues i = 1(1)`reps'{
        * 对残差进行自抽样
          use res_data, clear
          bsample          
          gen id = _n    /*便于与主数据合并*/
          sort id
          tempfile e_data
          save "`e_data'", replace
        * 构造BS样本
          sysuse auto, clear
          regress price wei len mpg foreign
          predict y_hat 
          keep y_hat wei len mpg foreign
          gen id = _n
          sort id
          merge id using "`e_data'"
          gen y_bs = y_hat + e_n
        * 对BS样本进行OLS估计，获得BS系数
          reg y_bs wei len mpg foreign
          mat b = e(b)
          mat B[`i',1] = b[1,1] 
      } 
     }  
     svmat B, names(b)
     sum b1
     local se_bs = r(sd)  /*自抽样标准误*/     
 *-------------------------------------------------  
   
     * 与 OLS 标准误对比：
       sysuse auto, clear
       reg price wei len mpg foreign, noheader
       
     * 小结：(1) 采用这种方法得到的结果与根据OLS公式得到的非常接近；
     *            Var(b) = s^2*(X'X)^{-1} 
     *       (2) 依赖一个重要的假设：干扰项服从某种分布，本例中为正态分布；
     
     * 练习：尝试将上述正态分布改为 t 分布或指数分布，看看结果有何差异？
       
       
           
*------------------------------------     
*  Stata 常用命令中 BS 标准误的设定
*------------------------------------
  
  *-- OLS 
  
    sysuse auto, clear
    * 默认设定(reps=50次)
      regress price wei rep78 mpg foreign, vce(bootstrap)
      est store m_bs
    * 指定 BS 次数
      regress price wei rep78 mpg foreign, vce(bootstrap, reps(500))
    * 不在屏幕上打点
      regress price wei rep78 mpg foreign, vce(bootstrap,nodots) 
    * 设定种子值，保证结果的可重复性
      regress price wei rep78 mpg foreign, vce(bootstrap,seed(1357))  
      regress price wei rep78 mpg foreign, vce(bootstrap,seed(1357))  
    * 考虑组内相关性
      * 假设维修次数相同的汽车具有组内相关性
        sysuse auto, clear
        drop if rep78 == .
        bootstrap, cluster(rep78): reg price wei rep78 mpg foreign
        est store m_bs_cluster
        esttab m_bs m_bs_cluster, mtitle(m_bs m_bs_cluster)
      * 亦可采用如下命令：
        bootstrap: reg price wei rep78 mpg foreign, cluster(rep78)
      
      
  *-- 工具变量法(IV regress, help ivreg)
  
      *
      *- 变量说明：
      *      rent: 房屋租金
      *   hsngval: 自住房屋价格
      *  pcturban: 城市人口比率
      *    faminc: 家庭收入
      *    reg1-4: 居住地虚拟变量
      *- 问题：
      * hsngval 可能内生：因为外界干扰在影响租金的同时也会影响房价。
      * 所以采用 城市人口比率、地区虚拟变量作为其工具变量
      
      use hsng2.dta, clear
      ivreg rent pcturban (hsngval = faminc reg1-reg4)
        est store iv
      ivreg rent pcturban (hsngval = faminc reg1-reg4), vce(bs,reps(500))
        est store iv_bs
      * 结果比较：
        esttab iv iv_bs, mtitle(iv iv_bs) 
      * 说明：在Stata10中，可以采用ivregress gmm 命令进行GMM估计，
      *       在这种情况下，也可以采用vce()选项得到BS标准误。     
            
            
  *-- 分位数回归(help qreg)

      sysuse auto, clear
      reg price weight length foreign
        est store ols
      reg price weight length foreign, vce(bs,reps(200))
        est store ols_bs
      qreg price weight length foreign
        est store p50 
      bsqreg price weight length foreign, reps(200)
        est store p50_bs
      qreg price weight length foreign, quantile(.75)
        est store p75 
      bsqreg price weight length foreign, quantile(.75) reps(200)
        est store p75_bs
        
      local model ols ols_bs p50 p50_bs p75 p75_bs
      esttab `model',mtitle(`model') compress

    *-评论：
      * (1) 对于不同价位的汽车，重量和长度的对价格的影响是不同的；
      * (2) 采用OLS无法反映出上述特征；
      * (3) 采用BS可能获得更为稳健的标准误； 
       

  *-- 面板数据模型
    * 
      use invest2.dta, clear
      xtreg market invest stock, fe
        est store fe
      xtreg market invest stock, fe vce(bs, nodots reps(200) seed(135)) 
        est store fe_bs
    * 结果比较  
      local m fe fe_bs
      esttab `m', mtitle(`m')
      
    * 上述命令等价于：
      use invest2.dta, clear
      tsset, clear
      bootstrap, reps(200) seed(135) cluster(id) idcluster(new_id):  ///
                 xtreg market invest stock, fe i(new_id) 
      est store fe_bs0  
      *
      * 结果比较
      local m  fe_bs fe_bs0
      esttab `m', mtitle(`m')  
      *
      * 注意事项：
      *  (1) 面板数据的特征，使得我们必须设定 cluster(id) 选项，
      *      这可以保证每个截面内部的时序特征；
      *  (2) idcluster(new_id) 选项必须设定，
      *      在BS过程中，stata在每次循环中都要执行 tsset new_id t 命令；
      *      因此，在对面板数据进行抽样时，必须同时设定如下三个选项：
      *      cluster(id), idcluster(new_id) 和 i(new_id)
      *  (3) 此前的 tsset,clear 命令必须执行，以保证stata能正确定义面板数据标识。 
      
      
    * BS检验其它统计量：
      * 检验变量间的系数差异是否显著？
      
        use xtcs.dta, clear  /*中国上市公司资本结构数据*/
        sort size
        gen groupSize = group(3)
        tab groupSize, gen(dsize)
        drop dsize2
        gen  xsize1 = dsize1*size  /*小规模公司交乘项*/
        gen  xsize3 = dsize3*size  /*大规模公司交乘项*/
        xtreg tl dsize1 dsize3 xsize1 xsize3 ndts tang npr tobin, fe 
        
     *- 问题：大规模和小规模对资本结构的影响是否存在显著差异？
     
        * 方法1：传统的 t 检验
          test xsize1 = xsize3
        * 方法2：Bootstrap 
          tsset, clear
          bootstrap diff=(_b[xsize1]-_b[xsize3]),         ///
            reps(200) seed(123) cluster(code) idcluster(new_code):  ///
            xtreg tl dsize1 dsize3 xsize1 xsize3 ndts tang npr tobin, fe i(new_code)  
            
        * 等价于
          xtreg tl dsize1 dsize3 xsize1 xsize3 ndts tang npr tobin,fe i(code) ///
                vce(bootstrap (_b[xsize1]-_b[xsize3]),reps(200) seed(123))                
             
        * 说明：
        *  (1) 按照同样的思路，我们也可以研究不同成长性(Tobin)
        *      对资本结构的影响是否存在显著差异；
        *  (2) 对比传统 t 检验的结果和BS的结果可以发现，
        *      虽然二者的在本例中的结论一致，
        *      但 t 检验的结果更加显著(可能存在过度拒绝)，
        *      在有些情况下，二者的结论可能不一致，而BS的结果往往更为可信；
        *      应用，参见 Cleary(1999,Journal of Finance)    
     
     *- 练习：(1) 设定 reps(1000)，看看结果有何差异？（BS结论非常稳健）
     *        (2) 比较不同Tobin值对资本结构的影响是否有显著差异？ 
                        
     *- 说明：Stata 中的多数与回归相关的命令都支持 vce() 选项，
     *        通过设定 vce(bootstrap)，我们便可非常方便地得到Bootstrap标准误；
     *        设定方法与上述实例完全相同。
     *        因此，在使用这些命令的过程中，可先查看其帮助文件，
     *        以便确定是否支持 vce(bs) 选项。
     *  常用命令包括：probit, logit, cloglit, glm, ivreg, xtreg, reg 等。
     
     
                                                                            
*---------------
*  BS 置信区间
*--------------- 
* see Dekking(2005, p.350); Efron(1993, Chp12-14)

*-- 简介：置信区间
*-----------------
  *
  *  x -- N(mu, se^2), 则
  *
  *      x - mu
  *     ---------  -- N(0，1)
  *        se
  * 其 95% 置信区间为：
  *                   x - mu
  * Prob{z(0.025) <= -------- <= z(1-0.025)} = 1-0.05 = 0.95
  *                     se
  * 或者：
  *                 x - mu
  * Prob{ -1.96 <= -------- <= 1.96 } = 1-0.05 = 0.95
  *                   se
  * 图示：
           do B9_ci95.do
           
  * 可进一步表示为：
  * 
  * Prob{mu _in_ [x-z(0.975)*se, x-z(0.05)*se]} = 0.95
  * 
  * 因此，mu 的 95% 置信区间为：
  *
  *    [ x-z(0.975)*se , x-z(0.025)*se ]
  *
  * 由于正态分布是对称的，所以 z(0.975) = -z(1-0.975) = -z(0.025)
  * 上述置信区间可表示为：
  *
  *      x +(-) z(0.975)*se
  *
  * 即：
  *     [ x-1.96*se , x+1.96*se ]
  * 含义：在 95% 的情况下，上述区间都会包含 x 的真实值 mu 。
  *
  * 一般化的公式：
  *     CI_a = [ x-z(1-a)*se , x-z(a)*se ]              (1)
  * 其中，x 表示统计量；
  *       a 表示置信水平，如a=0.025,a=0.05；
  *       z(a) 表示标准正态分布在第 100*a 百分位上的数值，如 z(0.025)=-1.96
  *            若采用 t 分布，则表示为 t_k(a)，k 表示 t 分布的自由度；
  *       se 表示标准误；
  
  *- 计算过程解析：ci 命令
     sysuse auto, clear
     ci price, level(90)  /*ci: Confidence Interval*/

     * ci 的计算方法解析：
       local k = r(N) -1
       local t_a = invttail(`k', 0.05)  /* t(k) 分布的第5百分位数值 */  
       dis `t_a'                        /* t(73) 分布的 5% 临界值 */
       dis `r(se)'
        * price 标准误计算方法
          sum price
          local se_price = sqrt(r(Var)/r(N))
          dis "se(price) = " `se_price'
       * 计算置信区间
       local lb = r(mean) - `t_a'*`se_price'
       local ub = r(mean) + `t_a'*`se_price'
       dis "Lower bound = "  `lb'
       dis "Upper bound = "  `ub' 
       * 与 ci 结果对比
       ci price, level(90)


*-- 基于Bootstrap标准误确定置信区间
*----------------------------------
  * see [U]bootstrap  p.217-218
  *
  *- 基本思路：
  *      采用 Bootstrap 获得统计量 x 的标准误 se_bs;
  *      采用 se_bs 代替 (1) 式中的 se，即可得到置信区间，即
  *      CI_a_bs = [ x-z(1-a)*se_bs , x-z(a)*se_bs ]    (2)
  *
  *- 评述：
  *      事实上，这一方法仍然假设统计量服从正态分布，
  *      因此，问题转化为采用BS获得标准误；
  *
  *- 例： 注意表中的最后一项, Normal-based [90% Conf. Interval]
     sysuse auto, clear
     bootstrap mean_bs=r(mean), saving(bs_ci01,replace) level(90): sum price
     
  *- 计算过程解析：
     qui sum price
     local mean = r(mean)    /*均值采用price的均值*/
     qui use bs_ci01,clear
     sum mean_bs             
     local se_bs = r(sd)     /*标准误由BS平均值的标准差计算得到*/
     local z_95 = invnorm(0.95)   /*正态分布第95百分位数值*/
     local z_5  = invnorm(0.05)   /*正态分布第 5百分位数值*/
     local lb = `mean' - `z_95'*`se_bs'  /*下限*/
     local ub = `mean' - `z_5' *`se_bs'  /*上限*/
     dis "90% CI = [`lb' , `ub']"
     

*-- 基于BS百分位数确定置信区间
*---------------------------
   * see [U]bootstrap  p.217-218
   
   *- 基本思想：
      clear 
      set obs 100
      set seed 1357
      gen z = invnorm(uniform())
      histogram z, normal
      
    * z 的 90% 置信区间是多少？
    * Answer：CI90 = [p5, p95]   (p5 表示第5百分位上的数值)
    * 本例中  CI90 = [-1.906403 , 1.530948]
    *
      sum z, detail
    *  
    * p5  就是 x 由小到大排序后的第 5 个观察值(或第5 个与第 6个观察值的平均值)；
    * p95 就是 x 由小到大排序后的第95 个观察值(或第95个与第96个观察值的平均值)；
      sort z
      dis (z[5]+z[6])/2    /* p5  */
      dis (z[95]+z[96])/2  /* p95 */
    *
    * 图示：
      qui sum z, detail
      local p5 = r(p5)
      local p95= r(p95)
      histogram z, xline(`p5' `p95')                     ///
         text(0.44 `=`p5'+0.6'  "---------------------") ///
         text(0.44 0.2 "90% CI")                         ///
         text(0.44 `=`p95'-0.6' "---------------------")


   *-- BS 百分位获得置信区间

     sysuse auto, clear
     bs mean = r(mean), reps(1000) nodots saving(bs_mp,replace) level(90): sum price
     estat bootstrap, all  /*列出所有三种置信区间*/
     * 注意：(P) 对应的置信区间是根据百分位数得到的。
     
   * -------------------------------------------------------  
   * 计算方法解析：
     use bs_mp.dta, clear   /*bs_mp.dta中存储了1000个BS mean的观察值*/
     qui sum mean , detail
     local lb_bs = r(p5)
     local ub_bs = r(p95)
     dis in g "90% percentile CI = [" in y %8.3f `lb_bs' " , " ///
         in y %8.3f `ub_bs' in g "]"  
     sum mean , detail
 
     * 与传统基于 t 分布假设得到的置信区间的比较：
       sysuse auto, clear 
       sum price
       ci price, level(90)  /*传统方法*/
       local lb = r(lb)
       local ub = r(ub) 
         
       use bs_mp.dta, clear  
       twoway histogram mean, xline(`lb' `ub',lcolor(red))        ///
                            xline(`lb_bs' `ub_bs',lcolor(blue)) ///
           caption("red: ci bound" "blue: Bootstrap bound")
   * -------------------------------------------------------        
     * 说明：红线表示采用传统的 t 分布得到的 10% 置信区间；
     *       蓝线表示采用 Bootstrap 百分位数得到的 10% 置信区间；
     * 可见，二者非常接近
     

  * 例2：求取 exp(mean) 的置信区间
     clear
     set obs 10
     gen x = invnormal(uniform())
     set seed 123456
     bs theta = exp(r(mean)), reps(1000) saving(bs_n01,replace) level(90): sum x
     estat bootstrap, all
     
     use bs_n01, clear
     sum theta, detail
     histogram theta

     * 由于theta的分布具有向右拖尾的特征，
     * 采用传统的ci方法得到的CI可能过窄：
     ci theta, level(90) 


*-- 小结：
*   (1) 文献中使用较多的是第二种方法，
*       即基于BS得到的百分位数值确定置信区间，
*       因为该方法不需要对统计量的分布特征作任何假设,
*       而第一种方法和传统的ci命令都需要正态分布假设，
*       当统计量的分布与正态分布偏离较大时，这些方法得到的置信区间不合理；
*   (2) 置信区间的求取往往是协助统计推断；
*   (3) 若采用BS获得置信区间，抽样次数通常介于500-1000次，
*       当样本数较大时，需要适当增加抽样次数，如K=3000次。



*------------
*  应用实例
*------------

*-- 非线性模型的置信区间
*-----------------------

* model： y = B0*(1 - e^(-B1*x))

  adopath + D:\stata9\ado\personal\Net_course\B9_BS_MC
  viewsource nlexpgr.ado
  use B9_production.dta, clear
  gen x = capital
  
  * 传统的 NLS 估计
    nl expgr lnout  
  
  * 采用 BS 获得标准误（仅需估计模型系数标准误时推荐采用该方法）
    nl expgr lnout, vce(bs,reps(200) seed(135))
  * 另一种设定方式（若需构造其他统计量，建议采用该方法）
    set seed 135
    bootstrap b_x = _b[B1],reps(200): nl expgr lnout
  * B1系数对数值的置信区间   
    bootstrap log_b_x = ln(_b[B1]),reps(200): nl expgr lnout


*-- 组间系数差异显著性检验
*-------------------------

  *- 问题的来源:
  *
  *  模型：  y_i = x_i*b1 + e_i  (group1: i=1,2,...,N1)
  *          y_i = x_i*b2 + e_i  (group2: i=1,2,...,N2) 
  *  
  *  Ho: b1 = b2  如何检验？
  * 
  * 传统方法：Chow检验，F 检验，
  *           都需要对样本进行混合，生成虚拟变量；
  *           需要较强的假设条件。
  
  * Bootstrap 法：
  *    在 Ho 成立的情况下，
  *    将 N1 和 N2 个样本混合后得到的估计系数 b 与 b1(=b2) 
  *    应该不存在显著差异。
  *    
  * 步骤：参见 Efron(1993,Chp16,p.221)
  *
  * 1. 混合两个子样本组的观察值，得到一个样本数为 N1+N2 的“混合样本”；
  * 2. 从“混合样本”中可重复地抽取(N1+N2)个观察值，
  *    将前   N1 个观察值定义为 group1, 
  *    剩下的 N2 个观察值定义为 group2； 
  * 3. 分别针对两个样本组进行估计，得到 
  *    Diff(bs_j) = b1 - b2, (j=1,2,...,1000)
  * 4. 计算“实证P值”：
  *      P_bs = #{Diff(bs_j) >= Diff(0)} / 1000
  *      即，BS得到的系数差异大于真实系数差异的次数占抽样次数的比例。
  *    其中，Diff(0)=b1-b2，即两组系数的真实差异。
  
  *- 例： 
  *  模型： price = a0 + a1*weight + a2*length + a3*mpg + e
  *  问题：在国产车和进口车两个子样本中，汽车重量(weight)对价格影响相同吗？
  
     * 观察到的实际差异：
       sysuse auto, clear
       reg price weight length mpg if foreign==1  /*进口车*/
         local b1 = _b[weight]   
       reg price weight length mpg if foreign==0  /*国产车*/
         local b2 = _b[weight]
       scalar diff0 = `b1' - `b2'
       dis "diff0_weight = " scalar(diff0)
     
     * Bootstrap 检验 Ho: b1 = b2 
     *--------------------------------------------------
       local reps = 1000
       mat D = J(`reps', 3, .)   /*存储结果的矩阵*/
       forvalues j = 1/`reps'{
          qui sysuse auto, clear
          bsample
          qui reg price wei len mpg in 1/22  /*前22个观察值，视为进口车*/
          local b1 = _b[weight]
          qui reg price wei len mpg in 23/74 /*后52个观察值，视为国产车*/
          local b2 = _b[weight]
          local diff = `b1' -`b2'
          mat D[`j',1] = (`b1', `b2', `diff')
       }    
     *--------------------------------------------------  
       svmat D, names(d)
       rename d1 b1
       rename d2 b2
       rename d3 diff
       
       * 计算“实证P值”
         count if diff > diff0 | diff == diff0
         local p = `r(N)'/`reps'
         dis "实证P值 = " `p'   
         
       * 图示
           local diff0 = scalar(diff0)
         histogram diff, xline(`diff0',lw(thick)) 
           local diff0 = scalar(diff0) 
         kdensity diff, lw(thick) xline(`diff0',lw(thick))          
       
       * Boostrap 参数估计值 b1 和 b2 的特征
         sum b1 b2
         * 实际估计值
         sysuse auto, clear
         reg price weight length mpg if foreign==1,noheader  /*进口车*/
         reg price weight length mpg if foreign==0,noheader  /*国产车*/        
       
  
  *------------------------------------------------
  *- 扩展 I：如何计算模型中所有系数的“实证P值”？
  *------------------------------------------------
  * 解决思路：将系数差异存放于矩阵中，而非暂元中（如上例）  
     sysuse auto, clear
     reg price wei len mpg
     eret list
     mat list e(b) 
     
     * 记录真实系数差异
       sysuse auto, clear
       qui reg price weight length mpg if foreign==1  /*进口车*/
         mat b1 = e(b)   
       qui reg price weight length mpg if foreign==0  /*国产车*/
         mat b2 = e(b)
       mat D0 = b1 - b2
       mat list D0, title(系数估计值的真实差异)
  
     * 采用Bootstrap得到实证差异和实证P值
     *--------------------------------------------------------------------
       local reps = 1000
       mat D = J(`reps', 4, .)   /*存储结果的矩阵*/
       forvalues j = 1/`reps'{
          qui sysuse auto, clear
          bsample
          qui reg price wei len mpg in 1/22  /*前22个观察值，视为进口车*/
          matrix b1 = e(b)
          qui reg price wei len mpg in 23/74 /*后52个观察值，视为国产车*/
          matrix b2 = e(b)
          matrix diff = b1 - b2
          mat D[`j',1] = diff
       }  
     *--------------------------------------------------------------------
       
       svmat D, names(diff)  /*diff1-diff4 对应 weight,length,mpg和常数项*/
       
       mat P = J(4,2,.)  /*记录系数真实差异和实证P值的矩阵*/
       forvalues j = 1/4{
          local diff0_`j' = D0[1,`j']
          qui count if (diff`j'>`diff0_`j'' | diff`j'==`diff0_`j'')
          local p = `r(N)'/1000
          mat P[`j',1] = (`diff0_`j'' , `p')
       }
       
       mat colnames P = 系数真实差异  实证P值
       mat rownames P = weight length mpg cons
       mat list P
       
     * 结论：各变量的组间系数估计值并不存在显著差异。
     
     * 图示：mpg变量的BS系数差异的分布
       histogram diff3, xline(-161.1735, lw(thick))
     
     
  *------------------------------------------------
  *- 扩展 II：如何得到面板数据模型的“实证P值”？
  *------------------------------------------------  
  * 面临的主要问题：如何保证面板中每个截面内部的时序特征？
  * 解决思路：按个体进行抽样(每个面板中的截面都是一个个体)
  * see [XT] p.215 Technical Note
  
  *- 例：成长机会(Tobin)对资本结构的影响
  *      在大规模公司和小规模公司中是否相同？
  *      Ho: b1 = b2  (b_large = b_small)
  
        use xtcs.dta, clear  /*中国上市公司资本结构数据*/
        tsset code year
        egen size_mean = mean(size), by(code) /*保证每家公司都分在同一组*/
        list code year size size_mean in 1/30 
        
        sort size_mean
        gen group = group(3)
        tab group
        drop if group == 2   /*去掉中间组，保证最大和最小两个组的差异足够显著*/
        xtreg tl size ndts tang npr tobin if group==1,fe /*小规模公司*/
          est store small
        xtreg tl size ndts tang npr tobin if group==3,fe /*大规模公司*/       
          est store large
        esttab small large, mtitle(small large)
        * 可见，在不同规模的公司中，Tobin对TL的影响是不同的。
        * 下面采用BS进行检验。 
        
     * 记录真实系数差异
        xtreg tl size ndts tang npr tobin if group==1,fe /*小规模公司*/
          mat b1 = e(b)
        xtreg tl size ndts tang npr tobin if group==3,fe /*大规模公司*/       
          mat b3 = e(b)
        mat D0 = b1 - b3
        mat list D0, title(系数估计值的真实差异)   
     
     
     * 采用Bootstrap得到实证差异和实证P值
       
       * 解析抽样过程：
         use xtcs.dta, clear
         set seed 12345
         bsample, cluster(code) idcluster(code_bs)
         tsset code_bs year
         list code_bs code year in 1/35 if year>2001
         * 可见：公司000002, 000012 都被抽中了2次
         * 新的截面变量 code_bs 可以唯一标示公司
     
     *--------------------------------------------------------------------
       local reps = 100
       local varlist "tl size ndts tang npr tobin"
       mat D = J(`reps', 6, .)   /*存储结果的矩阵*/
       forvalues j = 1/`reps'{
          use xtcs.dta, clear
          bsample, cluster(code) idcluster(code_bs)
          gen gg = group(3)      /*将样本等分为三组*/
          qui tsset code_bs year

          qui xtreg `varlist' if gg==1,fe  /*第一组，视为小规模公司*/
          matrix b1 = e(b)
          qui xtreg `varlist' if gg==3,fe  /*第三组，视为大规模公司*/
          matrix b3 = e(b)
          matrix diff = b1 - b3
          mat D[`j',1] = diff
       }  
     *--------------------------------------------------------------------
       
       svmat D, names(diff)  
       * diff1-diff6 对应 size ndts tang npr tobin和常数项
       
       mat P = J(6,2,.)  /*记录系数真实差异和实证P值的矩阵*/
       forvalues j = 1/6{
          local diff0_`j' = D0[1,`j']
          qui count if (diff`j'>`diff0_`j'' | diff`j'==`diff0_`j'')&diff`j'!= .
          local p = `r(N)'/`reps'
          mat P[`j',1] = (`diff0_`j'' , `p')
       }
       
       mat colnames P = 系数真实差异  实证P值
       mat rownames P = size ndts tang npr tobin cons
       mat list P
       
     * 结论：除SIZE外，其它变量的组间系数估计值并不存在显著差异。

     * Reps = 5000 次的结果(大约需要20分钟)
     *-------------------------------------
     *	  系数真实差异	实证P值
     *-------------------------------------
     * size	   .0392026		.0032
     * ndts	   .11700291	.707
     * tang   -.04144458	.4664
     * npr	  -.08150638	.7198
     * tobin  -.01324722	.1788
     * cons	  -.62137931	.9848
     *-------------------------------------



*================================
*  Permutation Tests（组合检验）
*================================
* Efron(1993, Chp15)
* rndallo.ado  ralloc.ado

*-- 基本原理：
*    假设有两组相互独立的随机样本: 
*       Z = (z1, z2, ..., z_n),  分布为 F 
*       Y = (y1, y2, ..., y_m)   分布为 G
*    若我们要检验如下原假设：
*       Ho：F = G  (例如：mean(Z) = mean(Y))
*    在 Ho 成立的情况下，随机数 z 和 y 的概率分布特征应该不存在显著差异。
*
*-- 基本步骤：
*    (1) 将 Z 和 Y 的样本混合起来，得到 n+m 个观察值，记为样本 H；
*    (2) 从 n+m 个样本中随机抽取 n 个观察值(不重复)，计算均值 m1，
*                                        对余下的样本计算均值 m2；
*    (3) 计算 d1 = (m1 - m2)；
*    (4) 将上述三个步骤重复 B=1000 次，得到 d1,d2,...,d1000；
*    (5) 计算 d_i>d_0 的次数，假设为Q次，则permute test的“p值”为：
*           p-value = Q / B
*         其中，d_0 为我们实际观察到的两个组的平均值之差。

  * 例1：检验两组数字的均值是否相等
    * 做了两组实验，每组三个样本，考察treatment是否有助于提高老鼠的存活时间 
      clear
      input y treatment
        7   0
        9   0
        11  0
        10  1
        12  1
        14  1
      end
      save B9_permu.dta, replace
    
    sum y
    bysort treatment: sum y
    
    set seed 1234
    permute y mean=r(mean), right nodrop nowarn: sum y if treatment /*默认100次*/
    permute y mean=r(mean), right reps(20) nodrop nowarn: sum y if treatment
    * 虽然精确的概率是 0.1，但当Permute次数太少时，得到的结果往往不稳定。
    * 传统 t 检验
      ttest y, by(treatment)
      
      
    *== Permutest过程解析：
    
     *- 真实差异：
        use B9_permu.dta, clear
        bysort treatment: sum y
        * d_0 = -3 = 9 - 12
        
     *- 定义样本数据 
       use B9_permu.dta, clear
       gen id = _n   /*便于后续合并数据*/
       sort id
       save data_all, replace
       
     *- Permunation test

     *--------------------------------------------- 
      set matsize 8000
      local B = 6000
      mat D = J(`B',1,.)
      qui{
        forvalues i = 1/`B'{
          use B9_permu.dta, clear
          gen rdm = uniform()     /*随机组合*/
          sort rdm
          sum y in 1/3            /*前三个观察值*/
          local m1 = r(mean)
          sum y in 4/6            /*后三个观察值*/
          local m2 = r(mean)
          local d = `m1' -`m2'
          mat D[`i',1] = (`d')
        }  
      }
        svmat D, names(diff)
        count if (diff>-3 | diff==-3)
        local       Q = r(N)
        local p_value = `Q' / `B'
        dis "p-value = " `p_value'
     *--------------------------------------------- 
     * 结论：二者的差异在 10%(5%) 水平上显著异于零。

     * 图示diff1的分布情况  
       histogram diff1, xline(-3, lw(thick)) discrete


*-- Permute 组合样本的个数
*
*   (   N  )       N!
*   (      ) = ----------  (其中，m=2n-1)   
*   (   n  )    n!(N-n)!
*
* 其中，N为总样本数，n为第一组的样本数，N-n为第二组的样本数

   mat A = J(9,3,.)
   local j = 1
   foreach N of numlist 4 6 8 10 20 30 50 100 1000{
      local n = int(`N'/2)  /*将 2 改为 3,4 看看结果如何？*/
      local permute = comb(`N',`n')
      mat A[`j',1] = (`N',`n',`permute')
      local j = `j' + 1
   }
   mat colnames A = N n Permute
   mat list A, format(%20.0f)
   
   * 结论：对于 N>10 的样本，采用permute test就可以得到较大样本量；
   *       而对于 N<10 的情形，我们可以非常精确的计算出所有可能的样本组合。


*-- 拒绝标准(Efron, 1993, p.204)
*
 * ------------------------------------------------------------
 *  ASL < 0.10   可以拒绝（borderling evidence）    
 *  ASL < 0.05   较强    （reasonably strong evidence）
 *  ASL < 0.025  强      （strong evidence） 
 *  ASL < 0.01   非常强  （very strong evidence）拒绝原假设 Ho
 * ------------------------------------------------------------  

* Permutation 的次数要求 （Efron, 1993, p.211, Tab 15.3）

   *   ASL(perm)   0.5   0.25   0.2   0.05   0.025
   * ------------------------------------------------
   *    B:          100    299   900   1901   3894
   *
   * 通常而言，至少 1000 次。


*-- Permutation Test 与 Bootstrap Tests 的异同
    
   * “同”，二者的基本思想非常相似：
   *     在原假设 Ho:m1=m2 下，由任意的子样本得到的统计量不存在显著差异；
   * “异”，二者的抽样方式不同：
   *     Bootstrap 为可重复抽样(sampling with replacement)
   *     Permutation test 为不可重复抽样(sampling without replacement)
   *  多数情况下，二者得到的结果相似。


*-- 例2：进口车和国产车的“平均价格”相等吗？
    cap program drop my_diff
    program define my_diff, rclass
      version 9.2
      args v gv
      qui sum `v' if `gv'
      local mean1 = r(mean)
      qui sum `v' if !`gv'
      local mean2 = r(mean)
      ret scalar diff = `mean1' - `mean2'
    end  

    sysuse auto,clear
    permute price diff = r(diff): my_diff price foreign
    permute price diff = r(diff), reps(2000) nodots nowarn: my_diff price foreign
    
    permute price mean = r(mean), reps(1000) right nodrop nowarn: sum price if foreign
    * 传统 t 检验
    ttest price, by(foreign)


*-- 例3：进口车和国产车“价格的波动”(方差)相等吗？
  * --------------------------------------
    cap program drop my_diff2
    program define my_diff2, rclass
      version 9.2
      args v gv
      qui sum `v' if `gv'
      local var1  = r(Var)
      qui sum `v' if !`gv'
      local var2  = r(Var)
      ret scalar diff_var  = ln(`var1'/`var2')
    end     
  * --------------------------------------
    sysuse auto,clear
    permute price d_var = r(diff_var), ///
       reps(5000) nodots nowarn: my_diff2 price foreign
      
       
  * 相关外部命令：
  *  rperm, permtest1, permtest2,        


     
*-- 面板数据的 Permutation Test 
*---------------------------------

  *- 关键问题：如何以公司为单位进行随机组合？
  *            此前是以观察值为单位进行样本组合的。
  * 基本原理解析：
  *-----------------------------------------------
    * 一份精简的上市公司财务数据
     use xtcs_simple.dta, clear
     xtdes
     list code year
    * 以公司为单位进行随机排序 
      gen rr = uniform()
      bysort code: egen rm = mean(rr)
      tsset rm year
     *xtnewid code_new   /*连玉君自行编写的命令，产生连续编号的公司代码*/
     egen code_new = group(rm)
     list code year code_new 
  *-----------------------------------------------
    * 多次运行上述代码，理解“随机排序”的含义
    * 接下来，我们就可以根据 code_new 来标识样本，进行分组回归了。
     
    *-- 进一步的说明： 
    * 采用 rperm 命令也可对样本进行随机排序 
      use xtcs_simple.dta, clear
      list code year 
      * findit rperm
      rperm code, gen(code_new) cluster(code)  /*重新组合排序*/
      list code year code_new   
      
      tsset code_new year
      *xtnewid id 
      egen id = group(code_new)
      list code year code_new id
     * 至此，我们可以根据 id 标识样本，进行分组回归。 
   
  *-------------------------------------
  *- 例：成长机会(Tobin)对资本结构的影响
  *      在大规模公司和小规模公司中是否相同？
  *      Ho: b1 = b2  (b_large = b_small)  
  * 注意：与此前Bootstrap检验的差异是什么？
  * 由于stata中的permute命令没有提供cluster()选项，
  * 我们需要自行编程来实现上述检验
  
     use xtcs.dta, clear
     bysort code: egen msize = mean(size)
     sort msize
     gen gsize = group(3)
     drop if gsize == 2
     
     * 记录真实系数差异
        xtreg tl size ndts tang npr tobin if gsize==1,fe /*小规模公司*/
          mat b1 = e(b)
        xtreg tl size ndts tang npr tobin if gsize==3,fe /*大规模公司*/       
          mat b3 = e(b)
        mat D0 = b1 - b3
        mat list D0, title(系数估计值的真实差异)   
     
     *--------------------------------------------------------------------
       local reps = 100          /*模拟次数*/
       local varlist "tl size ndts tang npr tobin"
       mat D = J(`reps', 6, .)   /*存储结果的矩阵*/
       forvalues j = 1/`reps'{
          use xtcs.dta, clear
            gen rr = uniform()
            bysort code: egen rm = mean(rr)  /*随机排序*/
            qui tsset rm year
          xtnewid code_new
          qui tsset code_new year
          local g1 = int(r(imax)/3)  /*第一组的分界点，前146个公司*/
          *dis `g1'
          local g3 = `g1'*2          /*第三组的分界点，第292家公司以后的公司*/
          *dis `g3'
          qui xtreg `varlist' if code_new<`g1',fe  /*第一组，视为小规模公司*/
          matrix b1 = e(b)
          qui xtreg `varlist' if code_new>`g3',fe  /*第三组，视为大规模公司*/
          matrix b3 = e(b)
          matrix diff = b1 - b3
          mat D[`j',1] = diff
       }  
     *--------------------------------------------------------------------
       
       svmat D, names(diff)  
       * diff1-diff6 对应 size ndts tang npr tobin和常数项
       
       mat P = J(6,2,.)  /*记录系数真实差异和实证P值的矩阵*/
       forvalues j = 1/6{
          local diff0_`j' = D0[1,`j']
          qui count if (diff`j'>`diff0_`j'' | diff`j'==`diff0_`j'')&diff`j'!= .
          local p = `r(N)'/`reps'
          mat P[`j',1] = (`diff0_`j'' , `p')
       }
       
       mat colnames P = 系数真实差异  实证P值
       mat rownames P = size ndts tang npr tobin cons
       mat list P     
 
   *----- 模拟1000次的结果 ------------
   *-----------------------------------
   *	    系数真实差异	实证P值
   *-----------------------------------  
   * size	 .0392026	.01
   * ndts	 .11700291	.146
   * tang	-.04144458	.781
   * npr	-.08150638	.961
   * tobin	-.01324722	.821
   * cons	-.62137931	.965
   *-----------------------------------
     
     
     
 

*=======================
*  Jackknife法(刀切法)
*=======================

* ------------
*    简  介
* ------------
* 参见：Efron(1993, Chp11)； Stata Manual 10 [R]jackknife

*- 在四十年代末，五十年代初提出，见 Tukey(1958)
*
*- 主要性质和用途：
*
*  1. 是诸多统计量的一阶无偏估计量(first-order unbiased estimator)；
*  2. 以样本为基础，计算统计量的标准误和置信区间；
*  3. 可产生每个观察值对应的“伪数值”(pseudovalues)，
*     用于评估该观察值对统计量的影响，
*     多用于勘查“离群值”(outliter)；

*- 发展状况：
*  
** 目前应用较为广泛的是第三个性质，这是Bootstrap无法做到的，
** 之所以不用JK计算标准误和置信区间，
*  是因为采用Bootstrap计算标准误和置信区间更为有效和稳健。

*- 我们学习的目的是掌握一种抽样方法。


* ------------
*   基本思想
* ------------
* 给定样本(x1,x2,...,x100)，记为 x_i (i=1,2,...,100)
* 假设我们要计算的统计量是样本均值，
* 若采用Jackknife，则我们将每次删除一个观察值，
* 只计算剩下99个观察值的均值，得到 100 个均值， 
* 利用这 100 个均值，便可计算其标准误和置信区间了。
* 具体而言：
*    m1 = (   x2+x3+...+x100)/99
*    m2 = (x1   +x3+...+x100)/99
*    ...  ...
*  m100 = (x1+x2+x3+...+x99) /99  

* 当然，使用Jackknife也可以计算其他统计量，如标准误、比率等。
* 但基本思想都是一样的。


*-----------------------
*  伪数值(pseudovalues)
*-----------------------
* XM_a = (x1+x2+...+x100)/100 (样本均值)
* XM_2 = (x1   +...+x100)/99  (去除第二个观察值后的样本均值)
*
* 则 XM_a 和 XM_2 存在如下关系：
*
*          (N-1)XM_2 + x2
*  XM_a = -----------------    (本例，N=100)             [1]
*                N
*
* 一般化公式：
*
*          (N-1)XM_j + x_j
*  XM_a = -----------------    (x_j 表示第 j 个观察值)   [2]
*                 N
*
* 由 [2] 式中，可求得：
* 
*  x_j = N*XM_a - (N-1)*XM_j                             [3]
* 
*  该值在 Jackknife 检验中称为“伪数值”(pseudovalues)
*
* 一般化：
* 设 Q   为任意统计量(如标准差、方差等)，
*    Q_j 为删除第j个观察值后得到的该统计量；
* 则第j个观察值对应的“伪数值”为：
*
*    q_j = N*Q - (N-1)*Q_j                               [4]
* 
*-- 性质：
*  1. q_j 的 均值 是统计量 Q 的一阶无偏估计量；
*  2. q_j 的标准误是统计量 Q 的标准误；
*
*  q_mean = (q1+q2+...+qN)/N
*
*         {    1     N                 }1/2 
*  q_se = { ------- SUM (q_j-q_mean)^2 }
*         {  N(N-1) j=1                }


*- 例1：解析Jackknife的计算过程：

   clear 
   set obs 10
   gen id = _n  /*样本序号*/   
   gen x  = _n + 10 
   gen px = .   /*x的伪值*/

 *- 计算伪 均值
    forvalues j = 1/10{
      qui sum x            /* Q */
      local m_0 = r(mean)
      sum x if (id != `j') /* Q_j */
      local m_j = r(mean)
      replace px = 10*`m_0' - (10-1)*`m_j' in `j' /*计算伪值*/
    }
    sum x px

  *- Stata命令：jackknife
     jackknife m_jk = r(mean),rclass keep: sum x     
     
  *- 例1.1：   
  *- 计算伪 方差
    replace px = .
    forvalues j = 1/10{
      qui sum x            
      local m_0 = r(Var)
      sum x if (id != `j') 
      local m_j = r(Var)
      replace px = 10*`m_0' - (10-1)*`m_j' in `j' /*计算伪值*/
    }
    sum x px  
    * 可见，两端的数值对方差的影响较大
    
    *- stata命令：
    replace m_jk = .
    jackknife m_jk = r(Var),rclass keep: sum x       


*- 例2：JK 得到的标准误和置信区间与 ci 命令的结果相同(传统方法)
   
   sysuse auto, clear
   jackknife r(mean),double: sum price
   
   ci price  /*参见Bootstrap小节*/
   
   * 这里，double 用于设定数值的精度，即“双精度”
   
   
*- 例3：Jackknife 计算标准误
     clear
     input x
        0.1
        0.1
        0.1
        0.4
        0.5
        1.0
        1.1
        1.3
        1.9
        1.9
        4.7
     end
      
     jackknife sd=r(sd), rclass keep: sum x 
     * x 的“标准差”为 1.343
     * x 的“标准差”的 95% 置信区间为 [-0.04779，2.7347]
     * x 的“标准差”的 JK 标准误为 0.6244
     
     list  
     * 我们发现，最后一个观察值对应的“伪值”很大，明显不同于其他伪值。
     * 至于11个观察值是否为离群值，则视具体情况而定；
     * 本例中，这11个观察值来自于指数分布，因此它并非离群值。    
     histogram x
     

*- 例4：离群值的查验

   sysuse auto, clear
   jackknife sd=r(sd), rclass keep: sum price
   
   sum sd, detail
   list price make sd if sd>10000
   
   
*- 例5：同时计算多个统计量的标准误

   sysuse auto, clear
   jackknife sd=r(sd) skew=r(skewness) var=r(Var), rclass: sum mpg, detail
   
   
*- 例6：计算估计系数的标准误
 
 *-截面资料
   sysuse auto, clear
   jackknife: reg price wei len mpg foreign
   * 或
   reg price wei len mpg foreign, vce(jackknife)
     est store r_jk
   reg price wei len mpg foreign, vce(bootstrap, reps(200))
     est store r_bs
   reg price wei len mpg foreign
     est store r_ols
   local mm "r_ols r_bs r_jk"
   esttab `mm', mtitle(`mm')
   * 结论：相对于传统的t检验，BS和JK得到的标准误都较大，
   *       同时，BS和JK得到的标准误非常接近。
 
 *-面板数据
   use xtcs.dta, clear
   keep if code<1000
   xtdes
   jackknife,eclass cluster(code) idcluster(code_new): ///
             xtreg tl size ndts tang tobin, fe
     est store fe_jk
   xtreg tl size ndts tang tobin, fe
     est store fe
   
   local mm "fe_jk fe"
   esttab `mm', mtitle(`mm') se(%6.3f)   /*标准误*/
   esttab `mm', mtitle(`mm')  t(%6.3f)   /*t值*/
   * 结论：相对于传统的t检验，JK得到的标准误较大

   * 说明：类似于BS，在采用JK获取标准误时，
   *       对于面板模型，需要同时设定 cluster() 和 idcluster()选项
   * cluster() 选项的作用在于，每次删除一个截面(公司或国家)


*- 例7：Jackknife instrumental variables estimation regression
   * “刀切法”IV 估计
   * 对该方法的介绍和相关的Monte Carlo过程，参见Stata Journal 2006(3):304-376.
   * 主要特点：能较好地克服弱工具变量问题。
   
   use hsng2.dta, clear
   jive rent pcturban (hsngval = faminc reg2-reg4), ujive2
   
   ivreg rent pcturban (hsngval = faminc reg2-reg4)


* -------------------------------
*  Jackknife 与 Bootstrap 的异同
* -------------------------------
* see Efron(1993, Chp11, p.145)
* 1. 若统计量是线性的，二者的结果会非常接近。
*    虽然从表面上看，Jackknife似乎只利用了非常有限的样本信息。 
* 2. 对于非线性统计量而言，Jack会有信息损失，此时BS较好。
*    这是因为，Jack可以视为BS的线性近似。
*    换言之，Jack的准确程度决定于统计量与其线性展开的接近程度。

 *-- 例：比较BS和JK在计算非线性统计量时的表现
 *   参见 Efron(1993,chp11,Ex11.3,p.152)
 
 *------------------------------------------
   clear
   set obs 20
   local B = 100         /*模拟次数*/
   mat R = J(`B',2,.)    /*存储模拟结果的矩阵*/
   local statis "r(Var)"       /*统计量1：Var[mean(x)]*/
   *local statis "r(mean)^2" /*统计量2：[mean(x)]^2 */
   forvalues i = 1/`B'{
     tempvar x
     gen `x' = 1 + invnorm(uniform())  /* x - N(1,1)*/
     * Bootstrap
     preserve
       tempfile bsdata
       qui bs m_bs = r(mean),reps(20) nowarn saving("`bsdata'"): sum `x'
       qui use "`bsdata'",clear
       qui sum m_bs
       mat R[`i',1] = `statis'   
     restore
     * Jackknife
       cap drop m_jk
       qui jackknife m_jk = r(mean), rclass keep: sum `x'
       qui sum m_jk
       mat R[`i',2] = `statis'
   }
   svmat R, names(r)
   rename r1 r_bs
   rename r2 r_jk
   sum r*
   
   graph box r_bs r_jk
 *------------------------------------------
   clear
   set obs 100
   gen x  = .
   gen mx = .
 *local jk  "in 2/100"
   forvalues i = 1/100{
     qui replace x  = 1+ invnorm(uniform())
     qui sum x `jk'
     qui replace mx = r(mean) in `i'
   }
   sum mx
   dis r(Var)
   
   
   
* -------------------------
*   Jackknife不适用的情形
* -------------------------
* see Efron(1993, p.148)    
     
  *- Jackknife 的基本假设是：
  *  原始样本具有“平滑性”(smoothness)，
  *  即，数据的微小变动(如，删除一个观察值)，仅会导致统计量的微小变动。
  * 在满足这一假设的前提下，JK 结果会非常接近于 BS。 
  * 反之，JK 的结果将是有偏的(biased)。
  
  *- 例1：非平滑数据的中位数
   *--------------------
   *   x      JK中位数 
   *--------------------       
   *   10        48
   *   27        48
   *   31        48
   *   40        48
   *   46        45
   *   50        43
   *   52        43
   *   104       43
   *   146       43
     
*== 问题：变量x中位数的标准误是多少？
   
   use B9_jk_fail.dta, clear
   list
   
   * s.e. using JK
     jackknife med=r(p50), rclass keep: sum x,de
   * s.e. using BS  
     bootstrap med=r(p50), reps(100) nodots nowarn: sum x, de
  
   *- 我们发现，采用JK得到的标准误明显偏小，
   *  主要是因为 JK 中位数缺乏平滑性所致。
   
   *- 结论：若所有检验的统计量不具有平滑性，
   *  采用JK计算其标准误或置信区间得到的结果将是有偏的。
  
    
     
*=========================
*    蒙特卡洛模拟（MC）
*=========================

*-- 基本思想
    
* 一个简单的实例：计算圆周率
*     在一个边长为r的正方形内均匀投点，
*     然后判断所投点是否落在与此正方形内切的半径为r的圆内，
*     若点落在圆内，则记录之，否则不记录。
*     那么，如果所投的点足够多且足够均匀的话，
*     落在圆内的点的数目除以总投点数既为圆面积与正方形面积之比，
*     知道了这个比值，我们就能够得出pi的值了。
*     area = pi*r^2  ==>  pi = area/r^2
*---------------------------------------------------
*|     落入圆圈中的点数       _pi*R^2       _pi     |
*|    ------------------ == ----------- == ------   |
*|          总点数            (2*R)^2        4      |
*---------------------------------------------------
*
* 图示：
        do B9_MC_pi.do
        viewsource B9_MC_pi.do  /* 查看原始文件 */
* 
* 实例：r = 0.5
  *------------------------------------------ 
   cap program drop pi
   program define pi, rclass
   version 9.2 
     scalar x = uniform()
     scalar y = uniform()
     scalar d = sqrt((x-0.5)^2 + (y-0.5)^2)
     local s = d <= 0.5
     ret scalar s = `s'
   end
  *------------------------------------------  
   simulate s = r(s), reps(100000): pi
   sum
   scalar pi = r(mean)*4
   dis in g "pi = " in y %6.5f scalar(pi)


*-- 例2：定积分  
   * Grasserman(2003,p.2); 

   clear
   set obs 1000
   gen x = 1 + (3-1)*uniform()
   gen g_x = x^2
   sum g_x
   local I = 1/(3-1)*r(mean)
   dis "I = `I'" 
   
 *-Dagpunar(2007,p.2) 
   clear 
   set obs 10000
   gen R = uniform()
   gen X = - ln(R)
   gen F = X^(1.9-1)
   sum F
   
   * 方法二：减小方差
   clear 
   set obs 10000
   gen R1 = uniform()
   gen R2 = uniform()
   gen X  = -ln(R1)*R2
   gen F  = X^(0.1)
   sum F
   
   

*-- MC 和 BS 的异同
  
  * MC假设数据生成过程是已知的，而BS则未知数据的生成过程
  *  BS根据现有的样本重复抽样得到实证样本
  * 换言之，MC 需要事先给定分布函数，而 BS 则无需事先给定分布函数
  * 二者都是数值模拟方法

* “对数正态分布”的期望和方差
  *------------------------------------- 
   cap program drop lnsim
   program define lnsim, rclass
   version 9.2
     drop _all
     set obs 100
     gen z = exp(invnormal(uniform())) /* ln(z)--N(0,1)*/
     sum z
     return scalar mean = r(mean)
     return scalar Var  = r(Var)
   end
  *-------------------------------------
  simulate mean=r(mean) Var=r(Var), reps(1000): lnsim
  des
  sum
  
  * 仅执行一次的效果: MC则是将该过程重复多次
    lnsim
    ret list
    set seed 1234
    lnsim 
    ret list
  
  * 一个相对完整的设定：改变“对数-正态分布”的参数
  *--------------------------------------------------------- 
    cap program drop lnsim2
    program define lnsim2, rclass
        version 9.2
        syntax [, obs(integer 100) mu(real 0) sigma(real 1) ]
        drop _all
        set obs `obs'
        tempvar z
        gen `z' = exp(`mu' + `sigma'*invnorm(uniform()))
        summarize `z'
        return scalar mean = r(mean)
        return scalar Var  = r(Var)
    end
  *--------------------------------------------------------- 
    simulate mean=r(mean) var=r(Var), reps(1000): lnsim, obs(100)
    sum
    simulate mean=r(mean) var=r(Var), reps(1000): lnsim, obs(50) mu(-3) sigma(7)
    sum


* 例2：内生性问题和异方差 对 OLS 估计的影响
   * 问题的来源：
   *In some cases it is possible to calculate the sampling distribution
   *from the econometric model. But sometimes, especially for finite (small)
   *samples, this is either not possible or very difficult. In these cases Monte
   *Carlo experiments are an intuitive way to obtain information about the
   *sampling distribution and hence about the “quality” of the estimator.

   * 模型： y_i = 1 + 2*x_i + u_i
   *        u_i = z_i + c*x_i
   * 显然： Var[u_i] != constant 
   *        Corr(u_i,x_i) !=0 
   
   *- 数据生成      
     drop _all
     set obs 100
     gen x = invnormal(uniform())
     gen y_true = 1 + 2*x
     save true_data, replace
     
   *- 内生性问题和异方差同时存在的影响   
  *----------------------------------------
   cap program drop hetero1
   program define hetero1
   version 9.2
     args c 
     use true_data, clear
     gen z = invnormal(uniform()) 
     gen y = y_true + z + `c'*x
     reg y x
   end
  *---------------------------------------- 
   simulate _b _se, reps(10000): hetero1 3
   sum
   
   * 结论：对常数项没有影响，但 x 的估计系数有偏。
   *   事实上，_b_x = 5 = 2+3
   
  * 程序的进一步改进 
  *---------------------------------------------------------  
   cap program drop hetero2
   program define hetero2
   version 9.2
     syntax varname[, c(real 3)]
     tempvar y 
     gen `y' = y_true + (invnormal(uniform()) + `c'*`varlist')  
     reg `y' x
   end
  *---------------------------------------------------------  
   
   use true_data, clear
   simulate _b _se, reps(1000) nodots: hetero2 x, c(3)
   sum
   use true_data, clear
   simulate _b _se, reps(1000) nodots: hetero2 x, c(5)
   sum   
   
   * 仅存在异方差
   use true_data, clear
   gen z = invnormal(uniform())
   simulate _b _se, reps(1000) nodots: hetero2 z, c(3)
   sum
   * 结论：异方差并不会影响 x 系数OLS估计的无偏性
   * 进一步的扩展：
   *  (1) 设定不同的分布函数；
   *  (2) 允许多个变量的设定；   
   


* 例3：遗漏变量和增加无关变量对OLS估计的影响

  * 理论基础： 
  *     对于模型 y = a0 + a1*x_1 + a2*x_2 + u 
  *                      u -- N(0,1)
  *     若回归中遗漏了 x_1，则 a_2 的 OLS 估计将是有偏的；
  *     若回归中增加了多余的变量 x_3，则 a_1 和 a_2 的 OLS 估计仍然是无偏的； 

  * 真实数据生成过程：
  * y = 0.5 + x_1 + 2*x_2
    clear
    set obs 100
    gen x1 = invnormal(uniform())
    gen x2 = invnormal(uniform())
    gen x3 = invnormal(uniform())
    gen y  = 0.5 + 1*x1 + 2*x2 
    save myomit_data, replace
  
  *------------------------------------
    cap program drop myomit
    program define myomit, eclass
      version 9.2
      syntax varlist 
        tempvar u y 
        gen `u' = invnormal(uniform()) 
        gen `y' = y + `u'  /*让干扰项变动是模拟的基础*/
        reg `y' `varlist'
    end
  *------------------------------------
  
  * 真实数据过程
    * 正确设定模型
      use myomit_data, clear
      simulate _b _se, reps(1000) nodots: myomit x1 x2
      sum
    * 遗漏重要变量   
      use myomit_data, clear
      simulate _b _se, reps(1000): myomit x1 
      sum
    * 附加无关变量
      use myomit_data, clear
      simulate _b _se, reps(1000): myomit x1 x2 x3
      sum
  
  * ::结论:：
  * 在模型设定过程中：
  *   遗漏变量的后果很严重：模型参数有偏！
  *   附加无关变量影响不大：模型参数仍然无偏，但不够有效！- 
  
  
    
* 例4：采用MC比较两个正态分布序列中位数的比值
   * 数据生成
   * y -- N(mu, sigma^2)
   *        { N(mu1, sigma_1^2)  前 n1 个观察值
   *   y -- {
   *        { N(mu2, sigma_2^2)  后 n2 个观察值
   * 程序
   *-------------------------------------------------------------------
   cap program drop myroatio
   program define myratio, rclass
   version 9.2
     syntax [, n1(int 5)  mu1(int 3) sigma1(int 1)  ///
               n2(int 10) mu2(int 3) sigma2(int 2)]
     drop _all
     local N = `n1' + `n2'
     set obs `N'
     tempvar y
     gen `y' = invnormal(uniform())
     replace `y' = `mu1' + `y'*`sigma1' if _n <= `n1'  /* y1--N(mu1,sigma1^2) */
     replace `y' = `mu2' + `y'*`sigma2' if _n > `n1'   /* y2--N(mu2,sigma2^2) */
     * replace `y' = cond(_n<=`n1',`mu1'+`y'*`sigma1',`mu2'+`y'*`sigma2')
     tempname m1 m2
     sum `y' if _n<=`n1', detail
       scalar `m1' = r(p50)
     sum `y' if _n>`n1', detail
       scalar `m2' = r(p50)
     ret scalar ratio = `m1'/`m2'
   end
   *-------------------------------------------------------------------
     
   * mu1=mu2=3;  sigma1=1 sigma2=2
       simulate ratio = r(ratio), reps(1000) nodots: myratio
       sum
   * mu1=3 mu2=6; sigma1=sigma2=2
       simulate ratio = r(ratio), reps(1000) nodots: myratio, mu1(6) sigma1(2) 
       sum     
       
   * 结论：影响两个序列中位数的是它们的期望值，与方差无关    
       
   * 练习：将 reps(1000) 分别修改为 reps(300) 和 reps(10000)，
   *       看看结果有何差别？
     
 
* 例5：弱工具变量问题的Monte Carlo模拟分析
* refer to Stata Journal 2006(3): 364-376.

 *-------------------------------
 *- 模型 1：仅存在一个弱工具变量
 *-------------------------------
 *  
 *   y = 0 + 1*x + e
 *   x = 0 + 0.3*z1 + 0*z2 + v
 *
 *  ( e )      { ( 0 )  (0.25  0.20)}
 *  (   ) -- N { (   ), (          )}
 *  ( v )      { ( 0 )  (0.20  0.25)}
 *
 * 即，e 和 v 均服从 N(0,0.25), 二者相关系数为 0.2，即二元正态分布。
 * 模型含义：由于 Corr(e,v)!=0, 所以 Corr(x,e)!=0, 即 x 是内生变量；
 *           由于 Corr(z1,v)=0, Corr(z2,v)=0，
 *           所以 z1 和 z2 都可以作为 x 的工具变量，
 *           但 z2 是一个弱工具变量。

 *- 生成数据
 *-----------------------------------------------------
  clear
  local reps = 1000         /*模拟次数*/
  mat R = J(`reps', 4, .)   /*结果矩阵*/
  timer on  1               /*记录程序耗时*/
  
  forvalues i = 1/`reps'{
  qui{
    *-- 生成数据
    set obs 100
    tempvar z1 z2 e1 v1 e v x y 
    gen `z1' = invnorm(uniform())
    gen `z2' = invnorm(uniform())
    qui mkbilogn `e1' `v1', r(0.2) m1(0) s1(0.5) m2(0) s2(0.5)         
    gen `e' = ln(`e1')
    gen `v' = ln(`v1')
    gen `x' = 0 + 0.3*`z1' + 0*`z2' + `v'
    gen `y' = 0 + 1*`x' + `e' 
    *-- 采用不同的方式估计
    * 2SLS 
      ivreg  `y' (`x' = `z1' `z2') 
      mat R[`i',1] = _b[`x'] 
    * LIML  
      ivreg2 `y' (`x' = `z1' `z2'), liml noid 
      mat R[`i',2] = _b[`x']
    * UJIVE1
      jive   `y' (`x' = `z1' `z2'), ujive1
      mat R[`i',3] = _b[`x']
    * JIVE1
      jive   `y' (`x' = `z1' `z2'), jive1      
      mat R[`i',4] = _b[`x']
    drop `z1' `z2' `e1' `v1' `e' `v' `x' `y' 
  }
  }  
  timer off  1
  timer list 1    /*程序耗时(秒)*/
  *-汇总模拟结果
    svmat R, names(b)
    rename b1  b_2sls
    rename b2  b_liml
    rename b3  b_ujive1
    rename b4  b_jive1
    sum 
    tabstat b* , stat(p10 p25 p50 p75 p90) c(s) format(%6.3f)  
  * 参见 SJ 6-3(p.371, Table 1)      
 *----------------------------------------------------- 
      
 *- 评述：本例中，我们并没有使用simulate命令，而是自己设定了循环程序；
 *        事实上，只要知道了MC的基本原理，就无需依赖simulate命令了；
 *        自己编程序，具有很大的灵活性。
 
               
 *-----------------------------------
 *- 模型 2：存在多个(19个)弱工具变量
 *-----------------------------------
 *  
 *   y = 0 + 1*x + e
 *   x = 0 + 0.3*z1 + (0*z2+0*z3+...+0*z20) + v
 *
 *  ( e )      { ( 0 )  (0.25  0.20)}
 *  (   ) -- N { (   ), (          )}
 *  ( v )      { ( 0 )  (0.20  0.25)}
 *
 * 即，e 和 v 均服从 N(0,0.25), 二者相关系数为 0.2，即二元正态分布。
 * 模型含义：x 是内生变量；
 *           z1 是有效的工具变量，
 *           z2-z20都是弱工具变量。

 *- 生成数据
 *-----------------------------------------------------
  clear
  local reps = 1000         /*模拟次数*/
  set matsize `reps'
  mat R = J(`reps', 4, .)   /*结果矩阵*/
  timer on  1               /*记录程序耗时*/
  
  forvalues i = 1/`reps'{
  qui{
    *-- 生成数据
    set obs 100
    forvalues j = 1/20{     /*产生 z1-z20 */
       tempvar z`j'
       gen `z`j'' = invnorm(uniform())
    }
    tempvar e1 v1 e v x y 
    qui mkbilogn `e1' `v1', r(0.2) m1(0) s1(0.5) m2(0) s2(0.5)         
    gen `e' = ln(`e1')
    gen `v' = ln(`v1')
    gen `x' = 0 + 0.3*`z1' + `v'  /*此处无需加z2-z20,因为它们的系数均为0*/
    gen `y' = 0 + 1*`x' + `e' 
    *-- 采用不同的方式估计
      local vlist1 "`z1' `z2' `z3' `z4' `z5' `z6' `z7' `z8' `z9' `z10'"
      local vlist2 "`z11' `z12' `z13' `z14' `z15' `z16' `z17' `z18' `z19' `z20'"     
    * 2SLS 
      ivreg  `y' (`x' = `vlist1' `vlist2') 
      mat R[`i',1] = _b[`x'] 
    * LIML       
      ivreg2 `y' (`x' = `vlist1' `vlist2'), liml noid 
      mat R[`i',2] = _b[`x']
    * UJIVE1
      jive   `y' (`x' = `vlist1' `vlist2'), ujive1
      mat R[`i',3] = _b[`x']
    * JIVE1
      jive   `y' (`x' = `vlist1' `vlist2'), jive1      
      mat R[`i',4] = _b[`x']
    drop `vlist1' `vlist2' `e1' `v1' `e' `v' `x' `y' 
  }
  }  
  timer off  1
  timer list 1    /*程序耗时(秒)*/
  *-汇总模拟结果
    svmat R, names(b)
    rename b1  b_2sls
    rename b2  b_liml
    rename b3  b_ujive1
    rename b4  b_jive1
 
    tabstat b* , stat(p10 p25 p50 p75 p90) c(s) format(%6.3f)      
 *----------------------------------------------------- 
    
 *----------模拟5000次的结果(耗时：352秒)------------------
 *----------------------------------------------------------------
 *    variable |       p10       p25       p50       p75       p90
 *-------------+--------------------------------------------------
 *      b_2sls |     0.899     0.980     1.070     1.161     1.240
 *      b_liml |     0.687     0.853     0.999     1.150     1.280
 *    b_ujive1 |     0.626     0.826     0.989     1.150     1.293
 *     b_jive1 |     0.250     0.406     0.550     0.678     0.777
 *----------------------------------------------------------------
 * 结论：相对于 LIML 和 UJIVE1 估计量，2SLS 略微上偏(upward biased)
 *       bias of 2SLS   = 0.07
 *       bias of LIML   = 0.001
 *       bias of UJIVE1 = 0.011                                                           
                                         
  
 *- 问题：这里得到的结果与SJ6-3(P.372,Table2)中的结果存在一定的差异，
 *        目前我尚未找出原因。                                                                                                                                           
 *- 练习: 请生成 Stata Jouranl 2006(3): 374-376 
 *        文中 表3-表5 的结果。            
                
                      
                                  
*=========================
*  检定统计量的势(Power)
*=========================
* see http://en.wikipedia.org/wiki/Statistical_power
*     http://www.indiana.edu/~statmath/stat/all/power/power.pdf
*     http://shazam.econ.ubc.ca/intro/simpower.htm

*------------
*  基本概念
*------------

* 第一类错误：(Type I Error)  原假设为真，但我们拒绝了它；(误杀好人)
* 第二类错误：(Type II Error) 原假设为假，但我们接受了它；(错接坏人)
* Size:  通常称为“显著水平”(significant level)，是范第一类错误的概率；
* Power：正确拒绝一个“错误”原假设的概率
* 置信水平：接受“正确”原假设的概率(confidence level)

*             Table 2. Size and Statistical Power of a Test
* -------------------------------------------------------------------------  
*        | 不拒绝Ho                |   拒绝Ho
* -------------------------------------------------------------------------
* Ho为真 | 判断正确                |  第一类错误(Type I Error)
*        | 1-a: 置信水平           |  a: Size of a test (Significant level)
* -------|-------------------------|---------------------------------------
* Ho为假 | 第二类错误(TypeII Error)|  判断正确
*        |  beta                   |  1-beta: Power of a test 
* -------------------------------------------------------------------------

* 显然，Power 越大，表示我们犯第二类错误的可能性越小。


*-- Power(势)的决定因素：
*
* 参考 http://shazam.econ.ubc.ca/intro/simpower.htm
*
*   1. 参数的真实值；
*   2. 样本数；
*   3. 预先设定的显著水平；
*   4. 母体方差；


*- 例1：Power决定因素的模拟分析

 *- 问题：已知 x - N(5,s^2), 我们要检验 Ho: u = 5, 
 *        统计量为： z = (x-5)/se 
 *  分析如下因素对Power的影响：
 *    样本数；标准差s； 置信水平alpha 

 *-----------------------------------------------
    *    sd: standard deviation; 
    *   obs: number of observations
    * alpha: the critical value
  cap program drop powerfcn
  program define powerfcn
  version 9.2
    syntax newvarname[, Mean(real 5) sd(real .1) obs(integer 10) Alpha(real 0.05)]
    local se  = `sd'/sqrt(`obs')     /*s.e.*/
    local z_a = invnorm(`alpha'/2)   /*alpha% critical value*/
    local lb  = `mean' + `z_a'*`se'  /*lower bound*/
    local ub  = `mean' - `z_a'*`se'  /*upper bound*/
  * 设定50个可能的母体期望值 4.76(0.01)5.25
    set obs 50
    tempvar tt
    gen `tt' = _n - 25
    capture confirm numeric variable mean
    if !_rc{
       replace mean = `mean' + `tt'/250
    }
    else{
       gen mean = `mean' + `tt'/250
    }
  * Find the probability of a Type II error
    tempvar zlow zup beta
    gen `zlow' = (`lb' - mean)/`se'
    gen `zup'  = (`ub' - mean)/`se'
    gen `beta' = normal(`zup') - normal(`zlow')
  * 计算 Power
    gen `varlist' = 1-`beta'
  end
 *-----------------------------------------------
   
 *- 样本数对Power的影响 
    clear
    powerfcn power16,  obs(16)  
    powerfcn power100, obs(100)     
    powerfcn power500, obs(500)
    
    line power16 power100 power500 mean, sort ///
         legend(off) yline(0.05,lp(dash))     ///
         ylabel(,angle(0) format(%2.1f))      ///     
         text(0.9 4.995 "n=500")              ///
         text(0.7 5.035 "n=100")              ///
         text(0.5 5.057 "n=16")               ///
         caption(std.dev.=0.1； alpha=0.05)
         
    *- 结论：
    *  1. 样本数越大，Power越高；
    *  2. 实际观测值与母体期望偏离越大，Power越高；
    *  3. 当实际观测值等于母体期望时，Power均为0.05            
   
   
 *- 母体标准差对Power的影响
    clear
    powerfcn power0, obs(16) sd(0.05)
    powerfcn power1, obs(16) sd(0.1)  
    powerfcn power2, obs(16) sd(0.2)    

    line power0 power1 power2 mean, sort      ///
            yline(0.05,lp(dash)) legend(off)  ///
            ylabel(,angle(0) format(%2.1f))   ///
            text(0.7 5.033 "sd=0.05",box)     ///
            text(0.5 5.045 "sd=0.1" ,box)     ///
            text(0.3 5.070 "sd=0.2" ,box)     ///
            caption(obs=16；alpha=0.05)  
    
    *- 结论：
    *  1. 母体标准差越小，Power越高；**
    *  2. 实际观测值与母体期望偏离越大，Power越高；
    *  3. 当实际观测值等于母体期望时，Power均为0.05      
   
    
 *- 预先设定的显著水平对Power的影响
    clear
    powerfcn power5, obs(16) alpha(0.05)
    powerfcn power1, obs(16) alpha(0.01)  
    
    line power5 power1 mean, sort            ///
          yline(0.05,lp(dash)) legend(off)   ///
          yline(0.00,lp(dash) lc(green))     ///
          ylabel(,angle(0) format(%2.1f))    ///
          text(0.5 5.045 "alpha=0.05" ,box)  ///
          text(0.3 5.055 "alpha=0.01" ,box)  ///
          caption(obs=16；s.d.=0.1)

    *- 结论：
    *  1. 预先设定的显著水平越低，Power越高；**
    *  2. 实际观测值与母体期望偏离越大，Power越高；
    *  3. 当实际观测值等于母体期望时，Power均为0.05        


*- 其它与 Power 和 Size 分析相关的命令（不再详述）
   *  sampsi  (stata官方命令)
   *  powercal(SJ 4(4):379--401)
   *  samplesize  to execute sampsi multiple times and produce a graph(推荐)
   *    sampsi_rho  compute sample size for a Pearson correlation
   *    sampsi_mcc  calculates the power and sample size for a matched case control study
   *    sampsi_reg  calculates the power and sample size for a simple linear regression
   *  sampclus
   *  sampncti
   *  xsampsi 
   *  artmenu 
   *  pwploti     plot power curve for sample size and power calculation
   *  mvsamp1i    计算多元回归分析中F检验的Power和Size



*----------------------------
*  采用模拟的方式得到Power值
*----------------------------

*-- 例：

   *- 模型： y = a + b*x + e, e--N(0,1) 
   *
   *- 问题：对于 H0：b=0，
   *        b的真实取值，alpha值，以及样本数对Power有何影响？
   
*-- 基本步骤
    *- 1. 产生模拟数据(设定模型的参数，干扰项的形式，)
    *- 2. 采用reg命令估计模拟数据；
    *- 3. 利用reg命令的返回值e(b),e(V)计算系数的标准误和P值；
    *- 4. 将以上三步重复执行K(如1000)次，记录每次得到的P值(P1,P2,...)；
    *- 5. Power = #{Pj>0.05} / 1000
    
  *-注意事项：
    *- 数据产生过程中，a+bx 部分固定，每次只随机干扰项e，进而得到y；
    *- p值的计算可根据z值(假设系数服从正态分布)或t值(假设服从t分布)

       
  *-模拟分析 http://www.stata.com/support/faqs/stat/power.html
    *--------------------------------------------------------------
      cap program drop mypower
      program define mypower, rclass
      version 9.2
        syntax [, Reps(int 50)  Obs(int 20) b(real 1) ///
                  pv(string) Alpha(real 0.05) ESigma2(real 1)] 
        preserve                              
        *- 数据生成
           clear
           qui set obs `obs'
           tempvar x y1
           gen `x' = invnormal(uniform())
           gen `y1' = 1 + `b'*`x'
           tempfile simdata
           qui save "`simdata'", replace
        *- 模拟分析
           qui set matsize `reps'
           mat P = J(`reps',1,.)
           forvalues i = 1(1)`reps'{
               use "`simdata'", clear
               tempvar e y_mc
               qui gen `e' = `esigma2'*invnormal(uniform())
               qui gen `y_mc' = `y1' + `e'
               qui reg `y_mc' `x'
               matrix V = e(V)
               matrix b = e(b)
               scalar t = b[1,1]/sqrt(V[1,1])
               *scalar p = 2*(1-normal(abs(t)))            /*正态分布*/
               scalar p = 2*(1-ttail(`e(df_r)', -abs(t)))  /* t 分布*/
             mat P[`i',1] = scalar(p)  
           }
           qui svmat P, names(p)
           qui count if p1 < `alpha'
           local power = r(N)/`reps'
           dis _col(4) in g "Power" _col(20) "Sample Size" _col(42) "Alpha"
           dis "{hline 50}"
           dis _col(4) in y  %6.4f `power' _col(20) %5.0f `obs' _col(42) %4.2f `alpha'
           ret scalar power = `power'
        restore
           if "`pv'" != ""{
             qui svmat P, names(`pv')
           }
      end
     *-------------------------------------------------------------- 
     
     *- 程序调用方法
        clear
        mypower
        mypower, reps(1000) b(0.1) obs(100) alpha(0.05)
        mypower, reps(1000) b(0.5) obs(100) alpha(0.05) pv(p)
      
     *- 几个检验程序的经验准则
     *
     *  1. 在原假设为真的情况下，Power应等于显著水平alpha=0.05；
           clear
           mypower, reps(8000) b(0) obs(2000) alpha(0.05) pv(p)   
     *   
     *  2. 同时，模拟产生的p-value应该服从均匀分布
           histogram p1
           
      
   *- 真实值与原假设偏离程度对Power的影响 
   *- H0: b = 0， 
   *- H1: b = -1, -0.9, ..., 0.9, 1
      clear
      set obs 20
      gen power = .
      gen b = .
      local i = 1
      forvalues j = -1(0.1)1{
        qui mypower, reps(1000) b(`j') obs(50)
        qui replace power = r(power) in `i'   
        qui replace b = `j' in `i++'
      }                   
      twoway connect power b, sort xlabel(-1(0.2)1)        ///
                     yline(0.05,lp(dash) lc(green))        ///
                     caption(reps=1000；obs=50；esigma2=1) ///
                     ylabel(0 0.05 0.2(0.2)1)
    
                
   *- 样本数对Power的影响 
   *- H0: b = 0  H1: b = 0.1
   *- obs = 10 20 30 50(50)1000  
                              
      clear
      set obs 50
      gen power = .
      gen obs = .
      local i = 1
      foreach j of numlist 10 20 30 50(50)1000{
        qui mypower, reps(1000) b(0.1) obs(`j')
        qui replace power = r(power) in `i'   
        qui replace obs = `j' in `i++'
      }                   
      twoway connect power obs, sort xlabel(0(100)1000)    ///
                     yline(0.05,lp(dash) lc(green))        ///
                     caption(reps=1000；b=0.1；esigma2=1)  ///
                     ylabel(0 0.05 0.2(0.2)1,angle(0) format(%3.2f))                     
   
   *- 练习：
   *  (1) 更改esigma2()选项，看看干扰项方差变动对Power的影响？
   *  (2) 更改alpha()选项，分析预先设定的显著水平对Power的影响。
   *  (3) 修改mypower程序，假设DGP为AR过程，分析上述因素对Power的影响。
   

                                                                
                         
*==================      
*  模拟数据的产生
*==================

*-- 目的：在多数模拟分析中，我们都需要生成数据，下面提供一些常用数据的生成方法。
*   数据生成过程：DGP，Data Generation Process

*-- 基本元素
    *- 干扰项
    clear 
    set obs 100
    gen e1 = invnorm(uniform())   /*N(0,1)*/
    gen e2 = 2*invnorm(uniform()) /*N(0,4)*/

*-- 简单线性回归模型数据的生成
    *- DGP: y = 3 + 6*x1 + 9*x2 + e   e--N(0,9)
    clear
    set obs 100
    set seed 135
    gen e  = invnorm(uniform())
    gen x1 = invnorm(uniform())
    gen x2 = invnorm(uniform())
    gen y  = 3 + 6*x1 + 9*x2 + e

*-- ARIMA(p,1,q)序列的生成
  * ssc install sim_arma
  *- 平稳AR(1)序列 
     clear
     sim_arma y, nobs(200) ar(0.8) /* y[t] = 0.8y[t-1] + e */
     ac  y
     pac y
  *- 平稳AR(p)序列
     sim_arma y2, ar(0.5 0.2)      /* y[t] = 0.5y[t-1] + 0.4y[t-2] + e */
     reg y2  L(1/2).y2
     arima y2, ar(1 2)
  *- 单位根序列
     sim_arma z1, ar(1)  
     scatter z1 _t
     dfuller z1  /*单位根检验*/
     dfuller y
  *- MA(1)序列
     sim_arma z2, ma(0.5) 
     arima z2, ma(1)
     
*------------------------     
*-- Panel Data 数据的生成

  *- 简介
     help xtarsim  
      
  *- 仅包含个体随机效应的“静态”面板数据
  *
  *  y[i,t] = 0.8*x[i,t] + u[i] + e[i,t]
  *
     clear
     xtarsim y x eta, n(200) t(10) g(0) b(.8) r(.2) one(corr 1) sn(9) 
     describe
     xtdes
     reg y x
       est store ols
     xtreg y x, re
       est store re
     xtreg y x, fe
       est store fe
     local mm "ols re fe"
     esttab `mm', mtitle(`mm') scalar(r2 r2_o r2_w r2_a)
     *
     *-- 结论：
     *
     * (1) 若设定 one(rand 1),即u_i和x_it不相关，则
     *       OLS,RE,FE 三者的结果差别甚微,但FE的拟合优度较高；
     * (2) 若设定one(corr 1)，即Corr(u_i,x_it)!=0，此时RE的假设不满足，则
     *       OLS和RE都是有偏的，而FE则是无偏的。
     *
     *-- Hausman检验结果如何？(设定 one(corr 1) DGP)
    
         hausman fe re
         hausman fe re, sigmamore  /*使用RE的方差-协方差矩阵 e(V_re)*/
         hausman fe re, sigmaless  /*使用FE的方差-协方差矩阵 e(V_fe)*/
         
     * 结论：若传统Hausman检验得到的卡方值为负，则应拒绝RE，而采用FE。    
         
         
  *- 仅包含个体随机效应的“动态”面板数据
  *
  *  y[i,t] = 0.2*y[i,t-1] + 0.8*x[i,t] + u[i] + e[i,t] 
  *
     clear
     xtarsim y x eta, n(200) t(10) g(.2) b(.8) r(.2) one(corr 1) sn(9) seed(1234)
     xtdes
     reg y L.y x
       est store ols
     xtreg y L.y x, fe
       est store fe
     xtreg y L.y x, re
       est store re
     xtabond y x
       est store abond
     local mm "ols fe re abond"
     esttab `mm', mtitle(`mm')
    
    * 结论：对于动态面板，
    *   (1) RE 存在严重(上偏)偏误，即biased upward；
    *   (2) OLS 严重上偏于真实值，FE下偏于真实值，
    *       但二者构成了真实值的合理取值区间(Roodman,2006)；
    *   (3) Arellano and Bond(1991)一阶差分估计量是无偏的。
            
  *- 进一步说明：
  *                                                                                                            
  *- xtarsim 命令还提供了同时包含个体效应和时间效应的静态和动态面板数据的DGP。
  *  采用这些模拟数据，我们可以分析xtreg, xtregar, xtgls, xtabond 等估计方法的表现。                                                                                                      



