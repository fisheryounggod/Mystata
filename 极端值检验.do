//八 、 检验极端值：

//常见命令： tabulate 、 stem 、 codebook 、 summarize 、 list 、 histogram 、 graph box 、 gragh matrix

//step1. 用 codebook 、 summarize 、 histogram 、 graph boxs 、 graph matrix 、 stem 看检验数据的总体情况：

codebook  x1 x2

summarize y x1 x2,detail

histogram x1,norm //正态直方图

graph box x1 //箱图

graph matrix  x1 x2,half //画出各个变量的两两 x-y 图

stem x1 //做 x1 的茎叶图可以看出数据分布状况，尤其是最大、最小值

//step2. 用 tabulate 、 list 细致寻找极端值

tabulate code if x1== 极端值 //作出 x1 等于极端值时 code 的频数分布表， code 表示地区、年份等序列变量，这样便可找出那些地区的数值出现了错误

list code if x1== 极端值 //直接列出 x1 等于极端值时 code 的值，当 x1的错误过多时，不建议使用该命令

list in -20/l // l 表示 last one ， -20 表示倒数第 20 个样本，该命令列出了从倒数第 20 个到倒数第一个样本的各变量值

//step3. 用 replace 命令替换极端值

replace x1=? if x1== 极端值

//去除极端值：

keep if y<1000

drop if y>1000

//对数据排序：

sort x

gsort +x

//对数据按 x 进行升序排列

gsort -x

//对数据按 x 进行降序排列

gsort -x, generate(id) mfirst

//对数据按 x 进行降序排列，缺失值排最前，生成反映位次的变量 id 

//对变量进行排序：

order y x3 x1 x2 //将变量按照 y 、 x3 、 x1 、 x2 的顺序排列
